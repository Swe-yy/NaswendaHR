import { Component, input, output } from '@angular/core';
import { Header } from '../../header/header';
import { Footer } from '../../footer/footer';
import { Calendar } from '../../calendar-component/calendar/calendar';

@Component({
  selector: 'app-emp-leave',
  imports: [Header,Footer,Calendar],
  templateUrl: './emp-leave.html',
  styleUrl: './emp-leave.scss',
})
export class EmpLeave {

}
