// if we create new Contact on Same Account it has increment No of Contact Field By 1, after we delete it has decrement by 1 and also if we undelete 
// the Contact Record it has increment By 1
trigger U_CountOfTrigger_Contact_1 on Contact (after insert,after update,after delete,after undelete) {

    if(trigger.isAfter){
        Set<Id> IdSet=new Set<Id>();
        List<Contact> conList=new List<Contact>();
        
        if(trigger.isDelete){
            conList=trigger.old;
        }else{
            conList=trigger.new;
        }
        
        for(Contact con:conList){
            if(con.AccountId !=null){
                IdSet.add(con.AccountId);
            }
            
            if(trigger.isUpdate){
                Contact oldContact=(Contact)trigger.oldmap.get(con.Id);
                if(oldContact.AccountId != con.AccountId){
                    IdSet.add(oldContact.AccountId);
                }
            }
            
            List<Account> accList=[Select Id,No_of_Contacts__c,(Select Id From Contacts) From Account Where Id IN:IdSet];
            for(Account acc:accList){
                List<Contact> relContact=acc.Contacts;
                if(relContact !=null){
                    acc.No_of_Contacts__c=relContact.size();
                }else{
                    acc.No_of_Contacts__c=0;
                }
            }
            update accList;
        }
    }
}