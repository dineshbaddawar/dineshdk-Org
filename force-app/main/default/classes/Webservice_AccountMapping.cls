@RestResource(urlMapping='/account_mapping/*')
global class Webservice_AccountMapping {
    
    @HttpPost
    global static ResponseWrapperClass.ResponseWrapper accountMapping(){
        ResponseWrapperClass.ResponseWrapper response = new ResponseWrapperClass.ResponseWrapper();
        AccountMappingWrapper accWrap = new AccountMappingWrapper();
        accWrap = AccountMappingWrapper.parse(RestContext.request.requestBody.tostring());
        
        List<account> accountListtobeInsert = New List<account>();
        List<opportunity> opportunityListTobeInsert = New List<opportunity>();
        List<contact> contactListTobeInsert = New List<Contact>();
        List<Account> childAccountTobeInsert = New List<Account>();
        
        
        system.debug('accWrap:::'+accWrap);
        system.debug('accWrap number::'+accWrap.mobile_number);
        system.debug('Opportunity list::'+accWrap.subscriptions);
        
        Account acc = new Account();
        acc.Name =accWrap.name;
        acc.Phone = accWrap.mobile_number;
        acc.Website = accWrap.email;
        accountListtobeInsert.add(acc);
        
        if(accWrap.subscriptions != null && !accWrap.subscriptions.isEmpty()){
            for(AccountMappingWrapper.cls_subscriptions oppDetails : accWrap.subscriptions){
                
                opportunity opp = new opportunity();
                opp.Name = acc.Name + oppDetails.subscription_type;
                opp.Amount = Decimal.ValueOf(oppDetails.amount);
                opp.CloseDate = Date.valueOf(oppDetails.expired_at);
                opp.StageName = 'Prospecting';
                opportunityListTobeInsert.add(opp);
            }
        }
        
        if(accWrap.Contacts!=null && !accWrap.Contacts.isEmpty()){
            for(AccountMappingWrapper.cls_Contacts contactDetails : accWrap.Contacts){
                
                Contact con = New Contact();
                con.FirstName = contactDetails.FirstName;
                con.LastName = contactDetails.LastName;
                con.Email = contactDetails.Email;
              //  con.Level__c = contactDetails.Level;
                contactListTobeInsert.add(con);
            }
        }
        
        if(accWrap.companies!=null && !accWrap.companies.isEmpty()){
            for(AccountMappingWrapper.cls_companies companyDetails : accWrap.companies){
                
                Account childAcc = New Account();
                childAcc.Name = companyDetails.Name;
                childAcc.Phone = companyDetails.mobile_number;
                childAcc.Industry = companyDetails.Industry_Type;
                childAccountTobeInsert.add(childAcc);
            }
        }
        
        if(!accountListtobeInsert.isEmpty()){
            Database.SaveResult[] result = database.insert(accountListtobeInsert,false);
            response.success_account_list = new list<account>();
            for(integer index = 0; index < result.size(); index++){
                if(result[index].isSuccess()){
                    
                    response.success_account_list.add(accountListtobeInsert[index]);
                    if(!contactListTobeInsert.isEmpty()){
                        for(Contact conRec : contactListTobeInsert){
                            conRec.AccountId = accountListtobeInsert[index].Id;
                        }
                        //insert contactListTobeInsert;
                    }
                    
                    if(!opportunityListTobeInsert.isEmpty()){
                        for(opportunity opps : opportunityListTobeInsert){
                            opps.AccountId = accountListtobeInsert[index].Id;
                        }
                        
                        //insert opportunityListTobeInsert;
                    }
                    
                    if(!childAccountTobeInsert.isEmpty()){
                        for(Account accs : childAccountTobeInsert){
                            accs.ParentId = accountListtobeInsert[index].Id;
                        }
                        //insert childAccountTobeInsert;
                    }
                }else{
                    system.debug('failure account');
                }
            }
            
            if(!childAccountTobeInsert.isEmpty()){
                response.success_child_account = new list<account>();
                Database.SaveResult[] childAccRes = database.insert(childAccountTobeInsert,false);
                for(integer index = 0; index < childAccRes.size(); index++){
                    if(childAccRes[index].isSuccess()){
                        
                        response.success_child_account.add(childAccountTobeInsert[index]);
                    }else{
                        system.debug('Failure child account');
                    }
                }
            }
            if(!contactListTobeInsert.isEmpty()){
                response.success_contact_list = new list<contact>();
                response.failed_contact_list = new list<ResponseWrapperClass.failure_contact>();
                Database.SaveResult[] conRes = database.insert(contactListTobeInsert,false);
                for(integer index = 0; index < conRes.size(); index++){
                    if(conRes[index].isSuccess()){
                        response.success_contact_list.add(contactListTobeInsert[index]);
                    }else{
                        system.debug('contcat failure');
                        system.debug('contactListTobeInsert[index].getErrors()::'+contactListTobeInsert[index].getErrors());
                        for(Database.Error err : conRes[index].getErrors()){
                            ResponseWrapperClass.failure_contact failedContact = new ResponseWrapperClass.failure_contact();
                            system.debug('inside error block');
                            //RestApexResponseWrapper.failure_account failedAccountDetail = new RestApexResponseWrapper.failure_account();
                            failedContact.contact_details = contactListTobeInsert[index];
                            failedContact.error_msg = err.getMessage();
                            response.failed_contact_list.add(failedContact);
                            //response.failed_contact_list.add(contactListTobeInsert[index]);
                            //failedAccountDetail.error_msg = err.getMessage();
                            //response.failed_account_list.add(failedAccountDetail);
                        }
                    }
                }
            }
            if(!opportunityListTobeInsert.isEmpty()){
                response.success_opportunity_list = new list<opportunity>();
                Database.SaveResult[] oppRes = database.insert(opportunityListTobeInsert,false);
                for(integer index = 0; index < oppRes.size(); index++){
                    if(oppRes[index].isSuccess()){
                        response.success_opportunity_list.add(opportunityListTobeInsert[index]);
                    }else{
                        system.debug('contcat failure');
                    }
                }
            }
        }
        return response;
    }
}