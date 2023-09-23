CREATE TABLE CUSTOMER
(
    CUST_ID BIGINT UNIQUE NOT NULL,
    CUST_FIRSTNAME VARCHAR(30) NOT NULL,
    CUST_LASTNAME VARCHAR(30) NOT NULL,
    CUST_BIRTHDATE DATE,
    CUST_GENDER CHAR(1) NOT NULL,
    CUST_ADDRESS VARCHAR(50),
    CUST_CITY VARCHAR(20),
    CUST_POSTCODE CHAR(5)
);

CREATE TABLE ACCOUNT
(
    ACC_NUMBER CHAR(13) UNIQUE NOT NULL PRIMARY KEY,
    ACC_OWNER BIGINT NOT NULL,
    ACC_DATE_CREATE DATE NOT NULL,
    ACC_BALANCE DECIMAL(10,0) NOT NULL,
    FOREIGN KEY (ACC_OWNER) REFERENCES customer(cust_id)
);


CREATE TABLE TRANSACTION
(
    TRS_ID BIGINT UNIQUE NOT NULL PRIMARY KEY,
    TRS_FROM_ACCOUNT CHAR(13) not NULL ,
    TRS_DATE DATE NOT NULL,
    TRS_AMOUNT DECIMAL(10,0) NOT NULL,
    TRS_TYPE CHAR(2) NOT NULL,
    FOREIGN key (TRS_FROM_ACCOUNT) REFERENCES account(acc_number)
);

CREATE TABLE TRANSACTION_TRANSFER
(
    TRS_ID BIGINT PRIMARY KEY NOT NULL,
    TRS_TO_ACCOUNT CHAR(13) NOT NULL,
    TRS_STATUS CHAR(1) NOT NULL,
    FOREIGN KEY (trs_id) REFERENCES transaction(trs_id)
);

INSERT INTO transaction
    (trs_id,trs_from_account,trs_date,trs_amount,trs_type)
VALUES
    (
        '23',
        '2011601781   ',
        '2020-02-02',
        '80',
        'DB'
);
SELECT *
FROM transaction;

INSERT INTO transaction_transfer
    (trs_id,trs_to_account,trs_status)
VALUES
    (
        '23',
        '1234441231',
        '1'
);
SELECT *
FROM transaction_transfer;

SELECT account.acc_number, transaction.trs_date
from transaction
    LEFT JOIN account on account.acc_number = transaction.trs_from_account
    LEFT JOIN customer ON account.acc_owner = customer.cust_id
WHERE customer.cust_firstname = 'John' AND customer.cust_lastname = 'Michael'
ORDER BY account.acc_number, transaction.trs_date;