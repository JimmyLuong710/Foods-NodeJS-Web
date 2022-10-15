import express from 'express';
import {signUp, signIn, logOut, refreshToken} from '../controllers/auth.controller'

const authRouter = express.Router();

authRouter.post('/sign-up', signUp);
authRouter.post('/sign-in', signIn);
authRouter.delete('/log-out', logOut)
authRouter.post('/refresh-token', refreshToken)

module.exports = authRouter;