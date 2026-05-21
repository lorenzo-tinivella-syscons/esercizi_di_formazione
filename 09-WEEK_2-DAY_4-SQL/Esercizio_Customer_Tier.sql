CREATE TABLE TIER(
	TierCode INT NOT NULL CHECK(TierCode IN (1, 2, 3)),
	TierDescription VARCHAR NOT NULL CHECK(TierDescription IN ('Standard', 'Premium', 'Elite')),
	PRIMARY KEY(TierCode)
);

CREATE TABLE CUSTOMER(
	Name VARCHAR NOT NULL,
	Surname VARCHAR NOT NULL,
	PhoneNumber VARCHAR NOT NULL,
	TierCode INT NOT NULL,
	CreateDate DATE DEFAULT CURRENT_DATE,

	PRIMARY KEY(Name, Surname),
	FOREIGN KEY(TierCode)
		REFERENCES TIER (TierCode)
);

INSERT INTO TIER (TierCode, TierDescription)
VALUES 
    (1, 'Standard'),
    (2, 'Premium'),
    (3, 'Elite');
	
INSERT INTO CUSTOMER (Name, Surname, PhoneNumber, TierCode, CreateDate)
VALUES
	('Mario', 'Rossi', '3331234567', 1, DEFAULT),
	('Luigi', 'Verdi', '3341234567', 3, '06-05-2026'),
	('Francesca', 'Neri', '3471122334', 2, '01-01-2026');

CREATE VIEW V_CUSTOMER AS
SELECT c.Name, c.Surname, c.PhoneNumber, t.TierDescription, c.CreateDate
FROM CUSTOMER c, TIER t
WHERE c.TierCode= t.TierCode

SELECT * FROM V_CUSTOMER

SELECT *
FROM V_CUSTOMER
WHERE TierDescription = 'Premium';

INSERT INTO CUSTOMER (Name, Surname, PhoneNumber, TierCode, CreateDate)
VALUES ('Chiara', 'Bianchi', '3401122334', 2, DEFAULT);

CREATE OR REPLACE PROCEDURE ADD_CUSTOMER(
    p_name VARCHAR,
    p_surname VARCHAR,
    p_phone_number VARCHAR,
    p_tier_description VARCHAR,
    p_create_date DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_tier_code INTEGER NOT NULL DEFAULT 1;
BEGIN
    v_tier_code := CASE p_tier_description
        WHEN 'Standard'   THEN 1
        WHEN 'Premium'   THEN 2
        WHEN 'Elite'     THEN 3
    END;

    INSERT INTO CUSTOMER (
        Name, 
        Surname, 
        PhoneNumber, 
        TierCode, 
        CreateDate
    )
    VALUES (
        p_name, 
        p_surname, 
        p_phone_number, 
        v_tier_code, 
        p_create_date
    );
END;
$$;

CALL ADD_CUSTOMER('Maria', 'Giallo', '3475522334', 'Premium', CURRENT_DATE)

SELECT * FROM V_CUSTOMER
SELECT * FROM CUSTOMER