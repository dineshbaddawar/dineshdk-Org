trigger OpportunityRollUp on Opportunity (before insert,after insert,before update,after update,after delete,after undelete) {

    if(trigger.isAfter){
        List<Opportunity> oppList=new List<Opportunity>();
        Set<Id> IdSet=new Set<Id>();
        
        if(trigger.isDelete){
            oppList=trigger.old;
        }else{
            oppList=trigger.new;
        }
        
        for(Opportunity opp:oppList){
            if(opp.AccountId !=null){
                IdSet.add(opp.AccountId);
            }
            if(trigger.isUpdate){
                Opportunity oldOpp=(Opportunity)trigger.oldMap.get(opp.Id);
                if(oldOpp.AccountId !=opp.AccountId){
                    IdSet.add(oldOpp.AccountId);
                }
            }
            
            List<Account> AccList=[Select Id,Name,No_of_Opportunities__c,(Select Id From Opportunities)
                                 From Account Where Id IN:IdSet ];
            for(Account acc:AccList){
                List<Opportunity> RelatedeOpp=acc.Opportunities;
                if(RelatedeOpp !=null){
                    acc.No_of_Opportunities__c=RelatedeOpp.size();
                }else{
                    acc.No_of_Opportunities__c=0;
                }
            }
            update AccList;
        }
    }
}