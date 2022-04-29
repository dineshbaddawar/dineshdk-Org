public class AccountActions_Handler1 {

     
    public static void createOpportunities(Map<id,account> newAccountMap, Map<id,account> oldAccountMap){
        list<opportunity> opportunityList = new list<opportunity> ();
        for(account actobj: newAccountMap.values()){
            if(newAccountMap.get(actobj.Id).Rating != oldAccountMap.get(actobj.Id).Rating && newAccountMap.get(actobj.id).Rating=='Warm'){
                opportunity opportunityObj = new opportunity();
                opportunityObj.Accountid = actobj.id;
                opportunityObj.Name = actobj.Name;
                opportunityObj.StageName = 'Prospecting';
                opportunityObj.CloseDate = system.today();
                opportunityList.add(opportunityObj);
            }
        }
        if(!opportunityList.isEmpty()){
            insert opportunityList;
        }
    }
}