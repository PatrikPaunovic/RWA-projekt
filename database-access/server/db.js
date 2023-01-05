const Pool = require("pg").Pool;

const pool = new Pool({
    user: "postgres",
    password: "doggo",
    host: "localhost",
    port: 5432,
    database: "guessing_game"
});

module.exports = pool;