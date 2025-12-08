import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

export interface LeaveItem {
  title: string;
  date: Date;
  status: string;
}

@Component({
  selector: 'app-leave',
  imports: [CommonModule],
  templateUrl: './leave.html',
  styleUrl: './leave.scss',
})
export class Leave {
  upcomingLeave: LeaveItem[] = [];
  pendingLeave: LeaveItem[] = [];
}
