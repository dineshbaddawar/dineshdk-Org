import { LightningElement,track } from 'lwc';

export default class Parent extends LightningElement {
    @track message;
    @track messageFromChild;
    sendDatatoChild(event){
        this.message='Message From Parent !!!';
    }
    handlechildMessage(event){
        this.messageFromChild=event.detail;
    }
}