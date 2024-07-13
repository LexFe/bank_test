export type User = {
    id: string;
    email: string;
    role : 'ADMIN' | 'USER';
    name: string;
    password: string;

}