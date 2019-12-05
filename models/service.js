module.exports = function(sequelize, DataTypes) {
    var  Service = sequelize.define("Service", {
        service_id: {
            type: DataTypes.INTEGER,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING,
            allowNull: false
        },
        business_id: {
            
        }
    });

    Service.associate = function(models) {
        //Associate Service with Business  
        //A service cannot be created without a Business due to the foreign key constraint 
        Service.belongsTo(models.Business, {
            foreignKey: 'business_id',
            targetKey: 'business_id',
            allowNull: false
        });
    }

    Service.associate = function(models) {
        //Associate Service with Appointments
        Service.hasMany(models.Appointment, {
            onDelete: 'cascade'
        });
    }
    return Service;
};