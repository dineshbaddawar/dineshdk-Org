public class This_Student {

    public string lastName;
    public string firstName;
    public string phone;
    public This_Student(string lastName,string firstName,string phone){
        this.lastName=lastName;
        this.firstName=firstName;
        this.phone=phone;
    }
    public void show(){
        system.debug('LastName:'+lastName);
        system.debug('FirstName:'+firstName);
        system.debug('Phone:'+phone);
    }
}