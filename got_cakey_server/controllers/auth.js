require("dotenv").config();
require("express-async-errors");
const bcryptjs = require("bcryptjs");
const { getBakerByEmail, createUser } = require("../db/db_connection");
const jwt = require("jsonwebtoken");
const signup = async (req, res) => {
  try {
    const { email, password, type } = req.body;

    if (type == "baker") {
      const existingBaker = await getBakerByEmail(email, "baker");

      if (existingBaker) {
        return res
          .status(400)
          .json({ msg: "User with same email already exists!" });
      }
    } else if (type == "buyer") {
      const existingBuyer = await getBakerByEmail(email, "buyer");
      if (existingBuyer) {
        return res
          .status(400)
          .json({ msg: "User with same email already exists!" });
      }
    } else {
      return res.status(404).json({ err: "there is no such type" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);
    const newUser = await createUser({
      email: email,
      password: hashedPassword,
      type: type,
    });

    const token = jwt.sign(
      { userId: newUser.id, email: email, type: type },
      process.env.JWT_SECRET,
      { expiresIn: "30d" }
    );

    newUser.type = type;
    newUser.email = email;
    newUser.token = token;

    res.status(200).json(newUser);
  } catch (error) {
    res.status(500).json({ error: "internal server error" });
  }
};

const login = async (req, res) => {
  const { email, password, type } = req.body;
  var user = await getBakerByEmail(email, "baker");
  if (!user) {
    var user = await getBakerByEmail(email, "buyer");
  }
  if (!user) {
    return res
      .status(404)
      .json({ err: "user does not exist. Please SignUp first!" });
  }

  const isMatched = await bcryptjs.compare(password, user.password);
  if (!isMatched) {
    return res.status(400).json({ msg: "incorrect email or password" });
  }

  const token = jwt.sign(
    { userId: user.id, email: email, type: type },
    process.env.JWT_SECRET,
    { expiresIn: "30d" }
  );
  user.type = type;
  req.user = user;
  req.token = token;
  user.email = email;
  user.token = token;
  res.status(200).json(user);
};

module.exports = { signup, login };
