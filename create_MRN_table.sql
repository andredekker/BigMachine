-- Query for PostgreSQL to generate a table with 100 sample MRNs for a 7 digit MRN with leading zeros
-- Andre Dekker, 09-08-2016

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Table: "MRN"

DROP TABLE "MRN";

CREATE TABLE "MRN"
(
  "MRN" character(7)
  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "MRN"
  OWNER TO postgres;

-- Insert MRNs, Tokens are created as UUID
INSERT INTO "MRN"("MRN")
    SELECT (to_char(generate_series(100, 200),'FM0000000'));

-- Check
SELECT * FROM "MRN" LIMIT 10

