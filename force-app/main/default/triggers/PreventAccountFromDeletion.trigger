trigger PreventAccountFromDeletion on Account (before delete) {

    List<Account> accList=new List<Account>();
    Set<Id> IdSet=new Set<Id>();
    for(Account acc:trigger.old){
        IdSet.add(acc.Id);
    }
    
    Map<Id,Account> accMap=new Map<Id,Account>([Select Id,(Select Id From Contacts) From Account Where Id IN:IdSet]);
    for(Account oldacc:trigger.old){
        if(accMap.get(oldacc.Id).Contacts.size()>0){
            oldacc.addError('Account can not be delete if it has related Contacts');
        }
    }
}