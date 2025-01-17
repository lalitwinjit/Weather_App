import { DataTypes } from 'sequelize';
import sequelize from '../config/database.js';


const ApiKey = sequelize.define('ApiKey', {
    keyName: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
    },
    keyValue: {
        type: DataTypes.TEXT,
        allowNull: false,
    },
}, {
    timestamps: true,
});

export default ApiKey;
