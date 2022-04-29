public class Example2 {
    
    public void testMe(){
        integer sum=0;
        for(integer i=1;i<=100;i++){
            integer x=Math.mod(i,2);
            if(x==1)
                sum=sum+i;
        }
        system.debug('sum'+sum);
    }

}