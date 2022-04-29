trigger CustomNotification on Lead (after insert) {

    if(trigger.isAfter && trigger.isInsert){
       CustomNotificationHandler.AfterInsert(trigger.new);
    }
    
}