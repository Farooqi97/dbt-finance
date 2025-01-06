--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: finance; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA finance;


ALTER SCHEMA finance OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: raw_balancesheethistory_annually; Type: TABLE; Schema: finance; Owner: postgres
--

CREATE TABLE finance.raw_balancesheethistory_annually (
    stock character varying(255) NOT NULL,
    enddate date NOT NULL,
    totalcurrentassets double precision,
    totalcurrentliabilities double precision,
    new_column double precision
);


ALTER TABLE finance.raw_balancesheethistory_annually OWNER TO postgres;

--
-- Name: raw_incomestatementhistory_annually; Type: TABLE; Schema: finance; Owner: postgres
--

CREATE TABLE finance.raw_incomestatementhistory_annually (
    stock character varying(255) NOT NULL,
    enddate date NOT NULL,
    costofrevenue double precision,
    totalrevenue double precision,
    incometaxexpense double precision,
    interestexpense double precision,
    ebit double precision,
    grossprofit double precision
);


ALTER TABLE finance.raw_incomestatementhistory_annually OWNER TO postgres;

--
-- Name: raw_balancesheethistory_annually raw_balancesheethistory_annually_pkey; Type: CONSTRAINT; Schema: finance; Owner: postgres
--

ALTER TABLE ONLY finance.raw_balancesheethistory_annually
    ADD CONSTRAINT raw_balancesheethistory_annually_pkey PRIMARY KEY (stock, enddate);


--
-- Name: raw_incomestatementhistory_annually raw_incomestatementhistory_annually_pkey; Type: CONSTRAINT; Schema: finance; Owner: postgres
--

ALTER TABLE ONLY finance.raw_incomestatementhistory_annually
    ADD CONSTRAINT raw_incomestatementhistory_annually_pkey PRIMARY KEY (stock, enddate);


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: finance; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA finance GRANT SELECT ON TABLES  TO postgres;


--
-- PostgreSQL database dump complete
--

