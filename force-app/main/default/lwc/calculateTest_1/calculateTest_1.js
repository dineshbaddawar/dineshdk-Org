import { LightningElement,track } from 'lwc';

export default class CalculateTest_1 extends LightningElement {
    firstNumber;
    secondNumber;
    @track result=0;

    handleChanges(event){
        if(event.target.name==='fnumber'){
            this.firstNumber=event.target.value;
        }
        if(event.target.name==='snumber'){
            this.secondNumber=event.target.value;
        }
        this.result=parseInt(this.firstNumber)-parseInt(this.secondNumber);
    }
}