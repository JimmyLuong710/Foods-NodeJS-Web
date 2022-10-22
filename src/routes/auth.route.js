import express from "express";
import {
  signUp,
  signIn,
  logOut,
  refreshToken,
} from "../controllers/auth.controller";
import authMiddleware from "../middlewares/auth.middleware";
require("express-async-errors");

const authRouter = express.Router();

authRouter.post("/sign-up", signUp);
authRouter.post("/sign-in", signIn);
authRouter.post("/log-out", authMiddleware, logOut);
authRouter.post("/refresh-token", refreshToken);

module.exports = authRouter;
