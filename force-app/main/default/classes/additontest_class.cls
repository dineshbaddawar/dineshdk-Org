@isTest
public class additontest_class {
    public static testmethod void myAddtest(){
        myClass_OntestAddtion myC = new myClass_OntestAddtion();
        myC.a = 30;
        myC.b = 50;
        myC.myAdd();
        system.assertEquals(80, myC.c);    
    }
}