public class AccountSelectClassContriller {
    public List<wrapAccount> wrapAccountList {set;get;}
    public List<Account> selectedAccounts {set;get;}
    public AccountSelectClassContriller(){
        if(wrapAccountList == null){
            wrapAccountList = new List<wrapAccount>();
            for(Account a:[select Id,Name,billingState,Website,Phone from Account limit 10]){
              wrapAccountList.add(new wrapAccount(a)); 
            }
        }
    }
    public void processSelected(){
        selectedAccounts = new List<Account>();
        for(wrapAccount wrapAccountObj:wrapAccountList){
            if(wrapAccountObj.selected == true){
                selectedAccounts.add(wrapAccountObj.acc);
            }
        }
    }
    public class wrapAccount{
        public Account acc {set;get;}
        public boolean selected {set;get;}
        public wrapAccount(Account a){
            acc= a;
            selected = true;
        }
    }
}