require("express-async-errors");
const { addUserInfo } = require("../db/db_connection");
const add_user_info = async (req, res) => {
  const {
    verification_doc,
    issuing_state,
    buisness_name,
    registration_status,
    img,
    username,
    bio,
    pickup_address,
    street_address,
    suburb,
    postcode,
    state,
    baked_type,
    suggestion,
    id,
    email,
    type,
  } = req.body;
  const user_info = await addUserInfo({
    verification_doc,
    issuing_state,
    buisness_name,
    registration_status,
    img,
    username,
    bio,
    pickup_address,
    street_address,
    suburb,
    postcode,
    state,
    baked_type,
    suggestion,
    id,
    email,
    type,
  });
  if (!user_info) {
    return res.status(400).json({ msg: "Bad Request" });
  }
  res.status(200).json(user_info);
};

module.exports = add_user_info;
