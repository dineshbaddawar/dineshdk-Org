trigger ApplicationTrigger on Application__c (before insert) {
    
    if(!ApplicationTriggerHelper.runOnce){
        
        ApplicationTriggerHelper.validateSingleApplicant(trigger.new);
        
        ApplicationTriggerHelper.runOnce = true;
    }
}