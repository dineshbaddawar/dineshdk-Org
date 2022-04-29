import { LightningElement,track,wire } from 'lwc';
import getContact from '@salesforce/apex/ContactClass.getContact';

export default class NewDataTableWithWireContact extends LightningElement {

    @track data;
    @track columns=[
        {label:'LastName',fieldName:'LastName'},
        {label:'Email',fieldName:'Email'},
        {label:'Phone',fieldName:'Phone'},
    ];

    @wire(getContact) getRecords({error,data}){
        if(data){
            this.data=data;
        }else if(error){
            this.data=undefined;
        }
    }
}