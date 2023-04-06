# Webtrit configurator


## Components
* `Cloud databse` (_**Firestore**_)
* `Cloud storage` (_**Firebase storage**_)
* `REST` (_**HTTP Cloud functions**_)

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
