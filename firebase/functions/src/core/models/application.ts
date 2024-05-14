import { BuildVersion } from "./build_version";
import GoogleServices from "./google_services";

export default class Application {
    constructor(public id?: string,
        public user?: string,
        public name?: string,
        public theme?: string,
        /** @deprecated */
        public platformIdentifier?: string,
        public androidPlatformId?: string,
        public iosPlatformId?: string,
        public androidVersion?: BuildVersion,
        public iosVersion?: BuildVersion,
        public coreUrl?: string,
        public termsConditionsUrl?: string,
        public googleServices?: GoogleServices | null,
        /** @deprecated */
        public version: number = 0,
    ) { }
}
