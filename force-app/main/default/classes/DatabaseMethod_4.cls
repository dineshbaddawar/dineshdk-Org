public class DatabaseMethod_4 {

    public static void Method(){
        List<Opportunity> oppList=new List<Opportunity>();
        Opportunity opp=new Opportunity();
        opp.Name='Hannah Rowe';
        opp.StageName='Prospecting';
        opp.CloseDate=system.today();
        oppList.add(opp);
        
        Opportunity opp1=new Opportunity();
        opp1.Name='oo';
        oppList.add(opp1);
        
        Database.SaveResult [] strlist=Database.insert(oppList,false);
        for(Database.SaveResult str:strlist){
            if(str.isSuccess()){
                System.debug('the Record is Inserted & ID '+str.getId());
            }else{
                for(Database.Error err:str.getErrors()){
                    System.debug('The Error is '+err.getMessage());
                }
            }
        }
    }
}