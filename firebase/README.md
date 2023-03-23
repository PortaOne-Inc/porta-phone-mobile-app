## Firebase

firebase login
firebase init

firebase deploy --only functions:addMessage
firebase deploy --only hosting
firebase deploy --only functions

npm run build

### Config local emulator

    export GOOGLE_APPLICATION_CREDENTIALS="path/to/key.json"

#### Key json -> https://console.cloud.google.com/iam-admin/serviceaccounts


firebase emulators:start --inspect-functions
lsof -t -i :7980 -i:7981 -i:7982 -i:7983 -i:7984 -i:7985 -i:9229 | xargs kill -9

