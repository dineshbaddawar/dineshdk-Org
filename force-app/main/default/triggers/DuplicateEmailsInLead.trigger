trigger DuplicateEmailsInLead on Lead (before insert,after insert,before update,after update) {
        
        // a trigger on lead to prevent duplicate records based on lead email, if a record already created with the same Email, 
        //   Or record is Updated. The trigger should throw an error. It will be fired whenever New Lead is Created Or Updated
        
        if(trigger.isAFTER){
            if(trigger.isInsert){
                DuplicateEmailsInLeadHelper.UpdateInsertedLead(trigger.new);                 
            }
            
            if(trigger.isUpdate){
                DuplicateEmailsInLeadHelper.UpdateInsertedLead(trigger.new);     
            }
        }else if(trigger.isAfter){
            System.debug('It is inside the After Method');
        }
    }