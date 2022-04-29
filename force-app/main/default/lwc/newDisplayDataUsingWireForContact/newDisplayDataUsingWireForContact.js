import { LightningElement,track,wire } from 'lwc';
import getContact from '@salesforce/apex/ContactClass.getContact';

export default class NewDisplayDataUsingWireForContact extends LightningElement {
    @track data;
    @wire(getContact) contactRecord({error,data}){
        if(data){
            this.data=data;
        }else if(error){
            this.data=undefined;
        }
    }
}