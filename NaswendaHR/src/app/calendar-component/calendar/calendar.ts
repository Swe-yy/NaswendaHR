import { Component,input,output } from '@angular/core';
import { MonthView } from '../month-view/month-view';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-calendar',
  imports: [MonthView, CommonModule],
  templateUrl: './calendar.html',
  styleUrl: './calendar.scss',
})
export class Calendar {
  currentDate = new Date();

  changeMonth(offset: number){
    this.currentDate = new Date(
      this.currentDate.setMonth(this.currentDate.getMonth() + offset)
    );
  }
}
