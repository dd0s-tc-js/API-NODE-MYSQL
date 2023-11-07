const express = require("express");
const mysql = require("mysql2");
const myconn = require("express-myconnection");
const router = express.Router();
const app = express();

app.set("port", process.env.PORT || 9000);
const dbOptions = {
  host: "localhost",
  port: 3306,
  user: "root",
  password: "091100",
  database: "api_supermarket",
};

require("./src/productos")(router);
//middlewares-------------------------------------
router.use(function pathLog(req, res, next) {
  console.log("-------------------------------");
  console.log("Path: ", req.path);
  console.log("   Query: ", req.query);
  console.log("   Params: ", req.params);
  console.log("   Body: ", req.body);
  console.log("-------------------------------");
  next();
});

app.use(myconn(mysql, dbOptions, "single"));
app.use("/api", router);

app.listen(app.get("port"), () => {
  console.log("Server is runing on port", app.get("port"));
});
