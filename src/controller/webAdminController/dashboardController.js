const pool = require("../../models/connectDB");

let getAdminV1Dashboard = async (req, res) => {
    try {
        // Tỷ giá hối đoái (giả định 1 USD = 23,000 VND)
        const exchangeRate = 23000;

        // Lấy tổng doanh thu (USD)
        const [totalRevenueRows] = await pool.execute(`
            SELECT SUM(TotalQuantity * Price) AS totalRevenue 
            FROM Invoicedetails 
            INNER JOIN Invoice ON Invoicedetails.IDInvoice = Invoice.IDInvoice 
            WHERE Invoice.Status = 3
        `);

        const totalRevenueUSD = totalRevenueRows[0].totalRevenue || 0;

        // Chuyển đổi doanh thu sang VND
        const totalRevenueVND = totalRevenueUSD * exchangeRate;

        // Định dạng doanh thu VND
        const formattedTotalRevenueVND = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(totalRevenueVND);

        // Lấy tổng số đơn hàng
        const [totalOrdersRows] = await pool.execute(`
            SELECT COUNT(*) AS totalOrders 
            FROM Invoice 
            WHERE Status = 3
        `);

        const totalOrders = totalOrdersRows[0].totalOrders || 0;

        // Lấy tổng số khách hàng
        const [totalCustomersRows] = await pool.execute(`
            SELECT COUNT(*) AS totalCustomers 
            FROM Customer
        `);

        const totalCustomers = totalCustomersRows[0].totalCustomers || 0;

        // Lấy tổng số sản phẩm tồn kho
        const [totalStockRows] = await pool.execute(`
            SELECT SUM(QuantityInStock) AS totalStock 
            FROM Warehousedetails
        `);

        const totalStock = totalStockRows[0].totalStock || 0;

        // Lấy doanh thu theo tháng trong năm hiện tại
        const [monthlyRevenueRows] = await pool.execute(`
            SELECT MONTH(Invoice.DateCreated) AS month, SUM(TotalQuantity * Price) AS revenue
            FROM Invoicedetails
            RIGHT JOIN Invoice ON Invoicedetails.IDInvoice = Invoice.IDInvoice
            WHERE Invoice.Status = 3 AND YEAR(Invoice.DateCreated) = YEAR(CURDATE())
            GROUP BY MONTH(Invoice.DateCreated)
            ORDER BY MONTH(Invoice.DateCreated) ASC
        `);
        
        const monthlyRevenue = monthlyRevenueRows.map(row => ({
            month: row.month,
            revenue: row.revenue * exchangeRate
        }));

        // Lấy doanh thu theo năm
        const [yearlyRevenueRows] = await pool.execute(`
            SELECT YEAR(Invoice.DateCreated) AS year, SUM(TotalQuantity * Price) AS revenue
            FROM Invoicedetails
            INNER JOIN Invoice ON Invoicedetails.IDInvoice = Invoice.IDInvoice
            WHERE Invoice.Status = 3
            GROUP BY YEAR(Invoice.DateCreated)
        `);

        const yearlyRevenue = yearlyRevenueRows.map(row => ({
            year: row.year,
            revenue: row.revenue * exchangeRate
        }));

        res.render('./Admin/dashboard/Dashboard.ejs', {
            totalRevenue: formattedTotalRevenueVND,
            totalOrders: totalOrders,
            totalCustomers: totalCustomers,
            totalStock: totalStock,
            monthlyRevenue: monthlyRevenue,
            yearlyRevenue: yearlyRevenue,
            yearlyRevenueRows: yearlyRevenueRows // Pass yearlyRevenueRows to the view
        });
    } catch (err) {
        console.error('Error getting dashboard data', err);
        res.status(500).json({ message: 'Internal Server Error' });
    }
}

module.exports = {
    getAdminV1Dashboard
};