const Pool = require("pg").Pool;

const pool = new Pool({
    user: "postgres",
    password: "pt248gr!",
    host: "localhost",
    port: 5432,
    database: "guessing_game_db"
});

module.exports = pool;