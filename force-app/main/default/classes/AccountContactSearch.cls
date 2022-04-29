public with sharing class AccountContactSearch {
    public AccountContactSearch() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> retrieveContactData(String KeySearch){
        List<Contact> contactList = [SELECT Id,FirstName, LastName, Email, Phone, Account.Name FROM Contact WHERE Account.Name =:KeySearch];
        return contactList;
    }
}