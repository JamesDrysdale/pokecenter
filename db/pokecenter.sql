-- DROP TABLE medical_records;
DROP TABLE pokemon;
-- DROP TABLE owners;
DROP TABLE vets;


CREATE TABLE vets
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- CREATE TABLE owners 
-- (
--     id SERIAL PRIMARY KEY,
--     first_name VARCHAR(255),
--     last_name VARCHAR(255),
--     phone VARCHAR(255),
--     email VARCHAR(255) UNIQUE,
--     address TEXT
-- );

CREATE TABLE pokemon
(
    -- PET DETAILS
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth VARCHAR(255),
    type VARCHAR(255),
    affinity VARCHAR(255),
    level INT,
    allergy TEXT,
    -- owner_id INT REFERENCES owners(id)
    -- OWNER DETAILS
    owner_first_name VARCHAR(255),
    owner_last_name VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    address TEXT,
    -- MEDICAL DETAILS
    vet_id INT REFERENCES vets(id),
    notes TEXT
);

-- CREATE TABLE medical_records
-- (
--     id SERIAL PRIMARY KEY,
--     pokemon_id INT REFERENCES pokemon(id),
--     vet_id INT REFERENCES vet(id),
--     date VARCHAR(255), -- Treatment date
--     details TEXT  -- Treatment details
-- );
