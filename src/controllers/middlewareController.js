import jwt from 'jsonwebtoken'

const middlewareController = {

    // VERIFY TOKEN
    verifyToken: (req, res, next) => {
            let token = req.headers.token.split(' ')[1]
            if(token) {
            jwt.verify(token, process.env.ACCESS_TOKEN_KEY, (err, user) => {
                if(err) {
                    res.status(400).json('Token da het han')
                } else {
                req.user = user // dùng cho hàm verifyTokenDelete để biết được role của user
                next()
                }
            })
        } else {
            res.status(401).json('ban chua dang nhap')
        }
    },

    // VERIFY DELETE USER
    verifyTokenUserOrAdminToken: (req, res, next) => {
        // bản chất next là 1 hàm => khi truyền vào tham số trong verifyToken thì có thể biến tấu nó đi
        // để đỡ xác thực lại => đã đăng nhập mới được xóa người dùng
        middlewareController.verifyToken(req, res, () => {  
            if(req.user.id === req.params.id) {
                next()
            } else {
                res.status(403).json('ban khong co quyen thao tac tai khaon nay')
            }
        })
    },

    verifyAdminToken: (req, res, next) => {
        middlewareController.verifyToken(req, res, () => {
            if(user.role === 'admin') {
                next()
            } else {
                res.status(403).json('ban khong co quyen truy cap')
            }
        })
    }

}

module.exports = middlewareController;