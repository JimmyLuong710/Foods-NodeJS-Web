import ApiError from "../config/error.config";
import DbService from "../services/DbService"
import models from "../models"

const addToCart = async (req, res) => {
  let docBody = {
    $push: {
      products:  req.body
    }
  }
  let filter = {
    owner: req.account._id,
    "products.product":  req.body.product
  };

  let cart = await DbService.findOne(models.CartModel, filter)
  if(cart) {
    throw new ApiError(400, "Sản phẩm này đã thêm vào giỏ trước đó")
  }

  let product = await DbService.updateOne(models.CartModel, {owner: req.account._id}, docBody, {new: true, upsert: true})

  return res.json(product)
}

const getCart = async (req, res) => {
  let cart = await DbService.findOne(models.CartModel, {owner: req.account._id}, {}, {notAllowNull: true, populate: 'products.product'})

  return res.json(cart)
};

const updateInCart = async (req, res) => {
  let filter = {
    owner: req.account._id,
    "products.product":  req.params.productId
  };
  let docBody = {
    $set: {
      "products.$.quantityAdded": req.body.quantityAdded,
    },
  };

  let cart = await DbService.updateOne(models.CartModel, filter, docBody, {new: true}, {notAllowNull: true});

  return res.json(cart);
};

const deleteInCart = async (req, res) => {
  let docBody = {
    $pull: {
      products: {
        product: req.params.productId
      }
    }
  }

  let cart = await DbService.updateOne(models.CartModel, {owner: req.account._id}, docBody, {new:true}, {notAllowNull: true})

  return res.json(cart)
}

const deleteCart = async (req, res) => {
  let cart = await DbService.deleteOne(models.CartModel, {owner: req.account._id}, {}, {notAllowNull: true})

  return res.json(cart)
}

module.exports = {
  addToCart,
  getCart,
  updateInCart,
  deleteInCart,
  deleteCart
}
