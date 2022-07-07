"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class LoginToken extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      LoginToken.belongsTo(models.User)
    }
  }
  LoginToken.init(
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
      },
      userId: {
        type: DataTypes.INTEGER
      },
      token: {
        type: DataTypes.STRING
      }
    },
    {
      sequelize,
      modelName: "LoginToken",
    }
  );
  return LoginToken;
};
