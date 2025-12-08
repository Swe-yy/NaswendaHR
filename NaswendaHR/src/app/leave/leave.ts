import { Component, input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Pagination } from '../pagination/pagination/pagination';

export interface LeaveItem {
  title: string;
  date: Date;
  status: string;
}

@Component({
  selector: 'app-leave',
  imports: [CommonModule, Pagination],
  templateUrl: './leave.html',
  styleUrl: './leave.scss',
})
export class Leave {
  manager = input<boolean>(false);
  upcomingLeave: LeaveItem[] = [];
  pendingLeave: LeaveItem[] = [];
 

  upcomingCurrentPage = 1;
  pendingCurrentPage = 1;

  changeUpcomingPage(page: number) {
    this.upcomingCurrentPage = page;
  }

  changePendingPage(page: number) {
    this.pendingCurrentPage = page;
  }
}
