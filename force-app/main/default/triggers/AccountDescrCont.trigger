trigger AccountDescrCont on Contact (before Insert) {

   
    List<Account> accList=new List<Account>();
    for(Contact con:trigger.new){
        Account acc=new Account();
        acc.Description=con.Description;
        acc.Id=con.AccountId;
        accList.add(acc);
    }
    update accList;
}