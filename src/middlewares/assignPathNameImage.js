const iconv = require("iconv-lite");
const assignPathNameImage = (req, res, next) => {
    const decodedFilename = iconv.decode(req.file.originalname, "utf-8");
    req.file.NameReal = decodedFilename;
    next();
};

module.exports = assignPathNameImage