public class FutureMethod_1 {

    @future
    public static void Method(){
        
        List<Account> AccList=[Select id,Name From Account Where Name Like 'Nitin'];
        for(Account acc:AccList){
            acc.Name='Marewar Nitin';
        }
        update AccList;
    }
    
    @future
    public static void updateAccount(){
        List<Account> AccountList=[Select Id,Name,Type From Account Where Type=null];
        for(Account acc:AccountList){
            acc.Type='Prospect';
        }
        update AccountList;
    }
}