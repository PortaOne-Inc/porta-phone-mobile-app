import GoogleServices from "./google_services";

export default class Application {
    constructor(public id?: string,
                public user?: string,
                public name?: string,
                public platformIdentifier?: string,
                public googleServices?: GoogleServices | null,
                public version: number = 0,
    ) {
    }
}
