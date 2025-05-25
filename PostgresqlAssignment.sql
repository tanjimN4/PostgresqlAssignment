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

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES 
('Jaguar', 'Panthera onca', '1758-01-01', 'Near Threatened'),
('African Elephant', 'Loxodonta africana', '1825-05-10', 'Vulnerable'),
('Grizzly Bear', 'Ursus arctos horribilis', '1815-03-15', 'Least Concern'),
('Clownfish', 'Amphiprioninae', '1830-07-12', 'Not Evaluated'),
('Snow Leopard', 'Panthera uncia', '1775-06-22', 'Vulnerable'),
('Red Panda', 'Ailurus fulgens', '1825-09-30', 'Endangered'),
('Bald Eagle', 'Haliaeetus leucocephalus', '1766-05-01', 'Least Concern'),
('Koala', 'Phascolarctos cinereus', '1816-03-01', 'Vulnerable'),
('Giant Panda', 'Ailuropoda melanoleuca', '1869-03-11', 'Vulnerable'),
('Blue Whale', 'Balaenoptera musculus', '1758-01-01', 'Endangered');

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES 
(1, 1, '2025-05-01 08:45:00', 'Snowfall Pass', 'Jaguar spotted drinking water.'),
(2, 2, '2025-05-02 10:30:00', 'Seronera Valley', 'Elephant herd migrating.'),
(3, 3, '2025-05-03 14:20:00', 'Hayden Valley', 'Grizzly near campsite.'),
(4, 4, '2025-05-04 11:00:00', 'Coral Gardens', 'Clownfish swimming near coral.'),
(5, 5, '2025-05-05 07:15:00', 'Karakoram Range', 'Snow leopard spotted on cliff.'),
(1, 6, '2025-05-06 09:10:00', 'Bamboo forest', 'Red panda climbing tree.'),
(2, 7, '2025-05-07 15:30:00', 'Lake Victoria', 'Bald eagle hunting fish.'),
(3, 8, '2025-05-08 12:00:00', 'Eucalyptus Grove', 'Koala resting on branch.'),
(4, 9, '2025-05-09 16:45:00', 'Chengdu Mountains', 'Giant panda eating bamboo.'),
(5, 10, '2025-05-10 13:00:00', 'Pacific Ocean', 'Blue whale breaching observed.');


INSERT INTO rangers (name, region) VALUES 
('Alice Johnson', 'Snowfall Pass'),
('David Kim', 'Serengeti'),
('Maria Lopez', 'Yellowstone'),
('Tom Baker', 'Great Barrier Reef'),
('Linda Zhang', 'Himalayas');


DROP Table if EXISTS sightings CASCADE

-- problem 1
-- 1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers (name,region) VALUES
('Derek Fox','Coastal Plains');

-- problem 2
-- 2️⃣ Count unique species ever sighted.

-- problem 3
-- 3️⃣ Find all sightings where the location includes "Pass".

select * FROM sightings
WHERE location ILIKE '%Pass%';

-- problem 4
-- 4️⃣ List each ranger's name and their total number of sightings.

SELECT name ,count(ranger_id) as total_sightings FROM rangers as r 
JOIN sightings as s ON r.ranger_id = s.ranger_id
GROUP BY r.name;
