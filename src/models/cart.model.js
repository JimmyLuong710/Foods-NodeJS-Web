import mongoose from "mongoose";
import paginate from "mongoose-paginate-v2";

const schema = new mongoose.Schema(
  {
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Account'
    },
    products: [{
       product: {
        type:  mongoose.Schema.Types.ObjectId,
        ref: 'Product'
       },
       quantityAdded: Number
    }]
  },
  {
    timestamps: true,
  }
);

schema.plugin(paginate);
const CartModel = mongoose.model("Cart", schema);

module.exports = CartModel;
