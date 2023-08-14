export default class GoogleServices {
    public androidUrl?: string|null;
    public iosUrl?: string|null;

    constructor(androidUrl?: string | null, iosUrl?: string | null) {
        this.androidUrl = androidUrl;
        this.iosUrl = iosUrl;
    }
}

