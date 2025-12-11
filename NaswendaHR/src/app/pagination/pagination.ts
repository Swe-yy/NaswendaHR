import { Component, input, output,OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-pagination',
  imports: [CommonModule],
  templateUrl: './pagination.html',
  styleUrl: './pagination.scss',
})
export class Pagination implements OnInit {
  itemsPerPage = input<number>(5);
  currentPage = input<number>(1);
  totalItems = input<number>(10);
  pages = 0;
  pageList:number[] = [];
  onClick = output<number>()

  constructor() {
  }

  ngOnInit(): void {

    if (this.totalItems() > 0){
        
      this.pages = Math.ceil(this.totalItems() / this.itemsPerPage());
      this.pageList = Array.from({length: this.pages}, (_,i)=> i + 1);
    }
  
  }

  pageClicked(page: number){
    if(page > 0 && page <= this.pages)
    this.onClick.emit(page);
  }
}
