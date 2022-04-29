public class QuickActionAccountUpdate {
    
    @AuraEnabled  
    public static void updateAccount( String recId ) {
        
        update new Account( Id = recId, Description = String.valueOf( System.now() ) );
        
    }
}