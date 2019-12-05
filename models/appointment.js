module.exports = function(sequelize, DataTypes) {
    var  Appointment = sequelize.define("Appointment", {
        
    });

    //one user will have many appointments
    Appointment.associate = function(models) {
        Appointment.belongsTo(models.User, {
            foreignKey: 'user_id',
            targetKey: 'id',
            allowNull: false
        });
    };

    //one service will be many appointments
    Appointment.associate = function(models) {
        Appointment.hasOne(models.Service, {
            foreignKey: 'service_id',
            targetKey: 'service_id',
            allowNull: false
        })
    }

    //one business will have many appointments booked
    Appointment.associate = function(models) {
        Appointment.belongsTo(models.Business, {
            foreignKey: 'business_id',
            targetKey: 'business_id',
            allowNull: false
        });
    };

    return Appointment;
}

