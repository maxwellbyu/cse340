CREATE TYPE public.account_type AS ENUM ('Admin', 'Employee', 'Client');
INSERT INTO account (
        account_firstname,
        account_lastname,
        account_email,
        account_password
    )
VALUES (
        'Tony',
        'Stark',
        'tony@starkent.com',
        'Iam1ronM@n'
    );
UPDATE account
SET acount_type = 'Admin'
WHERE account_id = 1;
UPDATE inventory
SET inv_description = REPLACE(
        inv_description,
        'small interiors',
        'a huge interior'
    )
WHERE inv_make = 'GM'
    AND inv_model = 'Hummer';
SELECT inventory.inv_make AS make,
    inventory.inv_model AS model,
    classification.classification_name
FROM inventory
    INNER JOIN classification ON inventory.classification_id = classification.classification_id
WHERE classification.classification_name = 'Sport';

UPDATE inventory
SET inv_image = REGEXP_REPLACE(inv_image, '^(/images/)(.*)$', '\1vehicles/\2'),
    inv_thumbnail = REGEXP_REPLACE(
        inv_thumbnail,
        '^(/images/)(.*)$',
        '\1vehicles/\2'
    );




ALTER TYPE public.account_type OWNER TO postgres;
CREATE TABLE public.classification (
    classification_id INT GENERATED BY DEFAULT AS IDENTITY,
    classification_name CHARACTER VARYING NOT NULL,
    CONSTRAINT classification_pk PRIMARY KEY (classification_id)
);