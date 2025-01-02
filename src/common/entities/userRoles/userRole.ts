import { Collection } from 'fireorm';

@Collection('userRoles')
export class UserRole {
  id: string;
  role: string;
  createdAt: Date;
  updatedAt: Date;
}
