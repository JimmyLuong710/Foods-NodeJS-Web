const { Sequelize } = require('sequelize');

// Option 3: Passing parameters separately (other dialects)
const sequelize = new Sequelize('db8v30ogi5hgt0', 'rjhgcxpwgeieoe', '960289dbb99f3e6636b9b478736450e71bc27cf9609292e393cea0d69fc80a29'
 , {
  host: "ec2-44-205-41-76.compute-1.amazonaws.com",
    dialect: "postgres",
    logging: false,
    dialectOptions: {
      ssl: {
        require: true,
        rejectUnauthorized: false
      }
    }
});

const connectDB = async () => {
  try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }
}

module.exports = connectDB;