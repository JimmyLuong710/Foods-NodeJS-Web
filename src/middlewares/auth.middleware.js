import AuthService from "../services/AuthService";
import db from "../models";

const authMiddleware = async (req, res, next) => {
  try {
    let token = req.headers.token.split(" ")[1];
    let decoded = await AuthService.verifyToken(token, "accessToken");

    let user = await db.User.findOne({
      raw: true,
      where: {
        id: decoded.id,
      },
    });

    req.user = user;
    next();
  } catch (error) {
    return res.status(403).json("Not authenticated");
  }
};

module.exports = authMiddleware;
