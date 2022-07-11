module.exports = {
    up: (queryInterface, Sequelize) => {
        return Promise.all([
            queryInterface.changeColumn('Products', 'price', {
                type: Sequelize.INTEGER
            })
        ])
    },

    down: (queryInterface, Sequelize) => {
    }
};
