module.exports = function(sequelize, DataTypes) {
  var Business = sequelize.define("Business", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },

    name: {
      type: DataTypes.STRING(150),
      allowNull: false
    },

    street_address: {
      type: DataTypes.STRING(200),
      allowNull: false,
      validate: {
        len: [1, 200]
      }
    },

    city: {
      type: DataTypes.STRING(200),
      allowNull: false,
      validate: {
        len: [1, 200]
      }
    },

    state: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        len: [2]
      }
    },

    zipcode: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        not: ["[a-z]",'i'],
      }
    }
  }, {
    underscored: true
  });

  return Business;
}