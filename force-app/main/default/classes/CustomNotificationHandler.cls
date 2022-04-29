public class CustomNotificationHandler {

    public Static void AfterInsert(List<Lead> newLeadList){
         for(Lead led : newLeadList){
            if(led.Followup_Date__c !=null){
                Messaging.CustomNotification notification = new Messaging.CustomNotification();
                notification.setBody('FollowUp Created for Lead');
                notification.setTitle('Lead Name :'+led.FirstName+' '+led.LastName+'\n Lead Id : '+led.Id);
                notification.setSenderId(Userinfo.getUserId());
                CustomNotificationType type = [SELECT Id FROM CustomNotificationType WHERE DeveloperName = 'Flow_Sample_Notification'];
                notification.setNotificationTypeId(type.id);
                notification.setTargetId(led.Id); // target object id
                notification.send(new Set<String> { Userinfo.getUserId() });
            }
        }
    }
    
}