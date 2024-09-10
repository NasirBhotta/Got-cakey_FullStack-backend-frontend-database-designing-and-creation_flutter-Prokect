const jwt = require("jsonwebtoken");
require("dotenv").config();
const authMiddleware = (req, res, next) => {
  const token = req.headers.authorization.split(" ")[1];
  try {
    if (!token) {
      return res.status(400).json({ msg: "Not authorized" });
    }

    const verified = jwt.verify(token, process.env.JWT_SECRET);
    req.body.id = verified.userId;
    req.body.email = verified.email;
    req.body.type = verified.type;
    if (!verified) {
      return res.status(400).json({ err: "Not authorized" });
    }

    next();
  } catch (error) {
    return res.status(400).json({ err: error });
  }
};

module.exports = authMiddleware;
