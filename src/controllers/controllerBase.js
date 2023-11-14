exports.success = (req, res, message = "OK") => {
  res.status(200).send({
    status: 200,
    message: message,
    data: res,
  });
};

exports.error = (req, res, message = "Error Interno") => {
  res.status(500).send({
    status: 500,
    message: message,
    data: res,
  });
};
