/* Modules */
const express = require('express');
const router = express.Router();

/**
 * Healthcheck
 * 		/API_PATH/healthcheck
 */

router.get('/', (req, res) => {
    res.send('Hello Healthcheck');
});


module.exports = router;
