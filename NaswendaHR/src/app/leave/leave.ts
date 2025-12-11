import { Component, input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Pagination } from '../pagination/pagination';
import { Router, RouterOutlet, RouterLink, RouterLinkActive } from '@angular/router';

export interface LeaveItem {
  title: string;
  date: Date;
  status: string;
}

@Component({
  selector: 'app-leave',
  imports: [CommonModule, Pagination, RouterOutlet, RouterLink, RouterLinkActive],
  templateUrl: './leave.html',
  styleUrl: './leave.scss',
})
export class Leave {
  manager = input<boolean>(false);
  upcomingLeave: LeaveItem[] = [];
  pendingLeave: LeaveItem[] = [];


  upcomingCurrentPage = 1;
  pendingCurrentPage = 1;

  deleting: boolean = false;

  changeUpcomingPage(page: number) {
    this.upcomingCurrentPage = page;
  }

  changePendingPage(page: number) {
    this.pendingCurrentPage = page;
  }

  deleteLeave(){
    this.deleting = true;
  }
}
