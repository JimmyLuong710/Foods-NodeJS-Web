import express from "express";
import {
  getOrders,
  addOrder,
  deleteOrder,
} from "../controllers/order.controller";
require("express-async-errors");

const orderRouter = express.Router();

orderRouter.get("/", getOrders);
orderRouter.post("/", addOrder);
orderRouter.delete("/", deleteOrder);

module.exports = orderRouter;
