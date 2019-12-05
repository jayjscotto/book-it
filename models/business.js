module.exports = function(sequelize, DataTypes) {
    var  Business= sequelize.define("Business", {
        business_id: {
            type: DataTypes.INTEGER,
            primaryKey: true
        },
        address: {
            type: DataTypes.STRING,
            allowNull: false
        },
        zipcode: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                isNumeric: true
            }
        }
    });

    Business.associate = function(models) {
        //Associate Business with Service
        //When Business is deleted, also delete any associated appointments
        Business.hasMany(models.Service);
    };

    Business.associate = function(models) {
        //Associate Business with Appointment
        //When Business is deleted, also delete any associated appointments
        Business.hasMany(models.Appointment, {
            onDelete: "cascade"
        });
    };

    return Business;
}

//One business will have many services available
//One business will have many appointments booked