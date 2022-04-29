trigger Account_After_Update on Account (after update) {
    // 100% Code Coverage
    Set<Id> IdSet=new Set<Id>();
    Set<Id> IdSet1=new Set<Id>();
    Map<Id,Account> oldAccount=trigger.oldmap;
    Map<Id,Account> newAccount=trigger.newmap; 
    
    for(Id aid:oldAccount.keySet()){
        if(oldAccount.get(aid) != NULL)
        {
            if(oldAccount.get(aid).Rating==Null && newAccount.get(aid).Rating=='Hot')
                IdSet.add(aid);
        }   
    }
    
    List<Contact> conList=[SELECT AccountId FROM Contact WHERE AccountId IN:IdSet];
    if(!conList.isEmpty()){
        delete conList;
    }
    
    
    for(Id aid1:oldAccount.keySet()){
        if(oldAccount.get(aid1) != NULL)
        {
            if(oldAccount.get(aid1).Rating == 'Hot' && newAccount.get(aid1).Rating=='Warm')
                IdSet1.add(aid1);
        }   
    }
    
    List<Opportunity> oppList=[SELECT AccountId FROM Opportunity WHERE AccountId IN:IdSet1];
    if(!oppList.isEmpty()){
        delete oppList;
    }
    
}