import db from "../models/index";

const signUpUser = async (req, res) => {
  let findUsername = await db.Users.findOne({
    raw: true,
    where: {
        userName: req.body.userName
    }
  });
  let findEmail = await db.Users.findOne({
    raw: true,
    where: {
        email: req.body.email
    }
  });
  let findPhone = await db.Users.findOne({
    raw: true,
    where: {
        phone: req.body.phone
    }
  });
  let errorCode = 0;
  let errorMessage = '';
  let errorType = '';

  if(findUsername) {
      errorType = 'Tên đăng nhập'
  } else {
    if(findEmail) {
      errorType = 'Email'
    } else {
      if(findPhone) {
        errorType = 'Số điện thoại'
      }
    }
  }

  if(errorType) {
    errorCode  = 1;
    errorMessage = errorType + ' đã tồn tại'
  } else {
    await db.Users.create({ 
      userName: req.body.userName,
      email: req.body.email,
      phone: req.body.phone,
      password: req.body.password
    })
    errorMessage = 'đăng ký thành công'
  }
  res.status(200).json({
    errorCode: errorCode,
    errorMessage: errorMessage,
    errorType: errorType
  })
}

const userLogin = async (req, res) => {
  let users = await db.Users.findOne({
    raw: true,
    where: {
        email: req.body.email
    }
  });

  let data = {};
  let lastName = req.body.lastName;
  if (users) {
    if (users.lastName == lastName) {
        data.errCode = 0
        data.errMessage = 'login sucessfull!'
        data.users = users
    } else {
        data.errCode = 1
        data.errMessage = 'your password is incorrect, please try again!'
        data.users = {}
    }
  }
  else {
        data.errCode = 1
        data.errMessage = 'your email is incorrect, please try again!'
  }

  return res.status(200).json({ 
      errCode: data.errCode,
      errMessage: data.errMessage,
      data: data.users
  });
};

const deleteUser = async (req, res) => {
     
     await db.User.destroy( {
      where: { 
        id:  req.params.id
      }
    })
    let data =  await db.User.findAll()
    // res.header("Access-Control-Allow-Origin", "*");
    return res.status(200).json({
      errCode: 0,
      message: 'success',
      data: data
    })
}
module.exports = {
  signUpUser,
  userLogin: userLogin,
  deleteUser
};
