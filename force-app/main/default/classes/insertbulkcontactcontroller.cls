public class insertbulkcontactcontroller {
 public pageReference sav(){
        return null;
    }
    public integer serialno{set;get;}
    public list<contact> con {set;get;}
    public insertbulkcontactcontroller(){
     con = new list<contact>();
      // for(integer i=0; i<3; i++) {
        //con.add(new contact());
     // }
    }
    public pageReference add(){
        con.add(new contact());
        return null;
    }
    public pageReference remo(){
        if(serialno != null){
           con.remove(serialno);
        }
        return null;
    }      
}