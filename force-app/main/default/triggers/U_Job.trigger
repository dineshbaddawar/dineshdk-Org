trigger U_Job on Job__c (before insert,before update) {

    // this adding the error if total no of candidate is greater than required no of candidate.
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        
       
        for(Job__c job:trigger.new){
            if(job.Total_No_of_Candidate__c > job.Required_No_of_Candidate__c){
                job.addError('The Limit of Required Candidate is Full');
            }
        }
    }
}