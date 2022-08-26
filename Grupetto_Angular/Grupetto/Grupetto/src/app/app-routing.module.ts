import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutComponent } from './components/about/about.component';
import { CartComponent } from './components/cart/cart.component';
import { CatalogueComponent } from './components/catalogue/catalogue.component';
import { ContactComponent } from './components/contact/contact.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { Error404Component } from './components/error404/error404.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';


const routes: Routes = [

{path: 'register', component: RegisterComponent},
{path: 'registro', component: RegisterComponent},
{path: 'login', component: LoginComponent},
{path: 'catalogue', component: CatalogueComponent},
{path: 'cart', component: CartComponent},
{path: 'about', component: AboutComponent},
{path: 'contact', component: ContactComponent},


{path: '', component: DashboardComponent},
{path: '**', component: Error404Component},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
