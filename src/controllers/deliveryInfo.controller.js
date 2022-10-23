import DbService from "../services/DbService"
import ApiError from "../config/error.config"
import models from "../models"

const addDeliveryInfo = async (req, res) => {
    let docBody = {
        owner: req.account._id,
        ...req.body
    }
    let deliveryInfo = await DbService.create(models.DeliveryInfoModel, docBody)

    return res.json(deliveryInfo)
}

const getDeliveryInfos = async (req, res) => {
    let deliveryInfos = await DbService.find(models.DeliveryInfoModel, {owner: req.account._id}, {}, {notAllowNull: true})

    return res.json(deliveryInfos)
}

const deleteDeliveryInfo = async (req, res) => {
    let filter = {
        owner: req.account._id,
        _id: req.params.deliveryInfoId
    }

    let deleteDeliveryInfo = await DbService.deleteOne(models.DeliveryInfoModel, filter)

    return res.json(deleteDeliveryInfo)
}

module.exports = {
    addDeliveryInfo,
    getDeliveryInfos,
    deleteDeliveryInfo
}