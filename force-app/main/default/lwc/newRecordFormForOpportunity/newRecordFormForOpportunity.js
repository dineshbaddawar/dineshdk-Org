import { LightningElement } from 'lwc';
import Opportunity_Name from '@salesforce/schema/Opportunity.Name';
import Opportunity_Date from '@salesforce/schema/Opportunity.CloseDate';
import Opportunity__Stage from '@salesforce/schema/Opportunity.StageName';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';

export default class NewRecordFormForOpportunity extends LightningElement {

    objectApiName= 'Opportunity';
    fields= [Opportunity_Name,Opportunity_Date,Opportunity__Stage];

    handleOpportunity(event){
        const evt=new ShowToastEvent({
            title: 'Record Created',
            message: 'RecordId Id '+ event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.detail.id,
                objectApiName: 'Opportunity',
                actionName: 'view'
            },
        });
    }
}