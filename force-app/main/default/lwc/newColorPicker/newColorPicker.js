import { LightningElement } from 'lwc';

export default class NewColorPicker extends LightningElement {
    handleColorChange(event){
        const colorCodeVal=event.target.value;
        const colorCodeEvent = new CustomEvent('colorchange',{
            detail:{colorCodeVal},
        });
    }
}