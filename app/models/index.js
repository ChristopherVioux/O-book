const Book = require("./book");
const Label = require("./label");

Book.belongsTo(Label, {
  as: "label",
  foreignKey: "label_id",
});

Label.hasMany(Book, {
  as: "book",
  foreignKey: "book_id",
});

module.exports = {
  Book,
  Label,
};
