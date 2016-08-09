-- Query for PostgreSQL to generate a table with tokens for a 7 digit MRN with leading zeros
-- The tokens have no mathemetical relation with the MRN and are created again everytime this query is run
-- Query will take a fair amount of time as 10^8 rows are created
-- Andre Dekker, 09-08-2016

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Table: "MRN2Token"

DROP TABLE "MRN2Token";

CREATE TABLE "MRN2Token"
(
  "Token" uuid DEFAULT uuid_generate_v4() NOT NULL,
  "MRN" character(7),
  CONSTRAINT "Token_PK" PRIMARY KEY ("Token"),
  CONSTRAINT "MRN_Unique" UNIQUE ("MRN")
  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "MRN2Token"
  OWNER TO postgres;

-- Insert MRNs, Tokens are created as UUID
INSERT INTO "MRN2Token"("MRN")
    SELECT (to_char(generate_series(0, 99999999),'FM0000000'));

-- Check
SELECT * FROM "MRN2Token" LIMIT 10

