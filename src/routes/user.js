import userController from '../controllers/userController';
import middlewareController from '../controllers/middlewareController';
import express from 'express';


const router = express.Router();

router.get('/get-all-user',middlewareController.verifyAdminToken,  userController.getAllUsers)
router.post('/add-user',middlewareController.verifyAdminToken, userController.addUser)
router.post('/update-user/:id',middlewareController.verifyToken, userController.updateUser)
router.delete('/delete-user/:id',middlewareController.verifyAdminToken, userController.deleteUser)

router.post('/add-product-img',middlewareController.verifyAdminToken, userController.addProductImg)
router.post('/add-product',middlewareController.verifyAdminToken, userController.addProduct)
router.get('/get-all-product', userController.getAllProducts)
router.delete('/delete-product/:id',middlewareController.verifyAdminToken, userController.deleteProduct)
router.put('/update-product/:id',middlewareController.verifyAdminToken, userController.updateProduct)
router.get('/get-one-product/:id', userController.getOneProduct)
router.get('/get-product-by-key/:key', userController.getProductsMatchKeyword)
router.post('/add-to-cart',middlewareController.verifyToken, userController.addToCart)
router.get('/get-product-in-cart/:userId',middlewareController.verifyToken, userController.getProductInCart)
router.put('/update-product-in-cart', middlewareController.verifyToken, userController.updateProductInCart)
router.delete('/delete-product-in-cart', middlewareController.verifyToken, userController.deleteProductInCart)


module.exports = router;