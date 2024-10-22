const { Router } = require('express');
const products = require('../data')


const router = Router();

router.get('/products', (req, res) => {
    res.json(products);
});

router.get('/products/:id', (req, res) => {
    const id = parseInt(req.params.id);

    const product = products.find(product => product.id === id);
    if(!products) return res.status(404).json({message: 'Product not found'});
    res.json(product);
});

router.post('/products', (req, res) => {
    console. log(req.body);

    const { name, price, category, description } = req.body
    if (!name || !price || !category || !description ){
        return res.status(400).send('format Invalid')}
    
        if(isNaN(price)){return res.status(404).json
            ({message: 'price should be a numbers'})
            }
    const product = {
        id: products.length + 1,
        name: req.body.name,
        price: req.body.price,
        category: req.body.category,
        description: req.body.description
    };
    products.push(product);
    res.status(201).json(product);
});

router.put('/products/:id', (req, res) => {
    console. log(req.body);

    const { name, price, category, description } = req.body
    if (!name || !price || !category || !description ){
        return res.status(400).send('format Invalid')}
    
    if(isNaN(price)){return res.status(404).json
        ({message: 'price should be a numbers'})};

    const id = parseInt(req.params.id);

    const product = products.find(product => product.id === id);
    if( !product) return res.status(404).json({message: 'Product not found'});
        
    product.name = req.body.name,
    product.price = req.body.price,
    product.category = req.body.category,
    product.description = req.body.description

    products.push(product);
    res.status(201).json(product);

});

router.delete('/products/:id', (req,res) => {
    const id = parseInt(req.params.id);

    const productIndex = products.findIndex(product => product.id ===id);
    if(productIndex ===  -1) return res.status(404).json({
        message: 'Product not Found'});

    const deleteProduct = products.splice(productIndex, 1);
    res.send({
        data: deleteProduct[0], 
        message: 'product Deleted',
    });
})
        

module.exports = router;