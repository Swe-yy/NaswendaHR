import { Component, computed, input, OnInit } from '@angular/core';
import { EventList } from '../event-list/event-list';
import { CommonModule } from '@angular/common';
import { Events } from '../services/events';
import { Pagination } from '../pagination/pagination';

@Component({
  selector: 'app-month-view',
  standalone: true,
  imports: [EventList, CommonModule, Pagination],
  templateUrl: './month-view.html',
  styleUrl: './month-view.scss',
})
export class MonthView implements OnInit {
  date = input<Date>(new Date());
  events: { [key: string]: string[] } = {};
  selectedDate: Date | null = null;
  numDays = new Date(this.date().getFullYear(), this.date().getMonth() + 1, 0).getDate();
  constructor(private event: Events) { }

  currentPage = 1;
  itemsPerPage = 7;

  days = computed(() => {
    const d = this.date();
    const year = d.getFullYear();
    const month = d.getMonth();
    const numDays = new Date(year, month + 1, 0).getDate();

    const array: Date[] = [];

    for (let i = 1; i < numDays; i++) {
      array.push(new Date(year, month, i));
    }
    return array;
  })

  get paginatedDays() {
    const start = (this.currentPage - 1)* this.itemsPerPage
    const end = start + this.itemsPerPage;

    return this.days().slice(start,end);
  }

  ngOnInit(): void {

  }


  selectDate(day: Date) {
    this.selectedDate = day;
  }

  loadEvents() {
    this.days().forEach((day) => {
      const dateString = this.date().toISOString().split('T')[0];
      this.events[dateString] = this.event.getEvents(dateString);
    });
  }
  addEvent(day: Date) {
    const event = prompt('Enter event:');
    if (event) {
      const dateString = day.toISOString().split('T')[0];
      this.event.addEvent(dateString, event);
      this.loadEvents();
    }
  }

  removeEvent(day: Date, event: string) {
    const dateString = day.toISOString().split('T')[0];
    this.event.removeEvent(dateString, event);
    this.loadEvents();
  }

  checkEvent(day: Date) {
    const dateString = day.toISOString().split('T')[0];
    const arr = this.event.getEvents(dateString);
    return arr.length;
  }

  changePage(page: number){
    this.currentPage = page;
  }
}
