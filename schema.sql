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
    FOREIGN KEY (user2_cc) REFERENCES Users(cc),
    PRIMARY KEY(user1_cc, user2_cc)
);

CREATE TABLE User_Activity (
    user_cc BIGINT UNSIGNED,
    activity_qr VARCHAR(255),
    FOREIGN KEY (user_cc) REFERENCES Users(cc),
    FOREIGN KEY (activity_qr) REFERENCES Activities(qr_code),
    PRIMARY KEY(user_cc, activity_qr)
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



INSERT INTO Users VALUES (11111111, "Tomás", 1000, 5200, "tomas@gmail.com", "pass", "https://web.tecnico.ulisboa.pt/~ist189428/images/ava-tomas.png");
INSERT INTO Users VALUES (22222222, "Maria", 1000, 4150, "maria@gmail.com", "pass", "https://web.tecnico.ulisboa.pt/~ist189428/images/ava-maria.png");
INSERT INTO Users VALUES (33333333, "Daniel", 1000, 3300, "daniel@gmail.com", "pass", "https://web.tecnico.ulisboa.pt/~ist189428/images/ava-daniel.png");
INSERT INTO Users VALUES (44444444, "Dinis", 1000, 2400, "dinis@gmail.com", "pass", "https://web.tecnico.ulisboa.pt/~ist189428/images/ava-dinis.png");
INSERT INTO Users VALUES (55555555, "João", 1000, 1150, "joao@gmail.com", "pass", "https://web.tecnico.ulisboa.pt/~ist189428/images/ava-paquete.png");
INSERT INTO Users VALUES (66666666, "Rafael", 1000, 1300, "testuser6@gmail.com", "pass", "https://images.generated.photos/dkJ4NQTt5K7eTnApq79EDEVCtr1WM3uuAfyqZgY2_jE/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/MDM4OTY3LmpwZw.jpg");
INSERT INTO Users VALUES (77777777, "Teresa", 1000, 200, "testuser7@gmail.com", "pass", "https://images.generated.photos/T4IdS2jMxyFbnZeEzVwJ7NPwnLDHBFugWNTCWJOL85E/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NzY0OTg2LmpwZw.jpg");
INSERT INTO Users VALUES (88888888, "Ana", 100, 2200, "testuser8@gmail.com", "pass", "https://images.generated.photos/q2qU5ctuiHEz72QZ8xsrmDVIrTmVsyb0yRjySuKJe3c/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NDE0NjQzLmpwZw.jpg");
INSERT INTO Users VALUES (99999999, "Rita", 100, 320, "testuser9@gmail.com", "pass", "https://images.generated.photos/fIkua7sgIh-27vBEcl1iilXb578TeMdSkCMe_dSuvHY/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/MDgxOTgxLmpwZw.jpg");
INSERT INTO Users VALUES (11111112, "Pedro", 100, 200, "testuser1@gmail.com", "pass", "https://images.generated.photos/SDNE9DrLQH4uq-UWhioySwNWjXdMkOfzMAnxP3wrgpQ/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/ODc1MjU2LmpwZw.jpg");
INSERT INTO Users VALUES (11111113, "Tobias", 100, 150, "testuser2@gmail.com", "pass", "https://images.generated.photos/VqkXfAZAgY2L2bxW2rYkE1tTBPvmGzqdtyw2QwgBl0g/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NTU2MDQ3LmpwZw.jpg");
INSERT INTO Users VALUES (11111114, "Júlia", 100, 300, "testuser3@gmail.com", "pass", "https://images.generated.photos/UEoySw-1mqv1lZDhL5dlLl63A-u99X3GbrAlMuNgcR0/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NDE4ODExLmpwZw.jpg");
INSERT INTO Users VALUES (11111115, "Joana", 100, 1400, "testuser4@gmail.com", "pass", "https://images.generated.photos/2b8HCcaBacLPWuegxDnIFwduI_4l15GdMG0xC_dctq0/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NzIxOTkwLmpwZw.jpg");
INSERT INTO Users VALUES (11111116, "Francisco", 100, 50, "testuser5@gmail.com", "pass", "https://images.generated.photos/HAI2nRcMwnxnozxvLI9SbIDRGiQJhTVAzk_4GtkxXIc/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/Mjk5NDA1LmpwZw.jpg");


INSERT INTO Discounts VALUES ("Discount_1_qr", "20% Off Starter Course", "percentage", 20, 200, "O Rialva", 125.21, 125.12, "20% discount on all starter courses, including bread and cheese. This offer can not be accumulated with others.", "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Abu_Nawas_Beach_restaurant_-_Flickr_-_Al_Jazeera_English_%281%29.jpg/1024px-Abu_Nawas_Beach_restaurant_-_Flickr_-_Al_Jazeera_English_%281%29.jpg");
INSERT INTO Discounts VALUES ("Discount_2_qr", "5€ Off On Purchases over 20€", "fixed", 20, 500, "Continente", 125.21, 125.12, "Get 5€ off any purchase over 20€, valid in every Continente in Lisbon.", "https://www.essential-business.pt/wp-content/uploads/2019/07/mercadona1024x683.jpg");
INSERT INTO Discounts VALUES ("Discount_3_qr", "5% Off Any Purchase", "percentage", 5, 100, "Wallmart", 125.21, 125.12, "5% discount on every purchase. Valid for 24h.", "https://cdn.britannica.com/16/204716-050-8BB76BE8/Walmart-store-Mountain-View-California.jpg");
INSERT INTO Discounts VALUES ("Discount_4_qr", "10% Off Vegetables", "percentage", 10, 100, "Mercearia do Bairro", 125.21, 125.12, "Valid only for vegetables, on purchases over 10€.", "https://domf5oio6qrcr.cloudfront.net/medialibrary/11499/3b360279-8b43-40f3-9b11-604749128187.jpg");
INSERT INTO Discounts VALUES ("Discount_5_qr", "10€ Off Any Purchase", "fixed", 10, 1000, "Clothes R' Us", 125.21, 125.12, "Valid for 24h. Purchase must be over 10€.", "https://media.istockphoto.com/photos/fashion-clothes-on-a-rack-in-a-light-background-indoors-place-for-picture-id1257563298?b=1&k=20&m=1257563298&s=170667a&w=0&h=Hhf0-AsQp7Z7k9q8XKHfQUY86uPJvE8vmmGHXihWS_M=");
INSERT INTO Discounts VALUES ("Discount_6_qr", "10% Off Meal", "percentage", 10, 300, "Plant Base", 125.21, 125.12, "Discount does not include drinks. Meals are payed by person.", "https://media.cntraveler.com/photos/5bc8ec072383b345456ab323/master/pass/Prado__RC36688-EditRodrigo-Cardoso.jpg");
INSERT INTO Discounts VALUES ("Discount_7_qr", "15% Off Used Clothes", "percentage", 15, 100, "Retro Shop", 125.21, 125.12, "Valid for every Retro City shop in Lisbon. New collection not applicable.", "https://www.highsnobiety.com/static-assets/thumbor/fL8IIqstKiZRRdXD_s-E1AO3zhA=/1600x1067/www.highsnobiety.com/static-assets/wp-content/uploads/2019/12/13124156/vintage-clothes-thrift-shopping-main.jpg");
INSERT INTO Discounts VALUES ("Discount_8_qr", "15% Off Vegetables", "percentage", 15, 200, "Pingo Doce", 125.21, 125.12, "Valid for 6 months. Only in selected Pingo Doce's", "https://www.cdc.gov/foodsafety/images/comms/features/GettyImages-1247930626-500px.jpg");
INSERT INTO Discounts VALUES ("Discount_9_qr", "5% Off Vegan Leather Bags", "percentage", 5, 100, "Cavalinho", 125.21, 125.12, "Purchases over 100€ receive a free goodie bag.", "https://media.cntraveler.com/photos/60afb4013309dcb8a6222a3b/master/w_2100,h_1500,c_limit/The%20Best%20Tote%20Bags-2021_Cuyana_Classic%20Structured%20Leather%20Tote.jpg");

INSERT INTO Transportation VALUES ("Transportation_1_qr", "Metro", 1, 100, "https://bordalo.observador.pt/v2/q:85/rs:fill:2000:1124/c:2000:1124:nowe:0:104/plain/https://s3.observador.pt/wp-content/uploads/2020/12/28165823/29711564.jpg");
INSERT INTO Transportation VALUES ("Transportation_2_qr", "Train", 1, 200, "https://www.sintra-portugal.com/Images/400px/sintra-lisbon-train.jpg");
INSERT INTO Transportation VALUES ("Transportation_3_qr", "Eco-Scooters", 1, 400, "https://thumbs.web.sapo.io/?W=910&H=0&delay_optim=1&webp=1&epic=NGIz4npDgfUxluN46cvOKoIkZlLVHI2vtHyASAQn8ZFiDL1XY+aqcy2T4OJZYlG/FATeph7Wucc2/l0M7H8PcondB/6Ila3FV+SknIvC6FmTk2I=");
INSERT INTO Transportation VALUES ("Transportation_4_qr", "Bus", 1, 50, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlHvBROpuAvHUe87WTDFouR24L3_4-3NGHEQ&usqp=CAU");
INSERT INTO Transportation VALUES ("Transportation_5_qr", "Tram", 1, 100, "https://lisbonlisboaportugal.com/images/650x450/portas-do-sol-alfama.jpg");
INSERT INTO Transportation VALUES ("Transportation_9_qr", "Suburban Train", 1, 100, "https://bordalo.observador.pt/v2/q:85/c:3543:1994:nowe:0:92/rs:fill:980/f:webp/plain/https://s3.observador.pt/wp-content/uploads/2020/10/29094214/GettyImages-1211666146.jpg");

INSERT INTO Activities VALUES ("Activity_1_qr", 100,  "Beach Cleaning", 38.699107, -9.251618, 10, "2022-01-01 13:00:00", "finished", 0, "Come help us clean the beach! Groups of 10 people will collect rubbish from the sand and coast.", "https://ciclovivo.com.br/wp-content/uploads/2019/07/peneira-cheia-de-pl%C3%A1sticos.jpg");
INSERT INTO Activities VALUES ("Activity_2_qr", 200, "Park Cleaning", 38.735671, -9.142299, 10, "2022-01-03 9:30:00", "open", 0, "Come help us clean Arco Do Cego! Collect as much rubbish as you can with friends and family.", "https://i.pinimg.com/originals/71/e8/b6/71e8b6b457f1ab00326c8ea3ebfb8b0b.jpg");
INSERT INTO Activities VALUES ("Activity_3_qr", 50, "Recycling Point", 38.735124, -9.140210, 1, "2022-01-05 14:00:00", "permanent", 0, "Recycling point. After placing rubbish in the container, scan the QR Code on the screen to redeem your tokens.",  "https://jf-sdomingosbenfica.pt/wp-content/uploads/2021/11/enterrados-1024x683.jpg");
INSERT INTO Activities VALUES ("Activity_4_qr", 50, "Recycling Point", 38.737429, -9.136262, 1, "2022-01-05 15:00:00", "permanent", 12, "Recycling point. After placing rubbish in the container, scan the QR Code on the screen to redeem your tokens.", "https://handsinportugal.files.wordpress.com/2012/09/ilha-ecologica.jpg?w=584");
INSERT INTO Activities VALUES ("Activity_5_qr", 50, "Recycling Point", 38.734155, -9.138746, 1, "2022-01-05 15:00:00", "permanent", 12, "Recycling point. After placing rubbish in the container, scan the QR Code on the screen to redeem your tokens.", "https://www.portugalvisitor.com/images/content_images/recycling-2021-9.jpg");
INSERT INTO Activities VALUES ("Activity_6_qr", 100, "Eco Fest 2022", 38.737183, -9.132949, 200, "2022-01-05 15:00:00", "open", 12, "Come and have fun as you learn about climate change! Evrey ticket for Eco Fest grants you 100 tokens!", "https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_391,q_75,w_588/v1/clients/newyorkstate/3ce9d7e8_e82b_4859_aad9_59d173edf736_f208a80a-6d3e-41d9-937c-f3f8f33e35bc.jpg");
INSERT INTO Activities VALUES ("Activity_7_qr", 450, "Tree Planting", 38.733924, -9.176562, 30, "2022-01-05 15:00:00", "permanent", 12, "Come help us plant trees! Seeds are provided and will be distributed per group.", "https://cordis.europa.eu/docs/news/images/2019-07/131589.jpg");

INSERT INTO Friends VALUES (11111111 , 22222222);
INSERT INTO Friends VALUES (11111111 , 33333333);
INSERT INTO Friends VALUES (11111111 , 44444444);
INSERT INTO Friends VALUES (11111111 , 55555555);
INSERT INTO Friends VALUES (11111111 , 77777777);
INSERT INTO Friends VALUES (11111111 , 99999999);
INSERT INTO Friends VALUES (11111111 , 88888888);
INSERT INTO Friends VALUES (22222222 , 11111111);
INSERT INTO Friends VALUES (22222222 , 33333333);
INSERT INTO Friends VALUES (22222222 , 44444444);
INSERT INTO Friends VALUES (22222222 , 55555555);

INSERT INTO User_Activity VALUES (11111111, "Activity_1_qr");
INSERT INTO User_Activity VALUES (11111111, "Activity_4_qr");
INSERT INTO User_Activity VALUES (11111111, "Activity_6_qr");
INSERT INTO User_Activity VALUES (11111111, "Activity_7_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_1_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_2_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_3_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_4_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_5_qr");

INSERT INTO User_Discounts VALUES (11111111, "Discount_1_qr", "used");
INSERT INTO User_Discounts VALUES (11111111, "Discount_4_qr", "used");
INSERT INTO User_Discounts VALUES (11111111, "Discount_7_qr", "used");
INSERT INTO User_Discounts VALUES (11111111, "Discount_8_qr", "used");
INSERT INTO User_Discounts VALUES (22222222, "Discount_1_qr", "used");
INSERT INTO User_Discounts VALUES (22222222, "Discount_2_qr", "used");
INSERT INTO User_Discounts VALUES (22222222, "Discount_3_qr", "used");

INSERT INTO User_Transportation VALUES (11111111, "Transportation_4_qr", "used");
INSERT INTO User_Transportation VALUES (11111111, "Transportation_5_qr", "used");
INSERT INTO User_Transportation VALUES (11111111, "Transportation_9_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_1_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_2_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_3_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_4_qr", "used");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_5_qr", "used");
