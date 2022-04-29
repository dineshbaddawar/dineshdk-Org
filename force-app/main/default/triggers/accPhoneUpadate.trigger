trigger accPhoneUpadate on Contact (after insert) {
List<Account> accs = new List<Account>();
    for(Contact c:trigger.new){
        Account a = [select id,phone from Account where id =:c.AccountId];
        a.phone = c.phone;
        accs.add(a);
    }
    update accs;
}