@RestResource(urlMapping='/activity_url/*')
global class WS_Activity {

    @HttpPost
    global static Activity_Response_Wrapper.ResponseWrapper AcitivityWebCallout(){
        Activity_Response_Wrapper.ResponseWrapper response = new Activity_Response_Wrapper.ResponseWrapper();
        Activity_Request_Wrapper accWrap = Activity_Request_Wrapper.parse(RestContext.request.RequestBody.tostring());
        response.failed_activity_list = new List<Activity_Response_Wrapper.failure_activity_cls>();
        
        Set<String> UniqueId = new Set<String>();
        Map<String,String> MapAccUID = new Map<String,String>();
        List<Task> TaskListToBeInserted = new List<Task>();
        
        for(Activity_Request_Wrapper.cls_activity ActDetails : accWrap.Activity){
            UniqueId.add(ActDetails.search_by_value);
        }
        
        List<Account> accList = [SELECT Id,AccountUID__c FROM Account WHERE AccountUID__c IN: UniqueId];
        if(!accList.isEmpty()){
            for(Account accRec : accList){
                MapAccUID.put(accRec.AccountUID__c,accRec.id);
            }
        }
        
        if(accWrap.Activity != null && !accWrap.Activity.isEmpty()){
            for(Activity_Request_Wrapper.cls_activity actRecDetails : accWrap.Activity){
                if(MapAccUID.containsKey(actRecDetails.search_by_value)){
                   
                    Task tak= new Task();
                    tak.Activity_Note__c = actRecDetails.activity_type;
                    tak.Activity_Type__c = actRecDetails.activity_type;
                    tak.Exam_Date__c = Date.valueOf(actRecDetails.exam_date);
                    tak.Exam_Name__c = actRecDetails.exam_name;
                    tak.Exam_Slug__c = actRecDetails.exam_slug;
                    tak.Is_qualified_in_exam__c = actRecDetails.is_qualified_in_exam;
                    tak.Skill_Based_Exam_Score__c = Decimal.valueOf(actRecDetails.skill_based_exam_score);
                    tak.Subject__c = actRecDetails.subject;
                    tak.Search_by_value__c = actRecDetails.search_by_value;
                    tak.WhatId = MapAccUID.get(tak.search_by_value__c);
                    TaskListToBeInserted.add(tak);
                }
                
               /* else{
                    System.debug('Account are not Found');
                    Activity_Response_Wrapper.failure_activity_cls faileddAct = new Activity_Response_Wrapper.failure_activity_cls();
                    faileddAct.failure_activity_details = actRecDetails;
                    faileddAct.error_msg = 'Account are not in the Org.';
                    response.failed_activity_list.add(faileddAct);
                } */
            }
            
            System.debug('TaskListToBeInserted-->'+TaskListToBeInserted);
            System.debug('TaskListToBeInserted-->'+TaskListToBeInserted.size());
            
            if(!TaskListToBeInserted.isEmpty()){
                Database.SaveResult[] result = Database.insert(TaskListToBeInserted,false);
                System.debug('The Result--->'+result);
                System.debug('The Result--->'+result.size());
                response.success_activity_list = new List<Task>();
                for(Integer i=0;i<result.size();i++){
                    if(result[i].isSuccess()){
                        response.success_activity_list.add(TaskListToBeInserted[i]);
                    }
                }
            }
        }
     return response;
    }
}