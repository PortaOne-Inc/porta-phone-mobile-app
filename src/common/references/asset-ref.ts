export type AssetRef = {
  $ref: 'asset';
  id: string;
};

export const isAssetRef = (v: unknown): v is AssetRef =>
  !!v &&
  typeof v === 'object' &&
  (v as any).$ref === 'asset' &&
  typeof (v as any).id === 'string';
