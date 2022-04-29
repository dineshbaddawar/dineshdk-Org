public class AccountAction {
 @InvocableMethod
    public static void updateAccountName(list<id> ids) {
        
        list<Account> accountToBeUpdated = new list<Account>();
        
        list<Account> accounts = [SELECT Name From Account WHERE id in :ids];
        
        for(Account account : accounts){
            
            account.Name = account.Name + 'Test';
            accountToBeUpdated.add(account);
        }
        update accountToBeUpdated;
    }
}