public with sharing class NewDraggerClass {
    public NewDraggerClass() {

    }
    

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        return [Select Id,Name,Type From Account LIMIT 5];
    }
}