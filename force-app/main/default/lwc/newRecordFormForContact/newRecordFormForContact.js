import { LightningElement } from 'lwc';
import Contact_LastName from '@salesforce/schema/Contact.LastName';
import Contct_FirstName from '@salesforce/schema/Contact.FirstName';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';

export default class NewRecordFormForContact extends LightningElement {

    objectApiName = 'Contact';
    fields=[Contact_LastName,Contct_FirstName,ShowToastEvent,NavigationMixin];

    handleContact(event){
        const evt=new ShowToastEvent({
            title: 'Contact Created',
            message: 'Record Id ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.detail.id,
                objectApiName: 'Contact',
                actionName: 'view',
            },
        });
    }
}