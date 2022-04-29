public class Example3 {
                                  /*
                                   without return value & with parameters
                                    apex code:Example3 var= new Example3();
                                               var.show('Dinesh Baddawar');
                                   */  
                            
    public void show(string name){
        system.debug('---Satrt-----');
        system.debug(' Name:'+name);
        system.debug('---Stop-----');
    }
}