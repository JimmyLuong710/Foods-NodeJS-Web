import authMiddleware from "../middlewares/auth.middleware";
import express from "express";
import {
  getProducts,
  getProduct,
  addProduct,
  updateProduct,
  deleteProduct,
} from "../controllers/product.controller";
require("express-async-errors");

const productRouter = express.Router();

productRouter.get("/:productId", getProduct);
productRouter.get("/", getProducts);
productRouter.post("/", authMiddleware, addProduct);
productRouter.put("/:productId", authMiddleware, updateProduct);
productRouter.delete("/:productId", authMiddleware, deleteProduct);

module.exports = productRouter;
