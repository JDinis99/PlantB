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
    if (err) res.send(err).status(500);
    console.log("Connected!");
});

/**
 * discounts
 */

router.get('/', (req, res) => {
    con.query("Select * FROM discounts", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.get('/:qr', (req, res) => {
    con.query("Select * FROM discounts WHERE qr_code = '" + req.params.qr + "'", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.post('/', (req,res) => {
    con.query("INSERT INTO discounts VALUES('" + req.body.qr_code +
        "','"+ req.body.type +
        "'," + req.body.amount +
        "," + req.body.token_cost +
        ",'" + req.body.shop +
        "'," + req.body.location_x +
        "," + req.body.location_y +
        ",'" + req.body.description + "')",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.put('/:qr', (req, res) => {
    con.query("UPDATE discounts SET qr_code = '" + req.body.qr_code +
        "', type = '"+ req.body.type +
        "', amount = " + req.body.amount +
        ", token_cost = " + req.body.token_cost +
        ", shop = '" + req.body.shop +
        "', location_x = " + req.body.location_x +
        ", location_y = " + req.body.location_y +
        ", description = '" + req.body.description +
        "' WHERE qr_code = '" + req.params.qr + "'",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.delete('/:qr', (req, res) => {
    con.query("DELETE FROM discounts WHERE qr_code = '" + req.params.qr  + "'", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});


module.exports = router;
