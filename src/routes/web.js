import express from "express";
import apiController from "../controllers/apiController";
import db from "../models/index"

let router = express.Router();

let initWebRoutes = (app) => {
    
    router.post('/test',async (req, res) => {
        await db.User.create({
            userName: req.body.userName,
            email: req.body.email
        })
        let id = await await db.User.findOne({
            where:
           { userName: req.body.userName}
        })
        res.status(200).json(id)
    })
    router.post('/sign-up', apiController.signUpUser)
    return app.use("/", router);
}

module.exports = initWebRoutes;