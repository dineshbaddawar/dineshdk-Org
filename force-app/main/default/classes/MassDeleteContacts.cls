public with sharing class MassDeleteContacts {
    public MassDeleteContacts() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        return [Select Id,FirstName,LastName,Title,Phone,Email From Contact Where
        FirstName !=null Order By CreatedDate Desc];
    }

    // This Method Delete The Selected Based on The Contact Ids Sent From LWC
    @AuraEnabled
    public static void DeleteSelectedContact(List<Id> ContactIdList){

        List<Contact> contactList=[Select Id From Contact Where Id IN:ContactIdList];
        if(contactList !=null && contactList.size()>0){
            delete contactList;
        }
    }
}