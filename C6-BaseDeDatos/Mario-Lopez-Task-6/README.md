TAREA 6: Creacion de API REST con Express para Gestion de Pruductos

1. En este repo pueden encontrar una API que se encargara de gestion de productos, tanto como tener un listado de los prouctos en memoria, estos productos tieneen como atributos: id, nombre, precio, categoria, descripcion.

2. Una vez almacenados puede acceder a estos por meidio del metodo GET y validar que se encuentra en el listado actual.

3. Por medio del metogo GET/products/id puede encontrar un ID especifico del listado.

4. En el metodo POST puede agregar un nuevo item, este metodo valida primero si los datos ingresados son correctos por medio de al constante validarProducto. Retornatra mensaje y error en caso de que los datos ingresados no sean los correctos.

5. Metodo PUT de igual forma valida si los datos ingresados son correctos ya actualizara el item indicaddo por medio de /product/id.

6. Por ultimo el metodo DELETE borrara los items que sean indicados en la URL.

Esto por medio de la direccion de localhost en el puerto 3000. Se valida el correcto funcionamiento de los metodos por medio de postman.