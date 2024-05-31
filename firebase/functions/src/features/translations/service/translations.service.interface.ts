import { Translation } from "../../../core/models/translation";

export default interface ITranslationsService {
	composeArb(appId: string): Promise<NodeJS.ReadableStream>;
	getTranslations(): Promise<Translation[]>;
	getOverridesByAppId(appId: string): Promise<Translation[]>;
	setOverrideByAppId(appId: string, translation: Translation): Promise<void>;
	deleteOverrideByAppId(appId: string, translation: Translation): Promise<void>;
}
