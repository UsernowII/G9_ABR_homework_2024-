const { Router }  = require('express');
const sequelize = require('../db/sequelize');
const { QueryTypes } = require('sequelize');

const router = Router();

router.get('/artists', async (req, res) => {
    const { limit } = req.query;

    let query = ` SELECT * FROM artists`;

    limit ? query += ` LIMIT ${limit};` : query += ';'

    try {
        const result = await sequelize.query(`
            SELECT * FROM artists;
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


router.post('/artists', async (req, res) => {

    try {
        const { name, bio, photoUrl } = req.body

        if (!name || !bio || !photoUrl ){
            return res.status(400).send('format Invalid')};


        const result = await sequelize.query(`
        INSERT INTO artists (name, bio, photoUrl)
        VALUES (:name, :bio, :photoUrl)
        RETURNING*;
        `,
        {
            replacements: {name, bio, photoUrl},
            type: sequelize.QueryTypes.INSERT,
        }
    );
    console.log(result)
    if ( !result) {
        return res.status(404).json({message: 'Something went wrong'})
    }
        res.status(201).json(result[0][0]);
        
    } catch (error) {
        console.log(error);
        res.status(500).json({message: 'Internal server Error'});   
    }
});

router.put('/artists/:id', async (req, res ) => {

    try {
        const id = parseInt(req.params.id);
        const { name, bio, photoUrl } = req.body

        if (!name| !bio || !photoUrl ){
            return res.status(400).send('format Invalid')};

        const [artists] = await sequelize.query(`
            UPDATE artists
            SET name = :name,
                bio = :bio,
                photoUrl = :photoUrl
            WHERE id = :id
            RETURNING *;
            `,
            {
                replacements: {name, bio, photoUrl, id},
                type: QueryTypes.UPDATE,
            }
        );
        if (artists.length <= 0) return res.status(404).json({message: "atist not Found"});
        res.status(200).json(artists[0])
    } catch (error) {
        
    }
});

router.delete('/artists/:id', async (req, res) => {

    try {
        const id = parseInt(req.params.id);
    
        const result = await sequelize.query(`
            DELETE FROM artists
            WHERE id = :id
            RETURNING *;
            `,{
                replacements: {id},
                type: sequelize.QueryTypes.DELETE,
            });
        console.log(result);

        if (result.length === 0 ) return res.status(404).json({message: 'artists Not Found'});
        res.json(result[0]);
    } catch (error) {
        res.status(500).json({message: 'Internal Server Error'});
        console.log(error);
    }
});

module.exports = router;