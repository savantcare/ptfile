const router = require("express").Router();
const db = require("../models");
const Component = db.componentDB.components;
const { uuid } = require("uuidv4");

router.post("/", async (req, res) => {
  try {
    const { name, tag } = req.body;
    const newData = {
      uuid: uuid(),
      name: name,
      tag: tag,
    };
    const newComponent = await Component.create(newData);
    res.send(newComponent);
  } catch (err) {
    res.status(500).send({
      message:
        err.message || "Some error occurred while creating the Component",
    });
  }
});

router.get("/", async (req, res) => {
  try {
    const queryResult = await Component.findAll();
    res.send(queryResult);
  } catch (err) {
    res.status(500).send({
      message:
        err.message || "Some error occurred while fetching the Component",
    });
  }
});

// get user component based on user role from DB
// fetch data from join query in user, userRole, component mapping, component
router.get("/getComponentsAllowedForUserRole", async (req, res) => {
  try {
    const { roleUUID } = req.query;
    const queryResult = await Component.sequelize.query(
      "SELECT uuid, roleUUID, componentUUID, multiStateDisplayAreaImportance,currentStateDisplayAreaImportance from ctAllowedToAccessByEachUserRole where roleUUID=:roleUUID and (multiStateDisplayAreaImportance>0 or currentStateDisplayAreaImportance>0)",
      {
        replacements: { roleUUID: roleUUID },
        type: Component.sequelize.QueryTypes.SELECT,
      }
    );

    // const queryResult = await Component.findAll()
    res.send(queryResult);
  } catch (err) {
    res.status(500).send({
      message:
        err.message || "Some error occurred while fetching the Component",
    });
  }
});

module.exports = router;
