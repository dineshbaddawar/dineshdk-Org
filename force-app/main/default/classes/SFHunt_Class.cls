public class SFHunt_Class {
   
    // Types of Constructor
    // 1. Parameterless
    // 2. With Parameter
    // 3. Copy Constructor
    
    integer i;
    /*
    // Parameter Less
    public  SFHunt_Class(){
        System.debug('Parameterless Construcotr');
    }
    
    // With Parameter 
    public SFHunt_Class(Integer age){

     System.debug('The one Parameter');        
    }
    
    // Constructor Overloading: multiple constructor having the same name & different parameter
    public SFHunt_Class(Integer age,String name){
        System.debug('Two Parameter');
    }
    
    public SFHunt_Class(Integer age,String name,Boolean isActivate){
        system.debug('Three Parameter');
    }
      */    

    // Copy Constructor: if we want to create multiple instance with same value then we use this copy constructor.
    
    // define the constructor
    public SFHunt_Class(Integer x){
        this.i=x;
    }
    
    // define copy constrcutor
    public SFHunt_Class(SFHunt_Class cc){
        this.i=cc.i;
    }
    
    public void Display(){
        System.debug('the value of I '+i);
    }
    /*
     Apex code:
     SFHunt_Class var=new SFHunt_Class(100);
        var.Display();
        
        SFHunt_Class var1=new SFHunt_Class(var);
        var1.Display();
     */
}