trigger AccountActions1 on Account (after insert,after update) {

    if(trigger.isUpdate && trigger.isAfter){
        AccountActions_Handler1.createOpportunities(trigger.newMap,trigger.oldMap);
    }
}