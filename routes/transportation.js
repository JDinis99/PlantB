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
 * users
 */

router.get('/', (req, res) => {
    con.query("Select * FROM transportation", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.get('/:qr', (req, res) => {
    con.query("Select * FROM transportation WHERE qr_code = '" + req.params.qr  + "'", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.post('/', (req,res) => {
    con.query("INSERT INTO transportation VALUES('"  + req.body.qr_code +
        "',"+ req.body.amount +
        "," + req.body.token_cost + ")",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.put('/:qr', (req, res) => {
    con.query("UPDATE transportation SET qr_code = '" + req.body.qr_code +
        "', amount = " + req.body.amount +
        ", token_cost = " + req.body.token_cost +
        " WHERE qr_code ='" + req.params.qr + "'",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.delete('/:qr', (req, res) => {
    con.query("DELETE FROM transportation WHERE qr_code = '" + req.params.qr + "'", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});


module.exports = router;
