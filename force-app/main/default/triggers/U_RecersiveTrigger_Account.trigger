trigger U_RecersiveTrigger_Account on Account (after update) {

    /*
    // Recursive Trigger Example
    if(trigger.isAfter && trigger.isUpdate){
       
      Id accId;
        for(Account acc:trigger.new){
            accId=acc.id;
        }
        
        Account accList=[Select Id,Name From Account Where Id !=:accId Limit 1];
        accList.site='salesforce.com';
        Update accList;
    }
    */
    // Solution of Above Example
    
    if(!U_RecersiveTrigger_1Handler.condition){
        U_RecersiveTrigger_1Handler.condition=true;
        
        Id accId;
        for(Account acc:trigger.new){
            accId=acc.id;
        }
        
        Account accList=[Select Id,Name From Account Where Id !=: accId Limit 1];
        accList.Description='Updated Description';
        update accList;
    }
}