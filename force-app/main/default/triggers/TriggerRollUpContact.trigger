trigger TriggerRollUpContact on Contact (after insert) {

    List<Account> accList=new List<Account>();
    
    for(Contact con:trigger.new){
        Account acc=[Select Id,Name,Phone From Account Where Id =:con.AccountId];
        acc.phone=con.Phone;
        accList.add(acc);
    }
    update accList;
}