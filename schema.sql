DROP TABLE IF EXISTS User_Activity CASCADE;
DROP TABLE IF EXISTS User_Discounts CASCADE;
DROP TABLE IF EXISTS User_Transportation CASCADE;
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
    qr_code VARCHAR(255) PRIMARY KEY,
    type ENUM('percentage', 'fixed'),
    amount INT,
    token_cost INT,
    shop VARCHAR(255),
    location_x DOUBLE,
    location_y DOUBLE,
    description VARCHAR(255)
);

CREATE TABLE Transportation (
    qr_code VARCHAR(255) PRIMARY KEY,
    amount INT,
    token_cost INT
);

CREATE TABLE Activities (
    qr_code VARCHAR(255) PRIMARY KEY,
    token_reward INT,
    name VARCHAR(255),
    location_x DOUBLE,
    location_y DOUBLE,
    max_number_participants INT,
    date DATETIME,
    status ENUM('open', 'closed', "finished", "permanent"),
    hours_to_repeat INT,
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
    activity_qr VARCHAR(255),
    FOREIGN KEY (user_cc) REFERENCES Users(cc),
    FOREIGN KEY (activity_qr) REFERENCES Activities(qr_code)
);

CREATE TABLE User_Discounts (
    user_cc BIGINT UNSIGNED,
    discounts_qr VARCHAR(255),
    status ENUM('used', "unused"),
    FOREIGN KEY (user_cc) REFERENCES Users(cc),
    FOREIGN KEY (discounts_qr) REFERENCES Discounts(qr_code)
);

CREATE TABLE User_Transportation (
    user_cc BIGINT UNSIGNED,
    transportation_qr VARCHAR(255),
    status ENUM('used', "unused"),
    FOREIGN KEY (user_cc) REFERENCES Users(cc),
    FOREIGN KEY (transportation_qr) REFERENCES Transportation(qr_code)
);


INSERT INTO Users VALUES (11111111, "Test User 1", 100, "testuser1@gmail.com", "pass");
INSERT INTO Users VALUES (22222222, "Test User 2", 100, "testuser2@gmail.com", "pass");
INSERT INTO Users VALUES (33333333, "Test User 3", 100, "testuser3@gmail.com", "pass");

INSERT INTO Discounts VALUES ("Discount_1", "percentage", 20, 10, "Test Shop 1", 125.21, 125.12, "Percentage discount for test shop 1 - Free");
INSERT INTO Discounts VALUES ("Discount_2", "fixed", 10, 10, "Test Shop 1", 125.21, 125.12, "Fixed discount for test shop 1 - Free");
INSERT INTO Discounts VALUES ("Discount_3", "percentage", 500, 10, "Test Shop 1", 125.21, 125.12, "Percentage discount for test shop 1");

INSERT INTO Transportation VALUES ("Transportation_1", 2, 10);
INSERT INTO Transportation VALUES ("Transportation_2", 5, 20);
INSERT INTO Transportation VALUES ("Transportation_3", 6, 6);

INSERT INTO Activities VALUES ("Activity_1", 100,  "Test Activity 1", 100.25, 100.25, 4, "2022-01-01 13:00:00", "finished", 0, "A test activity with maximum 4 users for 1st of January that rewards 100 tokens and finished");
INSERT INTO Activities VALUES ("Activity_2", 200, "Test Activity 2", 150.25, 150.25, 10, "2022-01-03 9:30:00", "closed", 0, "A test activity with maximum 10 users for 3rd of January that rewards 200 tokens and closed");
INSERT INTO Activities VALUES ("Activity_3", 50, "Test Activity 3", 200.25, 300.25, null, "2022-01-05 14:00:00", "open", 0, "A test activity with no maximum users for 5th of January that rewards 50 tokens and open");
INSERT INTO Activities VALUES ("Activity_4", 50, "Test Activity 4", 200.25, 300.25, null, null, "permanent", 12, "A permanent activity that can be repeated every 12 hours");

INSERT INTO Friends VALUES (11111111 , 22222222);
INSERT INTO Friends VALUES (11111111 , 33333333);
INSERT INTO Friends VALUES (22222222 , 33333333);


INSERT INTO User_Activity VALUES (11111111, "Activity_1");
INSERT INTO User_Activity VALUES (11111111, "Activity_2");
INSERT INTO User_Activity VALUES (22222222, "Activity_1");

INSERT INTO User_Discounts VALUES (11111111, "Discount_1", "used");
INSERT INTO User_Discounts VALUES (11111111, "Discount_2", "unused");
INSERT INTO User_Discounts VALUES (22222222, "Discount_1", "used");

INSERT INTO User_Transportation VALUES (11111111, "Transportation_1", "used");
INSERT INTO User_Transportation VALUES (11111111, "Transportation_2", "unused");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_1", "used");