import { ApiProperty } from '@nestjs/swagger';

export class UserDto {
  @ApiProperty({
    description: 'ID of the user',
    example: '25OyoPiSatTi11E9ORSaQ14JsTH2',
  })
  uid: string;

  @ApiProperty({
    description: 'Email of the user',
    example: 'user@example.com',
  })
  email: string;

  @ApiProperty({
    description: 'Display name of the user',
    example: 'user-user',
  })
  displayName?: string;

  @ApiProperty({
    description: 'Role of the user',
    example: 'user',
  })
  role: string;
}
