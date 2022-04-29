public with sharing class NewAccountSearchCls {
    public NewAccountSearchCls() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String actName){
        String keyString='%'+actName+'%';
        return [Select Id,Name From Account Where Name Like:keyString];
    }
}