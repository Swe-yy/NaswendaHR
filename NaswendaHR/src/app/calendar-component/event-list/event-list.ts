import { Component, input, output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-event-list',
  imports: [CommonModule],
  templateUrl: './event-list.html',
  styleUrl: './event-list.scss',
})
export class EventList {
  events!: string[];  //fetch leave from api!!!!!
  remove = new EventEmitter<string>();

  onRemove(event: string){
    this.remove.emit(event);
  }
}
