
const { Router } = require('express');
const { products } = require('../array_data');

const router = Router();

// MUESTRA TODA LA DATA
router.get('/products', (req, res) =>{
    res.json(products); 
})


//MUESTRA DATA BUSCADA POR ID
router.get('/products/:id', (req, res) =>{

    console.log(req.params);
    const id = parseInt(req.params.id);

    const product = products.find(product => product.id === id);
    if (!product) return res.status(404).json({message : "PRODUCT NOT FOUND"});
    res.json(product);
})


//AGREGA NUEVO
router.post('/products' , (req, res)=>{

    const { id, name, price, category, description } = req.body;
    console.log(req.body);

    if (!id || !name || !price || !category || !description){
        return res.status(400).json({message: 'TODOS LOS CAMPOS SON REQUERIDOS'})
    }

    if( isNaN(id) || isNaN(price) ){
        return res.status(404).json({message: 'EL (ID) Y (PRICE) DEBE SER NUMERO'})
    }

    const product = {
        id: products.length + 1,
        name: req.body.name,
        price: req.body.price,
        category: req.body.category,
        description: req.body.description
    };
    products.push(product);
    //res.status(201).json(product);
    res.status(201).json(products);
})


//ACTUALIZAR
router.put('/products/:id', (req, res) =>{

    const id = parseInt(req.params.id);

    const product = products.find(product => product.id === id);

    if (!product) return res.status(404).json({menssage: 'PRODUCT NO EXISTE'});

    product.name = req.body.name;
    product.price = req.body.price;
    product.category = req.body.category;
    product.description = req.body.description;

    res.status(200).json(products);
})


//ELIMINAR
router.delete('/products/:id', (req, res)=>{

    const id = parseInt(req.params.id);

    const productIndex = products.findIndex(product => product.id === id);
    console.log({productIndex});

    if (productIndex === -1) return res.status(404).json({message: 'PRODUCT NO EXISTE'});

    const deleteProduct = products.splice(productIndex, 1);
    res.json(deleteProduct[0]);



})






module.exports = router;