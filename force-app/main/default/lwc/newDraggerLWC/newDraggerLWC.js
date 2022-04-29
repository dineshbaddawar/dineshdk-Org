import { LightningElement,wire } from 'lwc';
import getAccountList from '@salesforce/apex/NewDraggerClass.getAccountList';

export default class NewDraggerLWC extends LightningElement {
    @wire(getAccountList) accounts;
    handleDragStart(event){
        event.dataTransfer.setData("account_id",event.target.dataset.item);
    }
}