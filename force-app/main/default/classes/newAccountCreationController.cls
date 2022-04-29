public with sharing class newAccountCreationController {
    public newAccountCreationController() {

    }
    @AuraEnabled 
    public Static Account creteAccount(Account accountRecordObj){
        insert accountRecordObj;
        return accountRecordObj;
    }
}