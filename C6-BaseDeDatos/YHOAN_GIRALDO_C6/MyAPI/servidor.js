const express = require('express');
const router = require('./routes/ProductsRoutes');


const port = process.env.PORT || 3000;

const app = express();


app.use(express.json());


app.get('/', function (req, res) {
    res.send("Hola, mensaje de servidor corriendo")
});

app.use(router)

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});

