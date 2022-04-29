trigger AccountActions on Account (after insert) {
 AccountActions_Handler.CreateContacts(trigger.new);
    
}