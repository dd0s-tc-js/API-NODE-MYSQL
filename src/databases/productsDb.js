const base = require("./dbBase");
//Querys Basics
const statementSelectAll = "SELECT * FROM productos;";
const statementSelect = "SELECT * FROM productos WHERE id=?;";
const statementInsert =
  "INSERT INTO productos(nombre,id_categoria,marca,cantidad,precio) VALUES (?,?,?,?,?);";
const statementUpdate =
  "UPDATE productos SET id_categoria=?,marca=?,cantidad=?,precio=?,imagen=? WHERE id=?;";
const statementDelete = "DELETE FROM productos WHERE id=?;";
//Querys
const statementUpdateCategoria =
  "UPDATE productos SET id_categoria= ? WHERE id = ?;";

const selectAllProducts = () => {
  return base.genericQuery(statementSelectAll);
};

const selectOneProduct = (params) => {
  return base.genericQueryParams(statementSelect, params);
};

const newProduct = (params) => {
  return base.genericQueryParams(statementInsert, params);
};

const updateProduct = (params) => {
  return base.genericQueryParams(statementUpdate, params);
};

const updateProductCategory = (params) => {
  return base.genericQueryParams(statementUpdateCategoria, params);
};

const deleteProduct = (params) => {
  return base.genericQueryParams(statementDelete, params);
};

module.exports = {
  selectAllProducts,
  selectOneProduct,
  newProduct,
  updateProduct,
  updateProductCategory,
  deleteProduct,
};
