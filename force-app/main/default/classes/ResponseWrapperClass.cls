global with sharing class ResponseWrapperClass {
    
    global class ResponseWrapper{
        
        global List<Account> success_account_list;
        global List<Opportunity> success_opportunity_list;
        global List<Contact> success_contact_list;
        global list<Account> success_child_account;
        global List<account> failed_account_list;
        global List<opportunity> failed_subscription_list;
        global List<failure_contact> failed_contact_list;
        global list<account> failed_child_account_list;
    }
    
    global class failure_account{
        global account account_details;
        global string error_msg;
    }
    
    global class failure_subscription{
        global opportunity subscription_details;
        global string error_msg;
    }
    
    global class failure_contact{
        global contact contact_details;
        global string error_msg;
    }
    
}