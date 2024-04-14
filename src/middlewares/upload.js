const multer = require("multer");
const appRoot = require("app-root-path");
const iconv = require("iconv-lite");

const storage = multer.diskStorage({
    
    destination: function (req, file, cb) {
        console.log("Đây là app-root-path", appRoot.path +"/src/public/img_products");
        cb(null, appRoot.path+"/src/public/img_products");
    },

    filename: function (req, file, cb) {
        const decodedFilename = iconv.decode(file.originalname, "utf-8");
        const pathNameImage = Date.now() + '-' + decodedFilename;
        cb(null, pathNameImage );
    }

    
});

const upload = multer({ storage: storage });
module.exports = upload;
