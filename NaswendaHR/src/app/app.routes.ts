import { Routes } from '@angular/router';
import { Login } from './login/login';
import { EmpDashboard } from './emp/emp-dashboard/emp-dashboard';
import { EmpLeave } from './emp/emp-leave/emp-leave';
import { ManageDashboard } from './manager/manage-dashboard/manage-dashboard';
import { ManageLeave } from './manager/manage-leave/manage-leave';

export const routes: Routes = [
    {
        path: '',
        component: Login
    },
    {
        path: 'empDash',
        component: EmpDashboard
    },
    {
        path: 'empLeave',
        component: EmpLeave
    },
    {
        path: 'manDash',
        component: ManageDashboard
    },
    {
        path: 'manLeave',
        component: ManageLeave
    }
];
