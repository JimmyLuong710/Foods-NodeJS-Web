
'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addConstraint('OrderDetails', {
        fields: ['orderId'], 
        type: 'foreign key',
        name: 'orderdetail_fkey_constraint_order',
        references: {
          table: 'Orders',
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
      });
      await queryInterface.addConstraint('OrderDetails', {
        fields: ['productId'], 
        type: 'foreign key',
        name: 'orderdetail_fkey_constraint_product',
        references: {
          table: 'Products',
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
      });
      await queryInterface.addConstraint('loginTokens', {
        fields: ['userId'],
        type: 'foreign key',
        name: 'logintoken_fkey_constraint_user', // optional
        references: {
          table: 'Users',
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
      });
      await queryInterface.addConstraint('Orders', {
        fields: ['userId'], 
        type: 'foreign key',
        name: 'order_fkey_constraint_user', // optional
        references: {
          table: 'Users',
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
      });
      await queryInterface.addConstraint('Payments', {
        fields: ['userId'], 
        type: 'foreign key',
        name: 'payment_fkey_constraint_user', // optional
        references: {
          table: 'Users',
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
      });

  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Products');
  }
};