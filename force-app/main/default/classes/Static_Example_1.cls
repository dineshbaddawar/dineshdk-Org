public class Static_Example_1 {

    public static string branch,colgName;
    public string name;
    public integer age;
    public Static_Example_1(string name,integer age){
        this.name=name;
        this.age=age;
        branch='CSE';
        colgName='CBIT';
    }
    public void show(){
        system.debug('Name:'+name);
        system.debug('Age:'+age);
        system.debug('Branch:'+branch);
        system.debug('ColgName:'+colgName);
    }
}