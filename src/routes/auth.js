import authController from '../controllers/authController';
import middlewareController from '../controllers/middlewareController'
import express from 'express';

const router = express.Router();

router.post('/register', authController.registerUser);
router.post('/login', authController.loginUser);
router.delete('/log-out',middlewareController.verifyToken, authController.logoutUser)
router.post('/refresh', authController.requestRefreshToken)

module.exports = router;