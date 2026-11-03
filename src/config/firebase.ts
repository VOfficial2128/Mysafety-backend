import admin from 'firebase-admin';
import { readFileSync } from 'node:fs';

const serviceAccountPath =
  process.env.FIREBASE_SERVICE_ACCOUNT_PATH ||
  '/run/secrets/firebase-service-account.json';

const serviceAccount = JSON.parse(
  readFileSync(serviceAccountPath, 'utf8')
) as admin.ServiceAccount;

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

export default admin;