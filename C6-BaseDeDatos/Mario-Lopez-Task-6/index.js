import express from 'express';
import productsRoutes from './routes/products.js';

const app = express();
app.use(express.json());

//Usar las rutas de productos
app.use('/productos', productsRoutes);

// app.get('/productos', (req, res) => {
//     res.send('HOLA');
//   });
  
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}/`)
})

