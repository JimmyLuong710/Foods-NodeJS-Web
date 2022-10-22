import mongoose from "mongoose";
import paginate from "mongoose-paginate-v2";

const schema = new mongoose.Schema(
  {
    owner: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Account",
    },
    orderDate: Date,
    shippedDate: Date,
    status: {
      type: String,
      enum: ["PENDING", "CANCELLED", "CONFIRMED"],
      default: 'PENDING'
    },
    products: [
      {
        product: {
          type: mongoose.Schema.Types.ObjectId,
          ref: "Product",
        },
        quantityOrdered: Number,
      },
    ],
    deliveryInfo: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "DeliveryInfo",
    },
  },
  {
    timestamps: true,
  }
);

schema.plugin(paginate);
const OrderModel = mongoose.model("Order", schema);

module.exports = OrderModel;
