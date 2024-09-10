const MySQL = require("mysql2");
var pool;
const connectMySQL = () => {
  try {
    pool = MySQL.createPool({
      host: "127.0.0.1",
      user: "root",
      password: "",
      database: "got_cakey",
    }).promise();
    console.log("MySQL is connected.....");
  } catch (error) {
    console.log("error connecting database");
  }
};
async function getBakerByEmail(email, type) {
  const sql = `SELECT name,id,password FROM ${type} where email = ?`;
  try {
    const [rows, fileds] = await pool.execute(sql, [email]);
    return rows[0];
  } catch (err) {
    console.error(`Error executing query: ${sql} - ${err.message}`);
    return err;
  }
}

async function createUser({ email, password, type }) {
  const query = `INSERT INTO ${type} (email, password) VALUES (?, ?)`;
  try {
    const [result] = await pool.execute(query, [email, password]);

    const [rows] = await pool.execute(
      `SELECT name,id FROM ${type} where id = ?`,
      [result.insertId]
    );

    return rows[0];
  } catch (error) {
    console.error(`Error executing query: ${query} - ${error.message}`);
    return error;
  }
}

async function addUserInfo({
  verification_doc,
  issuing_state,
  buisness_name,
  registration_status,
  img,
  username,
  bio,
  pickup_address,
  street_address,
  suburb,
  postcode,
  state,
  baked_type,
  suggestion,
  id,
  type,
}) {
  const query1 = `UPDATE baker SET name = ?, image_url = ?, short_bio = ?, gst_registration_status = ?, food_license_img = ?, issuing_state = ?, company_name = ?, suggestion = ? WHERE baker.id = ?`;
  const query2 = `INSERT INTO address (pickup_address, street_address, suburb, postcode, baker_id, state) VALUES (?,?,?,?,?,?)`;
  const query3 = `INSERT INTO bakerbakedgoods (baker_id, baked_good_id) VALUES (?,?)`;
  const query4 =
    "SELECT baker.id,pickup_address,street_address,suburb, address.postcode,state,name,image_url,short_bio,gst_registration_status, food_license_img,issuing_state,company_name,suggestion,type FROM address JOIN baker ON baker.id = address.baker_id JOIN bakerbakedgoods ON bakerbakedgoods.baker_id = baker.id JOIN bakedgoods ON bakedgoods.id = bakerbakedgoods.baked_good_id WHERE baker.id = ?";
  try {
    const [result] = await pool.execute(query1, [
      username,
      img,
      bio,
      registration_status,
      verification_doc,
      issuing_state,
      buisness_name,
      suggestion,
      id,
    ]);
    console.log(id);
  } catch (error) {
    console.error(`Error :${error.message}`);
    return error;
  }

  try {
    const [result_address] = await pool.execute(query2, [
      pickup_address,
      street_address,
      suburb,
      postcode,
      id,
      state,
    ]);
  } catch (error) {
    console.error(`Error :${error.message}`);
    return error;
  }
  try {
    if (baked_type.length > 1) {
      for (let i = 0; i < baked_type.length; i++) {
        switch (baked_type[i]) {
          case "cakes":
            await pool.execute(query3, [id, 1]);
            break;
          case "cupcakes":
            await pool.execute(query3, [id, 2]);
            break;
          case "biscuits":
            await pool.execute(query3, [id, 3]);
            break;
        }
      }
    } else {
      switch (baked_type[0]) {
        case "cakes":
          await pool.execute(query3, [id, 1]);
          break;
        case "cupcakes":
          await pool.execute(query3, [id, 2]);
          break;
        case "biscuits":
          await pool.execute(query3, [id, 3]);
          break;
      }
    }
  } catch (error) {
    console.error(`Error :${error.message}`);
    return error;
  }
  try {
    const [rows] = await pool.execute(query4, [id]);
    return rows[0];
  } catch (error) {
    console.error(`Error :${error.message}`);
    return error;
  }
}

module.exports = {
  getBakerByEmail,
  connectMySQL,
  createUser,
  addUserInfo,
};
