DROP TABLE IF EXISTS User_Activity CASCADE;
DROP TABLE IF EXISTS Discounts CASCADE;
DROP TABLE IF EXISTS Activities CASCADE;
DROP TABLE IF EXISTS Transportation CASCADE;
DROP TABLE IF EXISTS Friends CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

CREATE TABLE Users (
    cc BIGINT UNSIGNED PRIMARY KEY,
    name VARCHAR(255),
    token_amount INT,
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE Discounts (
    id SERIAL PRIMARY KEY,
    type ENUM('percentage', 'fixed'),
    amount INT,
    token_cost INT,
    shop VARCHAR(255),
    location_x DOUBLE,
    location_y DOUBLE,
    description VARCHAR(255),
    user_cc BIGINT UNSIGNED,
    FOREIGN KEY (user_cc) REFERENCES Users(cc)
);

CREATE TABLE Transportation (
    id SERIAL PRIMARY KEY,
    amount INT,
    token_cost INT,
    user_cc BIGINT UNSIGNED,
    FOREIGN KEY (user_cc) REFERENCES Users(cc)
);

CREATE TABLE Activities (
    id SERIAL PRIMARY KEY,
    token_reward INT,
    name VARCHAR(255),
    location_x DOUBLE,
    location_y DOUBLE,
    max_number_participants INT,
    date DATETIME,
    status ENUM('open', 'closed', "finished"),
    description VARCHAR(255)
);

CREATE TABLE Friends (
    user1_cc BIGINT UNSIGNED,
    user2_cc BIGINT UNSIGNED,
    FOREIGN KEY (user1_cc) REFERENCES Users(cc),
    FOREIGN KEY (user2_cc) REFERENCES Users(cc)
);

CREATE TABLE User_Activity (
    user_cc BIGINT UNSIGNED,
    activity_id BIGINT UNSIGNED,
    FOREIGN KEY (user_cc) REFERENCES Users(cc),
    FOREIGN KEY (activity_id) REFERENCES Activities(id)
);


INSERT INTO Users VALUES (11111111, "Test User 1", 100, "testuser1@gmail.com", "pass");
INSERT INTO Users VALUES (22222222, "Test User 2", 100, "testuser2@gmail.com", "pass");
INSERT INTO Users VALUES (33333333, "Test User 3", 100, "testuser3@gmail.com", "pass");

INSERT INTO Discounts VALUES (DEFAULT, "percentage", 20, 10, "Test Shop 1", 125.21, 125.12, "Percentage discount for test shop 1 - Free", null);
INSERT INTO Discounts VALUES (DEFAULT, "fixed", 10, 10, "Test Shop 1", 125.21, 125.12, "Fixed discount for test shop 1 - Free", null);
INSERT INTO Discounts VALUES (DEFAULT, "percentage", 500, 10, "Test Shop 1", 125.21, 125.12, "Percentage discount for test shop 1 - Taken by user with cc 11111111", 11111111);

INSERT INTO Transportation VALUES (DEFAULT, 2, 10, null);
INSERT INTO Transportation VALUES (DEFAULT, 5, 20, null);
INSERT INTO Transportation VALUES (DEFAULT, 6, 6, 11111111);

INSERT INTO Activities VALUES (DEFAULT, 100,  "Test Activity 1", 100.25, 100.25, 4, "2022-01-01 13:00:00", "finished", "A test activity with maximum 4 users for 1st of January that rewards 100 tokens and finished");
INSERT INTO Activities VALUES (DEFAULT, 200, "Test Activity 2", 150.25, 150.25, 10, "2022-01-03 9:30:00", "closed", "A test activity with maximum 10 users for 3rd of January that rewards 200 tokens and closed");
INSERT INTO Activities VALUES (DEFAULT, 50, "Test Activity 3", 200.25, 300.25, null, "2022-01-05 14:00:00", "open", "A test activity with no maximum users for 5th of January that rewards 50 tokens and open");

INSERT INTO Friends VALUES (11111111 , 22222222);
INSERT INTO Friends VALUES (11111111 , 33333333);
INSERT INTO Friends VALUES (22222222 , 33333333);


INSERT INTO User_Activity VALUES (11111111, 1);
INSERT INTO User_Activity VALUES (11111111, 2);
INSERT INTO User_Activity VALUES (22222222, 1);