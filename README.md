
## Initialize the Database

1. Create the Database Schema with "WeatherAppDB" name on mysql workbench.
2. Go to the server option at the top, select Data import option.
3. In the import option select "import from self-contained File.
4. Slect the "weather_app_backup.sql" file which is shared in the repo.
5. Below in the Default Target Schema, select the database which you have created in the 1st step.
6. At the end there is the dropdown in that select "Dump Structure And Data"
7. Start import


## Setup Instructions

1. git clone https://github.com/lalitwinjit/Weather_App
2. cd Weather_App
3. npm install
4. Replace your database credentials in the env file.
5. npm start
6. Go to crome and and visit the application by navigating to: http://localhost:3000

