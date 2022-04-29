// Number Pattern Code
public class codingTest {
    public static void StarPattern(){ 
        integer n=5;
        for(integer i=1;i<=n;i++){
            integer p=1;
            for(integer j=1;j<=i;j++){
                System.debug('');
            }
            for(integer j=i;j<=n;j++){
                System.debug(p++ +'');
            }
            System.debug('');
        }
    }
}
/*
   int n=5;
     for(int i=1,p=1;i<=n;i++,p++){
         for(int j=1;j<=i;j++){
             System.out.println(p+" ");
         }
         System.out.println();
     }
 */