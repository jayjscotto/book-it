
module.exports = function(sequelize, DataTypes) {
  var Appointment = sequelize.define("Appointments", {
    appointment_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },

    date: {
      type: DataTypes.DATE,
      allowNull: false,
    },

  }, {
      underscored: true
  });

  Appointment.associate = (models) => {
    Appointment.belongsTo(models.Business, {
      foreignKey: 'business_id',
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE'
    });

    Appointment.belongsTo(models.User, {
      foreignKey: 'user_id',
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE'
    });

    Appointment.belongsTo(models.Services, {
        foreignKey: 'service_id',
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
    })
  }
  return Appointment;
}
