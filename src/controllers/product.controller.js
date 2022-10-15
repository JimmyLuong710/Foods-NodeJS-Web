import db from "../models";
import ApiError from "../config/error.config";
const Sequelize = require("sequelize");
const Op = Sequelize.Op;

const addProduct = async (req, res) => {
  let data = await db.Product.create(req.body);

  return res.status(200).json(data);
};

const getProducts = async (req, res) => {
  let filter = req.query.key
    ? { productName: { [Op.like]: `%${req.params.key}%` } }
    : {};
  let data = await db.Product.findAll({
    order: [["id", "DESC"]],
    where: filter,
  });

  return res.status(200).json(data);
};

const getProduct = async (req, res) => {
  let data = await db.Product.findOne({
    where: {
      id: req.params.productId,
    },
  });

  return res.status(200).json(data);
};

const updateProduct = async (req, res) => {
  if (req.user.role != "admin") {
    throw new ApiError(403, "Not authorized");
  }

  let data = await db.Product.update(req.body, {
    where: {
      id: req.params.productId,
    },
  });

  return res.status(200).json(data);
};

const deleteProduct = async (req, res) => {
  if (req.user.role != "admin") {
    throw new ApiError(403, "Not authorized");
  }

  let data = await db.Product.destroy({
    where: {
      id: req.params.id,
    },
  });

  return res.status(200).json(data);
};

const getQuantitySoldOfProduct = async (req, res) => {
  let data = await db.OrderDetails.findAll({
    raw: true,
    attributes: [
      [Sequelize.fn("sum", Sequelize.col("quantityOrdered")), "total"],
    ],
    where: { productId: req.params.productId },
    include: [
      {
        model: db.Order,
        required: true,
        attributes: [],
        where: { status: "shipped" },
      },
    ],
    group: "productId",
  });
  console.log(data);

  res.status(200).json(data);
};

const getProductsBestSell = async (req, res) => {
  let data = await db.OrderDetails.findAll({
    raw: true,
    attributes: [
      [Sequelize.fn("sum", Sequelize.col("quantityOrdered")), "total"],
    ],
    include: [
      {
        model: db.Order,
        required: true,
        attributes: [],
        where: { status: "shipped" },
      },
      {
        model: db.Product,
        required: true,
      },
    ],
    group: "productId",
    order: [[Sequelize.col("total"), "DESC"]],
    limit: 10,
  });

  console.log(data);
  res.status(200).json(data);
};

module.exports = {
  addProduct,
  getProducts,
  getProduct,
  updateProduct,
  deleteProduct,
  getQuantitySoldOfProduct,
  getProductsBestSell,
};
