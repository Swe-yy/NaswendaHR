import { Component, input, output } from '@angular/core';
import { Header } from '../../header/header';
import { Footer } from '../../footer/footer';
import { Leave } from '../../leave/leave';

@Component({
  selector: 'app-emp-leave',
  imports: [Header,Footer,Leave],
  templateUrl: './emp-leave.html',
  styleUrl: './emp-leave.scss',
})
export class EmpLeave {

}
