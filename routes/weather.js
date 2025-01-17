import express from 'express';
import axios from 'axios';
import dotenv from 'dotenv';
import WeatherRequest from '../models/WeatherRequest.js';
import getApiKey from '../utils/getapiKeys.js';

const router = express.Router();

router.post('/', async (req, res) => {
    const { address, action } = req.body;

    const mapboxApiKey = await getApiKey('MAPBOX_API_KEY');
    const openWeatherApiKey = await getApiKey('OPENWEATHERMAP_API_KEY');

    try {
        const mapboxUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(address)}.json?access_token=${mapboxApiKey}`;
        process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
        const mapboxResponse = await axios.get(mapboxUrl);

        const validFeature = mapboxResponse.data.features[0];
        if (!validFeature) {
            return res.render('index.njk', {
                error: 'Invalid address. Please enter a valid location.',
                address,
            });
        }

        const [longitude, latitude] = validFeature.center;

        const weatherUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${openWeatherApiKey}&units=metric`;
        const weatherResponse = await axios.get(weatherUrl);

        const { temp, feels_like, temp_min, temp_max, humidity } = weatherResponse.data.main;
        const weatherDescription = weatherResponse.data.weather[0].description;

        if (action === 'getWeather') {
            return res.render('index.njk', {
                address,
                weather: {
                    longitude,
                    latitude,
                    temp,
                    feels_like,
                    temp_min,
                    temp_max,
                    humidity,
                    description: weatherDescription,
                },
            });
        } else if (action === 'saveWeather') {
            await WeatherRequest.create({
                address,
                latitude,
                longitude,
                weather: {
                    temp,
                    feels_like,
                    temp_min,
                    temp_max,
                    humidity,
                    description: weatherDescription,
                },
            });

            return res.render('index.njk', { success: 'Weather data has been saved successfully!', address });

        }
    } catch (error) {
        console.error(error.message);
        res.render('index.njk', {
            error: 'An error occurred while processing your request. Please try again.',
            address,
        });
    }
});

router.get('/history', async (req, res) => {
    try {
        const history = await WeatherRequest.findAll();

        res.json(history.map(entry => ({
            id: entry.id,
            address: entry.address,
            latitude: entry.latitude,
            longitude: entry.longitude,
            weather: entry.weather,
        })));
    } catch (error) {
        console.error('Error fetching historical data:', error.message);
        res.status(500).json({ error: 'Failed to retrieve historical data' });
    }
});

export default router;
