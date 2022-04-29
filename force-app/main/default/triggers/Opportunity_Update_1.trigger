trigger Opportunity_Update_1 on Opportunity (before update) {
     // 100% Code Coverage
    // When ever Opportunity "Stage" is modified to "Closed Won" then set "Descriptione" as "Updated Description" 
    // and "Type" as "New Customer".
    
    Map<Id,Opportunity> oppOld=trigger.oldMap;
    Map<Id,Opportunity> oppNew=trigger.newMap;
    Set<Id> IdSet=oppOld.keySet();
    
    for(Id AccId: IdSet){
        Opportunity oldOpportunity=oppOld.get(AccId);
        Opportunity newOpportunity=oppNew.get(AccId);
        
        if(oldOpportunity.StageName !='Closed Won' && newOpportunity.StageName=='Closed Won'){
            newOpportunity.Description ='Updated Description';
            newOpportunity.Type='New Customer';
        }
    }
}