const { Router }  = require('express');
const sequelize = require('../db/sequelize');
const { QueryTypes } = require('sequelize');


const routerSong = Router();
routerSong.get('/songs', async (req, res) => {
    const { limit } = req.query;

    let query = ` SELECT * FROM songs`;

    limit ? query += ` LIMIT ${limit};` : query += ';'

    try {
        const result = await sequelize.query(`
            SELECT * FROM songs;
            `,
            {
                type: sequelize.QueryTypes.SELECT,
            }
        );

        res.json(result);
    } catch (error) {
        console.log(error);
        res.status(500).json({message: 'Internal server Error'});
    }
    
});

routerSong.post('/songs', async (req, res) => {

    try {
        const { title, artistId, releaseYear, duration, coverUrl } = req.body

        if (!title || !artistId || !releaseYear || !duration || !coverUrl){
            return res.status(400).send('format Invalid')};
    
        if(isNaN(releaseYear) || isNaN(duration)){
            return res.status(404).json({ message: 'releaseYear and duration should be a numbers'})
        }


        const result = await sequelize.query(`
        INSERT INTO songs (title, artistId, releaseYear, duration, coverUrl)
        VALUES (:title, :artistId, :releaseYear, :duration, :coverUrl)
        RETURNING*;
        `,
        {
            replacements: {title, artistId, releaseYear, duration, coverUrl},
            type: sequelize.QueryTypes.INSERT,
        }
    );
    if ( !result) {
        return res.status(404).json({message: 'Something went wrong'})
    }
        res.status(201).json(result[0][0]);
        
    } catch (error) {
        console.log(error);
        res.status(500).json({message: 'Internal server Error'});   
    }
});

routerSong.put('/songs/:id', async (req, res ) => {

    try {
        const id = parseInt(req.params.id);
        const { title, artistId, releaseYear, duration, coverUrl } = req.body

        if (!title || !artistId || !releaseYear || !duration || !coverUrl){
            return res.status(400).send('format Invalid')};
    
        if(isNaN(artistId) ||isNaN(releaseYear) || isNaN(duration)){
            return res.status(404).json({ message: 'artistId, releaseYear and duration should be a numbers'})
        };

        const [songs] = await sequelize.query(`
            UPDATE songs
            SET title = :title,
                artistId = :artistId,
                releaseYear = :releaseYear,
                duration = :duration,
                coverUrl = :coverUrl
            WHERE id = :id
            RETURNING *;
            `,
            {
                replacements: {title, artistId, duration, releaseYear, coverUrl, id},
                type: QueryTypes.UPDATE,
            }
        );
        if (songs.length <= 0) return res.status(404).json({message: "songs not Found"});
        res.status(200).json(songs[0])
    } catch (error) {
        console.log(error);
        res.status(500).json({message: 'Internal server Error'});  
    }
});

routerSong.delete('/songs/:id', async (req, res) => {

    try {
        const id = parseInt(req.params.id);
    
        const result = await sequelize.query(`
            DELETE FROM songs
            WHERE id = :id
            RETURNING *;
            `,{
                replacements: {id},
                type: sequelize.QueryTypes.DELETE,
            });
        console.log(result);

        if (result.length === 0 ) return res.status(404).json({message: 'Song Not Found'});
        res.json(result[0]);
    } catch (error) {
        res.status(500).json({message: 'Internal Server Error'});
        console.log(error);
    }
})


module.exports = routerSong;