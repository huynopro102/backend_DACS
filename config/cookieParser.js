module.exports = function(app, express){
    const cookieParser = require('cookie-parser');
    app.use(express.json());
    app.use(cookieParser());
}