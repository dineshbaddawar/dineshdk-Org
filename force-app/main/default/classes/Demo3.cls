public class Demo3 {
    public void MainValueMethod(){
        
        String Applicaton ='Instagram';
        
        system.debug('Before Value Call '+Applicaton);
        PassByValueCall(Applicaton);
        system.debug('After Value Call '+Applicaton);
    }
    
    private void PassByValueCall(string ApplicationName){
        ApplicationName ='Facebook.com';
    }
    
    public void MainReferenceMethod(){
        
        Account a = new Account ();
        a.name='Dinesh Baddawar';
        a.website='www.google.com';
        
       system.debug('Before Reference Call '+a);
       system.debug('After Reference Call '+a);      
    }
    
    private void PassByRefCall (Account a){
        a.website='www.pirple.com';
    }
}