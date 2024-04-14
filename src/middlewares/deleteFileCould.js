    const cloudinary = require('cloudinary').v2;

    // Khởi tạo cấu hình Cloudinary
    cloudinary.config({
        cloud_name: process.env.CLOUDINARY_NAME,
        api_key: process.env.CLOUDINARY_KEY,
        api_secret: process.env.CLOUDINARY_SECRET
    });

    // Hàm xóa ảnh từ Cloudinary
    
    let deleteImage  = async (req,res,next)=>{
        try {
            console.log(req.body)
            const {productId,publicId,imageUrl} = req.body
            const result = await cloudinary.uploader.destroy(publicId);
            console.log(result);
        } catch (error) {
            console.error(error);
            throw error;
        }
        next()
    }

module.exports = deleteImage;
