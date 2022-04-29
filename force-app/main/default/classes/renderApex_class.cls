public class renderApex_class {
    public Boolean myData {set;get;}
    public Account accRec {set;get;}
    public renderApex_class(){
       accRec = [select id,name,accountNumber from Account limit 1];
        myData = false;
    }
    public void showMydata(){
     myData = true;   
    }
}