import { LightningElement,wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/NewAccountSearchCls.getAccounts';
const DELAY = 300;

export default class NewSearchAccount extends LightningElement {
    accountName='';
    @track accountList=[];
    @wire(getAccounts, {actName:'$accountName'})
    retriveAccountList({error,data}){
        if(data){
            this.accountList = data;
        }else if(error){

        }
    }

    handleKeyChange(event){
        const searchString = event.target.value;
        window.clearTimeout(this.delayTimeout);
        this.delayTimeout= setTimeout(()=>{
            this.accountName=searchString;
        }, DELAY);
    }
}