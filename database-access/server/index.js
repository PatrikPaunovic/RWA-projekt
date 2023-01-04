const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

//middleware
app.use(cors());
app.use(express.json());

//ROUTES

//create
app.post("/countries", async(req, res) => {
    try {
        //console.log(req.body);
        const {id, name, hint_1, hint_2, hint_3, hint_4, hint_5} = req.body;
        const newCountry = await pool.query("INSERT INTO countries (id,name,hint_1,hint_2,hint_3,hint_4,hint_5) VALUES($1,$2,$3,$4,$5,$6,$7) RETURNING *",
        [id, name, hint_1, hint_2, hint_3, hint_4, hint_5]);

        res.json(newCountry.rows[0]);
    } catch (error) {
        console.error(error.message);
    }
});

//get all
app.get("/countries", async(req, res) => {
    try {
        const allCountries = await pool.query("SELECT * FROM countries");
        res.json(allCountries.rows);
    } catch (error) {
        console.error(error.message);
    }
});

//get
app.get("/countries/:id", async(req, res) => {
    try {
        //console.log(req.params);
        const {id} = req.params;
        const country = await pool.query("SELECT * FROM countries WHERE id=$1",[id]);
        res.json(country.rows);
    } catch (error) {
        console.error(error.message);
    }
});

//update
app.put("/countries/:id", async(req, res) => {
    try {
        //console.log(req.params);
        const {id} = req.params;
        const {hint_2} = req.body;
        const updateCountry = await pool.query("UPDATE countries SET hint_2 = $1 WHERE id = $2",[hint_2, id]);
        res.json("Country was updated");
    } catch (error) {
        console.error(error.message);
    }
});

//delete
app.delete("/countries/:id", async(req, res) => {
    try {
        const {id} = req.params;
        const deleteCountry = await pool.query("DELETE FROM countries WHERE id = $1", [id]);
        res.json("Country was deleted");
    } catch (error) {
        console.error(error.message);
    }
});

app.listen(5000, () => {
    console.log("server has started on port 5000");
});