public class ApplicationTriggerHelper {
    
    public static Boolean runOnce = false;
    
    public static void validateSingleApplicant(List<Application__c> appRecordList){
        Set<Id> allJobIds =  new Set<Id>();
        
        // 1.Get All Unique Jobs to Query
        Map<Id,List<Id>> allContactsByJobId = new Map<Id,List<Id>>();
        for(Application__c appRecord:appRecordList){
            allJobIds.add(appRecord.Job__c);
        }
        
        //2.Query All Contacts under Job 
        List<Application__c> exitingApplicants = [Select Id,Name,Job__c,Contact__c from Application__c where Job__c IN :allJobIds ];
        
        //3. Put that data in map<jobId,List<contactId>>
        if(!exitingApplicants.isEmpty()){
            for(Application__c apprecord : exitingApplicants){
                if(allContactsByJobId.containsKey(apprecord.Job__c)){
                    //List<Id> existingEntry = allContactsByJobId.get(apprecord.Job__c);
                    //existingEntry.add(apprecord.Contact__c);
                    //allContactsByJobId.put(apprecord.Job__c,existingEntry);
                    allContactsByJobId.get(apprecord.Job__c).add(apprecord.Contact__c);
                }else{
                    allContactsByJobId.put(apprecord.Job__c,new List<Id>{apprecord.Contact__c});
                }
            }
        }
        
        //4 Process New Entries - Validate New Entries with Exiting Entries
        for(Application__c appRecord:appRecordList){
            if(allContactsByJobId.containsKey(apprecord.Job__c)){
                List<Id> exitingContacts = allContactsByJobId.get(apprecord.Job__c);
                if(exitingContacts.contains(appRecord.Contact__c)){
                    appRecord.addError('We have an existing entry for this contact');
                }
            }
            
        }
        
    }
    
}