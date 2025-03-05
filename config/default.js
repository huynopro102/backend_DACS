require('dotenv').config()

module.exports =
{
  "vnp_TmnCode": process.env.TMNCODE,
  "vnp_HashSecret": process.env.SECRETKEY,
  "vnp_Url": "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html",
  "vnp_Api": "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction",
  "vnp_ReturnUrl": process.env.VNP_RETURNURL
}
