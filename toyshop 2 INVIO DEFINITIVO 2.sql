-- Creazione delle tabelle
CREATE TABLE prodotto (
    id_giocattolo INT PRIMARY KEY,
    dimensione DECIMAL(10, 2),
    prezzo DECIMAL(10, 2),
    descrizione TEXT,
    nome_prodotto VARCHAR(100),
    codice_giocattolo VARCHAR(50)
);

CREATE TABLE region (
    id_region INT PRIMARY KEY,
    codice_regione VARCHAR(10),
    nome VARCHAR(50),
    popolazione INT,
    dimensioni DECIMAL(10, 2),
    abitanti NUMERIC(15, 0)
);

CREATE TABLE sales (
    id_vendite INT PRIMARY KEY,
    prezzo DECIMAL(10, 2),
    costo_unit DECIMAL(10, 2),
    fk_id_prodotto INT,
    quantità INT,
    total_sale DECIMAL(15, 2),
    stato_vendita VARCHAR(20),
    canale_vendita VARCHAR(30),
    fk_id_region INT,
    FOREIGN KEY (fk_id_region) REFERENCES region(id_region),
    FOREIGN KEY (fk_id_prodotto) REFERENCES prodotto(id_giocattolo)
);

CREATE TABLE toystore (
    id_negozio INT PRIMARY KEY,
    number_employee INT,
    store_location VARCHAR(100),
    id_regione INT,
    id_sales INT,
    id_giocattolo INT,
    FOREIGN KEY (id_regione) REFERENCES region(id_region),
    FOREIGN KEY (id_sales) REFERENCES sales(id_vendite),
    FOREIGN KEY (id_giocattolo) REFERENCES prodotto(id_giocattolo)
);

CREATE TABLE inventory (
    id_inventory INT PRIMARY KEY,
    id_copies INT,
    stato_prodotto BIGINT,
    number_of_copies INT,
    id_giocattolo INT,
    id_negozio INT,
    FOREIGN KEY (id_giocattolo) REFERENCES prodotto(id_giocattolo),
    FOREIGN KEY (id_negozio) REFERENCES toystore(id_negozio)
);

CREATE TABLE employee (
    id_employee INT PRIMARY KEY,
    employee_status BIGINT,
    id_negozio INT,
    contatti VARCHAR(100),
    nome VARCHAR(50),
    cognome VARCHAR(50),
    FOREIGN KEY (id_negozio) REFERENCES toystore(id_negozio)
);

CREATE TABLE employee_location (
    id_region INT,
    id_employee INT,
    id_store INT,
    employee_location_number INT PRIMARY KEY,
    FOREIGN KEY (id_employee) REFERENCES employee(id_employee),
    FOREIGN KEY (id_store) REFERENCES toystore(id_negozio),
    FOREIGN KEY (id_region) REFERENCES region(id_region)
);

-- Inserimento dati nelle tabelle

-- Inserimento dati nella tabella "region"
INSERT INTO region (id_region, codice_regione, nome, popolazione, dimensioni, abitanti) VALUES
    (1, 'IT01', 'Lazio', 5800000, 17544.00, 5800000),
    (2, 'IT02', 'Toscana', 3700000, 22950.00, 3700000),
    (3, 'IT03', 'Sicilia', 5000000, 25710.00, 5000000),
    (4, 'IT04', 'Lombardia', 10000000, 23846.00, 10000000),
    (5, 'IT05', 'Campania', 6000000, 13674.00, 6000000),
    (6, 'IT06', 'Emilia-Romagna', 4500000, 22556.00, 4500000),
    (7, 'IT07', 'Puglia', 4100000, 19445.00, 4100000),
    (8, 'IT08', 'Piemonte', 4400000, 25301.00, 4400000),
    (9, 'IT09', 'Veneto', 4900000, 18355.00, 4900000),
    (10, 'IT10', 'Sardegna', 1600000, 24090.00, 1600000);

-- Inserimento dati nella tabella "prodotto"
INSERT INTO prodotto (id_giocattolo, dimensione, prezzo, descrizione, nome_prodotto, codice_giocattolo) VALUES
    (1, 15.99, 19.99, 'Giocattolo educativo per bambini', 'Giocattolo A', 'G001'),
    (2, 18.50, 25.50, 'Peluche morbido e colorato', 'Giocattolo B', 'G002'),
    (3, 22.00, 30.00, 'Auto telecomandata per bambini', 'Giocattolo C', 'G003'),
    (4, 16.25, 15.00, 'Cubo educativo per neonati', 'Giocattolo D', 'G004'),
    (5, 17.50, 10.99, 'Costruzioni in legno', 'Giocattolo E', 'G005');

-- Inserimento dati nella tabella "sales"
INSERT INTO sales (id_vendite, prezzo, costo_unit, fk_id_prodotto, quantità, total_sale, stato_vendita, canale_vendita, fk_id_region) VALUES
    (1, 19.99, 15.99, 1, 10, 199.90, 'Confermato', 'Online', 1),
    (2, 25.50, 18.50, 2, 15, 382.50, 'Spedito', 'Negozio fisico', 2),
    (3, 30.00, 22.00, 3, 5, 150.00, 'Cancellato', 'Online', 3);

-- Inserimento dati nella tabella "toystore"
INSERT INTO toystore (id_negozio, number_employee, store_location, id_regione, id_sales, id_giocattolo) VALUES
    (1, 20, 'Roma', 1, 1, 1),
    (2, 15, 'Firenze', 2, 2, 2),
    (3, 12, 'Palermo', 3, 3, 3);

-- Inserimento dati nella tabella "inventory"
INSERT INTO inventory (id_inventory, id_copies, stato_prodotto, number_of_copies, id_giocattolo, id_negozio) VALUES
    (1, 50, 1, 50, 1, 1),
    (2, 45, 2, 45, 2, 2),
    (3, 60, 1, 60, 3, 3);

-- Inserimento dati nella tabella "employee"
INSERT INTO employee (id_employee, employee_status, id_negozio, contatti, nome, cognome) VALUES
    (1, 1, 1, '123456789', 'Mario', 'Rossi'),
    (2, 1, 2, '987654321', 'Luca', 'Bianchi'),
    (3, 2, 3, '111222333', 'Giulia', 'Verdi');

-- Inserimento dati nella tabella "employee_location"
INSERT INTO employee_location (id_region, id_employee, id_store, employee_location_number) VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 3);