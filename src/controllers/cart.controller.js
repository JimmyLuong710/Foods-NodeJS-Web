import ApiError from "../config/error.config";
import db from "../models";

const addToCart = async (req, res) => {
  let product = await db.Cart.findOne({
    where: {
      productId: req.body.productId,
      userId: req.body.userId,
    },
  });
  if (product) {
    throw new ApiError(400, "product already exists in cart");
  }

  if (req.params.userId != req.user.id) {
    throw new ApiError(400, `You don't have permission to do this action`);
  }

  let data = await db.Cart.create({
    userId: req.params.userId,
    productId: req.body.productId,
    quantityAdded: req.body.quantityAdded,
  });

  return res.status(200).json(data);
};

const getProductInCart = async (req, res) => {
  if (req.params.userId != req.user.id) {
    throw new ApiError(400, `You don't have permission to do this action`);
  }

  let data = await db.Cart.findAll({
    where: { userId: req.params.userId },
    include: [
      {
        model: db.Product,
        required: true,
      },
    ],
  });

  return res.status(200).json(data);
};

module.exports = {
  addToCart,
  getProductInCart,
};
