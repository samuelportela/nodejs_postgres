setTimeout(function(){ 
	const express = require('express');
	const server = express();
	const PORT = 3000;
	const { Client } = require('pg');
	const client = new Client("postgres://docker:docker@postgres:5432/docker");

	client.connect()

	const insert = {
	  text: 'INSERT INTO visits(username, date) VALUES($1, NOW())',
	  values: [require("os").userInfo().username]
	}

	const select = {
		  name: 'select-visits',
		  text: 'SELECT * FROM visits'
	}

	server.listen(PORT, () => console.log(`Server running on ${PORT}`));

	server.get('/', (req, res) => {
	  client.query(insert, (err, insertResults) => {
	    if (err) {
	      console.log(err.stack)
	    } else {
	      client.query(select, (err, selectResults) => {
	        if (err) {
	          console.log(err.stack)
	        } else {
	          console.log(JSON.stringify(selectResults.rows))
	          res.status(200).send('Audit: <br />' + JSON.stringify(selectResults.rows))
	        }
	      })
	    }
	  })
	});
}, 3000);

