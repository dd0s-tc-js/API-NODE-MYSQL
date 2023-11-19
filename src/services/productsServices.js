const productsDb = require("../databases/productsDb");

const getV1AllProducts = () => {
  return productsDb.selectAllProducts();
};

const getV1OneProduct =(reqBody) => {
  let params = [
    reqBody.id
  ];
  return productsDb.selectOneProduct(params);
};

const postV1CreateProduct = (reqBody) => {
  let params = [
    reqBody.nombre,
    reqBody.categoria,
    reqBody.marca,
    reqBody.cantidad,
    reqBody.precio,
  ];
  return productsDb.newProduct(params);
};

const patchV1UpdateProductCategory = (reqBody) => {
  let params = [
    reqBody.categoria,
    reqBody.id,
  ];
  return productsDb.updateProductCategory(params);
};

const putV1UpdateProduct = (reqBody) => {
  let params = [
    reqBody.categoria,
    reqBody.cantidad,
    reqBody.marca,
    reqBody.precio,
    reqBody.imagen,
    reqBody.id,
  ];
  return productsDb.updateProduct(params);
};

const deleteV1Product = (reqBody) => {
  let params = [
    reqBody.id,
  ];
  return productsDb.deleteProduct(params);
};

module.exports = {
  getV1AllProducts,
  getV1OneProduct,
  postV1CreateProduct,
  putV1UpdateProduct,
  patchV1UpdateProductCategory,
  deleteV1Product,
};
