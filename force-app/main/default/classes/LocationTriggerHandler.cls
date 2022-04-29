public class LocationTriggerHandler {

    @future(callout=true)
    public static void verifyAddress(String recordId){
        Location__c loc = [Select id,Name, Street__c, State__c, City__c, Postal_Code__c From Location__c Where
                       Id=:recordId];
        String baseURL ='https://us-street.api.smartystreets.com/street-address?auth-id=c31c9bfa-2eaa-609a-a81c-f60ade426956&auth-token=3P3l2gaCIqyz373AkPGP';
        baseURL+= '&street='+loc.Street__c+'&city'+loc.City__c+'&state'+loc.State__c+'&zipcode'+loc.Postal_Code__c+'&match=enhanced';
        HttpRequest httpReq = new HttpRequest();
        httpReq.setMethod('GET');
        httpReq.setEndpoint(baseURL);
        httpReq.setHeader('Content-Type', 'application/json');
        
        Http http = new Http();
        
        HttpResponse httpRes= new HttpResponse();
        
        try{
                httpRes= http.send(httpReq);
            system.debug('Response Body '+httpReq.getBody());
                if(httpRes.getStatusCode() == 200 && httpRes.getStatus() == 'OK'){
                String responseBody=httpReq.getBody();
                }else{
                   TransactionLogHandler.doHandleExceptionWithError(httpRes.getBody() , 'LocationTriggerHandler'); 
                }
        }catch(system.CalloutException ex){
            system.debug('Exception Executed '+ex.getStackTraceString());
            TransactionLogHandler.doHandleException(ex, 'LocationTriggerHandler');
        }
        
    }
}