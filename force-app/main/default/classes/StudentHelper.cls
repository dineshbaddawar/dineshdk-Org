public class StudentHelper {

    public static List<StudentWrapper> studentList;
    public StudentHelper(){
        studentList = new List<StudentWrapper>();
    }
    
    public Static void insertStudent(StudentWrapper stuWrap){
        studentList.add(stuWrap);
    }
    
    public Static List<String> getStudentByHobby(String hobby){
        Map<String,List<String>> studentByTheirHobbies = new Map<String,List<String>>();
        
        for(StudentWrapper stuWrap:studentList){
            for(String eachHobby:stuWrap.hobbies){
                if(studentByTheirHobbies.containsKey(eachHobby)){
                    studentByTheirHobbies.get(eachHobby).add(stuWrap.Email);
                }else{
                    studentByTheirHobbies.put(eachHobby, new List<String>{stuWrap.Email});
                }
            }
        }
        return studentByTheirHobbies.get(hobby);
    }
}