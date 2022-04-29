public class childtoparentsoql {
    public List<Contact> cons {set;get;}
    public Boolean flag1 {set;get;}
    public Boolean flag2 {set;get;}
    public void standardLookup(){
        flag1 = true;
        flag2 = false;
    cons = [select lastname,firstname,Account.Name,Account.industry from contact];    
    }
    public void customLookup(){
        flag1 = false;
        flag2 = true;
    cons = [select lastname,firstname,CustomAccount__r.Name,CustomAccount__r.industry from contact];      
    }
}