module.exports = function(sequelize, DataTypes) {
  var Service = sequelize.define("Services", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },

    class_name: {
      type: DataTypes.STRING(150),
      allowNull: false,
      validate: {
        len: [1, 150]
      },
    },

    cost: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false
    },

    start_time: {
      type: DataTypes.TIME,
      allowNull: false
    },

    day_of_week: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
    
  },
  {
    underscored: true
  });

Service.associate = function(models) {
    //Associate Service with Business
    //A service cannot be created without a Business due to the foreign key constraint
    Service.belongsTo(models.Business, {
      onDelete: 'CASCADE',
      onUpdate: 'CASCADE'
    });   
  }

  return Service;
}

