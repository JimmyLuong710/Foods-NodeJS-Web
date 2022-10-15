import express from 'express';
import userRouter from './user.route'
import cartRouter from './cart.route'
import productRouter from './product.route'
import paymentRouter from './payment.route'
import authRouter from './auth.route'
import authMiddleware from '../middlewares/auth.middleware'
require('express-async-errors');

const mainRouter = express.Router();

mainRouter.use('/auth', authRouter)
mainRouter.use('/users', authMiddleware, userRouter)
mainRouter.use('/products', productRouter)
mainRouter.use('/:userId/cart', authMiddleware, cartRouter)
mainRouter.use('/:userId/payments', authMiddleware, paymentRouter)

module.exports = mainRouter;