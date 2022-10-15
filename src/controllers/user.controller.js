import ApiError from "../config/error.config";
import db from "../models";
import AuthService from "../services/AuthService";

const getUsers = async (req, res) => {
  const users = await db.User.findAll();
  res.status(200).json(users);
};

const updateUser = async (req, res) => {
  let username = await db.User.findOne({
    where: {
      userName: req.body.userName,
    },
  });
  if (username) {
    throw new ApiError(400, "Username already exists");
  }

  if (req.user.role == "admin" || req.user.id == req.params.userId) {
    let data = await db.User.update(
      {
        userName: req.body.userName,
      },
      {
        where: {
          id: req.params.userId,
        },
      }
    );

    return res.status(200).json(data);
  } else {
    throw new ApiError(403, "Not authorized");
  }
};

const deleteUser = async (req, res) => {
  if (req.user.role == "admin" || req.user.id == req.params.userId) {
    let data = await db.User.destroy({
      where: {
        id: req.params.id,
      },
    });

    return res.status(200).json(data);
  } else {
    throw new ApiError(403, "Not authorized");
  }
};

const addUser = async (req, res) => {
  let username = await db.User.findOne({
    raw: true,
    where: {
      userName: req.body.userName,
    },
  });
  if (username) {
    throw new ApiError(400, "username already exists");
  }
  let email = await db.User.findOne({
    raw: true,
    where: {
      email: req.body.email,
    },
  });
  if (email) {
    throw new ApiError(400, "email already exists");
  }
  let phone = await db.User.findOne({
    raw: true,
    where: {
      phone: req.body.phone,
    },
  });
  if (phone) {
    throw new ApiError(400, "phone number already exists");
  }

  let hash = await AuthService.hashPassword(req.body.password);

  let data = await db.User.create({
    ...req.body,
    password: hash,
    role: "user",
  });
  res.status(200).json(data);
};

module.exports = {
  getUsers,
  deleteUser,
  updateUser,
  addUser,
};
