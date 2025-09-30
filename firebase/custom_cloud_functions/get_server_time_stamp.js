const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const dayjs = require("dayjs");
const utc = require("dayjs/plugin/utc");
const timezone = require("dayjs/plugin/timezone");

dayjs.extend(utc);
dayjs.extend(timezone);

exports.getServerTimeStamp = functions.https.onCall((data, context) => {
  // Write your code below!

  try {
    // Format as YYYY-MM-DD HH:mm:ss in Asia/Bangkok (UTC+7)
    const now = dayjs().tz("Asia/Bangkok").format("YYYY-MM-DD HH:mm:ss");
    return { serverTime: now };
  } catch (error) {
    throw new functions.https.HttpsError("internal", error.message);
  }
  // Write your code above!
});
