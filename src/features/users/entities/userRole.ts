import { Collection } from 'fireorm';

@Collection('user-roles')
export class UserRole {
  id: string;
  role: string;
  createdAt: Date;
  updatedAt: Date;
}
