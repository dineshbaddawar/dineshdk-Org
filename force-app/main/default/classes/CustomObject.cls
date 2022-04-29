public class CustomObject {

    public static void DatabaseMethod(){
        
        List<Sobject> objlist=new List<Sobject>();
        
        Laundry_Customer__c var=new Laundry_Customer__c();
        var.Address__c='Nanded Dharmabad';
        var.Name='Mr Shantunu';
        objlist.add(var);
        
        Laundry_Customer__c op=new Laundry_Customer__c();
        op.Name='Ms Pallavi';
        op.Address__c='Pune Moshi';
        op.Email__c='dineshbaddawar@gmail.com';
        objlist.add(op);
        Database.SaveResult [] str=Database.insert(objlist,false);
        for(Database.SaveResult sr:str){
            if(sr.isSuccess()){
                system.debug('successfull record insertd :'+sr.getid());
            }else{
                for(Database.Error err:sr.getErrors()){
                    system.debug('the error is occured');
                    system.debug('the error is :'+err.getMessage());
                }
            }
        }
    }
}