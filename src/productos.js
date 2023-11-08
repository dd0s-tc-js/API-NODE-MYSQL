const bodyParser = require("body-parser");

const statementSelectAll = "SELECT * FROM productos;";
const statementInsert = "INSERT INTO productos(nombre,id_categoria,marca,cantidad,precio) VALUES (?,?,?,?,?);";
const statementUpdateCategoria = "UPDATE productos SET id_categoria= ? WHERE id = ?;";
const statementDelete = "DELETE FROM productos as pr WHERE pr.id = ?;";
//localhost:9000/api
module.exports = (router) => {
  router.use(bodyParser.urlencoded({ extended: false }));
  router.use(bodyParser.json());
  //consulta
  router.get("/productos", (req, res) => {
    req.getConnection((err, conn) => {
      if (err) return res.send(err);
      conn.query(statementSelectAll, (errorQuery, rows) => {
        if (errorQuery) return res.status(500).send(errorQuery);

        res.json(rows);
      });
    });
  });
  //Creacion
  router.post("/productos/new", (req, res) => {
    req.getConnection((err, conn) => {
      let request = [
        req.body?.nombre,
        req.body?.id_categoria,
        req.body?.marca,
        req.body?.cantidad,
        req.body?.precio,
      ];
      if (err) return res.send(err);
      conn.query(statementInsert, request, (errorQuery, rows) => {
        if (errorQuery) return res.status(500).send(errorQuery);

        res.status(200).send("Se creo el producto exitosamente");
      });
    });
  });
  //Actualizacion
  router.patch("/productos/update/categoria", (req, res) => {
    req.getConnection((err, conn) => {
      let request = [
        req.body?.categoria,
        req.body?.producto,
      ];
      if (err) return res.send(err);
      conn.query(statementUpdateCategoria, request, (errorQuery, rows) => {
        if (errorQuery) return res.status(500).send(errorQuery);

        res.status(200).send("Se actualizo la categoria del producto exitosamente");
      });
    });
  });
  //Eliminacion
  router.delete("/productos/delete", (req, res) => {
    req.getConnection((err, conn) => {
      let request = [
        req.body?.producto,
      ];
      if (err) return res.send(err);
      conn.query(statementDelete, request, (errorQuery, rows) => {
        if (errorQuery) return res.status(500).send(errorQuery);

        res.status(200).send("Se elimino el producto exitosamente");
      });
    });
  });
};
