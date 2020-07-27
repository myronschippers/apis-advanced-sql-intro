-- One - to - One

CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL
);

CREATE TABLE "social_security" (
	"id" SERIAL PRIMARY KEY,
	"number" INT NOT NULL,
	"person_id" INT REFERENCES "person"
);

INSERT INTO "person" ("name")
	VALUES ('Myron'),
	('Scott');
	
INSERT INTO "social_security" ("number", "person_id")
	VALUES (115649976, 2),
	(102679371, 1);
	
SELECT * FROM "person"
JOIN "social_security" ON "person".id = "social_security".person_id;

	
SELECT * FROM "person"
JOIN "social_security" ON "person".id = "social_security".person_id
WHERE "person".id = 1;

SELECT "person".name, "social_security".number FROM "social_security"
JOIN "person" ON "person".id = "social_security".person_id
WHERE "person".id = 1;

-- One - to - Many

CREATE TABLE "cohorts" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50),
	"instructor" VARCHAR(100)
);

CREATE TABLE "students" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50),
	"cohorts_id" INT REFERENCES "cohorts"
);

INSERT INTO "cohorts" ("name", "instructor")
VALUES ('apis', 'Myron Schippers'),
('ursus', 'Scott Bromander'),
('tyto', 'Myron Schippers');

INSERT INTO "students" ("name", "cohorts_id")
VALUES ('David', 1),
('Kenny', 1),
('Ailea', 1),
('Ashleigh', 1),
('Pam', 2),
('Hyunsu', 2),
('Leila', 2),
('Anne', 2),
('Travis', 3),
('Dave', 3),
('Lucas', 3);

SELECT * FROM "cohorts";
SELECT * FROM "students";

SELECT * FROM "cohorts"
JOIN "students" ON "cohorts".id = "students".cohorts_id;

SELECT * FROM "cohorts"
JOIN "students" ON "students".cohorts_id = "cohorts".id;

-- COUNT
SELECT count(*) FROM "students";

SELECT count(*) FROM "cohorts"
JOIN "students" ON "students".cohorts_id = "cohorts".id;

-- WHAT IF THERE IS NO MATCH
INSERT INTO "cohorts" ("name", "instructor")
VALUES ('sasa', 'Rachael Bromander');

INSERT INTO "students" ("name")
VALUES ('Marge');

-- Grouping using GROUP BY
-- how many students in a cohort
SELECT "cohorts".name, count(*) FROM "cohorts"
JOIN "students" ON "students".cohorts_id = "cohorts".id
GROUP BY "cohorts".name;

-- SORTING :: ORDER BY
SELECT * FROM "students"
JOIN "cohorts" ON "students".cohorts_id = "cohorts".id
ORDER BY "students"."name" DESC;




