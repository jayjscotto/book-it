module.exports = function(sequelize, DataTypes) {
  var Service = sequelize.define("Services", {
    service_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },

    class_name: {
      type: DataTypes.STRING(150),
      allowNull: false,
      unique: true,
      validate: {
        len: [1, 150]
      },
      //primaryKey: true
    },

    cost: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false
    },

    start_time: {
      type: DataTypes.INTEGER,
      allowNull: false
    },

    days_offered: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        is: ["^[a-z]+$", "i"], // will only allow letters
        len: [1, 7]
      }
    }
  });

Service.associate = function(models) {
    //Associate Service with Business
    //A service cannot be created without a Business due to the foreign key constraint
    Service.belongsTo(models.Business, {
      foreignKey: 'business_id',
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE'
    });

   
  }
  return Service;
}

