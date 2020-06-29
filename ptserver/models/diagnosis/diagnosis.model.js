/*
How to model a table?
https://sequelize.org/v5/manual/getting-started.html#modeling-a-table

id is string since we do not want it to be a auto incrementing integer.
*/

module.exports = (sequelize, Sequelize) => {
  const Diagnosis = sequelize.define("diagnosis", {
    uuid: {
      type: Sequelize.STRING,
      primaryKey: true,
      defaultValue: Sequelize.UUIDV4
    },
    diagnosisName: {
      type: Sequelize.STRING
    },
    icd10Code:{
      type: Sequelize.STRING,
      defaultValue: null
    },
    diagnosisDiscontinueNotes: {
      type: Sequelize.STRING,
      defaultValue: null
    },
    diagnosedOnDate: {
      type: Sequelize.DATE
    },
    patientUUId: {
      type: Sequelize.STRING
    },
    recordChangedByUUID: {
      type: Sequelize.STRING
    },
    recordChangedOnDateTime: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW
    },
    recordChangedFromIPAddress: {
      type: Sequelize.STRING,
      defaultValue: null
    }
  },{
    // don't add the timestamp attributes (updatedAt, createdAt)
    timestamps: false,
  
    // disable the modification of tablenames; By default, sequelize will automatically
    // transform all passed model names (first parameter of define) into plural.
    // if you don't want that, set the following
    freezeTableName: true,
  });

  return Diagnosis;
};
