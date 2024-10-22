const express = require('express');
const router = require('./routes/routesProductos');

const port = process.env.PORT || 3000;

const app = express();

app.use(express.json());

app.use(router)

app.listen(3000, () => {
    console.log(`server running at http://localhost:${port}/`)
});

console.log('hello wordl')

module.exports = router;