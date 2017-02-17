--DROP TABLE suit;
--DROP TABLE jacket;
--DROP TABLE pants;
--DROP TABLE customer;
--DROP TABLE address; 
 

CREATE TABLE suit (
	id integer identity (1, 1) NOT NULL,
	jacket_id integer NOT NULL,
	pants_id integer NOT NULL,
	description varchar(MAX),
	color varchar(100),
	has_pic bit,
	price decimal,

	CONSTRAINT pk_id PRIMARY KEY (id)
	
);


CREATE TABLE jacket (
	jacket_id integer NOT NULL,
	suit_id integer,
	chest_size int	NOT NULL, 
	jacket_size int NOT NULL, 
	sleeve_length int NOT NULL, 
	shoulder_width int NOT NULL,
	jacket_picture binary 
	
	CONSTRAINT pk_jacket_jacket_id PRIMARY KEY (jacket_id),
	CONSTRAINT fk_jacket_suit_id FOREIGN KEY (suit_id) REFERENCES suit(id)
);

CREATE TABLE pants (
	pants_id integer identity(1,1)  NOT NULL,
	suit_id integer, 
	inside_leg_length int NOT NULL,
	waist_size int NOT NULL, 
	pants_picture binary 

	CONSTRAINT pk_pants_id PRIMARY KEY (pants_id),
	CONSTRAINT fk_pants_suit_id FOREIGN KEY (suit_id) REFERENCES suit (id) 
);

--CREATE TABLE forgot (
--	id int identity (1,1),
--	password varchar, 
--	login varchar 

--	CONSTRAINT pk_forgot_id PRIMARY KEY (id)

CREATE TABLE customer (
	id integer identity (1,1), 
	first_name varchar(max) NOT NULL,
	last_name varchar(max) NOT NULL,
	user_login varchar unique NOT NULL, 
	user_password varchar(15) NOT NULL, 
	email varchar NOT NULL, 
	phone int NOT NULL

	CONSTRAINT pk_customer_id Primary KEY (id)--,
	--CONSTRAINT fk_user_password FOREIGN KEY (user_Password) REFERENCES forgot(password),
	--CONSTRAINT fk_user_login FOREIGN KEY (user_login) REFERENCES forgot(login)

);
	

	
CREATE TABLE address (
	address_id int identity(1,1), 
	address varchar (100) NOT NULL, 
	customer_id int,
	city varchar (100) NOT NULL,
	state char(2) NOT NULL, 
	postalcode int NOT NULL, 
	countryCode char(3) NOT NULL, 
	
	CONSTRAINT pk_address_address_id PRIMARY KEY (address_id) ,
	CONSTRAINT fk_address_customer_id FOREIGN KEY (customer_id) REFERENCEs customer (id) 
);


	
