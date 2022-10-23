import mongoose from "mongoose";
import paginate from "mongoose-paginate-v2";

const schema = new mongoose.Schema(
  {
    order: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Order'
    },
    paidDate: Date,
    amount: Number
  },
  {
    timestamps: true,
  }
);

schema.plugin(paginate);
const PaymentModel = mongoose.model("Payment", schema);

module.exports = PaymentModel;
