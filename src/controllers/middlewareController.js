import jwt from 'jsonwebtoken'
import user from '../models/user'

const middlewareController = {

    // VERIFY TOKEN
    verifyToken: (req, res, next) => {
            let token = req.headers.token.split(' ')[1]
            if(token) {
            jwt.verify(token, process.env.ACCESS_TOKEN_KEY, (err, user) => {
                if(err) {
                    console.log(err)
                  return  res.status(403).json('Token da het han verifyToken')
                } else {
                req.user = user // dùng cho hàm verifyTokenDelete để biết được role của user
                next()
                }
            })
        } else {
          return  res.status(401).json('ban chua dang nhap')
        }
    },

    // VERIFY ADMIN
    verifyAdminToken: (req, res, next) => {
        middlewareController.verifyToken(req, res, () => {
            if(req.user.role === 'admin') {
                next()
            } else {
                res.status(403).json('ban khong co quyen truy cap')
            }
        })
    }

}

module.exports = middlewareController;