public with sharing class AccountController {
    public AccountController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [select id,name,type,industry from Account limit 10];
    }
    @AuraEnabled
    public static List<Account> getAccountRecordsList(){
        return [Select Id,Name,Type,Phone,Industry From Account Limit 10];
    }
}