export const register = async (req,res)=>{
    try {
        
    } catch (error) {
        return res.status(500).json({
            name : error.name ,
            message : error.message
        })
    }
}