-- Create schema
CREATE SCHEMA secure_polling;

-- Create tables
CREATE TABLE secure_polling.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE secure_polling.polls (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE secure_polling.options (
    id SERIAL PRIMARY KEY,
    poll_id INTEGER NOT NULL,
    text VARCHAR(100) NOT NULL,
    FOREIGN KEY (poll_id) REFERENCES secure_polling.polls(id)
);

CREATE TABLE secure_polling.votes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    poll_id INTEGER NOT NULL,
    option_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES secure_polling.users(id),
    FOREIGN KEY (poll_id) REFERENCES secure_polling.polls(id),
    FOREIGN KEY (option_id) REFERENCES secure_polling.options(id)
);

-- Create views
CREATE VIEW secure_polling.poll_results AS
SELECT p.id, p.title, o.id AS option_id, o.text, COUNT(v.id) AS vote_count
FROM secure_polling.polls p
JOIN secure_polling.options o ON p.id = o.poll_id
LEFT JOIN secure_polling.votes v ON o.id = v.option_id
GROUP BY p.id, p.title, o.id, o.text;

CREATE VIEW secure_polling.user_votes AS
SELECT u.id, u.username, p.id AS poll_id, p.title, o.id AS option_id, o.text
FROM secure_polling.users u
JOIN secure_polling.votes v ON u.id = v.user_id
JOIN secure_polling.polls p ON v.poll_id = p.id
JOIN secure_polling.options o ON v.option_id = o.id;

-- Create indexes
CREATE INDEX idx_polls_title ON secure_polling.polls(title);
CREATE INDEX idx_options_poll_id ON secure_polling.options(poll_id);
CREATE INDEX idx_votes_user_id ON secure_polling.votes(user_id);
CREATE INDEX idx_votes_poll_id ON secure_polling.votes(poll_id);
CREATE INDEX idx_votes_option_id ON secure_polling.votes(option_id);
