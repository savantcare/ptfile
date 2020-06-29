module.exports = (sequelize, Sequelize) => {
  const Reminder = sequelize.define("reminder", {
    uuid: {
      type: Sequelize.STRING,
      primaryKey: true,
      defaultValue: Sequelize.UUIDV4,
    },
    patientUUID: {
      type: Sequelize.STRING,
    },
    description: {
      type: Sequelize.STRING,
    },
    recordChangedByUUID: {
      type: Sequelize.STRING,
    },
    recordChangedOnDateTime: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
    },
    recordChangedFromIPAddress: {
      type: Sequelize.STRING,
      defaultValue: null,
    },
    recordChangedFromSection: {
      type: Sequelize.STRING,
      defaultValue: "patientFile",
    },
  });

  return Reminder;
};
