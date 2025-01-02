import { Collection } from 'fireorm';
import { Images } from '../images/images';
import { Colors } from '../colors/colors';

@Collection('themes')
export class Theme {
  id: string; // Make id required
  name?: string;
  applicationId?: string;
  images?: Images;
  fontFamily?: string;
  colors?: Colors;
}
