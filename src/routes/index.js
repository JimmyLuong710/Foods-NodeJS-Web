import express from 'express';
import accountRouter from './account.route'
import cartRouter from './cart.route'
import productRouter from './product.route'
import paymentRouter from './payment.route'
import authRouter from './auth.route'
import authMiddleware from '../middlewares/auth.middleware'
require('express-async-errors');

const mainRouter = express.Router();

mainRouter.use('/auth', authRouter)
mainRouter.use('/accounts', authMiddleware, accountRouter)
mainRouter.use('/products', productRouter)
mainRouter.use('/:accountId/cart', authMiddleware, cartRouter)
mainRouter.use('/:accountId/payments', authMiddleware, paymentRouter)

module.exports = mainRouter;