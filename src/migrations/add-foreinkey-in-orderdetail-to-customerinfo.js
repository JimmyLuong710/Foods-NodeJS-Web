
'use strict';
module.exports = {
    up: async (queryInterface, Sequelize) => {
    await  queryInterface.changeColumn('OrderDetails', 'customerInfoId', {
        type: Sequelize.INTEGER
    })
      await queryInterface.addConstraint("OrderDetails", {
        fields: ["customerInfoId"],
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
  
    down: (queryInterface, Sequelize) => {
      return Promise.all([
        
      ]);
    }
  };
  
  
