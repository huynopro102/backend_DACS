const configeViewEngine = (app,path,__dirname) => {
    app.set("view engine", "ejs");
    app.set("views", path.join(__dirname, "../views"));
    console.log(__dirname, "../views")
}

module.exports = configeViewEngine;