import { LightningElement,api } from 'lwc';
import Opportunity_Name from '@salesforce/schema/Opportunity.Name';
import Opportunity_Amount from '@salesforce/schema/Opportunity.Amount';
import Opportunity_Stage from '@salesforce/schema/Opportunity.StageName';
import Opportunity_Date from '@salesforce/schema/Opportunity.CloseDate';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class NewQuickUpdateRecordFormForOpportunity extends LightningElement {

    @api objectApiName;
    @api recordId;
    fields = [Opportunity_Name,Opportunity_Amount,Opportunity_Stage,Opportunity_Date];

    handleUpdateOpportunity(event){
        const evt=new ShowToastEvent({
            title: 'Opportunity Updated',
            message: 'Opportunity Record: ' +event.detail.fields.Name.value+" is Successfully Updated",
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
}