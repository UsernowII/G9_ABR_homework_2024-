const { Sequelize } = require('sequelize');
const env = require('../config/env');

const { database } = env;

const sequelize = new Sequelize(database.name,
    database.username, database.password, {
  host: database.host,
  dialect: database.dialect,
});


sequelize.query(`
    CREATE TABLE IF NOT EXISTS Artists (
      id SERIAL PRIMARY KEY,
      name VARCHAR(50),
      bio TEXT,
      photoUrl VARCHAR(100)
    );
  `).then(() => console.log('Artists table created'))
    .catch(err => console.error('Error creating Artists table:', err));
  
    sequelize.query(`
      CREATE TABLE IF NOT EXISTS Songs (
          id SERIAL PRIMARY KEY,
          title VARCHAR(100),
          artistId INTEGER REFERENCES artists (id),
          releaseYear INTEGER,
          duration INTEGER,
          coverUrl VARCHAR(100)
      );
      `).then(() => console.log('Songs table created'))
      .catch(err => console.error('Error creating Songs table:', err));


module.exports = sequelize;