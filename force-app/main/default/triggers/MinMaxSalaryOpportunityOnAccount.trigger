trigger MinMaxSalaryOpportunityOnAccount on Opportunity (after insert,after update,after delete) {

    List<Account> accList=new List<Account>();
    Set<Id> IdSet=new Set<Id>();
    List<Account> ListAcc=new List<Account>();
    
    if(trigger.isInsert){
        if(trigger.new !=null){
            for(Opportunity opp:trigger.new){
                if(opp.AccountId !=null){
                    IdSet.add(opp.AccountId);
                }
            }
        }
    }
    
    if(trigger.isDelete){
        for(Opportunity opp:trigger.old){
            IdSet.add(opp.AccountId);
        }
    }
    
    if(trigger.isUpdate){
        for(Opportunity opp:trigger.new){
            if(opp.AccountId !=trigger.oldmap.get(opp.Id).AccountId){
                IdSet.add(opp.AccountId);
                IdSet.add(trigger.oldmap.get(opp.Id).AccountId);
            }
            if(opp.Amount !=trigger.oldmap.get(opp.Id).Amount){
                IdSet.add(opp.AccountId);
            }
        }
    }
    
    ListAcc=[Select Id,Max_Salary__c,Min_Salary__c,(Select Id,Amount,AccountId From Opportunities) From Account Where
            Id IN:IdSet];
    for(Account acc:ListAcc){
        if(acc.Opportunities.size()>0){
            acc.Max_Salary__c=acc.Opportunities[0].Amount;
            acc.Min_Salary__c=acc.Opportunities[0].Amount;
        }else{
            acc.Max_Salary__c=0;
            acc.Min_Salary__c=0;
        }
        
        for(Opportunity opp:acc.Opportunities){
            for(Integer i=0;i<acc.Opportunities.size();i++){
                Decimal Xvalue=acc.Opportunities[i].Amount;
                
                if(acc.Max_Salary__c > Xvalue){
                    acc.Max_Salary__c=acc.Max_Salary__c;
                }else{
                    acc.Max_Salary__c=Xvalue;
                }
                
                if(acc.Min_Salary__c < Xvalue){
                    acc.Min_Salary__c=acc.Min_Salary__c;
                }else{
                    acc.Min_Salary__c=Xvalue;
                }
            }
        }
        
        accList.add(acc);
    }
    if(accList.size()>0){
        update accList;
    }
}