const pool = require("../../models/connectDB");

const { validateSignin, comparePassword } = require("../../utils/helpers");
const { generateAccessToken  } = require("../../utils/jwt_services");

let getSign = (req, res) => {
    console.log(req.payload)
  res.render("./Client/signin.ejs");
};

const postSign = async (req, res) => {
  const { email, password } = req.body;
  const result = validateSignin(email, password);

  if (!result.success) {
    return res.status(401).json({ message: result.error.message });
  }

  try {
    const [user, userFields] = await pool.execute(
      "SELECT * FROM user WHERE Email = " + [result.data.email]  );
    if (user.length === 0) {
      return res.status(404).json({ message: "Không tìm thấy tài khoản" });
    }

    const isPasswordMatch = await comparePassword(password, user[0].Password);
    if (isPasswordMatch) {
      const accessToken = await generateAccessToken(user[0].Username , user[0].Check);
        res.cookie('Token', accessToken ); 
        res.cookie('Username', user[0].Username.toString() ); 
      return res
        .status(201)
        .json({ message: "đăng nhập thành công", token: accessToken , Username :user[0].Username  });
    } else {
      return res.status(401).json({ message: "Mật khẩu không đúng" });
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Lỗi server" });
  }
};
module.exports = {
  getSign,
  postSign,
};
