import { LightningElement } from 'lwc';
import Contact_Object from '@salesforce/schema/Contact';
import Contact_FirstName from '@salesforce/schema/Contact.FirstName';
import Contact_LastName from '@salesforce/schema/Contact.LastName';
import Contact_Phone from '@salesforce/schema/Contact.Email';
import Contact_Email from '@salesforce/schema/Contact.Email';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import {NavigationMixin} from 'lightning/navigation';

export default class NewCreateContactUsingUI extends LightningElement {

    FirstName='';
    LastName='';
    Phone='';
    Email='';

    handleChange(event){
        if(event.target.label=='FirstName'){
            this.FirstName=event.target.value;
        }
        if(event.target.label=='LastName'){
            this.LastName=event.target.value;
        }
        if(event.target.label=='Phone'){
            this.Phone=event.target.value;
        }
        if(event.target.label=='Email'){
            this.Email=event.target.value;
        }
    }

    createContact(){
        const fields={};
        fields[Contact_FirstName.fieldApiName] = this.FirstName;
        fields[Contact_LastName.fieldApiName] = this.LastName;
        fields[Contact_Phone.fieldApiName] = this.Phone;
        fields[Contact_Email.fieldApiName] = this.Email;

        const recordInput = {apiName: Contact_Object.objectApiName, fields};
        createRecord(recordInput)
        .then(contact=>{
            this.contactId= contact.id;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contact Created',
                    variant: 'success',
                }),
            );

            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: contact.id,
                    objectApiName: 'Contact',
                    actionName: 'view',
                },
            });

        })
        .catch(error=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error Occured',
                    message: error.body.message,
                    variant: 'error',
                }),
            );
        });
    }
}