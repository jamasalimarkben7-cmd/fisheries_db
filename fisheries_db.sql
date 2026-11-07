--
-- PostgreSQL database dump
--

\restrict JGdijLOI3sO2n4ybKeHi6kotqS0Whn3kNzaGFYhFcpEncg9qscZ4LutWGHzqAoa

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-07 22:24:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 17508)
-- Name: dw; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dw;


ALTER SCHEMA dw OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 17380)
-- Name: stg; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stg;


ALTER SCHEMA stg OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 17609)
-- Name: dim_date; Type: TABLE; Schema: dw; Owner: postgres
--

CREATE TABLE dw.dim_date (
    date_key integer NOT NULL,
    full_date date,
    year integer,
    quarter integer,
    month integer,
    month_name text,
    day integer,
    day_of_week text
);


ALTER TABLE dw.dim_date OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17522)
-- Name: dim_port; Type: TABLE; Schema: dw; Owner: postgres
--

CREATE TABLE dw.dim_port (
    port_id integer NOT NULL,
    port_name character varying(100) NOT NULL,
    municipality character varying(100),
    province character varying(100)
);


ALTER TABLE dw.dim_port OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17521)
-- Name: dim_port_port_id_seq; Type: SEQUENCE; Schema: dw; Owner: postgres
--

CREATE SEQUENCE dw.dim_port_port_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dw.dim_port_port_id_seq OWNER TO postgres;

--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 221
-- Name: dim_port_port_id_seq; Type: SEQUENCE OWNED BY; Schema: dw; Owner: postgres
--

ALTER SEQUENCE dw.dim_port_port_id_seq OWNED BY dw.dim_port.port_id;


--
-- TOC entry 224 (class 1259 OID 17531)
-- Name: dim_species; Type: TABLE; Schema: dw; Owner: postgres
--

CREATE TABLE dw.dim_species (
    species_id integer NOT NULL,
    common_name character varying(100) NOT NULL,
    scientific_name character varying(100),
    family character varying(100)
);


ALTER TABLE dw.dim_species OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17530)
-- Name: dim_species_species_id_seq; Type: SEQUENCE; Schema: dw; Owner: postgres
--

CREATE SEQUENCE dw.dim_species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dw.dim_species_species_id_seq OWNER TO postgres;

--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 223
-- Name: dim_species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: dw; Owner: postgres
--

ALTER SEQUENCE dw.dim_species_species_id_seq OWNED BY dw.dim_species.species_id;


--
-- TOC entry 226 (class 1259 OID 17540)
-- Name: dim_vessel; Type: TABLE; Schema: dw; Owner: postgres
--

CREATE TABLE dw.dim_vessel (
    vessel_id integer NOT NULL,
    vessel_name character varying(100) NOT NULL,
    cooperative_name character varying(100),
    gear_type character varying(50),
    start_date date NOT NULL,
    end_date date,
    is_current boolean NOT NULL
);


ALTER TABLE dw.dim_vessel OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17539)
-- Name: dim_vessel_vessel_id_seq; Type: SEQUENCE; Schema: dw; Owner: postgres
--

CREATE SEQUENCE dw.dim_vessel_vessel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dw.dim_vessel_vessel_id_seq OWNER TO postgres;

--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 225
-- Name: dim_vessel_vessel_id_seq; Type: SEQUENCE OWNED BY; Schema: dw; Owner: postgres
--

ALTER SEQUENCE dw.dim_vessel_vessel_id_seq OWNED BY dw.dim_vessel.vessel_id;


--
-- TOC entry 228 (class 1259 OID 17551)
-- Name: dim_year; Type: TABLE; Schema: dw; Owner: postgres
--

CREATE TABLE dw.dim_year (
    year_id integer NOT NULL,
    year_val integer NOT NULL
);


ALTER TABLE dw.dim_year OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17550)
-- Name: dim_year_year_id_seq; Type: SEQUENCE; Schema: dw; Owner: postgres
--

CREATE SEQUENCE dw.dim_year_year_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dw.dim_year_year_id_seq OWNER TO postgres;

--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 227
-- Name: dim_year_year_id_seq; Type: SEQUENCE OWNED BY; Schema: dw; Owner: postgres
--

ALTER SEQUENCE dw.dim_year_year_id_seq OWNED BY dw.dim_year.year_id;


--
-- TOC entry 230 (class 1259 OID 17562)
-- Name: fact_landing; Type: TABLE; Schema: dw; Owner: postgres
--

CREATE TABLE dw.fact_landing (
    landing_id integer NOT NULL,
    date_key integer,
    port_id integer,
    species_id integer,
    vessel_id integer,
    year_id integer,
    quantity_kg numeric(10,2) NOT NULL,
    total_value_php numeric(12,2) NOT NULL
);


ALTER TABLE dw.fact_landing OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17561)
-- Name: fact_landing_landing_id_seq; Type: SEQUENCE; Schema: dw; Owner: postgres
--

CREATE SEQUENCE dw.fact_landing_landing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE dw.fact_landing_landing_id_seq OWNER TO postgres;

--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 229
-- Name: fact_landing_landing_id_seq; Type: SEQUENCE OWNED BY; Schema: dw; Owner: postgres
--

ALTER SEQUENCE dw.fact_landing_landing_id_seq OWNED BY dw.fact_landing.landing_id;


--
-- TOC entry 232 (class 1259 OID 17604)
-- Name: landings_raw; Type: TABLE; Schema: stg; Owner: postgres
--

CREATE TABLE stg.landings_raw (
    landing_id text,
    landing_date text,
    port_name text,
    municipality text,
    province text,
    species_raw text,
    vessel_name text,
    gear_type text,
    quantity_kg text,
    total_value_php text
);


ALTER TABLE stg.landings_raw OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17601)
-- Name: species_mapping; Type: TABLE; Schema: stg; Owner: postgres
--

CREATE TABLE stg.species_mapping (
    raw_name character varying(100),
    clean_name character varying(100)
);


ALTER TABLE stg.species_mapping OWNER TO postgres;

--
-- TOC entry 4890 (class 2604 OID 17525)
-- Name: dim_port port_id; Type: DEFAULT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_port ALTER COLUMN port_id SET DEFAULT nextval('dw.dim_port_port_id_seq'::regclass);


--
-- TOC entry 4891 (class 2604 OID 17534)
-- Name: dim_species species_id; Type: DEFAULT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_species ALTER COLUMN species_id SET DEFAULT nextval('dw.dim_species_species_id_seq'::regclass);


--
-- TOC entry 4892 (class 2604 OID 17543)
-- Name: dim_vessel vessel_id; Type: DEFAULT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_vessel ALTER COLUMN vessel_id SET DEFAULT nextval('dw.dim_vessel_vessel_id_seq'::regclass);


--
-- TOC entry 4893 (class 2604 OID 17554)
-- Name: dim_year year_id; Type: DEFAULT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_year ALTER COLUMN year_id SET DEFAULT nextval('dw.dim_year_year_id_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 17565)
-- Name: fact_landing landing_id; Type: DEFAULT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.fact_landing ALTER COLUMN landing_id SET DEFAULT nextval('dw.fact_landing_landing_id_seq'::regclass);


--
-- TOC entry 5072 (class 0 OID 17609)
-- Dependencies: 233
-- Data for Name: dim_date; Type: TABLE DATA; Schema: dw; Owner: postgres
--

COPY dw.dim_date (date_key, full_date, year, quarter, month, month_name, day, day_of_week) FROM stdin;
20260101	2026-01-01	2026	1	1	January  	1	Thursday 
20260102	2026-01-02	2026	1	1	January  	2	Friday   
20260103	2026-01-03	2026	1	1	January  	3	Saturday 
20260104	2026-01-04	2026	1	1	January  	4	Sunday   
20260105	2026-01-05	2026	1	1	January  	5	Monday   
20260106	2026-01-06	2026	1	1	January  	6	Tuesday  
20260107	2026-01-07	2026	1	1	January  	7	Wednesday
20260108	2026-01-08	2026	1	1	January  	8	Thursday 
20260109	2026-01-09	2026	1	1	January  	9	Friday   
20260110	2026-01-10	2026	1	1	January  	10	Saturday 
20260111	2026-01-11	2026	1	1	January  	11	Sunday   
20260112	2026-01-12	2026	1	1	January  	12	Monday   
20260113	2026-01-13	2026	1	1	January  	13	Tuesday  
20260114	2026-01-14	2026	1	1	January  	14	Wednesday
20260115	2026-01-15	2026	1	1	January  	15	Thursday 
20260116	2026-01-16	2026	1	1	January  	16	Friday   
20260117	2026-01-17	2026	1	1	January  	17	Saturday 
20260118	2026-01-18	2026	1	1	January  	18	Sunday   
20260119	2026-01-19	2026	1	1	January  	19	Monday   
20260120	2026-01-20	2026	1	1	January  	20	Tuesday  
20260121	2026-01-21	2026	1	1	January  	21	Wednesday
20260122	2026-01-22	2026	1	1	January  	22	Thursday 
20260123	2026-01-23	2026	1	1	January  	23	Friday   
20260124	2026-01-24	2026	1	1	January  	24	Saturday 
20260125	2026-01-25	2026	1	1	January  	25	Sunday   
20260126	2026-01-26	2026	1	1	January  	26	Monday   
20260127	2026-01-27	2026	1	1	January  	27	Tuesday  
20260128	2026-01-28	2026	1	1	January  	28	Wednesday
20260129	2026-01-29	2026	1	1	January  	29	Thursday 
20260130	2026-01-30	2026	1	1	January  	30	Friday   
20260131	2026-01-31	2026	1	1	January  	31	Saturday 
20260201	2026-02-01	2026	1	2	February 	1	Sunday   
20260202	2026-02-02	2026	1	2	February 	2	Monday   
20260203	2026-02-03	2026	1	2	February 	3	Tuesday  
20260204	2026-02-04	2026	1	2	February 	4	Wednesday
20260205	2026-02-05	2026	1	2	February 	5	Thursday 
20260206	2026-02-06	2026	1	2	February 	6	Friday   
20260207	2026-02-07	2026	1	2	February 	7	Saturday 
20260208	2026-02-08	2026	1	2	February 	8	Sunday   
20260209	2026-02-09	2026	1	2	February 	9	Monday   
20260210	2026-02-10	2026	1	2	February 	10	Tuesday  
20260211	2026-02-11	2026	1	2	February 	11	Wednesday
20260212	2026-02-12	2026	1	2	February 	12	Thursday 
20260213	2026-02-13	2026	1	2	February 	13	Friday   
20260214	2026-02-14	2026	1	2	February 	14	Saturday 
20260215	2026-02-15	2026	1	2	February 	15	Sunday   
20260216	2026-02-16	2026	1	2	February 	16	Monday   
20260217	2026-02-17	2026	1	2	February 	17	Tuesday  
20260218	2026-02-18	2026	1	2	February 	18	Wednesday
20260219	2026-02-19	2026	1	2	February 	19	Thursday 
20260220	2026-02-20	2026	1	2	February 	20	Friday   
20260221	2026-02-21	2026	1	2	February 	21	Saturday 
20260222	2026-02-22	2026	1	2	February 	22	Sunday   
20260223	2026-02-23	2026	1	2	February 	23	Monday   
20260224	2026-02-24	2026	1	2	February 	24	Tuesday  
20260225	2026-02-25	2026	1	2	February 	25	Wednesday
20260226	2026-02-26	2026	1	2	February 	26	Thursday 
20260227	2026-02-27	2026	1	2	February 	27	Friday   
20260228	2026-02-28	2026	1	2	February 	28	Saturday 
20260301	2026-03-01	2026	1	3	March    	1	Sunday   
20260302	2026-03-02	2026	1	3	March    	2	Monday   
20260303	2026-03-03	2026	1	3	March    	3	Tuesday  
20260304	2026-03-04	2026	1	3	March    	4	Wednesday
20260305	2026-03-05	2026	1	3	March    	5	Thursday 
20260306	2026-03-06	2026	1	3	March    	6	Friday   
20260307	2026-03-07	2026	1	3	March    	7	Saturday 
20260308	2026-03-08	2026	1	3	March    	8	Sunday   
20260309	2026-03-09	2026	1	3	March    	9	Monday   
20260310	2026-03-10	2026	1	3	March    	10	Tuesday  
20260311	2026-03-11	2026	1	3	March    	11	Wednesday
20260312	2026-03-12	2026	1	3	March    	12	Thursday 
20260313	2026-03-13	2026	1	3	March    	13	Friday   
20260314	2026-03-14	2026	1	3	March    	14	Saturday 
20260315	2026-03-15	2026	1	3	March    	15	Sunday   
20260316	2026-03-16	2026	1	3	March    	16	Monday   
20260317	2026-03-17	2026	1	3	March    	17	Tuesday  
20260318	2026-03-18	2026	1	3	March    	18	Wednesday
20260319	2026-03-19	2026	1	3	March    	19	Thursday 
20260320	2026-03-20	2026	1	3	March    	20	Friday   
20260321	2026-03-21	2026	1	3	March    	21	Saturday 
20260322	2026-03-22	2026	1	3	March    	22	Sunday   
20260323	2026-03-23	2026	1	3	March    	23	Monday   
20260324	2026-03-24	2026	1	3	March    	24	Tuesday  
20260325	2026-03-25	2026	1	3	March    	25	Wednesday
20260326	2026-03-26	2026	1	3	March    	26	Thursday 
20260327	2026-03-27	2026	1	3	March    	27	Friday   
20260328	2026-03-28	2026	1	3	March    	28	Saturday 
20260329	2026-03-29	2026	1	3	March    	29	Sunday   
20260330	2026-03-30	2026	1	3	March    	30	Monday   
20260331	2026-03-31	2026	1	3	March    	31	Tuesday  
20260401	2026-04-01	2026	2	4	April    	1	Wednesday
20260402	2026-04-02	2026	2	4	April    	2	Thursday 
20260403	2026-04-03	2026	2	4	April    	3	Friday   
20260404	2026-04-04	2026	2	4	April    	4	Saturday 
20260405	2026-04-05	2026	2	4	April    	5	Sunday   
20260406	2026-04-06	2026	2	4	April    	6	Monday   
20260407	2026-04-07	2026	2	4	April    	7	Tuesday  
20260408	2026-04-08	2026	2	4	April    	8	Wednesday
20260409	2026-04-09	2026	2	4	April    	9	Thursday 
20260410	2026-04-10	2026	2	4	April    	10	Friday   
20260411	2026-04-11	2026	2	4	April    	11	Saturday 
20260412	2026-04-12	2026	2	4	April    	12	Sunday   
20260413	2026-04-13	2026	2	4	April    	13	Monday   
20260414	2026-04-14	2026	2	4	April    	14	Tuesday  
20260415	2026-04-15	2026	2	4	April    	15	Wednesday
20260416	2026-04-16	2026	2	4	April    	16	Thursday 
20260417	2026-04-17	2026	2	4	April    	17	Friday   
20260418	2026-04-18	2026	2	4	April    	18	Saturday 
20260419	2026-04-19	2026	2	4	April    	19	Sunday   
20260420	2026-04-20	2026	2	4	April    	20	Monday   
20260421	2026-04-21	2026	2	4	April    	21	Tuesday  
20260422	2026-04-22	2026	2	4	April    	22	Wednesday
20260423	2026-04-23	2026	2	4	April    	23	Thursday 
20260424	2026-04-24	2026	2	4	April    	24	Friday   
20260425	2026-04-25	2026	2	4	April    	25	Saturday 
20260426	2026-04-26	2026	2	4	April    	26	Sunday   
20260427	2026-04-27	2026	2	4	April    	27	Monday   
20260428	2026-04-28	2026	2	4	April    	28	Tuesday  
20260429	2026-04-29	2026	2	4	April    	29	Wednesday
20260430	2026-04-30	2026	2	4	April    	30	Thursday 
20260501	2026-05-01	2026	2	5	May      	1	Friday   
20260502	2026-05-02	2026	2	5	May      	2	Saturday 
20260503	2026-05-03	2026	2	5	May      	3	Sunday   
20260504	2026-05-04	2026	2	5	May      	4	Monday   
20260505	2026-05-05	2026	2	5	May      	5	Tuesday  
20260506	2026-05-06	2026	2	5	May      	6	Wednesday
20260507	2026-05-07	2026	2	5	May      	7	Thursday 
20260508	2026-05-08	2026	2	5	May      	8	Friday   
20260509	2026-05-09	2026	2	5	May      	9	Saturday 
20260510	2026-05-10	2026	2	5	May      	10	Sunday   
20260511	2026-05-11	2026	2	5	May      	11	Monday   
20260512	2026-05-12	2026	2	5	May      	12	Tuesday  
20260513	2026-05-13	2026	2	5	May      	13	Wednesday
20260514	2026-05-14	2026	2	5	May      	14	Thursday 
20260515	2026-05-15	2026	2	5	May      	15	Friday   
20260516	2026-05-16	2026	2	5	May      	16	Saturday 
20260517	2026-05-17	2026	2	5	May      	17	Sunday   
20260518	2026-05-18	2026	2	5	May      	18	Monday   
20260519	2026-05-19	2026	2	5	May      	19	Tuesday  
20260520	2026-05-20	2026	2	5	May      	20	Wednesday
20260521	2026-05-21	2026	2	5	May      	21	Thursday 
20260522	2026-05-22	2026	2	5	May      	22	Friday   
20260523	2026-05-23	2026	2	5	May      	23	Saturday 
20260524	2026-05-24	2026	2	5	May      	24	Sunday   
20260525	2026-05-25	2026	2	5	May      	25	Monday   
20260526	2026-05-26	2026	2	5	May      	26	Tuesday  
20260527	2026-05-27	2026	2	5	May      	27	Wednesday
20260528	2026-05-28	2026	2	5	May      	28	Thursday 
20260529	2026-05-29	2026	2	5	May      	29	Friday   
20260530	2026-05-30	2026	2	5	May      	30	Saturday 
20260531	2026-05-31	2026	2	5	May      	31	Sunday   
20260601	2026-06-01	2026	2	6	June     	1	Monday   
20260602	2026-06-02	2026	2	6	June     	2	Tuesday  
20260603	2026-06-03	2026	2	6	June     	3	Wednesday
20260604	2026-06-04	2026	2	6	June     	4	Thursday 
20260605	2026-06-05	2026	2	6	June     	5	Friday   
20260606	2026-06-06	2026	2	6	June     	6	Saturday 
20260607	2026-06-07	2026	2	6	June     	7	Sunday   
20260608	2026-06-08	2026	2	6	June     	8	Monday   
20260609	2026-06-09	2026	2	6	June     	9	Tuesday  
20260610	2026-06-10	2026	2	6	June     	10	Wednesday
20260611	2026-06-11	2026	2	6	June     	11	Thursday 
20260612	2026-06-12	2026	2	6	June     	12	Friday   
20260613	2026-06-13	2026	2	6	June     	13	Saturday 
20260614	2026-06-14	2026	2	6	June     	14	Sunday   
20260615	2026-06-15	2026	2	6	June     	15	Monday   
20260616	2026-06-16	2026	2	6	June     	16	Tuesday  
20260617	2026-06-17	2026	2	6	June     	17	Wednesday
20260618	2026-06-18	2026	2	6	June     	18	Thursday 
20260619	2026-06-19	2026	2	6	June     	19	Friday   
20260620	2026-06-20	2026	2	6	June     	20	Saturday 
20260621	2026-06-21	2026	2	6	June     	21	Sunday   
20260622	2026-06-22	2026	2	6	June     	22	Monday   
20260623	2026-06-23	2026	2	6	June     	23	Tuesday  
20260624	2026-06-24	2026	2	6	June     	24	Wednesday
20260625	2026-06-25	2026	2	6	June     	25	Thursday 
20260626	2026-06-26	2026	2	6	June     	26	Friday   
20260627	2026-06-27	2026	2	6	June     	27	Saturday 
20260628	2026-06-28	2026	2	6	June     	28	Sunday   
20260629	2026-06-29	2026	2	6	June     	29	Monday   
20260630	2026-06-30	2026	2	6	June     	30	Tuesday  
20260701	2026-07-01	2026	3	7	July     	1	Wednesday
20260702	2026-07-02	2026	3	7	July     	2	Thursday 
20260703	2026-07-03	2026	3	7	July     	3	Friday   
20260704	2026-07-04	2026	3	7	July     	4	Saturday 
20260705	2026-07-05	2026	3	7	July     	5	Sunday   
20260706	2026-07-06	2026	3	7	July     	6	Monday   
20260707	2026-07-07	2026	3	7	July     	7	Tuesday  
20260708	2026-07-08	2026	3	7	July     	8	Wednesday
20260709	2026-07-09	2026	3	7	July     	9	Thursday 
20260710	2026-07-10	2026	3	7	July     	10	Friday   
20260711	2026-07-11	2026	3	7	July     	11	Saturday 
20260712	2026-07-12	2026	3	7	July     	12	Sunday   
20260713	2026-07-13	2026	3	7	July     	13	Monday   
20260714	2026-07-14	2026	3	7	July     	14	Tuesday  
20260715	2026-07-15	2026	3	7	July     	15	Wednesday
20260716	2026-07-16	2026	3	7	July     	16	Thursday 
20260717	2026-07-17	2026	3	7	July     	17	Friday   
20260718	2026-07-18	2026	3	7	July     	18	Saturday 
20260719	2026-07-19	2026	3	7	July     	19	Sunday   
20260720	2026-07-20	2026	3	7	July     	20	Monday   
20260721	2026-07-21	2026	3	7	July     	21	Tuesday  
20260722	2026-07-22	2026	3	7	July     	22	Wednesday
20260723	2026-07-23	2026	3	7	July     	23	Thursday 
20260724	2026-07-24	2026	3	7	July     	24	Friday   
20260725	2026-07-25	2026	3	7	July     	25	Saturday 
20260726	2026-07-26	2026	3	7	July     	26	Sunday   
20260727	2026-07-27	2026	3	7	July     	27	Monday   
20260728	2026-07-28	2026	3	7	July     	28	Tuesday  
20260729	2026-07-29	2026	3	7	July     	29	Wednesday
20260730	2026-07-30	2026	3	7	July     	30	Thursday 
20260731	2026-07-31	2026	3	7	July     	31	Friday   
20260801	2026-08-01	2026	3	8	August   	1	Saturday 
20260802	2026-08-02	2026	3	8	August   	2	Sunday   
20260803	2026-08-03	2026	3	8	August   	3	Monday   
20260804	2026-08-04	2026	3	8	August   	4	Tuesday  
20260805	2026-08-05	2026	3	8	August   	5	Wednesday
20260806	2026-08-06	2026	3	8	August   	6	Thursday 
20260807	2026-08-07	2026	3	8	August   	7	Friday   
20260808	2026-08-08	2026	3	8	August   	8	Saturday 
20260809	2026-08-09	2026	3	8	August   	9	Sunday   
20260810	2026-08-10	2026	3	8	August   	10	Monday   
20260811	2026-08-11	2026	3	8	August   	11	Tuesday  
20260812	2026-08-12	2026	3	8	August   	12	Wednesday
20260813	2026-08-13	2026	3	8	August   	13	Thursday 
20260814	2026-08-14	2026	3	8	August   	14	Friday   
20260815	2026-08-15	2026	3	8	August   	15	Saturday 
20260816	2026-08-16	2026	3	8	August   	16	Sunday   
20260817	2026-08-17	2026	3	8	August   	17	Monday   
20260818	2026-08-18	2026	3	8	August   	18	Tuesday  
20260819	2026-08-19	2026	3	8	August   	19	Wednesday
20260820	2026-08-20	2026	3	8	August   	20	Thursday 
20260821	2026-08-21	2026	3	8	August   	21	Friday   
20260822	2026-08-22	2026	3	8	August   	22	Saturday 
20260823	2026-08-23	2026	3	8	August   	23	Sunday   
20260824	2026-08-24	2026	3	8	August   	24	Monday   
20260825	2026-08-25	2026	3	8	August   	25	Tuesday  
20260826	2026-08-26	2026	3	8	August   	26	Wednesday
20260827	2026-08-27	2026	3	8	August   	27	Thursday 
20260828	2026-08-28	2026	3	8	August   	28	Friday   
20260829	2026-08-29	2026	3	8	August   	29	Saturday 
20260830	2026-08-30	2026	3	8	August   	30	Sunday   
20260831	2026-08-31	2026	3	8	August   	31	Monday   
20260901	2026-09-01	2026	3	9	September	1	Tuesday  
20260902	2026-09-02	2026	3	9	September	2	Wednesday
20260903	2026-09-03	2026	3	9	September	3	Thursday 
20260904	2026-09-04	2026	3	9	September	4	Friday   
20260905	2026-09-05	2026	3	9	September	5	Saturday 
20260906	2026-09-06	2026	3	9	September	6	Sunday   
20260907	2026-09-07	2026	3	9	September	7	Monday   
20260908	2026-09-08	2026	3	9	September	8	Tuesday  
20260909	2026-09-09	2026	3	9	September	9	Wednesday
20260910	2026-09-10	2026	3	9	September	10	Thursday 
20260911	2026-09-11	2026	3	9	September	11	Friday   
20260912	2026-09-12	2026	3	9	September	12	Saturday 
20260913	2026-09-13	2026	3	9	September	13	Sunday   
20260914	2026-09-14	2026	3	9	September	14	Monday   
20260915	2026-09-15	2026	3	9	September	15	Tuesday  
20260916	2026-09-16	2026	3	9	September	16	Wednesday
20260917	2026-09-17	2026	3	9	September	17	Thursday 
20260918	2026-09-18	2026	3	9	September	18	Friday   
20260919	2026-09-19	2026	3	9	September	19	Saturday 
20260920	2026-09-20	2026	3	9	September	20	Sunday   
20260921	2026-09-21	2026	3	9	September	21	Monday   
20260922	2026-09-22	2026	3	9	September	22	Tuesday  
20260923	2026-09-23	2026	3	9	September	23	Wednesday
20260924	2026-09-24	2026	3	9	September	24	Thursday 
20260925	2026-09-25	2026	3	9	September	25	Friday   
20260926	2026-09-26	2026	3	9	September	26	Saturday 
20260927	2026-09-27	2026	3	9	September	27	Sunday   
20260928	2026-09-28	2026	3	9	September	28	Monday   
20260929	2026-09-29	2026	3	9	September	29	Tuesday  
20260930	2026-09-30	2026	3	9	September	30	Wednesday
20261001	2026-10-01	2026	4	10	October  	1	Thursday 
20261002	2026-10-02	2026	4	10	October  	2	Friday   
20261003	2026-10-03	2026	4	10	October  	3	Saturday 
20261004	2026-10-04	2026	4	10	October  	4	Sunday   
20261005	2026-10-05	2026	4	10	October  	5	Monday   
20261006	2026-10-06	2026	4	10	October  	6	Tuesday  
20261007	2026-10-07	2026	4	10	October  	7	Wednesday
20261008	2026-10-08	2026	4	10	October  	8	Thursday 
20261009	2026-10-09	2026	4	10	October  	9	Friday   
20261010	2026-10-10	2026	4	10	October  	10	Saturday 
20261011	2026-10-11	2026	4	10	October  	11	Sunday   
20261012	2026-10-12	2026	4	10	October  	12	Monday   
20261013	2026-10-13	2026	4	10	October  	13	Tuesday  
20261014	2026-10-14	2026	4	10	October  	14	Wednesday
20261015	2026-10-15	2026	4	10	October  	15	Thursday 
20261016	2026-10-16	2026	4	10	October  	16	Friday   
20261017	2026-10-17	2026	4	10	October  	17	Saturday 
20261018	2026-10-18	2026	4	10	October  	18	Sunday   
20261019	2026-10-19	2026	4	10	October  	19	Monday   
20261020	2026-10-20	2026	4	10	October  	20	Tuesday  
20261021	2026-10-21	2026	4	10	October  	21	Wednesday
20261022	2026-10-22	2026	4	10	October  	22	Thursday 
20261023	2026-10-23	2026	4	10	October  	23	Friday   
20261024	2026-10-24	2026	4	10	October  	24	Saturday 
20261025	2026-10-25	2026	4	10	October  	25	Sunday   
20261026	2026-10-26	2026	4	10	October  	26	Monday   
20261027	2026-10-27	2026	4	10	October  	27	Tuesday  
20261028	2026-10-28	2026	4	10	October  	28	Wednesday
20261029	2026-10-29	2026	4	10	October  	29	Thursday 
20261030	2026-10-30	2026	4	10	October  	30	Friday   
20261031	2026-10-31	2026	4	10	October  	31	Saturday 
20261101	2026-11-01	2026	4	11	November 	1	Sunday   
20261102	2026-11-02	2026	4	11	November 	2	Monday   
20261103	2026-11-03	2026	4	11	November 	3	Tuesday  
20261104	2026-11-04	2026	4	11	November 	4	Wednesday
20261105	2026-11-05	2026	4	11	November 	5	Thursday 
20261106	2026-11-06	2026	4	11	November 	6	Friday   
20261107	2026-11-07	2026	4	11	November 	7	Saturday 
20261108	2026-11-08	2026	4	11	November 	8	Sunday   
20261109	2026-11-09	2026	4	11	November 	9	Monday   
20261110	2026-11-10	2026	4	11	November 	10	Tuesday  
20261111	2026-11-11	2026	4	11	November 	11	Wednesday
20261112	2026-11-12	2026	4	11	November 	12	Thursday 
20261113	2026-11-13	2026	4	11	November 	13	Friday   
20261114	2026-11-14	2026	4	11	November 	14	Saturday 
20261115	2026-11-15	2026	4	11	November 	15	Sunday   
20261116	2026-11-16	2026	4	11	November 	16	Monday   
20261117	2026-11-17	2026	4	11	November 	17	Tuesday  
20261118	2026-11-18	2026	4	11	November 	18	Wednesday
20261119	2026-11-19	2026	4	11	November 	19	Thursday 
20261120	2026-11-20	2026	4	11	November 	20	Friday   
20261121	2026-11-21	2026	4	11	November 	21	Saturday 
20261122	2026-11-22	2026	4	11	November 	22	Sunday   
20261123	2026-11-23	2026	4	11	November 	23	Monday   
20261124	2026-11-24	2026	4	11	November 	24	Tuesday  
20261125	2026-11-25	2026	4	11	November 	25	Wednesday
20261126	2026-11-26	2026	4	11	November 	26	Thursday 
20261127	2026-11-27	2026	4	11	November 	27	Friday   
20261128	2026-11-28	2026	4	11	November 	28	Saturday 
20261129	2026-11-29	2026	4	11	November 	29	Sunday   
20261130	2026-11-30	2026	4	11	November 	30	Monday   
20261201	2026-12-01	2026	4	12	December 	1	Tuesday  
20261202	2026-12-02	2026	4	12	December 	2	Wednesday
20261203	2026-12-03	2026	4	12	December 	3	Thursday 
20261204	2026-12-04	2026	4	12	December 	4	Friday   
20261205	2026-12-05	2026	4	12	December 	5	Saturday 
20261206	2026-12-06	2026	4	12	December 	6	Sunday   
20261207	2026-12-07	2026	4	12	December 	7	Monday   
20261208	2026-12-08	2026	4	12	December 	8	Tuesday  
20261209	2026-12-09	2026	4	12	December 	9	Wednesday
20261210	2026-12-10	2026	4	12	December 	10	Thursday 
20261211	2026-12-11	2026	4	12	December 	11	Friday   
20261212	2026-12-12	2026	4	12	December 	12	Saturday 
20261213	2026-12-13	2026	4	12	December 	13	Sunday   
20261214	2026-12-14	2026	4	12	December 	14	Monday   
20261215	2026-12-15	2026	4	12	December 	15	Tuesday  
20261216	2026-12-16	2026	4	12	December 	16	Wednesday
20261217	2026-12-17	2026	4	12	December 	17	Thursday 
20261218	2026-12-18	2026	4	12	December 	18	Friday   
20261219	2026-12-19	2026	4	12	December 	19	Saturday 
20261220	2026-12-20	2026	4	12	December 	20	Sunday   
20261221	2026-12-21	2026	4	12	December 	21	Monday   
20261222	2026-12-22	2026	4	12	December 	22	Tuesday  
20261223	2026-12-23	2026	4	12	December 	23	Wednesday
20261224	2026-12-24	2026	4	12	December 	24	Thursday 
20261225	2026-12-25	2026	4	12	December 	25	Friday   
20261226	2026-12-26	2026	4	12	December 	26	Saturday 
20261227	2026-12-27	2026	4	12	December 	27	Sunday   
20261228	2026-12-28	2026	4	12	December 	28	Monday   
20261229	2026-12-29	2026	4	12	December 	29	Tuesday  
20261230	2026-12-30	2026	4	12	December 	30	Wednesday
20261231	2026-12-31	2026	4	12	December 	31	Thursday 
\.


--
-- TOC entry 5061 (class 0 OID 17522)
-- Dependencies: 222
-- Data for Name: dim_port; Type: TABLE DATA; Schema: dw; Owner: postgres
--

COPY dw.dim_port (port_id, port_name, municipality, province) FROM stdin;
1	Port C	Municipality C	Province C
2	Port B	Municipality B	Province B
3	Port A	Municipality A	Province A
4	Port C	Municipality C	Province C
5	Port B	Municipality B	Province B
6	Port A	Municipality A	Province A
\.


--
-- TOC entry 5063 (class 0 OID 17531)
-- Dependencies: 224
-- Data for Name: dim_species; Type: TABLE DATA; Schema: dw; Owner: postgres
--

COPY dw.dim_species (species_id, common_name, scientific_name, family) FROM stdin;
1	Species Y	\N	\N
2	Species Z	\N	\N
3	Species X	\N	\N
4	Species Y	\N	\N
5	Species Z	\N	\N
6	Species X	\N	\N
\.


--
-- TOC entry 5065 (class 0 OID 17540)
-- Dependencies: 226
-- Data for Name: dim_vessel; Type: TABLE DATA; Schema: dw; Owner: postgres
--

COPY dw.dim_vessel (vessel_id, vessel_name, cooperative_name, gear_type, start_date, end_date, is_current) FROM stdin;
1	MV Fisher 1	Cooperative Beta (Updated)	Longline	2026-10-29	\N	t
2	Vessel C	\N	Trawl	2026-10-29	\N	t
3	Vessel B	\N	Longline	2026-10-29	\N	t
4	Vessel A	\N	Gillnet	2026-10-29	\N	t
5	Vessel C	\N	Trawl	2026-10-29	\N	t
6	Vessel B	\N	Longline	2026-10-29	\N	t
7	Vessel A	\N	Gillnet	2026-10-29	\N	t
\.


--
-- TOC entry 5067 (class 0 OID 17551)
-- Dependencies: 228
-- Data for Name: dim_year; Type: TABLE DATA; Schema: dw; Owner: postgres
--

COPY dw.dim_year (year_id, year_val) FROM stdin;
\.


--
-- TOC entry 5069 (class 0 OID 17562)
-- Dependencies: 230
-- Data for Name: fact_landing; Type: TABLE DATA; Schema: dw; Owner: postgres
--

COPY dw.fact_landing (landing_id, date_key, port_id, species_id, vessel_id, year_id, quantity_kg, total_value_php) FROM stdin;
1	20260501	3	3	4	\N	150.50	4500.00
2	20260501	3	6	4	\N	150.50	4500.00
3	20260501	3	3	7	\N	150.50	4500.00
4	20260501	3	6	7	\N	150.50	4500.00
5	20260501	6	3	4	\N	150.50	4500.00
6	20260501	6	6	4	\N	150.50	4500.00
7	20260501	6	3	7	\N	150.50	4500.00
8	20260501	6	6	7	\N	150.50	4500.00
9	20260601	2	1	3	\N	200.00	6000.00
10	20260601	2	4	3	\N	200.00	6000.00
11	20260601	2	1	6	\N	200.00	6000.00
12	20260601	2	4	6	\N	200.00	6000.00
13	20260601	5	1	3	\N	200.00	6000.00
14	20260601	5	4	3	\N	200.00	6000.00
15	20260601	5	1	6	\N	200.00	6000.00
16	20260601	5	4	6	\N	200.00	6000.00
17	20260701	1	2	2	\N	320.40	9600.00
18	20260701	1	5	2	\N	320.40	9600.00
19	20260701	1	2	5	\N	320.40	9600.00
20	20260701	1	5	5	\N	320.40	9600.00
21	20260701	4	2	2	\N	320.40	9600.00
22	20260701	4	5	2	\N	320.40	9600.00
23	20260701	4	2	5	\N	320.40	9600.00
24	20260701	4	5	5	\N	320.40	9600.00
\.


--
-- TOC entry 5071 (class 0 OID 17604)
-- Dependencies: 232
-- Data for Name: landings_raw; Type: TABLE DATA; Schema: stg; Owner: postgres
--

COPY stg.landings_raw (landing_id, landing_date, port_name, municipality, province, species_raw, vessel_name, gear_type, quantity_kg, total_value_php) FROM stdin;
1	2026-05-01	Port A	Municipality A	Province A	Species X	Vessel A	Gillnet	150.5	4500.00
2	2026-06-01	Port B	Municipality B	Province B	Species Y	Vessel B	Longline	200.0	6000.00
3	2026-07-01	Port C	Municipality C	Province C	Species Z	Vessel C	Trawl	320.4	9600.00
\.


--
-- TOC entry 5070 (class 0 OID 17601)
-- Dependencies: 231
-- Data for Name: species_mapping; Type: TABLE DATA; Schema: stg; Owner: postgres
--

COPY stg.species_mapping (raw_name, clean_name) FROM stdin;
Yellow-fin Tuna	Yellowfin Tuna
yellofin tuna	Yellowfin Tuna
Bangos	Bangus
\.


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 221
-- Name: dim_port_port_id_seq; Type: SEQUENCE SET; Schema: dw; Owner: postgres
--

SELECT pg_catalog.setval('dw.dim_port_port_id_seq', 6, true);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 223
-- Name: dim_species_species_id_seq; Type: SEQUENCE SET; Schema: dw; Owner: postgres
--

SELECT pg_catalog.setval('dw.dim_species_species_id_seq', 6, true);


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 225
-- Name: dim_vessel_vessel_id_seq; Type: SEQUENCE SET; Schema: dw; Owner: postgres
--

SELECT pg_catalog.setval('dw.dim_vessel_vessel_id_seq', 7, true);


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 227
-- Name: dim_year_year_id_seq; Type: SEQUENCE SET; Schema: dw; Owner: postgres
--

SELECT pg_catalog.setval('dw.dim_year_year_id_seq', 1, false);


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 229
-- Name: fact_landing_landing_id_seq; Type: SEQUENCE SET; Schema: dw; Owner: postgres
--

SELECT pg_catalog.setval('dw.fact_landing_landing_id_seq', 24, true);


--
-- TOC entry 4908 (class 2606 OID 17616)
-- Name: dim_date dim_date_pkey; Type: CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_date
    ADD CONSTRAINT dim_date_pkey PRIMARY KEY (date_key);


--
-- TOC entry 4896 (class 2606 OID 17529)
-- Name: dim_port dim_port_pkey; Type: CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_port
    ADD CONSTRAINT dim_port_pkey PRIMARY KEY (port_id);


--
-- TOC entry 4898 (class 2606 OID 17538)
-- Name: dim_species dim_species_pkey; Type: CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_species
    ADD CONSTRAINT dim_species_pkey PRIMARY KEY (species_id);


--
-- TOC entry 4900 (class 2606 OID 17549)
-- Name: dim_vessel dim_vessel_pkey; Type: CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_vessel
    ADD CONSTRAINT dim_vessel_pkey PRIMARY KEY (vessel_id);


--
-- TOC entry 4902 (class 2606 OID 17558)
-- Name: dim_year dim_year_pkey; Type: CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_year
    ADD CONSTRAINT dim_year_pkey PRIMARY KEY (year_id);


--
-- TOC entry 4904 (class 2606 OID 17560)
-- Name: dim_year dim_year_year_val_key; Type: CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.dim_year
    ADD CONSTRAINT dim_year_year_val_key UNIQUE (year_val);


--
-- TOC entry 4906 (class 2606 OID 17570)
-- Name: fact_landing fact_landing_pkey; Type: CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.fact_landing
    ADD CONSTRAINT fact_landing_pkey PRIMARY KEY (landing_id);


--
-- TOC entry 4909 (class 2606 OID 17576)
-- Name: fact_landing fact_landing_port_id_fkey; Type: FK CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.fact_landing
    ADD CONSTRAINT fact_landing_port_id_fkey FOREIGN KEY (port_id) REFERENCES dw.dim_port(port_id);


--
-- TOC entry 4910 (class 2606 OID 17581)
-- Name: fact_landing fact_landing_species_id_fkey; Type: FK CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.fact_landing
    ADD CONSTRAINT fact_landing_species_id_fkey FOREIGN KEY (species_id) REFERENCES dw.dim_species(species_id);


--
-- TOC entry 4911 (class 2606 OID 17586)
-- Name: fact_landing fact_landing_vessel_id_fkey; Type: FK CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.fact_landing
    ADD CONSTRAINT fact_landing_vessel_id_fkey FOREIGN KEY (vessel_id) REFERENCES dw.dim_vessel(vessel_id);


--
-- TOC entry 4912 (class 2606 OID 17591)
-- Name: fact_landing fact_landing_year_id_fkey; Type: FK CONSTRAINT; Schema: dw; Owner: postgres
--

ALTER TABLE ONLY dw.fact_landing
    ADD CONSTRAINT fact_landing_year_id_fkey FOREIGN KEY (year_id) REFERENCES dw.dim_year(year_id);


-- Completed on 2026-11-07 22:24:53

--
-- PostgreSQL database dump complete
--

\unrestrict JGdijLOI3sO2n4ybKeHi6kotqS0Whn3kNzaGFYhFcpEncg9qscZ4LutWGHzqAoa

