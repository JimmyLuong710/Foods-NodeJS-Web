import mongoose from "mongoose";
import paginate from "mongoose-paginate-v2";

const schema = new mongoose.Schema(
  {
    owner: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Account'
    },
    name: String,
    phone: String,
    address: String,
  },
  {
    timestamps: true,
  }
);

schema.plugin(paginate);
const DeliveryInfoModel = mongoose.model("DeliveryInfo", schema);

module.exports = DeliveryInfoModel;
