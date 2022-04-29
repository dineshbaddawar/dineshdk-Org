public class StudentWrapper {
    
    public String FirstName;
    public String LastName;
    public String Email;
    public List<String> hobbies;
    
    public StudentWrapper(String FirstName, String LastName, String Email,List<String> hobbies){
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.hobbies = hobbies;
    }

    
}

/*
 Apex code:

StudentWrapper st1 = new StudentWrapper('Ajeet','Kumar','aj@gmail.com',new List<String>{'Chess','Gaming'});
StudentWrapper st2 = new StudentWrapper('Isha','Raj','isha@gmail.com',new List<String>{'Chess','Songs'});
StudentWrapper st3 = new StudentWrapper('Anjali','Singh','anj@gmail.com',new List<String>{'Karrom','Badminton','Songs'});
StudentWrapper st4 = new StudentWrapper('Mukesh','Kumar','mukesh@gmail.com',new List<String>{'Books','Lightning','Talking'});

StudentHelper stuHelper = new StudentHelper();
StudentHelper.insertStudent(st1);
StudentHelper.insertStudent(st2);
StudentHelper.insertStudent(st3);
StudentHelper.insertStudent(st4);
System.debug(StudentHelper.getStudentByHobby('Chess'));


 */