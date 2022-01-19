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
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.get('/:cc', (req, res) => {
    con.query("Select * FROM users WHERE cc = " + req.params.cc, function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.post('/', (req,res) => {
    con.query("INSERT INTO users VALUES(" + req.body.cc +
        ",'"+ req.body.name +
        "'," + req.body.token_amount +
        "," + req.body.token_total +
        ",'" + req.body.email +
        "','" + req.body.password +
        "','" + req.body.img_url + "')",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.put('/:cc', (req, res) => {
    con.query("UPDATE users SET name = '" + req.body.name +
        "', token_amount = " + req.body.token_amount +
        ", token_total = " + req.body.token_total +
        ", email = '" + req.body.email +
        "', password = '" + req.body.password + 
        "', cc = " + req.body.cc +
        ", img_url = '" + req.body.img_url +
        "' WHERE cc =" + req.params.cc ,
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.delete('/:cc', (req, res) => {
    con.query("DELETE FROM users WHERE cc = " + req.params.cc, function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

// Login
// Status 200 means accepted, Status 400 means rejected

router.post('/login', (req, res)  => {
    con.query("Select * FROM users WHERE cc = " + req.body.cc, function (err, result, fields) {
        if (err) res.status(500).send(err);
        else{
            if (result[0]["password"] == req.body.password) {
                res.status(200).send(true)
            }
            else {
                res.status(400).send(false)
            }
        } ;
    });
});



// Friends: See, Add and remove friends
// TODO: Make get return the activities, transportation, discounts and friends (not just ids)
// NOTE: Currently friends is a one way street, meaning that when user 1 is friends with user 2, user 2 is not friends with user 1s

router.get('/:cc/friends', (req, res) => {
    con.query("Select * FROM friends JOIN USERS WHERE user1_cc = " + req.params.cc, function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.post('/:cc/friends', (req,res) => {
    con.query("INSERT INTO friends VALUES(" + req.body.user1_cc +
        ","+ req.body.user2_cc + ")",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.delete('/:cc/friends/:cc_2', (req, res) => {
    con.query("DELETE FROM friends WHERE user1_cc = " + req.params.cc +
    " AND user2_cc = " + req.params.cc_2, 
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

// Leaderboards

router.get('/:cc/leaderboard', (req, res) => {
    con.query("Select * FROM users", function (err, result, fields) {
        if (err) res.status(500).send(err);
        else{
            result.sort(function(a, b) {
                return parseFloat(b.token_total) - parseFloat(a.token_total);
            });
            res.status(200).send(result);
        }
    });
});

router.get('/:cc/friendleaderboard', (req, res)  => {
    con.query("Select * FROM friends INNER JOIN USERS ON friends.user1_cc = users.cc WHERE user1_cc = " + req.params.cc,
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else{
            result.sort(function(a, b) {
                return parseFloat(b.token_total) - parseFloat(a.token_total);
            });
            res.status(200).send(result);
        }
    });
});


// Activities: See, join and use receive from activites

router.get('/:cc/activities', (req, res) => {
    con.query("Select * FROM User_Activity INNER JOIN Activities ON User_Activity.activity_qr = Activities.qr_code WHERE user_cc = " + req.params.cc,
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.post('/:cc/activities', (req,res) => {
    con.query("INSERT INTO User_Activity VALUES(" + req.body.user_cc +
        ",'"+ req.body.activity_qr + "')",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.delete('/:cc/activities/:qr', (req, res) => {
    con.query("DELETE FROM User_Activity WHERE user_cc = " + req.params.cc +
        " AND activity_qr = '" + req.params.qr  + "'",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

// Discounts: See, claim and use discounts

router.get('/:cc/discounts', (req, res) => {
    con.query("Select * FROM User_Discounts INNER JOIN Discounts ON User_Discounts.discounts_qr = Discounts.qr_code WHERE user_cc = " + req.params.cc,
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.get('/:cc/unused_discounts', (req, res) => {
    con.query("Select * FROM User_Discounts INNER JOIN Discounts ON User_Discounts.discounts_qr = Discounts.qr_code WHERE user_cc = " + req.params.cc
        + " AND status = 'unused'",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.post('/:cc/discounts', (req,res) => {
    con.query("INSERT INTO User_Discounts VALUES(" + req.body.user_cc +
        ",'"+ req.body.discounts_qr +
        "','" +  req.body.status + "')",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.delete('/:cc/discounts/:qr', (req, res) => {
    con.query("DELETE FROM User_Discounts WHERE user_cc = " + req.params.cc +
        " AND discounts_qr = '" + req.params.qr  + "'",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

// Transportation: See, claim and use transportation

router.get('/:cc/transportation', (req, res) => {
    con.query("Select * FROM User_Transportation INNER JOIN Transportation ON User_Transportation.transportation_qr = Transportation.qr_code WHERE user_cc = " + req.params.cc,
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.get('/:cc/unused_transportation', (req, res) => {
    con.query("Select * FROM User_Transportation INNER JOIN Transportation ON User_Transportation.transportation_qr = Transportation.qr_code WHERE user_cc = " + req.params.cc
        + " AND status = 'unused'",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.post('/:cc/transportation', (req,res) => {
    con.query("INSERT INTO User_Transportation VALUES(" + req.body.user_cc +
        ",'"+ req.body.transportation_qr +
        "','" +  req.body.status + "')",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

router.delete('/:cc/transportation/:qr', (req, res) => {
    con.query("DELETE FROM User_Transportation WHERE user_cc = " + req.params.cc +
        " AND transportation_qr = '" + req.params.qr  + "'",
    function (err, result, fields) {
        if (err) res.status(500).send(err);
        else res.status(200).send(result)
    });
});

module.exports = router;
