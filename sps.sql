CREATE SCHEMA sps;
-- \dn list schemas
-- spsdata=> \dt sps.*
--            List of relations
--  Schema |    Name     | Type  | Owner
-- --------+-------------+-------+--------
--  sps    | opinions    | table | jerkey
--  sps    | screedlines | table | jerkey
--  sps    | screeds     | table | jerkey

CREATE TABLE sps.screeds (
    pubkey      VARCHAR(64) NOT NULL PRIMARY KEY,
    signer_key  VARCHAR(64) NOT NULL,
    sig_expires TIMESTAMP NOT NULL,
    modified    TIMESTAMP NOT NULL
);

-- SELECT * FROM sps.opinions;
CREATE TABLE sps.opinions (
    id BIGSERIAL PRIMARY KEY,
    opinion TEXT NOT NULL,
    screed_count BIGINT,
    updated_at   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sps.screedlines (
    id SERIAL PRIMARY KEY,
    screed_key VARCHAR(64) NOT NULL,
    opinion_id BIGINT NOT NULL,
    FOREIGN KEY (screed_key) REFERENCES sps.screeds(pubkey),
    FOREIGN KEY (opinion_id) REFERENCES sps.opinions(id)
);
