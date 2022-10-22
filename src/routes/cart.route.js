import authMiddleware from "../middlewares/auth.middleware";
import express from "express";
require('express-async-errors');

const cartRouter = express.Router();

cartRouter.post("/", authMiddleware);
cartRouter.put("/", authMiddleware);
cartRouter.delete("/", authMiddleware);
cartRouter.delete("/all", authMiddleware);

module.exports = cartRouter;
