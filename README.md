# Webtrit configurator


## Components
* `Cloud databse` (_**Firestore**_)
* `Cloud storage` (_**Firebase storage**_)
* `REST` (_**HTTP Cloud functions**_)

## Firebase CORS

1.  Install https://formulae.brew.sh/cask/google-cloud-sdk
2.  In root of flutter project create a file called cors.json and add this json file which will remove all domain restrictions.
    ``[
    {
    "origin": ["*"],
    "method": ["GET"],
    "maxAgeSeconds": 3600
    }
    ]``
3. Run gcloud init (located in google-cloud-sdk/bin
4. Authenticate yourself by clicking the link and choose the project in the console.
5. Finally execute gsutil cors set cors.json gs://<your-bucket-name>.appspot.com You can find your bucket name in firebase storage.
   `` gsutil cors set cors.json gs://webtrit-configurator-stage.appspot.com
   ``


## Build variables

* `ENV` (_default **prod**_)

Env parameters:
- prod:
    - `host` (_default **https://us-central1-webtrit-configurator.cloudfunctions.net/api/v1**_)
    - `auth` (_default **Firebase auth**_)
- dev:
    - `host` (_default **http://127.0.0.1:7981/webtrit-configurator/us-central1/api/v1**_)
    - `auth` (_**Emulator**_)
        - ip  (_default **127.0.0.1**_)
        - port  (_default**7980**_)

## Build
    flutter build web --output firebase/public

## Debug

Env parameter for ignore cors on localhost

```
--web-browser-flag "--disable-web-security"
```
