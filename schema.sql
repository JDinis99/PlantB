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


INSERT INTO Users VALUES (11111111, "Test User 1", 100, 200, "testuser1@gmail.com", "pass", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fsoundcloud.com%2Fkim-jonas-nordvang&psig=AOvVaw3Mx-48EUe0cgBDwBa67iqN&ust=1642607068894000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKjYyqrSu_UCFQAAAAAdAAAAABAD");
INSERT INTO Users VALUES (22222222, "Test User 2", 100, 150, "testuser2@gmail.com", "pass", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.reddit.com%2Fr%2FMindHunter%2Fcomments%2F77eiu8%2Fhas_anyone_figured_out_who_the_random_guy_is_at%2F&psig=AOvVaw3Mx-48EUe0cgBDwBa67iqN&ust=1642607068894000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKjYyqrSu_UCFQAAAAAdAAAAABAK");
INSERT INTO Users VALUES (33333333, "Test User 3", 100, 300, "testuser3@gmail.com", "pass", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fmobile.twitter.com%2Ffantomecupcake&psig=AOvVaw38TJ5CfPfIqnCqP_D2kRKb&ust=1642607112971000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNCi4b7Su_UCFQAAAAAdAAAAABAD");

INSERT INTO Discounts VALUES ("Discount_1_qr", "Discount_1", "percentage", 20, 10, "Test Shop 1", 125.21, 125.12, "Percentage discount for test shop 1 - Free", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpt.wikipedia.org%2Fwiki%2FRestaurante&psig=AOvVaw1BzR8QlJLxJmpy6jmCKJOA&ust=1642607390438000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMiJ8cLTu_UCFQAAAAAdAAAAABAD");
INSERT INTO Discounts VALUES ("Discount_2_qr", "Discount_2", "fixed", 10, 10, "Test Shop 1", 125.21, 125.12, "Fixed discount for test shop 1 - Free", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.essential-business.pt%2Fwp-content%2Fuploads%2F2019%2F07%2Fmercadona1024x683.jpg&imgrefurl=https%3A%2F%2Fwww.essential-business.pt%2F2019%2F07%2F01%2Fspanish-supermarket-group-moves-into-portugal%2F&tbnid=cFo4ZX35BDsw_M&vet=12ahUKEwjeu9LI07v1AhXB8IUKHUf3C1QQMygLegUIARC3AQ..i&docid=9P7h1OIYBePz0M&w=1024&h=683&itg=1&q=supermarket&client=opera-gx&ved=2ahUKEwjeu9LI07v1AhXB8IUKHUf3C1QQMygLegUIARC3AQ");
INSERT INTO Discounts VALUES ("Discount_3_qr", "Discount_3", "percentage", 500, 10, "Test Shop 1", 125.21, 125.12, "Percentage discount for test shop 1", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.britannica.com%2F16%2F204716-050-8BB76BE8%2FWalmart-store-Mountain-View-California.jpg&imgrefurl=https%3A%2F%2Fwww.britannica.com%2Ftopic%2Fdiscount-store&tbnid=_emB89dDD9eljM&vet=12ahUKEwj6luvN07v1AhVGwoUKHe_PC0AQMygEegUIARCmAQ..i&docid=0rf7offJoyl89M&w=1600&h=1048&itg=1&q=store&client=opera-gx&ved=2ahUKEwj6luvN07v1AhVGwoUKHe_PC0AQMygEegUIARCmAQ");

INSERT INTO Transportation VALUES ("Transportation_1_qr", "Transportation_1", 2, 10, "https://www.google.com/imgres?imgurl=https%3A%2F%2Fbordalo.observador.pt%2Fv2%2Fq%3A85%2Frs%3Afill%3A2000%3A1124%2Fc%3A2000%3A1124%3Anowe%3A0%3A104%2Fplain%2Fhttps%3A%2F%2Fs3.observador.pt%2Fwp-content%2Fuploads%2F2020%2F12%2F28165823%2F29711564.jpg&imgrefurl=https%3A%2F%2Fobservador.pt%2F2021%2F11%2F04%2Fgreve-no-metro-de-lisboa-desde-a-meia-noite-circulacao-retomada-na-sexta-feira%2F&tbnid=uYXbUjS8ISB2SM&vet=12ahUKEwiv3evY07v1AhUUgc4BHQNjB8cQMygCegUIARCeAQ..i&docid=g3paQdBcRQNNZM&w=2000&h=1124&itg=1&q=metro&client=opera-gx&ved=2ahUKEwiv3evY07v1AhUUgc4BHQNjB8cQMygCegUIARCeAQ");
INSERT INTO Transportation VALUES ("Transportation_2_qr", "Transportation_3", 5, 20, "https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic.globalnoticias.pt%2Fdn%2Fimage.jpg%3Fbrand%3DDN%26type%3Dgenerate%26guid%3D9875fac6-fafd-4c92-a0c2-04d8f57db051%26w%3D800%26h%3D450%26t%3D20210702144453&imgrefurl=https%3A%2F%2Fwww.dn.pt%2Flocal%2Fmetro-de-superficie-vai-avancar-em-loures-com-investimento-de-250-milhoes-13899163.html&tbnid=Is8Cr_E0WQaJUM&vet=12ahUKEwiv3evY07v1AhUUgc4BHQNjB8cQMygLegUIARCwAQ..i&docid=0bLNxQfnoM66XM&w=800&h=450&itg=1&q=metro&client=opera-gx&ved=2ahUKEwiv3evY07v1AhUUgc4BHQNjB8cQMygLegUIARCwAQ");
INSERT INTO Transportation VALUES ("Transportation_3_qr", "Transportation_2", 6, 6, "https://www.google.com/url?sa=i&url=https%3A%2F%2Fmagg.sapo.pt%2Fatualidade%2Fatualidade-nacional%2Fartigos%2Fvai-ser-possivel-andar-de-trotinete-eletrica-com-o-passe-lisboa-viva&psig=AOvVaw05xQ_y7CSHh288hYzn37CY&ust=1642607491484000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCODO7vLTu_UCFQAAAAAdAAAAABAE");

INSERT INTO Activities VALUES ("Activity_1_qr", 100,  "Test Activity 1", 100.25, 100.25, 4, "2022-01-01 13:00:00", "finished", 0, "A test activity with maximum 4 users for 1st of January that rewards 100 tokens and finished", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fciclovivo.com.br%2Fplaneta%2Fmeio-ambiente%2Fresiduos-mar-plasticos-cigarros%2Fattachment%2Fbeach-cleaning-cleaning-dirty-beaches-by-the-action-of-man-sustainability-of-the-planet-and-preservation-of-nature%2F&psig=AOvVaw1W9D0RoLveY-Uju_UyPjdE&ust=1642607195055000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIjcsebSu_UCFQAAAAAdAAAAABAD");
INSERT INTO Activities VALUES ("Activity_2_qr", 200, "Test Activity 2", 150.25, 150.25, 10, "2022-01-03 9:30:00", "closed", 0, "A test activity with maximum 10 users for 3rd of January that rewards 200 tokens and closed", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbr.freepik.com%2Ffotos-gratis%2Freciclar-fundo-com-mulher-segura-recicle-sinal_2295691.htm&psig=AOvVaw3ic1i4zeHnaKTLzd108dTa&ust=1642607232739000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMDSg_nSu_UCFQAAAAAdAAAAABAD");
INSERT INTO Activities VALUES ("Activity_3_qr", 50, "Test Activity 3", 200.25, 300.25, null, "2022-01-05 14:00:00", "open", 0, "A test activity with no maximum users for 5th of January that rewards 50 tokens and open",  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.firstpost.com%2Ftech%2Fscience%2Fof-all-the-many-kinds-of-waste-whats-the-most-toxic-garbage-that-humans-produce-6197591.html&psig=AOvVaw0OMQu2JpWifGKF4BSuc01Z&ust=1642607279456000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPiCkI7Tu_UCFQAAAAAdAAAAABAI");
INSERT INTO Activities VALUES ("Activity_4_qr", 50, "Test Activity 4", 200.25, 300.25, null, null, "permanent", 12, "A permanent activity that can be repeated every 12 hours", "");

INSERT INTO Friends VALUES (11111111 , 22222222);
INSERT INTO Friends VALUES (11111111 , 33333333);
INSERT INTO Friends VALUES (22222222 , 33333333);

INSERT INTO User_Activity VALUES (11111111, "Activity_1_qr");
INSERT INTO User_Activity VALUES (11111111, "Activity_2_qr");
INSERT INTO User_Activity VALUES (22222222, "Activity_1_qr");

INSERT INTO User_Discounts VALUES (11111111, "Discount_1_qr", "used");
INSERT INTO User_Discounts VALUES (11111111, "Discount_2_qr", "unused");
INSERT INTO User_Discounts VALUES (22222222, "Discount_1_qr", "used");

INSERT INTO User_Transportation VALUES (11111111, "Transportation_1_qr", "used");
INSERT INTO User_Transportation VALUES (11111111, "Transportation_2_qr", "unused");
INSERT INTO User_Transportation VALUES (22222222, "Transportation_1_qr", "used");