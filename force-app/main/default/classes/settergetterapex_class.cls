public class settergetterapex_class {
    public integer x {set;get;}
    public integer y {set;get;}
    public integer result {set;get;}
    public string operation {set;get;}
    
    public pageReference add(){
        result = x + y;
        operation='ADDTION';
        return null;
    }
}