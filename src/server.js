import express from "express";
import bodyParser from "body-parser";
import viewEngine from "./config/viewEngine";
import initWebRoutes from './routes/web';
import authRoute from './routes/auth'
import userRoute from './routes/user'
import connectDB from './config/connectionDB'
import cors from 'cors'
import cookieParser from 'cookie-parser'
import session from 'express-session'
import path from 'path'
var multer = require("multer")


require('dotenv').config();

let port = process.env.PORT || 8000;
let app = express();
const origin = "http://localhost:3000"


// ALLOW GET DATA FROM API
app.use(cors({
  credentials: true,
  origin
}))

// CONNECT TO DB
connectDB();

// USE COOKIES
app.use(cookieParser())

// USE SESSION
app.set('trust proxy', 1) // trust first proxy
app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}))

// USE DATA IN BODY
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }))


// SET VIEW FROM SERVER SIDE
viewEngine(app);

// ROUTES
app.use('/v1/auth', authRoute);
app.use('/v1/user', userRoute);
initWebRoutes(app)

// NO MATCH ANY ROUTE
app.use((req, res) => {
    res.send('THIS PAGE DOES NOT EXISTX')
})

app.listen(port, () => {
    console.log("Backend Nodejs is runing on the port : " + port)
})




