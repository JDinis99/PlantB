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
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.get('/:qr', (req, res) => {
    con.query("Select * FROM activities WHERE qr_code = '" + req.params.qr + "'", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.post('/', (req,res) => {
    con.query("INSERT INTO activities VALUES('" + req.body.qr_code +
        "',"+ req.body.token_reward +
        ",'" + req.body.name +
        "'," + req.body.location_x +
        "," + req.body.location_y +
        "," + req.body.max_number_participants +
        ",'" + req.body.date +
        "','" + req.body.status +
        "'," + req.body.hours_to_repeat +
        ",'" + req.body.description +
        "','" + req.body.img_url + "')",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.put('/:qr', (req, res) => {
    con.query("UPDATE activities SET qr_code = '" + req.body.qr_code +
        "', token_reward = "+ req.body.token_reward +
        ", name = '" + req.body.name +
        "', location_x = " + req.body.location_x +
        ", location_y = " + req.body.location_y +
        ", max_number_participants = " + req.body.max_number_participants +
        ", date = '" + req.body.date +
        "', status = '" + req.body.status +
        "', hours_to_repeat = " + req.body.hours_to_repeat +
        ", description = '" + req.body.description +
        "', img_url = '" + req.body.img_url +
        "' WHERE qr_code = '" + req.params.qr + "'",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.delete('/:qr', (req, res) => {
    con.query("DELETE FROM activities WHERE qr_code = '" + req.params.qr  + "'", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});


module.exports = router;
