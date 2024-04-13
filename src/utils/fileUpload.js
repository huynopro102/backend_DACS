const fileUploader = (req, res, next) => {
console.log(req.file)
  console.log("day la ham file req.file ", req.file);
  console.log("day la ham file req.body ", req.body);

  // Kiểm tra xem có file được tải lên không
  if (!req.file) {
      return res.status(400).json({ message: 'No file uploaded!' });
  }

  // Kiểm tra xem có lỗi xảy ra trong quá trình xử lý tải lên file không
  if (req.file instanceof Error) {
      return res.status(400).json({ message: 'Error uploading file!' });
  }

  // Kiểm tra xem có nhiều hơn một file được tải lên không
  if (req.files.length > 1) {
      return res.status(400).json({ message: 'Multiple files uploaded!' });
  }

  // Kiểm tra xem có nhiều hơn một trường dữ liệu được tải lên không
  if (Object.keys(req.body).length > 1) {
      return res.status(400).json({ message: 'Multiple fields uploaded!' });
  }

 res.status(200).json({message: "thanh cong"})
};

module.exports = fileUploader;
