-- rangers
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL
);

-- species
CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(255) NOT NULL,
    scientific_name VARCHAR(255) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

-- sightings
CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT,
    species_id INT,
    sighting_time TIMESTAMP,
    location VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);

-- Insert into rangers
INSERT INTO rangers (name, region) VALUES
('Alice Walker', 'Serengeti'),
('David Kim', 'Amazon Rainforest'),
('Fatima Noor', 'Sundarbans'),
('Carlos Mendes', 'Pantanal'),
('Liam O''Brien', 'Yellowstone');

-- Insert into species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('African Elephant', 'Loxodonta africana', '1797-01-01', 'Vulnerable'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Amazon River Dolphin', 'Inia geoffrensis', '1830-01-01', 'Endangered'),
('Jaguar', 'Panthera onca', '1758-01-01', 'Near Threatened'),
('American Bison', 'Bison bison', '1758-01-01', 'Near Threatened'),
('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
('Great Hornbill', 'Buceros bicornis', '1758-01-01', 'Vulnerable'),
('Maned Wolf', 'Chrysocyon brachyurus', '1815-01-01', 'Near Threatened'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered'),
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Vulnerable');

-- Insert into sightings
INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 2, '2024-05-12 18:30:00', 'Sundarbans Reserve Pass', 'Observed a lone Bengal tiger crossing a creek'),
(2, 10, '2024-05-15 17:50:00', 'Himalayan Foothills', 'Snow leopard spotted from afar on rocky ledge'),
(3, 5, '2024-05-17 14:00:00', 'Yellowstone Park', 'Group of bison grazing in open meadow'),
(4, 7, '2024-05-18 10:45:00', 'Western Ghats', 'Indian cobra basking near trail'),
(5, 1, '2024-05-20 09:15:00', 'Amboseli National Park', 'Herd of elephants heading toward waterhole');


-- Drop Table
DROP Table if EXISTS sightings CASCADE

DROP Table if EXISTS rangers CASCADE

DROP Table if EXISTS species CASCADE


SELECT * FROM rangers

SELECT * FROM species

SELECT * FROM sightings


-- problem 1
INSERT INTO rangers (name,region) VALUES
('Derek Fox','Coastal Plains');

-- problem 2
SELECT count(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- problem 3
select * FROM sightings
WHERE location ILIKE '%Pass%';

-- problem 4
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers as r
JOIN sightings as s ON r.ranger_id = s.ranger_id
GROUP BY r.name;

-- problem-5
SELECT species.common_name
FROM species
FULL JOIN sightings ON species.species_id = sightings.species_id
WHERE sightings.sighting_id IS NULL;

-- problem-6
SELECT common_name,sighting_time,scientific_name as name FROM sightings
JOIN species ON sightings.species_id = species.species_id
ORDER BY sightings.sighting_time LIMIT 2

--problem-7
UPDATE species 
SET conservation_status = 'Historic'
WHERE extract(YEAR FROM discovery_date) < 1800;

-- problem-8

SELECT 
  sighting_id,
  CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) < 18 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;

---problem-9

DELETE FROM rangers
WHERE ranger_id NOT in (
    SELECT DISTINCT ranger_id FROM sightings
);