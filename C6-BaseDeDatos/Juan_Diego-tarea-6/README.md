
# Proyecto de API de Productos

Este proyecto es una API simple para gestionar productos. Utiliza `Node.js` con `Express` para el backend y manipula un archivo JSON como base de datos para almacenar la información de los productos.

## Requisitos previos

- Node.js (v20.12.2 o superior)
- npm (que viene incluido con Node.js)

## Archivos importantes

- `data.json`: Almacena la información de los productos en formato JSON.
- `index.js`: Punto de entrada de la aplicación. Configura los endpoints de la API.
- `functions/`: Contiene las funciones para manejar las operaciones CRUD (crear, leer, actualizar y eliminar productos).
- `middlewares/`: Contiene los middlewares para validación de datos y logs.

## Scripts disponibles

- Iniciar el servidor en modo de desarrollo con `nodemon`:

   ```bash
   npm run dev
   ```

   Esto iniciará el servidor y lo reiniciará automáticamente cuando se detecten cambios en los archivos.

## Uso de la API

Todas las operaciones se realizan a través de **Postman**. A continuación, se muestran los endpoints disponibles y ejemplos de uso.

### Endpoints

- **GET /products**: Retorna todos los productos.
- **GET /products/:id**: Retorna un producto específico por su ID.
- **GET /products/name/:name**: Busca productos por nombre (parcial o completo).
- **POST /products**: Crea un nuevo producto. Requiere un cuerpo JSON con `name`, `price`, `category` y `description`.
- **PUT /products/:id**: Actualiza un producto existente por su ID. Requiere un cuerpo JSON con los datos a actualizar.
- **DELETE /products/:id**: Elimina un producto por su ID.

### Ejemplos de uso en Postman

1. **Crear un producto**:

   - Método: `POST`
   - URL: `http://localhost:3002/products`
   - Cuerpo (JSON):

     ```json
     {
       "name": "New Product",
       "price": 50,
       "category": "New Category",
       "description": "A description of the new product"
     }
     ```

2. **Obtener todos los productos**:

   - Método: `GET`
   - URL: `http://localhost:3002/products`

3. **Obtener un producto por ID**:

   - Método: `GET`
   - URL: `http://localhost:3002/products/1`

4. **Buscar productos por nombre**:

   - Método: `GET`
   - URL: `http://localhost:3002/products/name/laptop`

5. **Actualizar un producto**:

   - Método: `PUT`
   - URL: `http://localhost:3002/products/1`
   - Cuerpo (JSON):

     ```json
     {
       "name": "Updated Product",
       "price": 60,
       "category": "Updated Category",
       "description": "Updated description"
     }
     ```

6. **Eliminar un producto**:

   - Método: `DELETE`
   - URL: `http://localhost:3002/products/1`

## Middleware

- **Log Middleware**: Registra la información de cada solicitud (método, fecha, URL).
- **Body Validation Middleware**: Verifica que las solicitudes `POST` y `PUT` contengan todos los campos necesarios (`name`, `price`, `category`, `description`).


## Ejecución del Proyecto

1. Asegúrate de que `data.json` esté presente y configurado correctamente en la raíz del proyecto.
2. Inicia el servidor:

   ```bash
   npm run dev
   ```

3. Utiliza **Postman** para interactuar con los endpoints descritos anteriormente.
4. El servidor estará disponible en `http://localhost:3002`.

¡Listo! Ya puedes interactuar con la API de productos utilizando los endpoints disponibles.
