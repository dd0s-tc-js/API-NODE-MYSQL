module.exports = {
    app:{
        port: process.env.PORT || 9000,
        hostDb: process.env.HOSTDB || 'localhost',
        portDb: process.env.PORTDB || '3306',
        database: "api_supermarket",
        userDb: "root",
        passwordDb: process.env.PASSDB || '091100',
    }
}