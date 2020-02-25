process.env.NODE_ENV = process.env.NODE_ENV || "release";

const environment = require("./environment");

module.exports = environment.toWebpackConfig();
