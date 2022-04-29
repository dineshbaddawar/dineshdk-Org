trigger OpportunityAmountCheck on Opportunity (after insert,after update) {
    
    //When an Opportunity is greater than $20k, mark is_gold to TRUE
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        
        OpportunityAmountCheckhelper.validate20KCondition(trigger.new);
        
    }
    
}