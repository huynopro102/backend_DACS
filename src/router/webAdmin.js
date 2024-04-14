const express = require('express');
const router = express.Router();
const webAdminControllerAccounts = require('../controller/webAdminController/accountsController');
const webAdminControllerSupplier = require("../controller/webAdminController/supplierController");
const webAdminControllerProducts = require("../controller/webAdminController/productsController");
const webAdminControllerDashBoard = require("../controller/webAdminController/dashboardController")

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

// supplier
router.get('/admin/v1/supplier',webAdminControllerSupplier.getAdminV1Supplier)
router.get('/admin/v1/supplier/create',webAdminControllerSupplier.getAdminV1SupplierCreate)
router.post('/admin/v1/supplier/create',webAdminControllerSupplier.postAdminV1SupplierCreate)
router.get('/admin/v1/supplier/edit/:id',webAdminControllerSupplier.getAdminV1SupplierEdit)

// get product 
router.get('/admin/v1/product',webAdminControllerProducts.getAdminV1Products)
router.get('/admin/v1/product/edit/:id',webAdminControllerProducts.getAdminV1ProductsEdit)
router.get('/admin/v1/product/create',webAdminControllerProducts.getAdminV1ProductsCreate)

// post product
router.post("/admin/v1/product/edit/:id",webAdminControllerProducts.postAdminV1ProductEdit)
router.post("/admin/v1/product/create" , uploadCloud.single('image') ,  assignPathNameImage , 
webAdminControllerProducts.postAdminV1ProductsCreate)


// get product type
router.get('/admin/v1/producttype',webAdminControllerProducts.getAdminV1ProductsType)
router.get('/admin/v1/producttype/edit/:id',webAdminControllerProducts.getAdminV1ProductsTypeEdit)
router.get('/admin/v1/producttype/create',webAdminControllerProducts.getAdminV1ProductsTypeCreate)

// post product type 
router.post('/admin/v1/producttype/create',webAdminControllerProducts.postAdminV1ProductsTypeCreate)
router.post('/admin/v1/producttype/edit/:id',webAdminControllerProducts.postAdminV1ProductsTypeEdit)


module.exports = router;