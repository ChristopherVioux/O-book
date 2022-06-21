// création du serveur

require("dotenv").config();

// express: framework pour la création de serveur http
const express = require("express");
const app = express();
const PORT = process.env.PORT || 5050;
const router = require("./app/router");

app.set("view engine", "ejs");
app.set("views", "app/views");

app.use(express.static("./public"));

// je parse le format urlencoded du corps de la requete pour alimenter req.body
app.use(express.urlencoded({ extended: true }));
// je parse le format json du corps de la requete pour alimenter req.body
app.use(express.json());

app.use(router);

app.listen(PORT, () => {
  console.log(`Listen on http://localhost:${PORT}`);
});
