public class DatabaseMethod_3 {

    public void Method(){
    List<Contact> conList=new List<Contact>();
    
    Contact con=new Contact();
    con.FirstName='Smriti';
    con.LastName='Mandhana';
    conList.add(con);
        
        Contact con1=new Contact();
        con1.FirstName='Dinesh';
        conList.add(con1);
        
        Database.SaveResult [] strlist=Database.insert(conList,false);
        for(Database.SaveResult str:strlist){
            if(str.isSuccess()){
                System.debug('the Record is Inserted & ID: '+str.getId());
            }else{
                for(Database.Error err:str.getErrors()){
                    System.debug('The Error is Occured');
                    System.debug('The Error is '+err.getMessage());
                }
            }
        }
}
}