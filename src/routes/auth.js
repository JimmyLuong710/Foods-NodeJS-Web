import authController from '../controllers/authController';
import express from 'express';

const router = express.Router();

router.post('/register', authController.registerUser);
router.post('/login', authController.loginUser);
router.post('/log-out', authController.logoutUser)

module.exports = router;