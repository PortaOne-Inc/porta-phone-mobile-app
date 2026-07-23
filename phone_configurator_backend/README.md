# Webtrit Configurator (NestJS + Firebase)

This project is a **NestJS backend deployed to Firebase Cloud Functions**, with multiple environments (`dev`, `stage`,
`prod`).  
It integrates with **Firebase**, **Localizely**, **GitHub**, and **OpenAI APIs**.

---

## 🚀 Overview

- **Framework:** [NestJS](https://nestjs.com/)
- **Deployment target:** [Firebase Cloud Functions](https://firebase.google.com/docs/functions)
- **Environments:** dev, stage, prod (separate Firebase projects & service accounts)
- **Features:**
    - Localization sync with Localizely
    - Firebase Admin SDK integration
    - OpenAI API integrations

---

## 📚 Documentation

| Topic | File |
|---|---|
| Feature Index (all docs) | [docs/features.md](docs/features.md) |
| Themes Overview | [docs/themes-overview.md](docs/themes-overview.md) |
| Themes Data Model | [docs/themes-data-model.md](docs/themes-data-model.md) |
| Themes API Endpoints | [docs/themes-api-endpoints.md](docs/themes-api-endpoints.md) |
| Themes Core Flows | [docs/themes-core-flows.md](docs/themes-core-flows.md) |
| AI Theme Generation | [docs/generate-themes.md](docs/generate-themes.md) |
| DTO & Validation | [docs/validation.md](docs/validation.md) |

---

## ⚙️ Environment Setup

### 1. Environment variables

Copy the example file and adjust values for your environment:

```bash
cp .env.example .env.webtrit-configurator-dev
cp .env.example .env.webtrit-configurator-stage
cp .env.example .env.webtrit-configurator
```

**.env.example**

```dotenv
#####################################################################
# Localization (Localizely)
#####################################################################
LOCALIZELY_DOWNLOAD_URL=
LOCALIZELY_API_KEY=

#####################################################################
# GitHub Access
#####################################################################
GITHUB_TOKEN=

#####################################################################
# Firebase Project Configuration (client-side SDK)
#####################################################################
FB_API_KEY=
FB_AUTH_DOMAIN=
FB_DATABASE_URL=
FB_PROJECT_ID=webtrit-configurator-stage
FB_STORAGE_BUCKET=webtrit-configurator-stage.appspot.com
FB_MESSAGING_SENDER_ID=
FB_APP_ID=

#####################################################################
# Firebase Admin SDK / Service Account
#####################################################################
GOOGLE_APPLICATION_CREDENTIALS=creds/firebase-dev.json

#####################################################################
# External APIs
#####################################################################
OPENAI_API_KEY=
```

### 2. Firebase service accounts

Create a local `creds/` folder (already in `.gitignore`).  
Download service accounts for each Firebase project (`dev`, `stage`, `prod`) and save them as:

```
creds/
-- firebase-dev.json
-- firebase-stage.json
-- firebase-prod.json
```

⚠️ **Never commit these JSON files.**  
In CI/CD pipelines store them in secret storage and write them to disk dynamically.

---

## 🔧 Firebase Project Aliases

Project aliases are defined in **`.firebaserc`** so you can easily deploy to different environments.

**.firebaserc**

```json
{
  "projects": {
    "dev": "webtrit-configurator-dev",
    "stage": "webtrit-configurator-stage",
    "prod": "webtrit-configurator-prod"
  }
}
```

Now you can deploy with:

```bash
firebase deploy --only functions --project dev
firebase deploy --only functions --project stage
firebase deploy --only functions --project prod
```

---

## 🛠️ Build & Deployment

### Install dependencies

```bash
npm install
```

### Local development

Run NestJS in watch mode:

```bash
npm run start:dev
```

Run Firebase emulators (with NestJS build watch):

```bash
npm run dev:watch
```

### Build per environment

```bash
npm run build:dev
npm run build:stage
npm run build:prod
```

### Deploy to Firebase

```bash
npm run deploy:dev
npm run deploy:stage
npm run deploy:prod
```

### Firebase Emulators per Environment

To run local emulators for different environments, use the following commands:

```bash
# Stage environment
firebase emulators:start --project stage

# Development environment
firebase emulators:start --project dev

# Production environment
firebase emulators:start --project prod

```

Each alias (dev, stage, prod) must be defined in .firebaserc.

Each command:

- Sets `NODE_ENV` (to load the correct `.env.*`)
- Uses `--project <alias>` from `.firebaserc`
- Optionally loads service account (`GOOGLE_APPLICATION_CREDENTIALS`)

---

## 📂 Project Structure

```
.
--- src/              # NestJS source code
--- docs/             # Feature documentation
--- dist/             # Compiled output
--- creds/            # Firebase service accounts (gitignored)
--- .env.*            # Environment configs
--- firebase.json     # Firebase config
--- .firebaserc       # Firebase project aliases
--- package.json
```

---

## 📖 License

This project is private. All rights reserved.
