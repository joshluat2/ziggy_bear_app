/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */
const {setGlobalOptions} = require("firebase-functions");
const {onRequest} = require("firebase-functions/https");
const logger = require("firebase-functions/logger");

setGlobalOptions({ maxInstances: 10 });

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

const functions = require("firebase-functions");
const sgMail = require("@sendgrid/mail");

sgMail.setApiKey(functions.config().sendgrid.key);

exports.sendEmail = functions.https.onCall(async (data, context) => {
  const msg = {
    to: data.to,
    from: "your@example.com",
    subject: data.subject,
    text: data.text,
  };

  await sgMail.send(msg);
  return { success: true };
});
