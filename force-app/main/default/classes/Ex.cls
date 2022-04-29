public class Ex {
/*
    
    @httpPost
    global static ActivityResponseWrapper.ReponseWrapper makeWebServiceCallout()
    {
        ActivityResponseWrapper.ReponseWrapper response = new ActivityResponseWrapper.ReponseWrapper();
        ActivityResponseWrapper.failed_activity failedResponse = new ActivityResponseWrapper.failed_activity();
        ActivityWrapper recInfoWrap = ActivityWrapper.parse(RestContext.request.requestBody.tostring());
        response.failed_activity_list = new list<ActivityResponseWrapper.failed_activity>();
        
        set<string> uniqueIdListFromTask = new set<string>();
        map<string,string> mapofUidByAccId = new map<string,string>();
      //  map<string,list<ActivityWrapper.cls_Activity>> mapofuidByTask = new map<string,list<ActivityWrapper.cls_Activity>>();
        list<Account> accList = new list<Account>();
        list<task> taskListToBeInserted = new list<task>();
        list<ActivityWrapper.cls_Activity> errorResponse = new list<ActivityWrapper.cls_Activity>();
        
        for(ActivityWrapper.cls_Activity actRecDetails : recInfoWrap.Activity){
            uniqueIdListFromTask.add(actRecDetails.search_by_value);
        }
        
        accList = [select id,U_ID__c from account where U_ID__c in: uniqueIdListFromTask];
        
        system.debug('accList::'+accList);
        
        for(Account acc : accList){
            mapofUidByAccId.put(acc.U_ID__c,acc.Id);
        }
        system.debug('recInfoWrap.Activity::'+recInfoWrap.Activity);
        if(!accList.isEmpty()){
            for(ActivityWrapper.cls_Activity actRecDetails: recInfoWrap.Activity){
                system.debug('actRecDetails::'+actRecDetails);
                if(mapofUidByAccId.containsKey(actRecDetails.search_by_value)){
                    task newTask = new task();
                    newTask.Activity_Note__c = actRecDetails.activity_type;
                    newTask.Activity_Type__c = actRecDetails.activity_type;
                    newTask.Exam_Date__c = actRecDetails.exam_date;
                    newTask.Exam_Name__c = actRecDetails.exam_name;
                    newTask.Exam_Slug__c = actRecDetails.exam_slug;
                    newTask.Is_qualified_in_exam__c = actRecDetails.is_qualified_in_exam;
                    newTask.Skill_Based_Exam_Score__c = actRecDetails.skill_based_exam_score;
                    newTask.Subject__c = actRecDetails.subject;
                    newTask.Search_by_value__c = actRecDetails.search_by_value;
                    newTask.WhatId = mapofUidByAccId.get(newTask.Search_by_value__c);
                    taskListToBeInserted.add(newTask);
                    system.debug('taskListToBeInserted::'+taskListToBeInserted);
                    
                }else{
                    ActivityResponseWrapper.failed_activity failure_activity_response= new ActivityResponseWrapper.failed_activity();
                    failure_activity_response.failure_activity = actRecDetails;
                    failure_activity_response.error_msg = 'Account is not available';
                    response.failed_activity_list.add(failure_activity_response);
                    system.debug('actRecDetails::'+actRecDetails);
                    
                }
                
                
            }
            if(!taskListToBeInserted.isEmpty()){
                insert taskListToBeInserted;
                response.success_activity_list = new list<task>();
                response.success_activity_list.addAll(taskListToBeInserted);
            }
        }else{
            for(ActivityWrapper.cls_Activity actRecDetails: recInfoWrap.Activity){
                ActivityResponseWrapper.failed_activity failure_activity_response= new ActivityResponseWrapper.failed_activity();
                    failure_activity_response.failure_activity = actRecDetails;
                    failure_activity_response.error_msg = 'Account is not available';
                    response.failed_activity_list.add(failure_activity_response);
            }
        }
        return response;
    }

*/
}