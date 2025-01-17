import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';
dotenv.config(); 

// Configure Sequelize
const sequelize = new Sequelize(
    process.env.DB_NAME, 
    process.env.DB_USERNAME, 
    process.env.DB_PASSWORD, {
    host: process.env.HOST,
    dialect: process.env.DIALECT,
});

export default sequelize; 