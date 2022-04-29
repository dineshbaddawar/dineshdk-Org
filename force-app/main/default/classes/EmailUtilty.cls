public class EmailUtilty {
    
    public Static void SendEmailWithoutTemplate(){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        String[] EmialAddress = new String[]{'dbaddawar@gmail.com'};
            
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Interview Letter');
        mail.setPlainTextBody('You have been Selected For the Interview.');
        mail.setToAddresses(EmialAddress);
        mailList.add(mail);
        if(!mailList.isEmpty())
            Messaging.sendEmail(mailList);
    } 
    
    public Static void SendEmailWithTemplate(){
      List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        EmailTemplate temp = [SELECT Id,Subject,Body FROM EmailTemplate WHERE Name ='Offer Letter'];
       List<Contact> conList = [SELECT Id,LastName FROM Contact WHERE Email !=null];
        
        for(Contact con : conList){
        Messaging.SingleEmailMessage mailTemp = new Messaging.SingleEmailMessage();
        mailTemp.setTemplateId(temp.id);
        mailTemp.setTargetObjectId(con.id);
        mailList.add(mailTemp);
        }
        
        if(!mailList.isEmpty())
            Messaging.sendEmail(mailList);
    }
}