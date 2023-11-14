const productsServices = require("../services/productsServices");
const resp = require("./controllerBase");

const getV1AllProducts = (req, res) => {
  resp.success(req, productsServices.getV1AllProducts(), "Get All Products successful");
};

const getV1OneProduct = (req, res) => {
  productsServices.getV1OneProduct();
  res.send("Get Product");
};

const postV1CreateProduct = (req, res) => {
  productsServices.postV1CreateProduct();
  res.send("Post Product");
};

const patchV1UpdateProductCategory = (req, res) => {
  productsServices.patchV1UpdateProductCategory();
  res.send("Patch Product");
};

const deleteV1Product = (req, res) => {
  productsServices.deleteV1Product();
  res.send("Delete Product");
};

module.exports = {
  getV1AllProducts,
  getV1OneProduct,
  postV1CreateProduct,
  patchV1UpdateProductCategory,
  deleteV1Product,
};
