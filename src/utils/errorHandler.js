const errorHandler = (err,req,res)=>{
    return res.status(err.status || 500).json({
        error:{
            name : err.name ,
            message: err.message || "server invalid"
        },
    })
}

const errorHandlerNotFound = (req,res,next)=>{
    const error = new Error("Not Found!!")
    error.status = 404;
    res.render("Error404.ejs")
    next(error)
}

module.exports = {errorHandler,errorHandlerNotFound}