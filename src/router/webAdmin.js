const express = require('express');
const router = express.Router();
const webAdminController = require('../controller/webAdminController/accountsController');

router.get("/admin/v1",webAdminController.getAdminV1Dashboard)

// accounts
router.get('/admin/v1/accounts', webAdminController.getAdminV1Accounts);
router.post('/admin/v1/accounts', webAdminController.postAdminV1Accounts);
router.get('/admin/v1/accounts/edit/:id', webAdminController.getAdminV1AccountsEdit);
router.get('/admin/v1/accounts/create',webAdminController.getAdminV1AccountsCreate)



module.exports = router;