public class DatabaseMethod_2 {

    public static void DatabaseMethod(){
        
     
        List<Opportunity> oppList=new List<Opportunity>();
        
        Opportunity op=new Opportunity();
        op.Name='Custome Opportunity';
        op.StageName='Prospecting';
        op.CloseDate=system.today();
        oppList.add(op);
        
        Opportunity op1=new Opportunity();
        op1.Name='Custom 1';
        op1.CloseDate=system.today();
        oppList.add(op1);
        
        Database.SaveResult [] strList=Database.insert(oppList,false);
        for(Database.SaveResult str:strList){
            if(str.isSuccess()){
                System.debug('the record Is Inserted Successfully & ID: '+str.getId());
            }else{
                for(Database.Error err:str.getErrors()){
                    system.debug('the error is occured');
                    System.debug('the error is : '+err.getmessage());
                }
            }
        }
    }
    
}