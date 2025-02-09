import express from 'express';
import { createPool, sql } from 'slonik';
import fs from 'fs';

var postGresURI = fs.readFileSync('postgres.uri', {encoding: 'utf8'});
// postgresql://[user[:password]@][host[:port]][/database name][?name=value[&...]]

const main = async () => {
  const pool = await createPool(postGresURI);

  const app = express();
  const port = 3000;

  app.get('/', (req, res) => {
    res.send('Hello, World!')
  });

  app.get('/opinions', async (req, res) => {
    const opinions = await pool.any(sql.unsafe`SELECT opinion FROM sps.opinions`);
    res.json(opinions);
  });

  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  });
};

void main();
