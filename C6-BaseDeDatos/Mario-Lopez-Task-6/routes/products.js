// routes/productos.js
import { Router } from 'express';

const router = Router();

// Productos en memoria (para simplificar)
let products = [
    {
      "id": 1,
      "name": "Laptop",
      "price": 1000,
      "category": "Electronics",
      "description": "A high performance laptop"
    },
    {
      "id": 2,
      "name": "Coffee Mug",
      "price": 10,
      "category": "Kitchenware",
      "description": "A ceramic coffee mug"
    },
    {
      "id": 3,
      "name": "Phone",
      "price": 200,
      "category": "Electronics",
      "description": "High quality cell phone"
    }
];

//Validar producto
const validarProducto = (producto) => {
    const { name, price, category, description } = producto;
  
    if (!name || name.trim() === '') {
      return 'El nombre es obligatorio.';
    }
    if (typeof price !== 'number' || price <= 0) {
      return 'El precio debe ser un número mayor a 0.';
    }
    if (!category || category.trim() === '') {
      return 'La categoría es obligatoria.';
    }
    if (!description || description.trim() === '') {
      return 'La descripción es obligatoria.';
    }
  
    return null;
  };

// Obtener la lista de productos
router.get('/', (req, res) => {
  res.json(products);
    // res.send('Hola')
});

// Obtener un producto por su ID
router.get('/:id', (req, res) => {
  const producto = products.find(p => p.id === parseInt(req.params.id));
  if (!producto) return res.status(404).send('Producto no encontrado');
  res.json(producto);
});

// Agregar un nuevo producto
router.post('/', (req, res) => {
    const {name, price, category, description } = req.body;

    //Validar el producto
    const error = validarProducto({name, price, category, description});
    if (error){
        return res.status(400).json({error});
    }

  const nuevoProducto = {
    id: products.length + 1,
    name,
    price,
    category,
    description
  };
  products.push(nuevoProducto);
  res.status(201).json(nuevoProducto);
});

// Actualizar un producto existente
router.put('/:id', (req, res) => {
  const producto = products.find(p => p.id === parseInt(req.params.id));
  if (!producto) return res.status(404).send('Producto no encontrado');

  const {name, price, category, description } = req.body;

  //Validar el producto
  const error = validarProducto({name, price, category, description});
  if (error){
      return res.status(400).json({error});
  }

  producto.name = req.body.name;
  producto.price = req.body.price;
  producto.category = req.body.category;
  producto.description = req.body.description;

  res.json(producto);
});

// Eliminar un producto
router.delete('/:id', (req, res) => {
  const productoIndex = products.findIndex(p => p.id === parseInt(req.params.id));
  if (productoIndex === -1) return res.status(404).send('Producto no encontrado');

  products.splice(productoIndex, 1);
  res.status(204).send();
});

export default router;
