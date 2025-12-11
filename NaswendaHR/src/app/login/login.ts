import { Component, OnInit } from '@angular/core';
import { Header } from '../header/header';
import { Footer } from '../footer/footer';
import { ApiCalls } from '../services/api-calls';

@Component({
  selector: 'app-login',
  imports: [Header, Footer],
  templateUrl: './login.html',
  styleUrl: './login.scss',
})
export class Login implements OnInit {
  empID: string = "";
  password: string = ""
  empType: string | null = localStorage.getItem('empType');

  constructor(private api: ApiCalls) { }

  async ngOnInit() {

  }

  async login() {
    //set employee type on login
  }



}
