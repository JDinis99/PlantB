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
    con.query("Select * FROM users", function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.get('/:cc', (req, res) => {
    con.query("Select * FROM users WHERE cc = " + req.params.cc, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.post('/', (req,res) => {
    con.query("INSERT INTO users VALUES(" + req.body.cc +
        ",'"+ req.body.name +
        "'," + req.body.token_amount +
        ",'" + req.body.email +
        "','" + req.body.password + "')",
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.put('/:cc', (req, res) => {
    con.query("UPDATE users SET name = '" + req.body.name +
        "', token_amount = " + req.body.token_amount +
        ", email = '" + req.body.email +
        "', password = '" + req.body.password + 
        "', cc = " + req.body.cc +
        " WHERE cc =" + req.params.cc ,
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.delete('/:cc', (req, res) => {
    con.query("DELETE FROM users WHERE cc = " + req.params.cc, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

// Friends: See, Add and remove friends
// TODO

/*
router.get('/:cc/friends', (req, res) => {
    con.query("Select user2_cc FROM friends WHERE cc = " + req.params.cc, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.post('/:cc/friends', (req,res) => {
    con.query("INSERT INTO users VALUES(" + req.body.cc +
        ",'"+ req.body.name +
        "'," + req.body.token_amount +
        ",'" + req.body.email +
        "','" + req.body.password + "')",
    function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});

router.delete('/:cc/friends', (req, res) => {
    con.query("DELETE FROM users WHERE cc = " + req.params.cc, function (err, result, fields) {
        if (err) throw err;
        res.send(result).status(200)
    });
});
*/

// Discounts: See, claim and use discounts
// TODO

// Transportation: See, claim and use transportation
// TODO

// Activities: See, join and use receive from activites
// TODO

module.exports = router;
