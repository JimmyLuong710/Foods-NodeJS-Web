import db from "../models";
import ApiError from "../config/error.config";
import AuthService from "../services/AuthService";

const signUp = async (req, res) => {

  let username = await db.User.findOne({
    raw: true,
    where: {
      userName: req.body.userName,
    },
  });
  if (username) {
    throw new ApiError(400, "Username already exists");
  }

  let email = await db.User.findOne({
    raw: true,
    where: {
      email: req.body.email,
    },
  });
  if (email) {
    throw new ApiError(400, "Email already exits");
  }

  let phone = await db.User.findOne({
    raw: true,
    where: {
      phone: req.body.phone,
    },
  });
  if (phone) {
    throw new ApiError(400, "Phone number already exits");
  }

  let hash = AuthService.hashPassword(req.body.password);
  let data = await db.User.create({
    userName: req.body.userName,
    email: req.body.email,
    phone: req.body.phone,
    password: hash,
    role: "user",
  });

  delete data.password;

  return res.status(200).json(data);
};

const signIn = async (req, res) => {

  let user = await db.User.findOne({
    raw: true,
    where: {
      userName: req.body.userName,
    },
  });
  if (!user) {
    throw new ApiError(400, "wrong username or password");
  }

  let validatedPassword = AuthService.comparePassword(
    req.body.password,
    user.password
  );
  if (!validatedPassword) {
    throw new ApiError(400, "wrong username or password");
  }

  let accessToken = AuthService.createToken({ id: user.id }, "accessToken");
  let refreshToken = AuthService.createToken({ id: user.id }, "refreshToken");

  await db.LoginToken.create({
    userId: user.id,
    token: refreshToken,
  });

  delete user.password;

  return res.status(200).json({
    ...user,
    accessToken: accessToken,
    refreshToken: refreshToken,
  });
};

const logOut = async (req, res) => {

  let data = await db.LoginToken.destroy({
    where: {
      token: req.body.refreshToken,
    },
  });

  return res.status(200).json(data);
};

const refreshToken = async (req, res) => {

  let refreshToken = req.refreshToken;
  if (!refreshToken) {
    throw new ApiError(403, "Not authenticated");
  }

  let refreshTokenInDb = await db.LoginToken.findOne({
    raw: true,
    where: {
      token: refreshToken,
    },
  });
  if (!refreshTokenInDb) {
    throw new ApiError(403, "Not authenticated");
  }

  let decoded = await AuthService.verifyToken(refreshToken, "refreshToken");
  let newAccessToken = await AuthService.createToken(decoded, "accessToken");

  return res.status(200).json({
    accessToken: newAccessToken,
  })
}

module.exports = {
    signUp, 
    signIn,
    logOut,
    refreshToken
};
