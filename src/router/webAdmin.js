const express = require('express');
const router = express.Router();
const webAdminControllerAccounts = require('../controller/webAdminController/accountsController');
const webAdminControllerSupplier = require("../controller/webAdminController/supplierController");
const webAdminControllerProducts = require("../controller/webAdminController/productsController");
const webAdminControllerWarehouses = require("../controller/webAdminController/warehouseController");
const webAdminControllerCustomer = require("../controller/webAdminController/customerController")
const webAdminControllerInvoice = require("../controller/webAdminController/invoiceController")
const webAdminControllerStaff = require("../controller/webAdminController/staffController")
const webAdminControllerDeliveryNotes = require("../controller/webAdminController/deliverynoteController")
const webAdminControllerInvoiceDetail = require("../controller/webAdminController/invoiceDetailController")
const webAdminControllerDocument = require("../controller/webAdminController/documentsController")
const webAdminControllerDashBoard = require("../controller/webAdminController/dashboardController")
const webAdminControllerImported= require("../controller/webAdminController/importedController")
const webAdminControllerLogin = require("../controller/webAdminController/loginController")
const {checkStaff ,  checkAdmin} = require("../utils/jwt_services")
 


const uploadCloud = require("../middlewares/uploadFileCould")
const assignPathNameImage = require("../middlewares/assignPathNameImage");
const deleteImage = require("../middlewares/deleteFileCould")


// upload file could 
router.post("/admin/v1/cloudinary-upload" , checkAdmin , uploadCloud.array('image') , webAdminControllerProducts.handleUploadFileCould )
router.delete("/admin/v1/cloudinary-upload" , checkAdmin , deleteImage , webAdminControllerProducts.handleDeleteFileCould  )

// dashboard
router.get("/admin/v1" , checkAdmin , webAdminControllerDashBoard.getAdminV1Dashboard)

// accounts
router.get('/admin/v1/accounts', webAdminControllerAccounts.getAdminV1Accounts);
router.get('/admin/v1/accounts/edit/:id', webAdminControllerAccounts.getAdminV1AccountsEdit);
router.get('/admin/v1/accounts/create',webAdminControllerAccounts.getAdminV1AccountsCreate)
router.post('/admin/v1/accounts/edit/:id',webAdminControllerAccounts.postAdminV1AccountsEdit)
router.post('/admin/v1/accounts/delete/:id',webAdminControllerAccounts.postAdminV1AccountsDelete)
router.post('/admin/v1/accounts/create',webAdminControllerAccounts.postAdminV1AccountsCreate)


//customer
router.get('/admin/v1/customer', webAdminControllerCustomer.getAdminV1Customers);
router.get('/admin/v1/customer/view/:id', webAdminControllerCustomer.getAdminV1CustomersView);
router.get('/admin/v1/exportToExcelCustomer', webAdminControllerCustomer.exportToExcel);



// get product 
router.get('/admin/v1/product',checkAdmin ,checkStaff ,webAdminControllerProducts.getAdminV1Products)
router.get('/admin/v1/product/edit/:id',checkAdmin ,checkStaff ,webAdminControllerProducts.getAdminV1ProductsEdit)
router.get('/admin/v1/product/create',checkAdmin ,checkStaff ,webAdminControllerProducts.getAdminV1ProductsCreate)

// post product
router.post("/admin/v1/product/edit/:id",checkAdmin ,checkStaff ,webAdminControllerProducts.postAdminV1ProductEdit)
router.post("/admin/v1/product/create" ,checkAdmin , uploadCloud.single('image') ,  assignPathNameImage , webAdminControllerProducts.postAdminV1ProductsCreate)
router.get("/admin/v1/product/delete/:id",checkAdmin ,checkStaff ,webAdminControllerProducts.deleteAdminV1Product)

// get product type
router.get('/admin/v1/producttype',webAdminControllerProducts.getAdminV1ProductsType)
router.get('/admin/v1/producttype/edit/:id',webAdminControllerProducts.getAdminV1ProductsTypeEdit)
router.get('/admin/v1/producttype/create',webAdminControllerProducts.getAdminV1ProductsTypeCreate)

// post product type 
router.post('/admin/v1/producttype/create',webAdminControllerProducts.postAdminV1ProductsTypeCreate)
router.post('/admin/v1/producttype/edit/:id',webAdminControllerProducts.postAdminV1ProductsTypeEdit)
router.post('/admin/v1/producttype/delete/:id',webAdminControllerProducts.deleteAdminV1ProductsType)






//imported
router.get("/admin/v1/imported",webAdminControllerImported.getAdminV1Imported)
router.get('/admin/v1/imported/create',webAdminControllerImported.getAdminV1ImportedCreate)
router.post('/admin/v1/imported/create',webAdminControllerImported.postAdminV1ImportedCreate)
router.get('/admin/v1/imported/edit/:id',webAdminControllerImported.getAdminV1ImportedEdit)
router.post('/admin/v1/imported/edit/:id',webAdminControllerImported.postAdminV1ImportedEdit)
router.post('/admin/v1/imported/delete/:id',webAdminControllerImported.postAdminV1ImportedDelete)
router.post('/admin/v1/imported/import/:id',webAdminControllerImported.postAdminV1ImportedImport)
router.get('/admin/v1/imported/import/:id',webAdminControllerImported.getAdminV1ImportedImport)
router.get('/admin/v1/importeddetail',webAdminControllerImported.getAdminV1ImportedDetails)
router.get('/admin/v1/importeddetail/view/:id',webAdminControllerImported.getImportedProductDetailsView)





//warehouse
router.get('/admin/v1/warehouse',checkAdmin ,webAdminControllerWarehouses.getAdminV1Warehouse)
router.get('/admin/v1/warehousedetail',checkAdmin ,webAdminControllerWarehouses.getAdminV1WarehouseDetail)
router.get('/admin/v1/warehouse/edit/:id',checkAdmin ,webAdminControllerWarehouses.getAdminV1WarehouseEdit)
router.get('/admin/v1/warehouse/create',checkAdmin ,webAdminControllerWarehouses.getAdminV1WarehouseCreate)
router.post('/admin/v1/warehouse/create',checkAdmin ,webAdminControllerWarehouses.postAdminV1WarehouseCreate)
router.post('/admin/v1/warehouse/edit/:id',checkAdmin ,webAdminControllerWarehouses.postAdminV1WarehouseEdit)
router.post('/admin/v1/warehouse/delete/:id',checkAdmin ,webAdminControllerWarehouses.postAdminV1WarehouseDelete)


//invoice
router.get('/admin/v1/invoice'   , checkAdmin ,webAdminControllerInvoice.getAdminV1Invoices)
router.get('/admin/v1/exportToExcel',checkAdmin ,webAdminControllerInvoice.exportToExcel)
router.post('/admin/v1/invoice/upgrade_to_one_from_two/:id',checkAdmin ,webAdminControllerInvoice.upgrade_to_one_from_two)


// invoiceDetail
router.get("/admin/v1/invoicedetail/:id", checkAdmin ,webAdminControllerInvoiceDetail.getAdminV1InvoiceDetailID)


// deliveryNotes
router.get("/admin/v1/deliverynotes",checkAdmin ,webAdminControllerDeliveryNotes.getDeliveryNote)
router.post("/admin/v1/deliverynotes/edit/:id",checkAdmin ,webAdminControllerDeliveryNotes.postDeliveryNote)


//staff
router.get('/admin/v1/staff', webAdminControllerStaff.getAdminV1Staff);
router.get('/admin/v1/exportToExcelStaff', webAdminControllerStaff.exportToExcel);
router.get('/admin/v1/staff/edit/:id', webAdminControllerStaff.getAdminV1StaffEdit);
router.post('/admin/v1/staff/edit/:id', webAdminControllerStaff.postAdminV1StaffEdit);

 
//stafftype
router.get('/admin/v1/stafftype',webAdminControllerStaff.getAdminV1StaffType)
router.get('/admin/v1/stafftypes',webAdminControllerStaff.getAdminV1StaffTypes)
router.get('/admin/v1/stafftype/create',webAdminControllerStaff.getAdminV1StafftypeCreate)
router.post('/admin/v1/stafftype/create',webAdminControllerStaff.postAdminV1StafftypeCreate)
router.get('/admin/v1/stafftype/edit/:id',webAdminControllerStaff.getAdminV1StafftypeEdit)
router.post('/admin/v1/stafftype/edit/:id',webAdminControllerStaff.postAdminV1StafftypeEdit)
router.post('/admin/v1/stafftype/delete/:id',webAdminControllerStaff.postAdminV1StafftypeDelete)

// supplier
router.get('/admin/v1/supplier',webAdminControllerSupplier.getAdminV1Supplier)
router.get('/admin/v1/supplier/create',webAdminControllerSupplier.getAdminV1SupplierCreate)
router.post('/admin/v1/supplier/create',webAdminControllerSupplier.postAdminV1SupplierCreate)
router.get('/admin/v1/supplier/edit/:id',webAdminControllerSupplier.getAdminV1SupplierEdit)
router.post('/admin/v1/supplier/edit/:id',webAdminControllerSupplier.postAdminV1SupplierEdit)
router.post('/admin/v1/supplier/delete/:id',webAdminControllerSupplier.postAdminV1SupplierDelete)

//document
router.get("/admin/v1/document",checkAdmin ,webAdminControllerDocument.getAdminV1Documents)


// dashboard
router.get("/admin/v1",checkAdmin ,webAdminControllerDashBoard.getAdminV1Dashboard)


// login admin
router.get("/admin/v1/signinAdmin"  ,webAdminControllerLogin.getSignAdmin)
router.post("/admin/v1/signinAdmin"  ,webAdminControllerLogin.postSignAdmin)


module.exports = router;