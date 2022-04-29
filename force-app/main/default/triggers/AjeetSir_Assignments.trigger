trigger AjeetSir_Assignments on Contact (before insert) {


    /*

  # Assignment 1.0
    trigger AccountDefaultContact on Account (after insert) {
    
    // When a new Account is created, create a new Contact # 1.0

    List<Contact> conList=new List<Contact>();
    list<Id> accId = new list<Id>();

    for(Account acc:trigger.new){
        Contact con=new Contact();
        con.FirstName='Info';
        con.LastName='Default';
        con.AccountId=acc.id;
        conList.add(con);
        accId.add(acc.Id);
     
    }
    insert conList;

    list<account> accList = [SELECT Id, Only_Default_Contact__c  FROM Account WHERE Id IN:accId];
    for(account acc: accList)
    {
        acc.Only_Default_Contact__c=false; // this will set Only_Default_Contact__c Uncheck
    }
    update accList;
   
}


# Assignment 1.1

trigger ContactDefaultCheck on Contact (before insert) {

    // this will set Only_Default_Contact__c check after more than one record. # 1.1

    List<Account> accList=new List<Account>();
    for(Contact con:trigger.new){
        Account acc=new Account();
        acc.Id=con.accountid;
        acc.Only_Default_Contact__c=true;
        accList.add(acc);
    }
    update accList;
}



# Assignment 2

trigger Contact_Update_Out_of_Zip on Contact (after insert,after update) {

    // Whenever we create Contact if Contacts MailingPostalCode is Equal to Accounts BillingPostalCode then update Accounts
    //  Field Out_of_Zip__c is True.

    List<Account> accList=new List<Account>();
    Set<Id> IdSet=new Set<Id>();
    for(Contact con:trigger.new){
      if(con.AccountId !=null){
          IdSet.add(con.AccountId);
      }
    }

    Account acc=[Select Id,Out_of_Zip__c,BillingPostalCode From Account Where Id IN:IdSet];
    for(Contact con:trigger.new){
        if(con.MailingPostalCode == acc.BillingPostalCode){
            acc.Out_of_Zip__c=true;
        }
        accList.add(acc);
    }
    update accList;
}



# Assignment 3


trigger AfterUpdateAccount on Account (after update) {

    // When an Account is updated and the Website is filled in, update all the Profile field on all Contacts

    if(trigger.isAfter && trigger.isUpdate){

        Set<Id> accId=new Set<Id>();
        for(Account acc:trigger.new){
            if(acc.Website !=null){
                accId.add(acc.Id);
            }
        }
        
        if(accId.size()>0){
            List<Contact> conList=[Select AccountId,FirstName,LastName,Profile__c,Account.Website From Contact Where AccountId IN:accId];
            for(Contact con:conList){
                if(con.LastName !=null){
                    con.Profile__c=con.Account.Website +'/ '+con.LastName;
                }
            }
            update conList;
        }
    }
}


# Assignment 4

trigger OpportunityAmountCheck_Update on Opportunity (after insert,after update) {

    // When an Opportunity is greater than $20k, mark is_gold to TRUE
    List<Account> accList=new List<Account>();
    Map<Id,Boolean> IsGoldByAccId=new Map<Id,Boolean>();
    if(Trigger.isAfter && trigger.isInsert){
        for(Opportunity opp:trigger.new){
            if(opp.Amount> 20000){
                if(!IsGoldByAccId.containsKey(opp.AccountId))
                    IsGoldByAccId.put(opp.AccountId,true);
            }
        }
    }
    for(String accId :IsGoldByAccId.keySet()){
        accList.add(new Account(Id=accId,is_gold__c=IsGoldByAccId.get(accId)));
    }
    update accList;
}


# Assignment 5


trigger Contact_Dead_Check on Contact (after update) {

//    If 70% or more of the Contacts on an Account are Dead, mark the need_intel field to TRUE.

    if(trigger.isAfter && trigger.isUpdate){
        Set<Id> accId=new Set<Id>();
        
        for(Contact con:trigger.new){
            if(con.AccountId !=null){
                accId.add(con.AccountId);
            }
        }
        
        Map<Id,List<Contact>> accContactMap=new Map<Id,List<Contact>>();
        List<Account> AccountUpdateList=new List<Account>();
        
        for(Contact conObj:[Select AccountId,Dead__c From Contact Where AccountId IN:accId]){
            List<Contact> conLists;
            if(accContactMap.containskey(conObj.AccountId)){
                conLists=accContactMap.get(conObj.AccountId);
            }else{
                conLists=new List<Contact>();
            }
            conLists.add(conObj);
            accContactMap.put(conObj.AccountId, conLists);
        }
        
        for(Id accIds:accContactMap.keySet()){
            Integer count_of_Dead=0;
            Integer total_count=accContactMap.get(accIds).size();
            if(accContactMap.get(accIds).size()>1){
                for(Integer i=0;i<accContactMap.get(accIds).size();i++)
                    if(accContactMap.get(accIds)[i].Dead__c==true){
                        count_of_Dead++;
                    }
            }
            
            if((count_of_Dead*100)/total_count > 70){
                AccountUpdateList.add(new Account(Id=accIds,need_intel__c = true));
            }
            if(!AccountUpdateList.isEmpty()){
                update AccountUpdateList;
            }     
        }
    }
}


    */
}