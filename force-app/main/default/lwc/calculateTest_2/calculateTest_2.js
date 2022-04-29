import { LightningElement,track } from 'lwc';

export default class CalculateTest_2 extends LightningElement {

    // it is for Addition Calculator
    firstnumber;
    secondnumber;
    @track result=0;

    handleChange(event){
        if(event.target.name==='fnumber'){
            this.firstnumber=event.target.value;
        }
        if(event.target.name==='snumber'){
            this.secondnumber=event.target.value;
        }
        this.result=parseInt(this.firstnumber)+parseInt(this.secondnumber);
    } 




    /* it is for Subtraction Calculator
    firstnumber;
    secondnumber;
    @track result=0;

    handleChange(event){
        if(event.target.name==='fnumber'){
            this.firstnumber=event.target.value;
        }
        if(event.target.name==='snumber'){
            this.secondnumber=event.target.value;
        }
        this.result=parseInt(this.firstnumber)-parseInt(this.secondnumber);
    } */c

}