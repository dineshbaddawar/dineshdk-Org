public class insertbulkcontact {
    public PageReference sav() {
        return null;
    }
    public integer serialno{get;set;}
    public list<contact> con{get;set;}
    
    public insertbulkcontact(){
        con = new list<contact>(); 
        for(integer i=0; i<2; i++){
            con.add(new contact());
        }  
    }
    public PageReference add(){
        con.add(new contact());
        return null;
    } 
    public PageReference remo() {
        if(serialno != null){
         con.remove(serialno);   
        }
        
        return null;
    }
}