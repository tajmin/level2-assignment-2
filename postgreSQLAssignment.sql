-- Active: 1747560871241@@127.0.0.1@5432@conservation_db
-- Create a new database
CREATE DATABASE conservation_db;

-- Create rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- Create species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) CHECK (
        conservation_status IN ( 'Endangered', 'Vulnerable' )
    )
);

-- Create sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INTEGER REFERENCES species(species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes TEXT
);

-- Insert into rangers
INSERT INTO rangers (name, region) 
VALUES
    ('Alice Green', 'Northern Hills'),
    ('Bob White', 'River Delta'),
    ('Carol King', 'Mountain Range');


-- Insert into species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) 
VALUES
    ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


-- Insert into sightings
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) 
VALUES
    (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
    (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
    (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
    (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);



-- Problem # 1
-- Register a new ranger with provided data
INSERT INTO rangers (name, region) 
VALUES ('Derek Fox', 'Coastal Plains');


-- Problem # 2
-- Count unique species
SELECT 
    COUNT(DISTINCT species_id) AS unique_species_count
FROM 
    sightings;


-- # Problem # 3
-- Sightings' locations include "Pass".
SELECT * 
FROM 
    sightings
WHERE 
    location LIKE '%Pass%';


-- Problem # 4
-- Ranger's name and their total number of sightings
SELECT 
    r.name, COUNT(*) AS total_sightings
FROM 
    rangers r
JOIN  -- This is an INNER JOIN by default
    sightings s ON r.ranger_id = s.ranger_id
GROUP BY 
    r.ranger_id;


-- Problem # 5
-- Species that have never been sighted.
SELECT 
    s.common_name
FROM 
    species s
LEFT JOIN 
    sightings si ON s.species_id = si.species_id
WHERE 
    si.species_id IS NULL;


-- Problem # 6
-- Most recent 2 sightings
SELECT 
    s.common_name,
    recent.sighting_time,
    recent.name
FROM (
    SELECT 
        si.species_id,
        si.sighting_time,
        r.name AS "name"
    FROM 
        sightings si
    JOIN 
        rangers r ON si.ranger_id = r.ranger_id
    ORDER BY 
        si.sighting_time DESC
    LIMIT 2
) AS recent
JOIN 
    species s ON recent.species_id = s.species_id;


-- Problem # 7
-- Update to have status 'Historic'.

-- Firstly, modifying table structure to add historic in check constraint
ALTER 
    TABLE species
DROP 
    CONSTRAINT species_conservation_status_check,
ADD 
    CONSTRAINT species_conservation_status_check 
    CHECK (conservation_status IN ('Endangered', 'Vulnerable', 'Historic'));

-- finally, update query to update based on condition
UPDATE species
SET 
    conservation_status = 'Historic'
WHERE 
    discovery_date < '1800-01-01';


-- Problem # 8
SELECT 
    sighting_id,
    CASE 
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'  -- 12 PM (hour 12) to 4:59 PM (hour 16)
        ELSE 'Evening'  -- 5 PM (hour 17) and later
    END AS time_of_day
FROM sightings;


-- Problem # 9
-- Delete ranger who has never sighted
DELETE 
FROM 
    rangers
WHERE 
    ranger_id NOT IN (
    SELECT 
        DISTINCT ranger_id 
    FROM 
        sightings
);