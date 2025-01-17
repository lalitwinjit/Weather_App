import express from 'express';
import WeatherRequest from '../models/WeatherRequest.js';

const router = express.Router();


router.get('/details/:id', async (req, res) => {
    const { id } = req.params;
    console.log("id==>", id);
    

    try {
        const record = await WeatherRequest.findByPk(id);

        if (!record) {
            return res.status(404).send('Record not found');
        }

        res.render('details.njk', {
            address: record.address,
            latitude: record.latitude,
            longitude: record.longitude,
            weather: record.weather,
        });
    } catch (error) {
        console.error('Error fetching record details:', error.message);
        res.status(500).send('Failed to fetch record details');
    }
});

export default router;
