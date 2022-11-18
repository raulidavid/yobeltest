import { HttpClient } from '@angular/common/http';
import { Component, ViewChild } from '@angular/core';
import { ModalComponent } from 'src/modal/modal.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  public response: any[]=[];
  public pedidos: any[] = [];
  public isActive: boolean;
  title = 'frontend';

  constructor(private http: HttpClient) {
    this.http.get<any>('http://localhost:8081/api/pedidos').subscribe(data => {
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

  savePedido(){
    this.http.post<any>('http://localhost:8081/api/pedidos', { title: 'Angular POST Save Pedido' }).subscribe(data => {
      alert(data.message);
    })
    
  }
}
