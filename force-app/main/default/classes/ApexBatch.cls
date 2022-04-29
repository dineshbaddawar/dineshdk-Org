public class ApexBatch implements Database.Batchable <Sobject> {
// 100% Code Coverage
    public Database.QueryLocator start(Database.BatchableContext bc){
        String var='Select Id,Name,Amount From Opportunity';
        return Database.getQueryLocator(var);
    }
    public void Execute(Database.BatchableContext bc,List<Opportunity> oppList){
        for(Opportunity opp:oppList){
            if(opp.Amount ==null){
                opp.Amount=100000;
            }
        }
        update oppList;
    }
    public void Finish(Database.BatchableContext bc){
        
    }
}