public with sharing class ContactClass {
    public ContactClass() {

    }
    @AuraEnabled(cacheable=true)
    public Static List<Contact> getContact(){
        return [Select Id,LastName,FirstName,Email,Phone From Contact Limit 10];
    }
}