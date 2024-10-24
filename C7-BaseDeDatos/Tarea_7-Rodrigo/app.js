const express = require('express');
const router = require('./src/routes/routeArtists');
const routerSong = require('./src/routes/routeSongs');
const sequelize = require('./src/db/sequelize.js');
const { port } = require("./src/config/env.js");

const env = require('./src/config/env.js');

async function main() {
    const app = express()

app.use(express());

app.use(express.json());


try {
    await sequelize.authenticate();
    console.log('Connection has been established successfully.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
  }

app.get('/', function (req, res) {
    res.send('hello World')
});

app.use(router);
app.use(routerSong);

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`)
});
console.log('helo word'); 

}

main();
