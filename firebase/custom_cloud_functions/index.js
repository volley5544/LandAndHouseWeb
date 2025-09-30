const admin = require("firebase-admin/app");
admin.initializeApp();

const getServerTimeStamp = require("./get_server_time_stamp.js");
exports.getServerTimeStamp = getServerTimeStamp.getServerTimeStamp;
