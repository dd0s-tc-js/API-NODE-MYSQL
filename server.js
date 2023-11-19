const express = require("express");
const config = require("./config");
const v1ProductsRoutes = require("./src/routes/v1/productsRoutes");
const app = express();

app.set("port", config.app.port);
app.use(express.json());
app.use("/api/v1/products", v1ProductsRoutes);


app.listen(app.get("port"), () => {
  console.log("🚀Server is runing on port", app.get("port"));
});
