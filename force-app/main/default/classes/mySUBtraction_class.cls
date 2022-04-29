public class mySUBtraction_class {
    public integer A {set;get;}
    public integer B {set;get;}
    public integer Result {set;get;}
    public string operation {set;get;}
    
    public pageReference sub(){
        Result = A - B;
         operation ='SUBTRACTION';
        return null;
    }
}