trigger Contact_Dead_Check_1_Updated on Contact (after  insert,after update) {

    Set<Id> AccIdSet=new Set<Id>();
    List<Account> accList=new List<Account>();
    Map<Id,List<Id>> needIntelByAccId = new Map<Id,List<Id>>();
    Map<Id,Integer> deadContacts = new Map<Id,Integer>();
    Map<Id,Integer> totalContacts = new Map<Id,Integer>();
    Map<Id,Integer> upcomingContactsByAccount = new Map<Id,Integer>();
    
    if(trigger.isInsert && trigger.isAfter){
        
        // Fetch All Unique Accounts
        for(Contact conRecord : trigger.new){
            AccIdSet.add(conRecord.AccountId);
            if(upcomingContactsByAccount.containsKey(conRecord.AccountId)){
                upcomingContactsByAccount.put(conRecord.AccountId,upcomingContactsByAccount.get(conRecord.AccountId)+1);
            }else{
                upcomingContactsByAccount.put(conRecord.AccountId, 1);
            }
        }
        
        // Fetch All TotalContacts Under that Account
        List<Account> ConInaccList = [Select Id,need_intel__c,(Select Id,Dead__c From Contacts) From Account Where Id IN: AccIdSet];
        for(Account accRecord :ConInaccList){
            totalContacts.put(accRecord.Id,accRecord.Contacts.size());
        }
        
        // Final TotalContacts By Account
        Map<Id,Integer> allContactForPercentageByAccount = new Map<Id,Integer>();
        for(Id accId:totalContacts.keySet()){
            allContactForPercentageByAccount.put(accId,totalContacts.get(accId)+upcomingContactsByAccount.get(accId));
        }
        
        // Fetch All DeadContacts Under that Account
        List<Account> ConInaccList1 = [Select Id,need_intel__c,(Select Id,Dead__c From Contacts Where Dead__c = true) From Account Where Id IN:AccIdSet];
        for(Account accRecord1 : ConInaccList1){
            List<Contact> conList = accRecord1.Contacts;
            deadContacts.put(accRecord1.Id,conList.size());
        }
        
        Map<Id,Integer> deadContactsToBeInsertedByAccount = new Map<Id,Integer>();
        // How many Dead Contacts are Coming to ger Inserted in each Account
        for(Contact ContactRec : trigger.new){
            if(ContactRec.Dead__c){
                if(deadContactsToBeInsertedByAccount.containsKey(ContactRec.AccountId)){
                    deadContactsToBeInsertedByAccount.put(ContactRec.AccountId,1);
                }
            }
        }
        
        // Final Dead Contact Calculation by AccountId
        Map<Id,Integer> allDeadContactsByAccount = new Map<Id,Integer>();
        if(!allDeadContactsByAccount.isEmpty()){
            for(Id accId:deadContacts.keySet()){
                allDeadContactsByAccount.put(accId,deadContactsToBeInsertedByAccount.get(accId)+deadContacts.get(accId));
            }
        }
        
        // Percentage of Dead Calculation, Total Contacts, AllContactForPercentageByAccount
        Map<Id,Boolean> needIntelByAccId = new Map<Id,Boolean>();
        if(!allDeadContactsByAccount.isEmpty()){
            for(Id accId:allDeadContactsByAccount.keySet()){
                Decimal deadPercentage = (allDeadContactsByAccount.get(accId)/allContactForPercentageByAccount.get(accId))*100;
                if(deadPercentage > 70){
                    needIntelByAccId.put(accId,true);
                }
            }
        }
        
        // update Account
        List<Account> accListToBeUpdated = new List<Account>();
        for(Id accId:needIntelByAccId.keySet()){
            accListToBeUpdated.add(new Account(Id=accId,need_intel__c=true));
        }
        update accListToBeUpdated;
    }
    update accList;
}