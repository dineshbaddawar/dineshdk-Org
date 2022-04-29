public class personDetails {
public integer empNumber;
public string   empName;
    public personDetails(){
       empNumber = 123;
        empName = 'Dinesh';
    }
    public void empDetails(){
        system.debug('Employee Number is---'+empNumber);
        system.debug('Employee Name is---'+empName);
    }
}