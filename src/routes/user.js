import userController from '../controllers/userController';
import middlewareController from '../controllers/middlewareController';
import express from 'express';


const router = express.Router();

router.get('/get-all-user',  userController.getAllUsers)
router.post('/add-user', userController.addUser)
router.post('/add-product', userController.addProduct)
router.get('/get-all-product', userController.getAllProducts)
router.post('/update-user/:id', userController.updateUser)

module.exports = router;