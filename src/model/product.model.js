import mongoose from "mongoose";
import paginate from "mongoose-paginate-v2";

const schema = new mongoose.Schema(
  {
    productName: String,
    price: Number,
    type: {
        type: String
    },
    isDeleted: {
        type: Boolean,
        default: false
    },
    description: String,
    image: String
  },
  {
    timestamps: true,
  }
);

schema.plugin(paginate);
const ProductModel = mongoose.model("Product", schema);

module.exports = ProductModel;
