public class Example1 {
    public void callMe(){
        for(integer i=1;i<=100;i++){
            integer x=Math.mod(i,2);
            if(x==0)
                system.debug(i);
        }
    }

}