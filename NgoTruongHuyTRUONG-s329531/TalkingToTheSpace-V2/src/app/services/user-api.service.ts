import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UserAPIService {

  getUrlAPI = "https://localhost:44341/api/User/GetAllUsers";
  createUrlAPI = "https://localhost:44341/api/User/AddUser";
  UpdateUrlAPI = "https://localhost:44341/api/User/UpdateUser";
  DeleteUrlAPI = "https://localhost:44341/api/User/DeleteUser";

  constructor(private http:HttpClient) { }


  GetAllUsers() {
    return this.http.get(this.getUrlAPI);
  }

  AddUser(data: string) {
    return this.http.post(this.createUrlAPI + data, "");
  }

  UpdateUser(data: string) {
    return this.http.post(this.UpdateUrlAPI, data);
  }

  DeleteUser(data: string) {
    return this.http.post(this.DeleteUrlAPI, data);
  }


}
