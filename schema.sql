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
    token_total INT,
    email VARCHAR(255),
    password VARCHAR(255),
    img_url VARCHAR(1000)
);

CREATE TABLE Discounts (
    qr_code VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    type ENUM('percentage', 'fixed'),
    amount INT,
    token_cost INT,
    shop VARCHAR(255),
    location_x DOUBLE,
    location_y DOUBLE,
    description VARCHAR(255),
    img_url VARCHAR(1000)
);

CREATE TABLE Transportation (
    qr_code VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    amount INT,
    token_cost INT,
    img_url VARCHAR(1000)
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
    description VARCHAR(255),
    img_url VARCHAR(1000)
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


INSERT INTO Users VALUES (11111111, "Test User 1", 100, 200, "testuser1@gmail.com", "pass", "https://images.generated.photos/SDNE9DrLQH4uq-UWhioySwNWjXdMkOfzMAnxP3wrgpQ/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/ODc1MjU2LmpwZw.jpg");
INSERT INTO Users VALUES (22222222, "Test User 2", 100, 150, "testuser2@gmail.com", "pass", "https://images.generated.photos/VqkXfAZAgY2L2bxW2rYkE1tTBPvmGzqdtyw2QwgBl0g/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NTU2MDQ3LmpwZw.jpg");
INSERT INTO Users VALUES (33333333, "Test User 3", 100, 300, "testuser3@gmail.com", "pass", "https://images.generated.photos/UEoySw-1mqv1lZDhL5dlLl63A-u99X3GbrAlMuNgcR0/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NDE4ODExLmpwZw.jpg");
INSERT INTO Users VALUES (44444444, "Test User 4", 100, 400, "testuser4@gmail.com", "pass", "https://images.generated.photos/2b8HCcaBacLPWuegxDnIFwduI_4l15GdMG0xC_dctq0/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NzIxOTkwLmpwZw.jpg");
INSERT INTO Users VALUES (55555555, "Test User 5", 100, 50, "testuser5@gmail.com", "pass", "https://images.generated.photos/HAI2nRcMwnxnozxvLI9SbIDRGiQJhTVAzk_4GtkxXIc/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/Mjk5NDA1LmpwZw.jpg");
INSERT INTO Users VALUES (66666666, "Test User 6", 100, 1300, "testuser6@gmail.com", "pass", "https://images.generated.photos/dkJ4NQTt5K7eTnApq79EDEVCtr1WM3uuAfyqZgY2_jE/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/MDM4OTY3LmpwZw.jpg");
INSERT INTO Users VALUES (77777777, "Test User 7", 100, 200, "testuser7@gmail.com", "pass", "https://images.generated.photos/T4IdS2jMxyFbnZeEzVwJ7NPwnLDHBFugWNTCWJOL85E/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NzY0OTg2LmpwZw.jpg");
INSERT INTO Users VALUES (88888888, "Test User 8", 100, 2200, "testuser8@gmail.com", "pass", "https://images.generated.photos/q2qU5ctuiHEz72QZ8xsrmDVIrTmVsyb0yRjySuKJe3c/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NDE0NjQzLmpwZw.jpg");
INSERT INTO Users VALUES (99999999, "Test User 9", 100, 320, "testuser9@gmail.com", "pass", "https://images.generated.photos/fIkua7sgIh-27vBEcl1iilXb578TeMdSkCMe_dSuvHY/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/MDgxOTgxLmpwZw.jpg");

INSERT INTO Discounts VALUES ("Discount_1_qr", "Discount_1", "percentage", 20, 200, "Test Shop 1", 125.21, 125.12, "Percentage discount for test shop - Free", "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Abu_Nawas_Beach_restaurant_-_Flickr_-_Al_Jazeera_English_%281%29.jpg/1024px-Abu_Nawas_Beach_restaurant_-_Flickr_-_Al_Jazeera_English_%281%29.jpg");
INSERT INTO Discounts VALUES ("Discount_2_qr", "Discount_2", "fixed", 10, 100, "Test Shop 2", 125.21, 125.12, "Fixed discount for test shop  - Free", "https://www.essential-business.pt/wp-content/uploads/2019/07/mercadona1024x683.jpg");
INSERT INTO Discounts VALUES ("Discount_3_qr", "Discount_3", "percentage", 30, 500, "Test Shop 3", 125.21, 125.12, "Percentage discount for test shop ", "https://cdn.britannica.com/16/204716-050-8BB76BE8/Walmart-store-Mountain-View-California.jpg");
INSERT INTO Discounts VALUES ("Discount_4_qr", "Discount_4", "percentage", 50, 100, "Test Shop 4", 125.21, 125.12, "Percentage discount for test shop ", "https://domf5oio6qrcr.cloudfront.net/medialibrary/11499/3b360279-8b43-40f3-9b11-604749128187.jpg");
INSERT INTO Discounts VALUES ("Discount_5_qr", "Discount_5", "fixed", 50, 100, "Test Shop 1", 125.21, 125.12, "Fixed discount for test shop ", "https://media.istockphoto.com/photos/fashion-clothes-on-a-rack-in-a-light-background-indoors-place-for-picture-id1257563298?b=1&k=20&m=1257563298&s=170667a&w=0&h=Hhf0-AsQp7Z7k9q8XKHfQUY86uPJvE8vmmGHXihWS_M=");
INSERT INTO Discounts VALUES ("Discount_6_qr", "Discount_6", "percentage", 50, 100, "Test Shop 2", 125.21, 125.12, "Percentage discount for test shop ", "https://media.cntraveler.com/photos/5bc8ec072383b345456ab323/master/pass/Prado__RC36688-EditRodrigo-Cardoso.jpg");
INSERT INTO Discounts VALUES ("Discount_7_qr", "Discount_7", "percentage", 30, 50, "Test Shop 3", 125.21, 125.12, "Percentage discount for test shop ", "https://www.highsnobiety.com/static-assets/thumbor/fL8IIqstKiZRRdXD_s-E1AO3zhA=/1600x1067/www.highsnobiety.com/static-assets/wp-content/uploads/2019/12/13124156/vintage-clothes-thrift-shopping-main.jpg");
INSERT INTO Discounts VALUES ("Discount_8_qr", "Discount_8", "percentage", 10, 200, "Test Shop 4", 125.21, 125.12, "Percentage discount for test shop ", "https://www.cdc.gov/foodsafety/images/comms/features/GettyImages-1247930626-500px.jpg");
INSERT INTO Discounts VALUES ("Discount_9_qr", "Discount_9", "percentage", 5, 100, "Test Shop 1", 125.21, 125.12, "Percentage discount for test shop ", "https://media.cntraveler.com/photos/60afb4013309dcb8a6222a3b/master/w_2100,h_1500,c_limit/The%20Best%20Tote%20Bags-2021_Cuyana_Classic%20Structured%20Leather%20Tote.jpg");

INSERT INTO Transportation VALUES ("Transportation_1_qr", "Transportation_1", 1, 100, "https://bordalo.observador.pt/v2/q:85/rs:fill:2000:1124/c:2000:1124:nowe:0:104/plain/https://s3.observador.pt/wp-content/uploads/2020/12/28165823/29711564.jpg");
INSERT INTO Transportation VALUES ("Transportation_2_qr", "Transportation_2", 1, 200, "https://www.sintra-portugal.com/Images/400px/sintra-lisbon-train.jpg");
INSERT INTO Transportation VALUES ("Transportation_3_qr", "Transportation_3", 1, 400, "https://thumbs.web.sapo.io/?W=910&H=0&delay_optim=1&webp=1&epic=NGIz4npDgfUxluN46cvOKoIkZlLVHI2vtHyASAQn8ZFiDL1XY+aqcy2T4OJZYlG/FATeph7Wucc2/l0M7H8PcondB/6Ila3FV+SknIvC6FmTk2I=");
INSERT INTO Transportation VALUES ("Transportation_4_qr", "Transportation_4", 1, 50, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlHvBROpuAvHUe87WTDFouR24L3_4-3NGHEQ&usqp=CAU");
INSERT INTO Transportation VALUES ("Transportation_5_qr", "Transportation_5", 1, 100, "https://lisbonlisboaportugal.com/images/650x450/portas-do-sol-alfama.jpg");

INSERT INTO Activities VALUES ("Activity_1_qr", 100,  "Test Activity 1", 100.25, 100.25, 4, "2022-01-01 13:00:00", "finished", 0, "A test activity with maximum 4 users for 1st of January that rewards 100 tokens and finished", "https://ciclovivo.com.br/wp-content/uploads/2019/07/peneira-cheia-de-pl%C3%A1sticos.jpg");
INSERT INTO Activities VALUES ("Activity_2_qr", 200, "Test Activity 2", 150.25, 150.25, 10, "2022-01-03 9:30:00", "closed", 0, "A test activity with maximum 10 users for 3rd of January that rewards 200 tokens and closed", "https://image.freepik.com/fotos-gratis/reciclar-fundo-com-mulher-segura-recicle-sinal_23-2147825485.jpg");
INSERT INTO Activities VALUES ("Activity_3_qr", 50, "Test Activity 3", 200.25, 300.25, 3, "2022-01-05 14:00:00", "open", 0, "A test activity with no maximum users for 5th of January that rewards 50 tokens and open",  "https://images.firstpost.com/wp-content/uploads/2019/03/Household-Junk-2.jpg");
INSERT INTO Activities VALUES ("Activity_4_qr", 50, "Test Activity 4", 200.25, 300.25, 17, "2022-01-05 15:00:00", "permanent", 12, "A permanent activity that can be repeated every 12 hours", "https://handsinportugal.files.wordpress.com/2012/09/ilha-ecologica.jpg?w=584");
INSERT INTO Activities VALUES ("Activity_5_qr", 50, "Test Activity 5", 200.25, 300.25, 17, "2022-01-05 15:00:00", "permanent", 12, "A permanent activity that can be repeated every 12 hours", "https://www.portugalvisitor.com/images/content_images/recycling-2021-9.jpg");
INSERT INTO Activities VALUES ("Activity_6_qr", 50, "Test Activity 6", 200.25, 300.25, 17, "2022-01-05 15:00:00", "permanent", 12, "A permanent activity that can be repeated every 12 hours", "https://www.asbeiras.pt/wp-content/uploads/2019/08/14-LIXO_fb.jpg");
INSERT INTO Activities VALUES ("Activity_7_qr", 50, "Test Activity 7", 200.25, 300.25, 17, "2022-01-05 15:00:00", "permanent", 12, "A permanent activity that can be repeated every 12 hours", "https://cordis.europa.eu/docs/news/images/2019-07/131589.jpg");

INSERT INTO Friends VALUES (11111111 , 22222222);
INSERT INTO Friends VALUES (11111111 , 33333333);
INSERT INTO Friends VALUES (11111111 , 55555555);
INSERT INTO Friends VALUES (11111111 , 77777777);
INSERT INTO Friends VALUES (11111111 , 99999999);
INSERT INTO Friends VALUES (11111111 , 88888888);
INSERT INTO Friends VALUES (22222222 , 11111111);
INSERT INTO Friends VALUES (22222222 , 33333333);
INSERT INTO Friends VALUES (22222222 , 44444444);
INSERT INTO Friends VALUES (22222222 , 55555555);

INSERT INTO User_Activity VALUES (11111111, "Activity_1_qr");
INSERT INTO User_Activity VALUES (11111111, "Activity_2_qr");
INSERT INTO User_Activity VALUES (11111111, "Activity_4_qr");
INSERT INTO User_Activity VALUES (11111111, "Activity_6_qr");
INSERT INTO User_Activity VALUES (11111111, "Activity_7_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_1_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_2_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_3_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_4_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_5_qr");

INSERT INTO User_Discounts VALUES (11111111, "Discount_1_qr", "used");
INSERT INTO User_Discounts VALUES (11111111, "Discount_2_qr", "unused");
INSERT INTO User_Discounts VALUES (11111111, "Discount_4_qr", "used");
INSERT INTO User_Discounts VALUES (11111111, "Discount_6_qr", "unused");
INSERT INTO User_Discounts VALUES (11111111, "Discount_7_qr", "used");
INSERT INTO User_Discounts VALUES (11111111, "Discount_8_qr", "unused");
INSERT INTO User_Discounts VALUES (22222222, "Discount_1_qr", "used");
INSERT INTO User_Discounts VALUES (22222222, "Discount_2_qr", "unused");
INSERT INTO User_Discounts VALUES (22222222, "Discount_3_qr", "used");

INSERT INTO User_Transportation VALUES (11111111, "Transportation_1_qr", "used");
INSERT INTO User_Transportation VALUES (11111111, "Transportation_2_qr", "used");
INSERT INTO User_Transportation VALUES (11111111, "Transportation_4_qr", "unused");
INSERT INTO User_Transportation VALUES (11111111, "Transportation_5_qr", "used");
INSERT INTO User_Transportation VALUES (11111111, "Transportation_9_qr", "unused");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_1_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_2_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_3_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_4_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_5_qr", "used");
