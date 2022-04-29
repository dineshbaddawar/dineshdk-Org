global class Activity_Response_Wrapper {

    global class ResponseWrapper{
        global List<Task> success_activity_list;
        global List<failure_activity_cls> failed_activity_list;
    }
    
    global class failure_activity_cls{
        global Activity_Request_Wrapper.cls_activity failure_activity_details;
        global String error_msg;
    }
}