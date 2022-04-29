public class Example20 {

    public string name,branch,colgname;
    public integer age;
    public Example20(){
        branch='CBM';
        colgname='LBSC';
    }
    public void show(){
        system.debug('Name:'+name);
        system.debug('Age'+age);
        system.debug('Branch:'+branch);
        system.debug('ColgName'+colgname);
    }
}