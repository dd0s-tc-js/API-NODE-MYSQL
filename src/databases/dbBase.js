const mysql = require("mysql2");
const config = require("../../config");

const dbConfig = {
  host: config.app.hostDb,
  port: config.app.portDb,
  user: config.app.userDb,
  password: config.app.passwordDb,
  database: config.app.database,
};
let conexion;
const _connectionDb = () => {
  conexion = mysql.createConnection(dbConfig);

  conexion.connect((err) => {
    if (err) {
      console.log("[DB ERROR] => ", err);
      setTimeout(_connectionDb(), 200);
    } else {
      console.log("[DB successful connection 🚀]");
    }
  });

  conexion.on("error", (err) => {
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
      _connectionDb();
    } else {
      throw err;
    }
  });
};

_connectionDb();

const genericQuery = (query) => {
  return new Promise((resolve, reject) => {
    conexion.query(query, (error, result) => {
      if (error) return reject(error);
      resolve(result);
    });
  });
};

module.exports = {
  genericQuery,
};
