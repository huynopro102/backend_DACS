const sendEmailService = require("../../services/emailService");


// Controller function to render the contact page
const getContact = (req, res) => {
    try {
        res.render("./Client/contact.ejs");
    } catch (error) {
        console.error("Error rendering contact page: ", error);
        res.status(500).json({ success: false, message: "Error rendering contact page" });
    }
};

// Controller function to handle sending email
const sendEmail = async (req, res) => {
    const { name, email, phone, body } = req.body;

    try {
        // Gọi hàm sendEmailService và đợi kết quả
        const { userMail, adminMail } = await sendEmailService(email, "khanhchii741@gmail.com", name, email, phone, body);
        
        // Log kết quả gửi email
        console.log("Email sent to user: ", userMail);
        console.log("Email sent to admin: ", adminMail);
        
        // Kiểm tra xem cả hai email đã được gửi thành công hay không
        if (userMail && userMail.response.includes('250') && adminMail && adminMail.response.includes('250')) {
            // Nếu cả hai email đều được gửi thành công, trả về thông báo thành công
            return res.status(200).json({ success: true, message: "Email sent successfully" });
        } else {
            // Nếu bất kỳ email nào gửi không thành công, trả về thông báo lỗi
            return res.status(500).json({ success: false, message: "Error sending emails" });
        }
    } catch (error) {
        // Nếu có lỗi xảy ra trong quá trình gửi email, ghi log và trả về thông báo lỗi
        console.error("Error sending email: ", error);
        return res.status(500).json({ success: false, message: "Error sending emails" });
    }
};

module.exports = {
    getContact,
    sendEmail
};