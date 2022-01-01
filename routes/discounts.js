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
    con.query("Select * FROM discounts", function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.get('/:id', (req, res) => {
    con.query("Select * FROM discounts WHERE id = " + req.params.id, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.post('/', (req,res) => {
    con.query("INSERT INTO discounts VALUES(DEFAULT" +
        ",'"+ req.body.type +
        "'," + req.body.amount +
        "," + req.body.token_cost +
        ",'" + req.body.shop +
        "'," + req.body.location_x +
        "," + req.body.location_y +
        ",'" + req.body.description +
        "'," + req.body.user_cc + ")",
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.put('/:id', (req, res) => {
    con.query("UPDATE discounts SET id = " + req.body.id +
        ", type = '"+ req.body.type +
        "', amount = " + req.body.amount +
        ", token_cost = " + req.body.token_cost +
        ", shop = '" + req.body.shop +
        "', location_x = " + req.body.location_x +
        ", location_y = " + req.body.location_y +
        ", description = '" + req.body.description +
        "', user_cc = " + req.body.user_cc +
        " WHERE id = " + req.params.id,
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.delete('/:id', (req, res) => {
    con.query("DELETE FROM discounts WHERE id = " + req.params.id, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});


module.exports = router;
