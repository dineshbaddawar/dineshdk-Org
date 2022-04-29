public class FutureMethod_3 {
    @future
    public static void Method(){
        List<Account> accList=[Select Id,Name,Site From Account Where Site=null];
        for(Account acc:accList){
            acc.site='Salesforce.com';
        }
        update accList;
    }
    @future
    public static void Method1(){
        List<Account> acclist=[Select id,phone From Account Where Phone=null];
        for(Account acc:acclist){
            acc.Phone='9890-098788';
        }
        update acclist;
    }
}