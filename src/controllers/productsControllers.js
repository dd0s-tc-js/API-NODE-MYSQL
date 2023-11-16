const productsServices = require("../services/productsServices");
const resp = require("./controllerBase");

const getV1AllProducts = (req, res) => {
  if (!req.query?.id) {
    productsServices.getV1AllProducts().then((bodyResponse) => {
      resp.success(res, bodyResponse, "Get All Products successful");
    });
  } else {
    productsServices.getV1OneProduct(req.query).then((bodyResponse) => {
      resp.success(res, bodyResponse, "Get Product successful");
    });
  }
};

const postV1CreateProduct = (req, res) => {
  if (
    !req.body?.nombre ||
    !req.body?.categoria ||
    !req.body?.marca ||
    !req.body?.cantidad ||
    !req.body?.precio
  ) {
    resp.badRequest(res);
  } else {
    productsServices.postV1CreateProduct(req.body).then((bodyResponse) => {
      resp.success(res, bodyResponse, "Get All Products successful");
    });
  }
};

const putV1CreateProduct = (req, res) => {
  if (
    !req.body?.categoria ||
    !req.body?.cantidad ||
    !req.body?.marca ||
    !req.body?.precio ||
    !req.body?.imagen ||
    !req.body?.id
  ) {
    resp.badRequest(res);
  } else {
    productsServices.putV1UpdateProduct(req.body).then((bodyResponse) => {
      resp.success(res, bodyResponse, "Update Product successful");
    });
  }
};

const patchV1UpdateProductCategory = (req, res) => {
  if (!req.body?.categoria || !req.body?.id) {
    resp.badRequest(res);
  } else {
    productsServices
      .patchV1UpdateProductCategory(req.body)
      .then((bodyResponse) => {
        resp.success(res, bodyResponse, "Update Category successful");
      });
  }
};

const deleteV1Product = (req, res) => {
  productsServices.deleteV1Product();
  res.send("Delete Product");
};

module.exports = {
  getV1AllProducts,
  postV1CreateProduct,
  patchV1UpdateProductCategory,
  putV1CreateProduct,
  deleteV1Product,
};
