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
    logAccess(req);
  });

  app.get('/opinions', async (req, res) => {
    const opinions = await pool.any(sql.unsafe`SELECT opinion FROM sps.opinions`);
    logAccess(req);
    res.json(opinions);
  });

  app.get('/ipv4', (req, res) => {
    console.log(req);
    return res.json({ message: `Hello! Your IP address is: ${logAccess(req)}` });
  });

  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  });
};

function logAccess(req) {
  const ipAddress = req.ip; // https://stackoverflow.com/questions/29411551/express-js-req-ip-is-returning-ffff127-0-0-1
  console.log(ipAddress, 'asks for',req.url);
  return ipAddress;
}

void main();
