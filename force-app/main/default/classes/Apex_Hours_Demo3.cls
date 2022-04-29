public class Apex_Hours_Demo3 {

    public void mainValueMethod(){
        
        string websiteurl = 'wwww.Google.com';
        
        system.debug('Before Value Call '+ websiteurl);
        passByValueCall(websiteurl);
        system.debug('After value call '+ websiteurl);
    }
    
    private void passByvalueCall(string websiteUrlValue){
        websiteUrlValue = 'www.salesforce.com';
    }
    
    public void mainReferenceMethod(){
        
        Account a = new Account ();
        a.name ='test Account';
        a.website= 'wwww.Google.com';
        
        system.debug('Before reference cell '+a);
        passByRefcall(a);
        system.debug('After reference call '+a);
    }
    
    private void passByRefcall(account a){
        a.website = 'www.salesforce.com';
    }
}