const express = require("express");
const app = express();

const healthcheck = require('./routes/healthcheck');
const users = require('./routes/users');
const discounts = require('./routes/discounts');
const transportation = require('./routes/transportation');
const activities = require('./routes/activities');

app.use(express.json());
app.use('/healthcheck', healthcheck);
app.use('/users', users);
app.use('/discounts', discounts);
app.use('/transportation', transportation);
app.use('/activities', activities);


app.listen(3000, () => console.log('Listening on port 3000...'));