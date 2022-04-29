trigger Opportunity_Update on Opportunity (before update) {

    // Whenever Opportunity "Stage" is modified to "Closed Won" then set "Close Date" as "Today Date" and "Type" as "New Customer".
    List<Opportunity> oppList=new List<Opportunity>();
    
    for(Opportunity opp:trigger.new){
        if(opp.StageName=='Closed Won'){
            opp.CloseDate=system.today();
            opp.Type='New Customer';
        }
    }
}