import db from "../models/index";
var bcrypt = require("bcryptjs");
var salt = bcrypt.genSaltSync(10);
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

var multer = require("multer");

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "src/public");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});
var upload = multer({ storage: storage }).single("file");

const userController = {
  //GET ALL USER
  getAllUsers: async (req, res) => {
    try {
      const users = await db.User.findAll();
      res.status(200).json(users);
    } catch (err) {
      res.status(500).json("loi server");
    }
  },

  // UPDATE USER
  updateUser: async (req, res) => {
    try {
      let username = await db.User.findOne({
        where: {
          userName: req.body.userName,
        },
      });

      // CHECK USERNAME EXISTS
      if (username) {
        return res.status(400).json("username đã tồn tại");
      }
      let email = await db.User.findOne({
        where: {
          email: req.body.email,
        },
      });

      // CHECK EMAIL EXISTS
      if (email) {
        return res.status(400).json("email đã tồn tại");
      }
      let phone = await db.User.findOne({
        where: {
          phone: req.body.phone,
        },
      });

      // CHECK PHONE EXISTS
      if (phone) {
        return res.status(400).json("số điện thoại đã tồn tại");
      }
      let data = await db.User.update(
        {
          userName: req.body.userName,
          email: req.body.email,
          phone: req.body.phone,
        },
        {
          where: {
            id: req.params.id,
          },
        }
      );

      res.status(200).json(data);
    } catch (err) {
      res.status(500).json("loi server");
    }
  },

  // DELETE USER
  deleteUser: async (req, res) => {
    try {
      await db.User.destroy({
        where: {
          id: req.params.id,
        },
      });

      res.status(200).json("xoa thanh cong");
    } catch (err) {
      res.status(500).json("loi server");
    }
  },

  addUser: async (req, res) => {
    try {
      let username = await db.User.findOne({
        raw: true,
        where: {
          userName: req.body.userName,
        },
      });

      // CHECK USERNAME EXISTS
      if (username) {
        res.status(400).json("username đã tồn tại");
      } else {
        let email = await db.User.findOne({
          raw: true,
          where: {
            email: req.body.email,
          },
        });

        // CHECK EMAIL EXISTS
        if (email) {
          res.status(200).json("email đã tồn tại");
        } else {
          let phone = await db.User.findOne({
            raw: true,
            where: {
              phone: req.body.phone,
            },
          });

          // CHECK PHONE EXISTS
          if (phone) {
            res.status(400).json("số điện thoại đã tồn tại");
          } else {
            let hash = bcrypt.hashSync(req.body.password, salt);
            // INSERT DATA TO DB
            let data = await db.User.create({
              userName: req.body.userName,
              email: req.body.email,
              phone: req.body.phone,
              password: hash,
              role: "user"
            });
            res.status(200).json(data);
          }
        }
      }
    } catch (err) {
      console.log(err);
      res.status(500).json("loi server");
    }
  },

  addProductImg: (req, res) => {
    upload(req, res, function (err) {
      if (err instanceof multer.MulterError) {
        console.log(err);
        return res.status(500).json(err);
      } else if (err) {
        console.log(err);
        return res.status(500).json(err);
      }
    });
    res.status(200).json('them hinh anh thanh cong')
  },

  addProduct: async (req, res) => {
    try {
     let data =  await db.Product.create({
        productName: req.body.productName,
        price: req.body.price,
        type: req.body.type,
        status: req.body.status,
        description: req.body.description,
        image: req.body.image,
      });
      res.status(200).json(data);
    } catch (err) {
      res.status(500).json("loi server");
    }
  },

  getAllProducts: async (req, res) => {
    try {
      let data = await db.Product.findAll();
      res.status(200).json(data);
    } catch (err) {
      res.status(500).json("loi server");
    }
  },

  updateProduct: async (req, res) => {
    try {
      await db.Product.update(
        {
          productName: req.body.productName,
          price: req.body.price,
          type: req.body.type,
          status: req.body.phone,
          description: req.body.description,
          image: req.body.image,
        },
        {
          where: {
            id: req.params.id,
          },
        }
      );
      let data = await db.Product.findOne({
        where: {
          id: req.params.id
        }
      })
      res.status(200).json(data);
    } catch (err) {
      res.status(500).json("loi server");
    }
  },
  deleteProduct: async (req, res) => {
    try {
      await db.Product.destroy({
        where: {
          id: req.params.id,
        },
      });
      res.status(200).json('xoa thanh cong')
    } catch(err) {
      res.status(500).json('loi server')
    }
  },
  getOneProduct: async (req, res) => {
    try {
      let data = await db.Product.findOne({
        where: {
          id: req.params.id
        }
      })

      res.status(200).json(data)
    } catch(err) {
      res.status(500).json('loi server')
    }
  },
  getProductsMatchKeyword: async (req, res) => {
    try {
      let data = await db.Product.findAll({
        where: {
          productName: { [Op.like] : `%${req.params.key}%`}
        }
      })
      res.status(200).json(data)
    } catch(err) {
      res.status(500).json('loi server')
    }
  },

  addToCart: async (req, res) => {
    try {
      let product = await db.Cart.findOne({
        where: {
          productId: req.body.productId
        }
      })
      if(product) return res.status(400).json('Ban da them vao gio truoc do roi')
       let data = await db.Cart.create({
          userId: req.body.userId,
          productId: req.body.productId,
          quantityAdded: req.body.quantityAdded
       })
       res.status(200).json(data)
    } catch(err) {
      console.log(err)
      res.status(500).json('loi server')
    }
  }, 
  getProductInCart: async (req, res) => {
    try {
      let data = await db.Cart.findAll({
        where: {userId: req.params.userId},
        include: [
          {
            model: db.Product,
            required: true
          }
        ]
      })
      res.status(200).json(data)
    } catch(err) {
      console.log(err)
      res.status(500).json('loi server')
    }
  },
  updateProductInCart: async (req, res) => {
    try {
      await db.Cart.update({
        quantityAdded: req.body.quantityAdded
      },
      {
        where: {
          userId: req.body.userId,
          productId: req.body.productId
        },
      }
      )
      res.status.json('update thanh cong')
    } catch(err) {
      console.log(err)
      req.status(500).json('loi server')
    }
  },
  deleteProductInCart: async (req, res) => {
    try {
      await db.Cart.destroy({
        where: {
          userId: req.query.userId,
          productId: req.query.productId
        }
      })
      res.status(200).json('xoa thanh cong')
    } catch(err) {
      console.log(err)
      res.status(500).json('loi server')
    }
  }
};

module.exports = userController;
