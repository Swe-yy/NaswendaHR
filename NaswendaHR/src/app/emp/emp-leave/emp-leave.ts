import { Component, input, output } from '@angular/core';
import { Header } from '../../header/header';
import { Footer } from '../../footer/footer';

@Component({
  selector: 'app-emp-leave',
  imports: [Header,Footer],
  templateUrl: './emp-leave.html',
  styleUrl: './emp-leave.scss',
})
export class EmpLeave {

}
