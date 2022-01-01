/* Modules */
const express = require('express');
const router = express.Router();
const mysql = require("mysql2")

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "admin",
    database:"PlantB"
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

/**
 * discounts
 */

router.get('/', (req, res) => {
    con.query("Select * FROM activities", function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.get('/:id', (req, res) => {
    con.query("Select * FROM activities WHERE id = " + req.params.id, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.post('/', (req,res) => {
    con.query("INSERT INTO activities VALUES(DEFAULT" +
        ","+ req.body.token_reward +
        ",'" + req.body.name +
        "'," + req.body.location_x +
        "," + req.body.location_y +
        "," + req.body.max_number_participants +
        ",'" + req.body.date +
        "','" + req.body.status +
        "','" + req.body.description + "')",
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.put('/:id', (req, res) => {
    con.query("UPDATE activities SET id = " + req.body.id +
        ", token_reward = "+ req.body.token_reward +
        ", name = '" + req.body.name +
        "', location_x = " + req.body.location_x +
        ", location_y = " + req.body.location_y +
        ", max_number_participants = " + req.body.max_number_participants +
        ", date = '" + req.body.date +
        "', status = '" + req.body.status +
        "', description = '" + req.body.description +
        "' WHERE id = " + req.params.id,
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.delete('/:id', (req, res) => {
    con.query("DELETE FROM activities WHERE id = " + req.params.id, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});


module.exports = router;
