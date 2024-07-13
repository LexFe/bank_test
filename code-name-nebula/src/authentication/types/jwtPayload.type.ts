export type JwtPayload = {
    sub: string;
    email: string;
    roles: 'ADMIN' | 'USER' | 'MANAGER';
}