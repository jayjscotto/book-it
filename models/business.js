module.exports = function(sequelize, DataTypes) {
  var Business = sequelize.define("Business", {
    business_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },

    name: {
      type: DataTypes.STRING(150),
      allowNull: false
    },

    address: {
      type: DataTypes.STRING(200),
      allowNull: false,
      validate: {
        len: [1, 200]
      }
    },

    zipcode: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        isNumeric: true
      }
    }
  });

  return Business;
}