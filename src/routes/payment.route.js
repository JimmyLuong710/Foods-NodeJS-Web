import express from 'express';
import authMiddleware from '../middlewares/auth.middleware'
require('express-async-errors');

const paymentRouter = express.Router();

paymentRouter.post('/', authMiddleware, (req, res) => {})

module.exports = paymentRouter;
