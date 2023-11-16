exports.success = (res,body,message = "OK",status = 200) => {
  res.status(status).send({
    message: message,
    data: body,
  });
};

exports.error = (res, message = "Error Interno",status = 500) => {
  res.status(status).send({
    message: message,
  });
};

exports.badRequest = (res, message = "Faltan parametros obligatorios",status = 403) => {
  res.status(status).send({
    message: message,
  });
};