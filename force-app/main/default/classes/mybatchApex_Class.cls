public class mybatchApex_Class implements Database.Batchable<SObject>{
 
    public Database.QueryLocator Start(Database.BatchableContext bc){
        string query ='select name,industry from Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,List<Account> scope){
        List<Account> accs = new List<Account>();
        for(Account a:scope){
            a.Industry ='Education';
            accs.add(a);
        } 
        update accs;
    }
    public void finish(Database.BatchableContext bc){
        
    }
}