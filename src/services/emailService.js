require("dotenv").config();
const nodemailer = require("nodemailer");

// Hàm gửi email
const sendEmailService = async (userEmail, adminEmail, name, email, phone, body) => {
    const transporter = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 465,
        secure: true, // Sử dụng SSL
        auth: {
            user: process.env.EMAIL_USERNAME,
            pass: process.env.EMAIL_PASSWORD
        }
    });

    try {
        // Gửi email cho người dùng
        const userMail = await transporter.sendMail({
            from: '"Thông tin của bạn đã được tiếp nhận" <DungChinhOrner@gmail.com>',
            to: userEmail,
            subject: "Chúng tôi đã nhận được thắc mắc của bạn",
            html: `<p>Chúng tôi đã nhận được thắc mắc của bạn. Chúng tôi sẽ liên lạc bạn sớm nhất có thể! Chúc bạn ngày mới tốt lành (DungChinhBike)</p>`
        });

        // Gửi email cho admin
        const adminMail = await transporter.sendMail({
            from: '"Thông tin liên hệ" <DungChinhOrner@gmail.com>',
            to: adminEmail,
            subject: "Thông tin liên hệ từ khách hàng",
            html: `
                <p>Tên: ${name}</p>
                <p>Email: ${email}</p>
                <p>Số điện thoại: ${phone}</p>
                <p>Nội dung: ${body}</p>
            `
        });

        return { userMail, adminMail };
    } catch (error) {
        console.error('Error occurred: ', error.message);
        throw error; // Phát sinh lỗi để xử lý ở tầng trên
    }
};

    module.exports = sendEmailService;