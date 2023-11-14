const express = require("express");
const routers = express.Router();
const productsController = require("../../controllers/productsControllers");

routers
  //consulta todos los productos
  .get("/", productsController.getV1AllProducts)
  //consulta especifica
  .get("/:productId", productsController.getV1OneProduct)
  //Creacion
  .post("/new", productsController.postV1CreateProduct)
  //Actualizacion de categoria
  .patch("/update/category",productsController.patchV1UpdateProductCategory)
  //Eliminacion
  .delete("/delete", productsController.deleteV1Product);

  module.exports = routers;