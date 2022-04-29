public class Example16 {

    string name;
    string branch;
    integer age;
    string colgname;
    string phone;
    
 public   void invoke(){
        name='ganesh';
        branch='PCM';
        age=25;
        colgname='LBS';
        phone='2345176';
    }
   public void display(){
        system.debug('Name:'+name);
        system.debug('Branch:'+branch);
        system.debug('Age:'+age);
        system.debug('ColgName:'+colgname);
        system.debug('Phone:'+phone);
    }
}