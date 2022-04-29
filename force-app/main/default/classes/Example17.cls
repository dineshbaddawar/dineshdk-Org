public class Example17 {

    public integer age;
    public string name;
    public string city;
    public void callMe(){
        age=44;
        name='Kiran';
        city='Pune';
    }
    public void show(){
        system.debug('Age:'+age);
        system.debug('Name:'+name);
        system.debug('City:'+city);
    }
}