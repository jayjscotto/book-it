// Requiring bcrypt for password hashing. Using the bcryptjs version as 
//the regular bcrypt module sometimes causes errors on Windows machines
var bcrypt = require("bcryptjs");

//Create User model
//export to require on server
module.exports = function(sequelize, DataTypes) {
    var User = sequelize.define("User", {
        
        //E-mail cannot be null, and must be a valid email
        email: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true,
            validate: {
                isEmail: true
            }
        },

        //password cannot be null
        password: {
            type: DataTypes.STRING,
            allowNull: false
        }
    });
    
    
    //Creating custom method for User model
    //to check if unhashed password entered by the user 
    //can be compared against the hashed password in DB
    User.prototype.validPassword = function (password) {
        return bcrypt.compareSync(password, this.password);
    };

    //Before creating the user, automatically hash the password
    User.addHook("beforeCreate", function (user) {
        user.password = bcrypt.hashSync(user.password, bcrypt.genSaltSync(10), null);
    });   

    return User;
};
