-- Create schema
CREATE SCHEMA sps;

-- Create tables
CREATE TABLE sps.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE sps.polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sps.options (
    id SERIAL PRIMARY KEY,
    poll_id INTEGER NOT NULL,
    text VARCHAR(100) NOT NULL,
    FOREIGN KEY (poll_id) REFERENCES sps.polls(id)
);
-- below is search and replaced for sps and opinions

CREATE TABLE sps.votes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    opinion_id INTEGER NOT NULL,
    option_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES sps.screeds(id),
    FOREIGN KEY (opinion_id) REFERENCES sps.opinions(id),
    FOREIGN KEY (option_id) REFERENCES sps.screedlines(id)
);

-- Create views
CREATE VIEW sps.poll_results AS
SELECT p.id, p.title, o.id AS option_id, o.text, COUNT(v.id) AS vote_count
FROM sps.opinions p
JOIN sps.screedlines o ON p.id = o.opinion_id
LEFT JOIN sps.votes v ON o.id = v.option_id
GROUP BY p.id, p.title, o.id, o.text;

CREATE VIEW sps.user_votes AS
SELECT u.id, u.pubkey, p.id AS opinion_id, p.title, o.id AS option_id, o.text
FROM sps.screeds u
JOIN sps.votes v ON u.id = v.user_id
JOIN sps.opinions p ON v.opinion_id = p.id
JOIN sps.screedlines o ON v.option_id = o.id;

-- Create indexes https://www.w3schools.com/sql/sql_create_index.asp
CREATE INDEX idx_polls_title ON sps.opinions(title);
CREATE INDEX idx_options_poll_id ON sps.screedlines(opinion_id);
CREATE INDEX idx_votes_user_id ON sps.votes(user_id);
CREATE INDEX idx_votes_poll_id ON sps.votes(opinion_id);
CREATE INDEX idx_votes_option_id ON sps.votes(option_id);

