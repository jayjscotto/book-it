
module.exports = function(sequelize, DataTypes) {
  var Appointment = sequelize.define("Appointments", {
    appointment_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },

    day: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        is: ["^[a-z]+$", "i"], // will only allow letters
        len: [1]
      }
    },

    // class_name: {
    //   type: DataTypes.STRING,
    //   allowNull: false,
    //   validate: {
    //     len: [1]
    //   }
    // }
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
  }
  return Appointment;
}
