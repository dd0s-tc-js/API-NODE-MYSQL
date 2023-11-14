const productsDb = require("../databases/productsDb");

const getV1AllProducts = () => {
  productsDb.selectAllProducts().then((products) => {
    return products;
  });
};
const getV1OneProduct = () => {
  return;
};
const postV1CreateProduct = () => {
  return;
};
const patchV1UpdateProductCategory = () => {
  return;
};
const deleteV1Product = () => {
  return;
};

module.exports = {
  getV1AllProducts,
  getV1OneProduct,
  postV1CreateProduct,
  patchV1UpdateProductCategory,
  deleteV1Product,
};
