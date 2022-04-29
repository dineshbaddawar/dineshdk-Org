import { LightningElement,track } from 'lwc';
import getContact from '@salesforce/apex/ContactClass.getContact';

export default class NewDataImperativeForContact extends LightningElement {

    @track data;
    @track errors;
    @track columns=[
        {label:'FirstName',fieldName:'FirstName'},
        {label:'LastName',fieldName:'LastName'},
        {label:'Email',fieldName:'Email'},
        {label:'Phone',fieldName:'Phone'},
    ];

    connectedCallback(){
      getContact()
      .then(result=>{
          this.data=result;
      })
      .catch(error=>{
          this.errors=error;
      })
    }
}