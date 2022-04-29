trigger TriggerRollUpOpportunity on Opportunity (after insert,after update,after delete) {

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
                Opportunity RelOpp=(Opportunity)trigger.oldMap.get(opp.Id);
                if(RelOpp.AccountId !=opp.AccountId){
                    IdSet.add(RelOpp.AccountId);
                }
            }
            
            List<Account> accList=[Select Id,No_of_Opportunities__c,(Select Id From Opportunities) From 
                                  Account Where Id IN:IdSet];
            for(Account acc:accList){
                List<Opportunity> oldOpp=acc.Opportunities;
                if(oldOpp!=null){
                    acc.No_of_Opportunities__c=oldOpp.size();
                }else{
                    acc.No_of_Opportunities__c=0;
                }
            }
            update accList;
            }
        }
    }