trigger Contact_Dead_Check on Contact (after update) { // Not Working

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