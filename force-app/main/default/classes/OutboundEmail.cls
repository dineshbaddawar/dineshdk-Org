public class OutboundEmail {

    public static void EmailMessage(){
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        List<String> strlist=new List<String>{'dineshbaddawar@gmail.com'};
            mail.setToAddresses(strlist);
            mail.setSubject('Salesforce Email For Outbound Message');
            mail.setPlainTextBody('This is an Outbound Message From Salesforce.com');
        Messaging.Email[] mail1=new Messaging.Email[]{mail};
            messaging.sendEmail(mail1);
    }
    
    
}