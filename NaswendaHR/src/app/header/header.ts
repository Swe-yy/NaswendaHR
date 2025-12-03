import { Component, input, output , NgModule} from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-header',
  imports: [CommonModule],
  templateUrl: './header.html',
  styleUrl: './header.scss',
})
export class Header {
  loginIcon = input<boolean>(false);
  logoutIcon = input<boolean>(false);
  regIcon = input<boolean>(false);
  leavePageIcon = input<boolean>(false);
  dashIcon = input<boolean>(false);

  
}
