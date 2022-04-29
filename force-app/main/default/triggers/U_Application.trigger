trigger U_Application on Application__c (after insert,after update) {
    
    // it will count the size of candidate
    if(trigger.isInsert && trigger.isAfter){
        Set<Id> IdSet=new Set<Id>();
        
        if(trigger.new !=null){
            for(Application__c appnew:trigger.new){
                if(appnew.id != null){
                    IdSet.add(appnew.id);
                }
            }
        }
        
        if(trigger.old !=null){
            for(Application__c appold:trigger.old){
                if(appold.id != null){
                    IdSet.add(appold.id);
                }
            }
        }
        
        List<Job__c> jobList=[Select Id,(Select Id From Applications__r) From Job__c];
        if(!jobList.isEmpty()){
            for(Job__c job : jobList){
                job.Total_No_of_Candidate__c=job.Applications__r.size();
            }
        }
        update jobList;
    }
}