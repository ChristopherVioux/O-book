const { Model, DataTypes } = require("sequelize");
const sequelize = require("../database");

class Book extends Model {}

Book.init(
  {
    name: DataTypes.TEXT,
    author: DataTypes.TEXT,
    position: DataTypes.SMALLINT,
  },
  {
    sequelize,
    tableName: "book",
  }
);

module.exports = Book;
