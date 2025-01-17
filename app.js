import express from 'express';
import nunjucks from 'nunjucks';
import bodyParser from 'body-parser';
import weatherRoutes from './routes/weather.js';
import historyRouter from './routes/details.js';
import sequelize from './config/database.js';

const app = express();
const PORT = process.env.PORT || 3000;

nunjucks.configure('views', {
    autoescape: true,
    express: app,
});

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('public'));

app.use('/', weatherRoutes);
app.use('/', historyRouter);

app.get('/', (req, res) => {
    res.render('index.njk');
});

sequelize.sync().then(() => {
    console.log('Database synced');
    app.listen(PORT, () => console.log(`Server is running on port ${PORT}`));
}).catch(err => {
    console.error('Failed to sync database:', err);
});