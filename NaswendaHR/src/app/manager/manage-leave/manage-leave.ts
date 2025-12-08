import { Component } from '@angular/core';
import { Header } from '../../header/header';
import { Footer } from '../../footer/footer';
import { Leave } from '../../leave/leave';

@Component({
  selector: 'app-manage-leave',
  imports: [Header,Footer,Leave],
  templateUrl: './manage-leave.html',
  styleUrl: './manage-leave.scss',
})
export class ManageLeave {

}
