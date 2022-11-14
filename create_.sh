#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
echo "$($PSQL "DROP TABLE IF EXISTS appointments"): appointments"
echo "$($PSQL "DROP TABLE IF EXISTS services"): services"
echo "$($PSQL "DROP TABLE IF EXISTS customers"): customers"

CREATETABLE1="CREATE TABLE IF NOT EXISTS customers (
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL UNIQUE
);"
echo "$($PSQL "$CREATETABLE1"): customers"

CREATETABLE2="CREATE TABLE IF NOT EXISTS services (
	service_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);"
echo "$($PSQL "$CREATETABLE2"): services"

CREATETABLE3="CREATE TABLE IF NOT EXISTS appointments (
	appointment_id SERIAL PRIMARY KEY,
	time VARCHAR(50) NOT NULL,
	customer_id INT NOT NULL references customers (customer_id),
	service_id INT NOT NULL references services (service_id)
);"
echo "$($PSQL "$CREATETABLE3"): appointments"


