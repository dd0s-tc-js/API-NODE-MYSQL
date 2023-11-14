const base = require("./dbBase");

const statementSelectAll = "SELECT * FROM productos;";
const statementInsert =
  "INSERT INTO productos(nombre,id_categoria,marca,cantidad,precio) VALUES (?,?,?,?,?);";
const statementUpdateCategoria =
  "UPDATE productos SET id_categoria= ? WHERE id = ?;";
const statementDelete = "DELETE FROM productos as pr WHERE pr.id = ?;";

const selectAllProducts = () => {
  return base.genericQuery(statementSelectAll);
};

module.exports = {
  selectAllProducts,
};
