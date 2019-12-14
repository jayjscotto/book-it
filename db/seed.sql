USE bookit;

ALTER TABLE businesses
MODIFY created_at DATETIME
DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE businesses
MODIFY updated_at DATETIME
DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE services
MODIFY created_at DATETIME
DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE services
MODIFY updated_at DATETIME
DEFAULT CURRENT_TIMESTAMP;


INSERT INTO businesses (name, street_address, city, state, zipcode) VALUES 
('Newell Strength', '12 Minneakoning Road', 'Flemington', 'NJ', '08822'),
('Newell Strength', '2 Ilene Court', 'Hillsborough', 'NJ', '08844'),
('Hunterdon Wellness Center', '1738 NJ-31', 'Clinton', 'NJ', '08809'),
('HealthQuest Fitness', '310 NJ-31', 'Flemington', 'NJ', '08822');


INSERT INTO services (class_name, cost, start_time, day_of_week, business_id) VALUES
-- MONDAY NEWELL F
('Small Group Weight Training', '15.00', '05:00', '0', '1'),
('Small Group Weight Training', '15.00', '06:00', '0', '1'),
('Small Group Weight Training', '15.00', '07:00', '0', '1'),
('Small Group Weight Training', '10.00', '08:00', '0', '1'),
('Small Group Weight Training', '15.00', '09:00', '0', '1'),
('Small Group Weight Training', '15.00', '10:00', '0', '1'),
('Small Group Weight Training', '15.00', '11:00', '0', '1'),
('Small Group Weight Training', '15.00', '12:00', '0', '1'),
('Small Group Weight Training', '15.00', '13:00', '0', '1'),
('Small Group Weight Training', '15.00', '14:00', '0', '1'),
('Small Group Weight Training', '15.00', '15:00', '0', '1'),
('Small Group Weight Training', '15.00', '16:00', '0', '1'),
('Small Group Weight Training', '15.00', '17:00', '0', '1'),
('Small Group Weight Training', '15.00', '18:00', '0', '1'),
('Small Group Weight Training', '15.00', '19:00', '0', '1'),
('Small Group Weight Training', '15.00', '20:00', '0', '1'),
('Small Group Weight Training', '15.00', '21:00', '0', '1' ),
('Metabollic Enhancement Training', '15.00', '06:00', '0', '1'),
('Metabollic Enhancement Training', '15.00', '18:00', '0', '1'),

-- TUESDAY NEWELL F
('Small Group Weight Training', '15.00', '05:00', '1', '1'),
('Small Group Weight Training', '15.00', '06:00', '1', '1'),
('Small Group Weight Training', '15.00', '07:00', '1', '1'),
('Small Group Weight Training', '10.00', '08:00', '1', '1'),
('Small Group Weight Training', '15.00', '09:00', '1', '1'),
('Small Group Weight Training', '15.00', '10:00', '1', '1'),
('Small Group Weight Training', '15.00', '11:00', '1', '1'),
('Small Group Weight Training', '15.00', '12:00', '1', '1'),
('Small Group Weight Training', '15.00', '13:00', '1', '1'),
('Small Group Weight Training', '15.00', '14:00', '1', '1'),
('Small Group Weight Training', '15.00', '15:00', '1', '1'),
('Small Group Weight Training', '15.00', '16:00', '1', '1'),
('Small Group Weight Training', '15.00', '17:00', '1', '1'),
('Small Group Weight Training', '15.00', '18:00', '1', '1'),
('Small Group Weight Training', '15.00', '19:00', '1', '1'),
('Small Group Weight Training', '15.00', '20:00', '1', '1'),
('Small Group Weight Training', '15.00', '21:00', '1', '1' ),
('Metabollic Enhancement Training', '15.00', '06:00', '1', '1'),
('Metabollic Enhancement Training', '15.00', '18:00', '1', '1'),

-- WEDNESDAY NEWELL F
('Small Group Weight Training', '15.00', '05:00', '2', '1'),
('Small Group Weight Training', '15.00', '06:00', '2', '1'),
('Small Group Weight Training', '15.00', '07:00', '2', '1'),
('Small Group Weight Training', '10.00', '08:00', '2', '1'),
('Small Group Weight Training', '15.00', '09:00', '2', '1'),
('Small Group Weight Training', '15.00', '10:00', '2', '1'),
('Small Group Weight Training', '15.00', '11:00', '2', '1'),
('Small Group Weight Training', '15.00', '12:00', '2', '1'),
('Small Group Weight Training', '15.00', '13:00', '2', '1'),
('Small Group Weight Training', '15.00', '14:00', '2', '1'),
('Small Group Weight Training', '15.00', '15:00', '2', '1'),
('Small Group Weight Training', '15.00', '16:00', '2', '1'),
('Small Group Weight Training', '15.00', '17:00', '2', '1'),
('Small Group Weight Training', '15.00', '18:00', '2', '1'),
('Small Group Weight Training', '15.00', '19:00', '2', '1'),
('Small Group Weight Training', '15.00', '20:00', '2', '1'),
('Small Group Weight Training', '15.00', '21:00', '2', '1' ),
('Metabollic Enhancement Training', '15.00', '06:00', '2', '1'),
('Metabollic Enhancement Training', '15.00', '18:00', '2', '1'),

-- THURSDAY NEWELL F
('Small Group Weight Training', '15.00', '05:00', '3', '1'),
('Small Group Weight Training', '15.00', '06:00', '3', '1'),
('Small Group Weight Training', '15.00', '07:00', '3', '1'),
('Small Group Weight Training', '10.00', '08:00', '3', '1'),
('Small Group Weight Training', '15.00', '09:00', '3', '1'),
('Small Group Weight Training', '15.00', '10:00', '3', '1'),
('Small Group Weight Training', '15.00', '11:00', '3', '1'),
('Small Group Weight Training', '15.00', '12:00', '3', '1'),
('Small Group Weight Training', '15.00', '13:00', '3', '1'),
('Small Group Weight Training', '15.00', '14:00', '3', '1'),
('Small Group Weight Training', '15.00', '15:00', '3', '1'),
('Small Group Weight Training', '15.00', '16:00', '3', '1'),
('Small Group Weight Training', '15.00', '17:00', '3', '1'),
('Small Group Weight Training', '15.00', '18:00', '3', '1'),
('Small Group Weight Training', '15.00', '19:00', '3', '1'),
('Small Group Weight Training', '15.00', '20:00', '3', '1'),
('Small Group Weight Training', '15.00', '21:00', '3', '1' ),
('Metabollic Enhancement Training', '15.00', '06:00', '3', '1'),
('Metabollic Enhancement Training', '15.00', '18:00', '3', '1'),

-- FRIDAY NEWELL F
('Small Group Weight Training', '15.00', '05:00', '4', '1'),
('Small Group Weight Training', '15.00', '06:00', '4', '1'),
('Small Group Weight Training', '15.00', '07:00', '4', '1'),
('Small Group Weight Training', '10.00', '08:00', '4', '1'),
('Small Group Weight Training', '15.00', '09:00', '4', '1'),
('Small Group Weight Training', '15.00', '10:00', '4', '1'),
('Small Group Weight Training', '15.00', '11:00', '4', '1'),
('Small Group Weight Training', '15.00', '12:00', '4', '1'),
('Small Group Weight Training', '15.00', '13:00', '4', '1'),
('Small Group Weight Training', '15.00', '14:00', '4', '1'),
('Small Group Weight Training', '15.00', '15:00', '4', '1'),
('Small Group Weight Training', '15.00', '16:00', '4', '1'),
('Small Group Weight Training', '15.00', '17:00', '4', '1'),
('Small Group Weight Training', '15.00', '18:00', '4', '1'),
('Small Group Weight Training', '15.00', '19:00', '4', '1'),
('Small Group Weight Training', '15.00', '20:00', '4', '1'),
('Small Group Weight Training', '15.00', '21:00', '4', '1' ),
('Metabollic Enhancement Training', '15.00', '06:00', '4', '1'),
('Metabollic Enhancement Training', '15.00', '18:00', '4', '1'),

-- SATURDAY NEWELL F

('Small Group Weight Training', '15.00', '06:00', '5', '1'),
('Small Group Weight Training', '15.00', '07:00', '5', '1'),
('Small Group Weight Training', '10.00', '08:00', '5', '1'),
('Small Group Weight Training', '15.00', '09:00', '5', '1'),
('Small Group Weight Training', '15.00', '10:00', '5', '1'),
('Small Group Weight Training', '15.00', '11:00', '5', '1'),
('Metabollic Enhancement Training', '15.00', '06:00', '5', '1'),
('Metabollic Enhancement Training', '15.00', '18:00', '5', '1'),

-- MONDAY NEWELL H
('Small Group Weight Training', '15.00', '05:00', '0', '2'),
('Small Group Weight Training', '15.00', '06:00', '0', '2'),
('Small Group Weight Training', '15.00', '07:00', '0', '2'),
('Small Group Weight Training', '10.00', '08:00', '0', '2'),
('Small Group Weight Training', '15.00', '09:00', '0', '2'),
('Small Group Weight Training', '15.00', '10:00', '0', '2'),
('Small Group Weight Training', '15.00', '11:00', '0', '2'),
('Small Group Weight Training', '15.00', '12:00', '0', '2'),
('Small Group Weight Training', '15.00', '13:00', '0', '2'),
('Small Group Weight Training', '15.00', '14:00', '0', '2'),
('Small Group Weight Training', '15.00', '15:00', '0', '2'),
('Small Group Weight Training', '15.00', '16:00', '0', '2'),
('Small Group Weight Training', '15.00', '17:00', '0', '2'),
('Small Group Weight Training', '15.00', '18:00', '0', '2'),
('Small Group Weight Training', '15.00', '19:00', '0', '2'),
('Small Group Weight Training', '15.00', '20:00', '0', '2'),
('Small Group Weight Training', '15.00', '21:00', '0', '2' ),
('Metabollic Enhancement Training', '15.00', '06:00', '0', '2'),
('Metabollic Enhancement Training', '15.00', '18:00', '0', '2'),

-- TUESDAY NEWELL H
('Small Group Weight Training', '15.00', '05:00', '1', '2'),
('Small Group Weight Training', '15.00', '06:00', '1', '2'),
('Small Group Weight Training', '15.00', '07:00', '1', '2'),
('Small Group Weight Training', '10.00', '08:00', '1', '2'),
('Small Group Weight Training', '15.00', '09:00', '1', '2'),
('Small Group Weight Training', '15.00', '10:00', '1', '2'),
('Small Group Weight Training', '15.00', '11:00', '1', '2'),
('Small Group Weight Training', '15.00', '12:00', '1', '2'),
('Small Group Weight Training', '15.00', '13:00', '1', '2'),
('Small Group Weight Training', '15.00', '14:00', '1', '2'),
('Small Group Weight Training', '15.00', '15:00', '1', '2'),
('Small Group Weight Training', '15.00', '16:00', '1', '2'),
('Small Group Weight Training', '15.00', '17:00', '1', '2'),
('Small Group Weight Training', '15.00', '18:00', '1', '2'),
('Small Group Weight Training', '15.00', '19:00', '1', '2'),
('Small Group Weight Training', '15.00', '20:00', '1', '2'),
('Small Group Weight Training', '15.00', '21:00', '1', '2' ),
('Metabollic Enhancement Training', '15.00', '06:00', '1', '2'),
('Metabollic Enhancement Training', '15.00', '18:00', '1', '2'),

-- WEDNESDAY NEWELL H
('Small Group Weight Training', '15.00', '05:00', '2', '2'),
('Small Group Weight Training', '15.00', '06:00', '2', '2'),
('Small Group Weight Training', '15.00', '07:00', '2', '2'),
('Small Group Weight Training', '10.00', '08:00', '2', '2'),
('Small Group Weight Training', '15.00', '09:00', '2', '2'),
('Small Group Weight Training', '15.00', '10:00', '2', '2'),
('Small Group Weight Training', '15.00', '11:00', '2', '2'),
('Small Group Weight Training', '15.00', '12:00', '2', '2'),
('Small Group Weight Training', '15.00', '13:00', '2', '2'),
('Small Group Weight Training', '15.00', '14:00', '2', '2'),
('Small Group Weight Training', '15.00', '15:00', '2', '2'),
('Small Group Weight Training', '15.00', '16:00', '2', '2'),
('Small Group Weight Training', '15.00', '17:00', '2', '2'),
('Small Group Weight Training', '15.00', '18:00', '2', '2'),
('Small Group Weight Training', '15.00', '19:00', '2', '2'),
('Small Group Weight Training', '15.00', '20:00', '2', '2'),
('Small Group Weight Training', '15.00', '21:00', '2', '2' ),
('Metabollic Enhancement Training', '15.00', '06:00', '2', '2'),
('Metabollic Enhancement Training', '15.00', '18:00', '2', '2'),

-- THURSDAY NEWELL H
('Small Group Weight Training', '15.00', '05:00', '3', '2'),
('Small Group Weight Training', '15.00', '06:00', '3', '2'),
('Small Group Weight Training', '15.00', '07:00', '3', '2'),
('Small Group Weight Training', '10.00', '08:00', '3', '2'),
('Small Group Weight Training', '15.00', '09:00', '3', '2'),
('Small Group Weight Training', '15.00', '10:00', '3', '2'),
('Small Group Weight Training', '15.00', '11:00', '3', '2'),
('Small Group Weight Training', '15.00', '12:00', '3', '2'),
('Small Group Weight Training', '15.00', '13:00', '3', '2'),
('Small Group Weight Training', '15.00', '14:00', '3', '2'),
('Small Group Weight Training', '15.00', '15:00', '3', '2'),
('Small Group Weight Training', '15.00', '16:00', '3', '2'),
('Small Group Weight Training', '15.00', '17:00', '3', '2'),
('Small Group Weight Training', '15.00', '18:00', '3', '2'),
('Small Group Weight Training', '15.00', '19:00', '3', '2'),
('Small Group Weight Training', '15.00', '20:00', '3', '2'),
('Small Group Weight Training', '15.00', '21:00', '3', '2' ),
('Metabollic Enhancement Training', '15.00', '06:00', '3', '2'),
('Metabollic Enhancement Training', '15.00', '18:00', '3', '2'),

-- FRIDAY NEWELL H
('Small Group Weight Training', '15.00', '05:00', '4', '2'),
('Small Group Weight Training', '15.00', '06:00', '4', '2'),
('Small Group Weight Training', '15.00', '07:00', '4', '2'),
('Small Group Weight Training', '10.00', '08:00', '4', '2'),
('Small Group Weight Training', '15.00', '09:00', '4', '2'),
('Small Group Weight Training', '15.00', '10:00', '4', '2'),
('Small Group Weight Training', '15.00', '11:00', '4', '2'),
('Small Group Weight Training', '15.00', '12:00', '4', '2'),
('Small Group Weight Training', '15.00', '13:00', '4', '2'),
('Small Group Weight Training', '15.00', '14:00', '4', '2'),
('Small Group Weight Training', '15.00', '15:00', '4', '2'),
('Small Group Weight Training', '15.00', '16:00', '4', '2'),
('Small Group Weight Training', '15.00', '17:00', '4', '2'),
('Small Group Weight Training', '15.00', '18:00', '4', '2'),
('Small Group Weight Training', '15.00', '19:00', '4', '2'),
('Small Group Weight Training', '15.00', '20:00', '4', '2'),
('Small Group Weight Training', '15.00', '21:00', '4', '2' ),
('Metabollic Enhancement Training', '15.00', '06:00', '4', '2'),
('Metabollic Enhancement Training', '15.00', '18:00', '4', '2'),

-- SATURDAY NEWELL H

('Small Group Weight Training', '15.00', '06:00', '5', '2'),
('Small Group Weight Training', '15.00', '07:00', '5', '2'),
('Small Group Weight Training', '10.00', '08:00', '5', '2'),
('Small Group Weight Training', '15.00', '09:00', '5', '2'),
('Small Group Weight Training', '15.00', '10:00', '5', '2'),
('Small Group Weight Training', '15.00', '11:00', '5', '2'),
('Metabollic Enhancement Training', '15.00', '06:00', '5', '2'),
('Metabollic Enhancement Training', '15.00', '18:00', '5', '2'),


SUNDAY NEWELL BOTH
('Specialized Lift Training', '20.00', '11:00', '6', '1'),
('Specialized Lift Training', '20.00', '11:00', '6', '2');