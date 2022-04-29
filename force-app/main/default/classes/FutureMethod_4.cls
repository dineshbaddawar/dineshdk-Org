public class FutureMethod_4 {

    @future
    public static void Method(){
        List<Account> accList=[Select Id,Site From Account];
        for(Account acc:accList){
            if(acc.site==null){
                acc.site='SalesforceWeb.com';
            }
        }
        update accList;
    }
}