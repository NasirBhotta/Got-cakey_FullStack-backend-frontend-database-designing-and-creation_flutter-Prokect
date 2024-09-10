const express = require("express");
const router = express.Router();
const add_user_info = require("../controllers/baker");

router.route("/userinfo").post(add_user_info);

module.exports = router;
