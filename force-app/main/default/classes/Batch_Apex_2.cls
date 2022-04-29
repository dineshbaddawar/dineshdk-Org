public class Batch_Apex_2 implements Database.Batchable <Sobject> {

    public Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Title From Contact');
    }
    
    public void Execute(Database.BatchableContext bc, List<Contact> conList){
        for(Contact con:conList){
            if(con.Title==null){
                con.Title='Salesforce';
            }
        }
        update conList;
    }
    
    public void Finish(Database.BatchableContext bc){
        System.debug('The Batch Apex Updated Successfully');
    }
}