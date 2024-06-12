const {request,response} = require('express');
const axios = require('axios');
const API = 'https://www.datos.gov.co/resource/9vha-vh9n.json';

// GET LISTAR DELITOS
const listarDelitos = async (req, res = response) => {
    try {
        const { data } = await axios.get(API);
        const datos = data; // Aquí asignas los datos obtenidos de la API a la variable datos
        res.render('listarDelitos', { datos }); // Pasas los datos a la vista
    } catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Error al cargar la API'
        });
    }
}

// GET BUSCAR DELITOS
const buscarDelitos = async (req, res) => {
    const searchTerm = req.query.q;

    try {
        const { data } = await axios.get(`${API}?campo_de_busqueda=${searchTerm}`);
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al buscar delitos' });
    }
}

module.exports = {
    listarDelitos,
    buscarDelitos
}
