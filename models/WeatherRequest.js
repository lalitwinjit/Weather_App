import { DataTypes } from "sequelize";
import sequelize from "../config/database.js";

const WeatherRequest = sequelize.define(
  "WeatherRequest",
  {
    address: { 
        type: DataTypes.STRING, 
        allowNull: false 
    },
    latitude: { 
        type: DataTypes.DECIMAL(10, 8), 
        allowNull: false 
    },
    longitude: { 
        type: DataTypes.DECIMAL(11, 8), 
        allowNull: false 
    },
    weather: { 
        type: DataTypes.JSON, 
        allowNull: false 
    },
  },
  { timestamps: true }
);

export default WeatherRequest;
