import mongoose from "mongoose";
import paginate from "mongoose-paginate-v2";

const schema = new mongoose.Schema(
  {
    avatar: {
      type: String,
      default: "https://i.imgur.com/Uoeie1w.jpg",
    },
    userName: {
      type: String,
      trim: true,
      unique: true,
      required: true
    },
    email: {
      type: String,
      trim: true,
      unique: true,
      required: true
    },
    password: {
      type: String,
      private: true,
      required: true
    },
    role: {
      type: String,
      default: "user",
    },
    forgotToken: String,
    refreshToken: String
  },
  {
    timestamps: true,
  }
);

schema.plugin(paginate);
const AccountModel = mongoose.model("Account", schema);

module.exports = AccountModel;
