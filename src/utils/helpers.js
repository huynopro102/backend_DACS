const Joi = require('joi');
const bcrypt = require('bcrypt');
const saltRounds = 10; 

const validateRegistration = (firstName, lastName, email, password) => {
    const schema = Joi.object({
        firstName: Joi.string().required(),
        lastName: Joi.string().required(),
        email: Joi.string().email().required(),
        password: Joi.string().min(6).required(),
    });

    const { error, value } = schema.validate({ firstName, lastName, email, password });

    if (error) {
        return { success: false, error: { field: error.details[0].context.key, message: error.details[0].message } };
    }

    return { success: true, data: value };
};


const validateSignin = (email, password) => {
    const schema = Joi.object({
        email: Joi.string().email().required(),
        password: Joi.string().min(6).required(),
    }).options({ allowUnknown: false }); // Không cho phép các trường không mong muốn

    const { error, value } = schema.validate({ email, password });

    if (error) {
        return { success: false, error: { field: error.details[0].context.key, message: error.details[0].message } };
    }

    return { success: true, data: value };
};




const comparePassword = async (password, hash) => {
    try {
        const result = await bcrypt.compare(password, hash);
        return result;
    } catch (error) {
        throw error
    }
};

const hashPassword = async (password) => {
    try {
        const hashedPassword = await bcrypt.hash(password, saltRounds);
        return hashedPassword;
    } catch (error) {
        throw error
    }
};




module.exports = { validateRegistration , validateSignin , hashPassword , comparePassword};
