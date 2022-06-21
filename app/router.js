const express = require("express");
const router = express.Router();
const mainController = require("./controllers/mainController");
// const cardController = require("./controllers/cardController");

router.get("/", mainController.home);
// cards
// router.get("/", cardController.startButton);
// router.post('/cards', cardController.create);
// router.get('/cards/:id', cardController.readOne);
// router.patch('/cards/:id', cardController.update);
// router.delete('/cards/:id', cardController.delete);
// router.get('/lists/:d/cards', cardController.cardsOfList);

module.exports = router;
