import { Component, input, output } from '@angular/core';
import { Header } from '../../header/header';
import { Footer } from '../../footer/footer';
import { Calendar } from '../../calendar-component/calendar/calendar';
import { EventList } from '../../calendar-component/event-list/event-list';

@Component({
  selector: 'app-emp-leave',
  imports: [Header,Footer,Calendar,EventList],
  templateUrl: './emp-leave.html',
  styleUrl: './emp-leave.scss',
})
export class EmpLeave {

}
