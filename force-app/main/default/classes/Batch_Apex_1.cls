public class Batch_Apex_1 implements Database.Batchable <Sobject> {

    public Database.QueryLocator Start(Database.BatchableContext bc){
        String var='Select Id,AnnualRevenue From Account';
        return Database.getQueryLocator(var);
    }
    
    public void Execute(Database.BatchableContext bc, List<Account> accList){
        for(Account acc:accList){
            if(acc.AnnualRevenue ==null){
                acc.AnnualRevenue=89000;
            }
        }
        update accList;
    }
    
    public void Finish(Database.BatchableContext bc){
        System.debug('The Operation is Successfully Completed');
        Database.executeBatch(new Batch_Apex_2(),1);
    }
}