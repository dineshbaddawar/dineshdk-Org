public class FutureMethod_2 {

    @future
    public static void Method1(){
        Opportunity op=new Opportunity(Name='Ravinder Jadeja',StageName='Prospecting',CloseDate=System.today());
        insert op;
    }
    
    @future
    public Static void Method2(){
        Account acc=new Account(Name='Hardik Pandya',Phone='986899');
        insert acc;
    }
}