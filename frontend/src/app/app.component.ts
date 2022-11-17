import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  public pedidos: any[] = [];
  public isActive: boolean;
  title = 'frontend';

  constructor(private http: HttpClient) {
    this.http.get<any>('https://jsonplaceholder.typicode.com/posts').subscribe(data => {
        this.pedidos = data;
        console.log(this.pedidos);
    });
    this. isActive = false;

  }
  

  openModal(value: any) {
    value.active = true
  }

  closeModal(value:any) {
    value.active = false
  }
  modalAddPedido(){

  }
}
