'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Carts', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      userId: {
        allowNull: false,
        type: Sequelize.INTEGER
      },
      productId: {
        type: Sequelize.INTEGER
      },
      quantityAdded: {
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
    await queryInterface.addConstraint('Carts', {
      fields: ['userId'], 
      type: 'foreign key',
      name: 'cart_fkey_constraint_user', // optional
      references: {
        table: 'Users',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });
    await queryInterface.addConstraint('Carts', {
      fields: ['productId'], 
      type: 'foreign key',
      name: 'cart_fkey_constraint_product', // optional
      references: {
        table: 'Products',
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    });

  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Carts');
  }
};