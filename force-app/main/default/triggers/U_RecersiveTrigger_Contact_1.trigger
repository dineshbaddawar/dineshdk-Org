trigger U_RecersiveTrigger_Contact_1 on Contact (after update) {
     /*
     // This cause an Trigger recursion
    if(trigger.isAfter && trigger.isUpdate){
        
        Id conId;
        for(Contact con:trigger.new){
            conId=con.Id;
        }
        
        Contact conList=[Select Id,Name From Contact Where Id !=:conId Limit 1];
        conList.Description='Updated';
        update conList;
    }
    */

    // Solution of Above trigger
    if(trigger.isAfter && trigger.isUpdate){
        
        if(!U_RecersiveTrigger_Contact_1Handler.condition){
            U_RecersiveTrigger_Contact_1Handler.condition=false;
            
            Id conId;
            for(Contact con:trigger.new){
                conId=con.Id;
            }
            
            Contact conList=[Select Id,Name From Contact Where Id !=:conId Limit 1];
            conList.Description='Updated';
            update conList;
        }
    }
}