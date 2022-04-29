public class DatabaseMethod_1 {
    // 100% Code Coverage
    public static void Data(){
        List<Contact> conList=new List<Contact>();
        
        Contact con=new Contact();
        con.FirstName='Annabel';
        con.LastName='Sutherland';
        conList.add(con);
        
        Contact co=new Contact();
        co.FirstName='Dinesh';
        conList.add(co);
        
        Database.SaveResult [] strlist=Database.insert(conList,false);
        for(Database.SaveResult result:strlist){
            if(result.isSuccess()){
                System.debug('The Record Created & ID Is '+result.getId());
            }else{
                for(Database.Error getError:result.getErrors()){
                    System.debug('The Error is Occured & The Error is '+getError.getMessage());
                }
            }
        }
    }
}