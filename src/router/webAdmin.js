const express = require('express');
const router = express.Router();
const webAdminControllerAccounts = require('../controller/webAdminController/accountsController');
const webAdminControllerSupplier = require("../controller/webAdminController/supplierController");
const webAdminControllerProducts = require("../controller/webAdminController/productsController");
const webAdminControllerWarehouses = require("../controller/webAdminController/warehouseController");
const webAdminControllerDashBoard = require("../controller/webAdminController/dashboardController")
const webAdminControllerCustomer = require("../controller/webAdminController/customerController")
const webAdminControllerInvoice = require("../controller/webAdminController/invoiceController")
const webAdminControllerStaff = require("../controller/webAdminController/staffController")
const webAdminControllerDeliveryNotes = require("../controller/webAdminController/deliverynoteController")
const webAdminControllerInvoiceDetail = require("../controller/webAdminController/invoiceDetailController")



const uploadCloud = require("../middlewares/uploadFileCould")
const assignPathNameImage = require("../middlewares/assignPathNameImage");
const deleteImage = require("../middlewares/deleteFileCould")


// upload file could 
router.post("/admin/v1/cloudinary-upload" , uploadCloud.array('image') , webAdminControllerProducts.handleUploadFileCould )
router.delete("/admin/v1/cloudinary-upload" , deleteImage , webAdminControllerProducts.handleDeleteFileCould  )

// dashboard
router.get("/admin/v1",webAdminControllerDashBoard.getAdminV1Dashboard)

// accounts
router.get('/admin/v1/accounts', webAdminControllerAccounts.getAdminV1Accounts);
router.post('/admin/v1/accounts', webAdminControllerAccounts.postAdminV1Accounts);
router.get('/admin/v1/accounts/edit/:id', webAdminControllerAccounts.getAdminV1AccountsEdit);
router.get('/admin/v1/accounts/create',webAdminControllerAccounts.getAdminV1AccountsCreate)

// post accounts
router.post("/admin/v1/accounts/edit/:id", webAdminControllerAccounts.postAdminV1AccountsEdit )
router.post("/admin/v1/accounts/delete" , webAdminControllerAccounts.postAdminV1AccountDelete )

//customer
router.get('/admin/v1/customer', webAdminControllerCustomer.getAdminV1Customers);
router.get('/admin/v1/exportToExcel', webAdminControllerCustomer.exportToExcel);


// supplier
router.get('/admin/v1/supplier',webAdminControllerSupplier.getAdminV1Supplier)
router.get('/admin/v1/supplier/create',webAdminControllerSupplier.getAdminV1SupplierCreate)
router.post('/admin/v1/supplier/create',webAdminControllerSupplier.postAdminV1SupplierCreate)
router.get('/admin/v1/supplier/edit/:id',webAdminControllerSupplier.getAdminV1SupplierEdit)
// router.post('/admin/v1/supplier/edit/:id',webAdminControllerSupplier.postAdminV1SupplierEdit)
// router.post('/admin/v1/supplier/delete/:id',webAdminControllerSupplier.postAdminV1SupplierDelete)

// get product 
router.get('/admin/v1/product',webAdminControllerProducts.getAdminV1Products)
router.get('/admin/v1/product/edit/:id',webAdminControllerProducts.getAdminV1ProductsEdit)
router.get('/admin/v1/product/create',webAdminControllerProducts.getAdminV1ProductsCreate)

// post product
router.post("/admin/v1/product/edit/:id",webAdminControllerProducts.postAdminV1ProductEdit)
router.post("/admin/v1/product/create" , uploadCloud.single('image') ,  assignPathNameImage , webAdminControllerProducts.postAdminV1ProductsCreate)
router.get("/admin/v1/product/delete/:id",webAdminControllerProducts.deleteAdminV1Product)

// get product type
router.get('/admin/v1/producttype',webAdminControllerProducts.getAdminV1ProductsType)
router.get('/admin/v1/producttype/edit/:id',webAdminControllerProducts.getAdminV1ProductsTypeEdit)
router.get('/admin/v1/producttype/create',webAdminControllerProducts.getAdminV1ProductsTypeCreate)

// post product type 
router.post('/admin/v1/producttype/create',webAdminControllerProducts.postAdminV1ProductsTypeCreate)
router.post('/admin/v1/producttype/edit/:id',webAdminControllerProducts.postAdminV1ProductsTypeEdit)
// router.post('/admin/v1/producttype/delete/:id',webAdminControllerProducts.deleteAdminV1ProductsType)

//warehouse
router.get('/admin/v1/warehouse',webAdminControllerWarehouses.getAdminV1Warehouse)
router.get('/admin/v1/warehouse/edit/:id',webAdminControllerWarehouses.getAdminV1WarehouseEdit)
router.get('/admin/v1/warehouse/create',webAdminControllerWarehouses.getAdminV1WarehouseCreate)
router.post('/admin/v1/warehouse/create',webAdminControllerWarehouses.postAdminV1WarehouseCreate)
router.post('/admin/v1/warehouse/edit/:id',webAdminControllerWarehouses.postAdminV1WarehouseEdit)
router.post('/admin/v1/warehouse/delete/:id',webAdminControllerWarehouses.postAdminV1WarehouseDelete)


//invoice
router.get('/admin/v1/invoice',webAdminControllerInvoice.getAdminV1Invoices)
router.get('/admin/v1/exportToExcel',webAdminControllerInvoice.exportToExcel)
router.post('/admin/v1/invoice/upgrade_to_one_from_two/:id',webAdminControllerInvoice.upgrade_to_one_from_two)


// invoiceDetail
router.get("/admin/v1/invoicedetail/:id", webAdminControllerInvoiceDetail.getAdminV1InvoiceDetailID)


// deliveryNotes
router.get("/admin/v1/deliverynotes",webAdminControllerDeliveryNotes.getDeliveryNote)
router.post("/admin/v1/deliverynotes/edit/:id",webAdminControllerDeliveryNotes.postDeliveryNote)


//staff
router.get('/admin/v1/staff', webAdminControllerStaff.getAdminV1Staff);
router.get('/admin/v1/exportToExcelStaff', webAdminControllerStaff.exportToExcel);


//stafftype
router.get('/admin/v1/stafftype',webAdminControllerStaff.getAdminV1StaffType)
router.get('/admin/v1/stafftype/create',webAdminControllerStaff.getAdminV1StafftypeCreate)
router.post('/admin/v1/stafftype/create',webAdminControllerStaff.postAdminV1StafftypeCreate)
router.get('/admin/v1/stafftype/edit/:id',webAdminControllerStaff.getAdminV1StafftypeEdit)
router.post('/admin/v1/stafftype/edit/:id',webAdminControllerStaff.postAdminV1StafftypeEdit)
router.post('/admin/v1/stafftype/delete/:id',webAdminControllerStaff.postAdminV1StafftypeDelete)



module.exports = router;