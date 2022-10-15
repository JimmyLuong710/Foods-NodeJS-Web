import {getUsers, addUser, updateUser, deleteUser} from '../controllers/user.controller'
import express from "express";

const userRouter = express.Router();

userRouter.get("/", getUsers);
userRouter.post("/", addUser);
userRouter.put("/:userId", updateUser);
userRouter.delete("/:userId", deleteUser);
userRouter.get(
  "/:userId/products/history",
(req, res) => {}
);
userRouter.get("/products/pending", (req, res) => {});
userRouter.get("/:userId/cart", (req, res) => {});

module.exports = userRouter;
