"use strict";
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addConstraint("OrderDetails", {
      fields: ["customerInfoId1"],
      type: "foreign key",
      name: "CustomerInfos_fkey_constraint_orderdetails", // optional
      references: {
        table: "CustomerInfos",
        field: "id",
      },
      onDelete: "cascade",
      onUpdate: "cascade",
    });
  },

  down: (queryInterface, Sequelize) => {},
};
