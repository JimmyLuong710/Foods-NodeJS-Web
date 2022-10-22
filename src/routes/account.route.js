import {
  getAccounts,
  getAccount,
  addAccount,
  updateAccount,
  deleteAccount,
} from "../controllers/account.controller";
import express from "express";
require("express-async-errors");

const accountRouter = express.Router();

accountRouter.get("/", getAccounts);
accountRouter.get("/:accountId", getAccount);
accountRouter.post("/", addAccount);
accountRouter.put("/:accountId", updateAccount);
accountRouter.delete("/:accountId", deleteAccount);
accountRouter.get("/:userId/products/history", (req, res) => {});
accountRouter.get("/products/pending", (req, res) => {});
accountRouter.get("/:userId/cart", (req, res) => {});

module.exports = accountRouter;
