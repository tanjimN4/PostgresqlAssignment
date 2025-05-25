CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL
);

CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(255) NOT NULL,
    scientific_name VARCHAR(255) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

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

INSERT INTO rangers (name, region) VALUES
('Alice Walker', 'Serengeti'),
('David Kim', 'Amazon Rainforest'),
('Fatima Noor', 'Sundarbans'),
('Carlos Mendes', 'Pantanal'),
('Liam O''Brien', 'Yellowstone');

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
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Vulnerable'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Endangered'),
('Giant Otter', 'Pteronura brasiliensis', '1788-01-01', 'Endangered'),
('Okapi', 'Okapia johnstoni', '1901-01-01', 'Endangered'),
('Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern'),
('Harpy Eagle', 'Harpia harpyja', '1758-01-01', 'Near Threatened'),
('Komodo Dragon', 'Varanus komodoensis', '1910-01-01', 'Endangered'),
('Golden Lion Tamarin', 'Leontopithecus rosalia', '1820-01-01', 'Endangered'),
('Black Rhinoceros', 'Diceros bicornis', '1758-01-01', 'Critically Endangered'),
('Mountain Gorilla', 'Gorilla beringei beringei', '1903-01-01', 'Endangered'),
('Addax', 'Addax nasomaculatus', '1826-01-01', 'Critically Endangered'),
('Malayan Tapir', 'Tapirus indicus', '1819-01-01', 'Endangered'),
('Philippine Eagle', 'Pithecophaga jefferyi', '1896-01-01', 'Critically Endangered'),
('Aye-aye', 'Daubentonia madagascariensis', '1788-01-01', 'Endangered'),
('Saola', 'Pseudoryx nghetinhensis', '1992-01-01', 'Critically Endangered'),
('Blue Whale', 'Balaenoptera musculus', '1758-01-01', 'Endangered');

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 2, '2024-05-12 08:30:00', 'Sundarbans Reserve Forest', 'Observed a lone Bengal tiger crossing a creek'),
(2, 10, '2024-05-15 07:50:00', 'Himalayan Foothills', 'Snow leopard spotted from afar on rocky ledge'),
(3, 5, '2024-05-17 14:00:00', 'Yellowstone Park', 'Group of bison grazing in open meadow'),
(4, 14, '2024-05-18 10:45:00', 'Western Ghats', 'Indian cobra basking near trail'),
(5, 7, '2024-05-19 06:20:00', 'Kaziranga National Park', 'Great hornbill seen nesting on tall fig tree'),
(1, 1, '2024-05-20 09:15:00', 'Amboseli National Park', 'Herd of elephants heading toward waterhole'),
(2, 20, '2024-05-21 08:00:00', 'Taman Negara, Malaysia', 'Malayan tapir briefly seen near riverbank'),
(3, 4, '2024-05-22 13:40:00', 'Amazon Rainforest', 'Jaguar spotted from river boat'),
(4, 18, '2024-05-23 11:10:00', 'Serengeti', 'Black rhino observed at distance using binoculars'),
(5, 22, '2024-05-24 16:00:00', 'Luzon, Philippines', 'Philippine eagle flying over forest canopy'),
(1, 3, '2024-05-25 07:30:00', 'Amazon River', 'Amazon river dolphin seen surfacing in group'),
(2, 8, '2024-05-26 06:45:00', 'Cerrado, Brazil', 'Maned wolf seen trotting across open field'),
(3, 11, '2024-05-27 09:20:00', 'Eastern Himalayas', 'Red panda spotted eating bamboo'),
(4, 13, '2024-05-28 12:30:00', 'Ituri Forest, Congo', 'Brief glimpse of okapi near thick vegetation'),
(5, 25, '2024-05-29 10:00:00', 'Southern Ocean', 'Blue whale spotted surfacing off the coast');


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
    WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;

---problem-9

DELETE FROM rangers
WHERE ranger_id NOT in (
    SELECT DISTINCT ranger_id FROM sightings
)


DROP Table if EXISTS sightings CASCADE

DROP Table if EXISTS rangers CASCADE

DROP Table if EXISTS species CASCADE



SELECT * FROM rangers

SELECT * FROM species

SELECT * FROM sightings