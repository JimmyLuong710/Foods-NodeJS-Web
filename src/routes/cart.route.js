
import express from "express";
import { addToCart, getCart, deleteInCart, deleteCart } from '../controllers/cart.controller'
require('express-async-errors');

const cartRouter = express.Router();

cartRouter.post("/", addToCart );
cartRouter.get("/", getCart);
cartRouter.delete("/:productId", deleteInCart);
cartRouter.delete("/", deleteCart);

module.exports = cartRouter;
