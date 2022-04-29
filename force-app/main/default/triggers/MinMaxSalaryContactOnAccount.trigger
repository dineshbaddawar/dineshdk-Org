// Write a trigger  on contact and show Max and Min salary of contact on associated account.
trigger MinMaxSalaryContactOnAccount on Contact (after insert,after update,after delete) {

    List<Account> accList=new List<Account>();
    Set<Id> IdSet=new Set<Id>();
    List<Account> ListAcc=new List<Account>();
    
    if(trigger.isInsert){
        if(trigger.new !=null){
            for(Contact con:trigger.new){
                if(con.AccountId !=null){
                    IdSet.add(con.AccountId);
                }
            }
        }
    }
    
    if(trigger.isDelete){
        for(Contact con:trigger.old){
            IdSet.add(con.AccountId);
        }
    }
    
    if(trigger.isUpdate){
        for(Contact con:trigger.new){
            if(con.AccountId !=trigger.oldmap.get(con.Id).AccountId){
                IdSet.add(con.AccountId);
                IdSet.add(trigger.oldmap.get(con.Id).AccountId);
            }
            if(con.Salary__c !=trigger.oldmap.get(con.Id).Salary__c){
                IdSet.add(con.AccountId);
            }
        }
    }
    
    ListAcc=[Select Id,Max_Salary__c,Min_Salary__c,(Select Id,Salary__c,AccountId From Contacts) From Account Where
            Id IN:IdSet];
    for(Account acc:ListAcc){
        if(acc.Contacts.size()>0){
            acc.Max_Salary__c =acc.Contacts[0].Salary__c;
            acc.Min_Salary__c=acc.Contacts[0].Salary__c;
        }else{
            acc.Max_Salary__c=0;
            acc.Min_Salary__c=0;
        }
        
        for(Contact con:acc.Contacts){
            for(Integer i=0;i<acc.Contacts.size();i++){
                Decimal Value=acc.Contacts[i].Salary__c;
                
                if(acc.Max_Salary__c > Value){
                    acc.Max_Salary__c=acc.Max_Salary__c;
                }else{
                    acc.Max_Salary__c=Value;
                } 
                
                if(acc.Min_Salary__c < Value){
                    acc.Min_Salary__c=acc.Min_Salary__c;
                }else{
                    acc.Min_Salary__c=Value;
                }
            }
        }
        accList.add(acc);
    }
    if(accList.size()>0){
        update accList;
    }
}