require("express-async-errors");
require("dotenv").config();
const cors = require("cors");
const express = require("express");
const app = express();
const authRouter = require("./routes/auth");
const bakerRouter = require("./routes/baker");
const mysql = require("mysql2/promise");
const { connectMySQL } = require("./db/db_connection");
const authMiddleware = require("./middleware/authentication");

app.use(cors());
app.use(express.json());

app.use("/gotcakey/auth", authRouter);
app.use("/gotcakey/baker", authMiddleware, bakerRouter);

const start_Server = async () => {
  try {
    await connectMySQL();
    app.listen(process.env.PORT, "0.0.0.0", () => {
      console.log("server is running..........");
    });
  } catch (error) {
    console.log(err);
  }
};
start_Server();
