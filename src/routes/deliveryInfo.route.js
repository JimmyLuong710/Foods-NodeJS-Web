import express from 'express'
import {addDeliveryInfo, getDeliveryInfos, deleteDeliveryInfo} from '../controllers/deliveryInfo.controller'
require('express-async-errors');

const deliveryInfoRouter = express.Router();

deliveryInfoRouter.get('/', getDeliveryInfos)
deliveryInfoRouter.post('/', addDeliveryInfo)
deliveryInfoRouter.delete('/:deliveryInfoId', deleteDeliveryInfo)

module.exports = deliveryInfoRouter