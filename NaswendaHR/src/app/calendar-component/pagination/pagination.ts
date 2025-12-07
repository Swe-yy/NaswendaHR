import { Component,input } from '@angular/core';

@Component({
  selector: 'app-pagination',
  imports: [],
  templateUrl: './pagination.html',
  styleUrl: './pagination.scss',
})
export class Pagination {
  itemsPerPage: number = 7;
  currentPage = 1;
  totalItems = input.required<number>();
  pages = 0;

  constructor() {
    if (this.totalItems() > 0)
      this.pages = Math.ceil(this.totalItems() / this.itemsPerPage);
  }
}
