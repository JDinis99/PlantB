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
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.get('/:id', (req, res) => {
    con.query("Select * FROM transportation WHERE id = " + req.params.id, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.post('/', (req,res) => {
    con.query("INSERT INTO transportation VALUES(DEFAULT" +
        ","+ req.body.amount +
        "," + req.body.token_cost +
        "," + req.body.user_cc + ")",
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.put('/:id', (req, res) => {
    con.query("UPDATE transportation SET id = " + req.body.id +
        ", amount = " + req.body.amount +
        ", token_cost = " + req.body.token_cost +
        ", user_cc = " + req.body.user_cc + 
        " WHERE id =" + req.params.id ,
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.delete('/:id', (req, res) => {
    con.query("DELETE FROM transportation WHERE id = " + req.params.id, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});


module.exports = router;
