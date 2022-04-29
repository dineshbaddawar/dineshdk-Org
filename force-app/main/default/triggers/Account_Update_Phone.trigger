trigger Account_Update_Phone on Account (before update) {

    Set<Id> IdSet=new Set<Id>();
    Map<Id,Account> oldmap=trigger.oldmap;
    Map<Id,Account> newmap=trigger.newmap;

    for(Id aid:oldmap.keySet()){
        if(oldmap.get(aid).Phone != newmap.get(aid).Phone)
        IdSet.add(aid);
    }

    List<Contact> conList=[SELECT AccountId,OtherPhone From Contact WHERE AccountId IN:IdSet];
    if(conList.size()>0){
        for(Contact con:conList){
            con.OtherPhone=newmap.get(con.AccountId).Phone;
        }
        update conList;
    }
}