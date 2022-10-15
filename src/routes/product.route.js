import authMiddleware from "../middlewares/auth.middleware";
import express from "express";
import {
  getProducts,
  getProduct,
  addProduct,
  updateProduct,
  deleteProduct,
  getProductsMatchKeyword,
  getQuantitySoldOfProduct,
  getProductsBestSell
} from "../controllers/product.controller";

const productRouter = express.Router();

productRouter.post("/add-product-img", authMiddleware, (req, res) => {});
productRouter.post("/", authMiddleware, addProduct);
productRouter.put("/:productId", authMiddleware, updateProduct);
productRouter.delete("/:productId", authMiddleware, deleteProduct);

productRouter.get("/", getProducts);
productRouter.get("/:productId", getProduct);
productRouter.get("/:productId/quantity-sold", (req, res) => {});
productRouter.get("/best-sold", (req, res) => {});

module.exports = productRouter;
