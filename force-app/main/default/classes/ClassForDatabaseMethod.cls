public class ClassForDatabaseMethod {

            public static void DatabaseCall(){
 
            List<Contact> conlist=new List<Contact>();
            contact con1 = new Contact();
            con1.FirstName='Class';
            con1.LastName='1';
            conlist.add(con1);
            
            Contact con= new Contact();
            con.FirstName='Class 2';
            conlist.add(con);
            
                Database.SaveResult[] srlist= Database.insert(conlist,false);
                for(Database.SaveResult sr:srlist){
                    if(sr.isSuccess()){
                        system.debug('Get Id--'+sr.getId());
                    }else{
                        for(Database.Error objerr:sr.getErrors()){
                            system.debug(objerr.getMessage());
                        }
                    }
                }
    }
    
}