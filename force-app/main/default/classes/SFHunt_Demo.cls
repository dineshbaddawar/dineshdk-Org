public class SFHunt_Demo {
    
    // non-static variable
    public integer x=100;
   
    
    // static variable
    public static string name='Friend';
    
    
    
    
    /* 
Apex Code:

SFHunt_Demo d1=new SFHunt_Demo(); // d1 is an instance of the class
SFHunt_Demo d2=d1; // d2 reference variable of the class
system.debug(d1.x+' '+d2.x);

// Static Variable, Static block & Static Method

// 1. Static Variable: this are the special type of variable which are created during the load time of class.
//                     it should be accessed by class name.

// 2. Static Block: these are the block which are implicitly called when the classs is instantiated that means
when the instance of class is made.(by using new operator).                    


    
    
    // Constructor
    public SFHunt_Demo(){
        System.debug('The Constructor is Called');
    }
    
    static {
        system.debug('Static Block is Called');
    }

Apex code:
SFHunt_Demo d1=new SFHunt_Demo();


*/
    
    // 3. Static Method: Static method are automatically created during load time of class
    // They are accessed by using the class name
    // The most important point Static Function can not access non static method member.
    
    public static void Display(){
        System.debug('Static Method is Called');
    }
    
    // Apex code: SFHunt_Demo.Display();
    
    /*
     // Access Specifiers/ Modifier:
     
     // Both are same but few differences between them Access specifiers is old one & access modifier is new one
     // Its a special kind of modifiers using which we can define the scope of type & its members.
     
     */

/*
 
 # Life cycle of the Class:
 > In the life cycle of the class a static variable initialized one & only one time
   Where as variables are initialized 0 times or no of instance are created & n times if n instance is created.

 # Different kinds of Variables in a Class:
  1. Non-static
  2. Static
  3. Constants

> Static Variables: If a variables is explicitly declare  by using static modifier or else if a variable is declare
  under the static block then those variables are static where as rest of the others non-static.

    
    public integer a=100; // non-static
    public static integer b=200;  // static
    
    Apex code:
    System.debug(SFHunt_Demo.b);
    SFHunt_Demo d1=new SFHunt_Demo();
    system.debug(d1.a);
    SFHunt_Demo d2=new SFHunt_Demo();
    system.debug(d2.a);


> Constants Variable: The behaviour of constant variable will be similar like the static variables i.e.
                      initialized one & only one time in the life cycle of the class.


    public static final double PI=3.14;

Apex Code:
System.debug(SFHunt_Demo.PI);


> Inheritance: It's mechanism of consuming the members of one class in another class by establishing parent/child
               relationship between the classes which provide us reusability.

Rules of Inheritance:

1. Parent classes constructor must be accessible to the child class otherwise inheritance not possible.
2. In inheritance child class can access the members of the parent class but parent class can never access\
   any member if urs child class.
3. We can initialize a parent class variables by using the child class instance to make it as reference but
   in this case we can not call pure child clas members by reference.
4. Every class that is defined by us or pre-defined of the language has a default parent class i.e. Object.
        */ 
}