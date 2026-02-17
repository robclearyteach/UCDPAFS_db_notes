--
-- PostgreSQL database dump
--

\restrict uZ6awgzhblA5AIbFvG6B7mxlsXaxU5a0sT9SsiMFpCQT3ILR6Aa9nIkJreheX1S

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    branchno character(5) NOT NULL,
    street character varying(35),
    city character varying(10),
    postcode character varying(10)
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    clientno character(5) NOT NULL,
    fname character varying(10),
    lname character varying(10),
    telno character(15),
    preftype character varying(10),
    maxrent integer,
    email character varying(50)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: privateowner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privateowner (
    ownerno character(5) NOT NULL,
    fname character varying(10),
    lname character varying(10),
    address character varying(50),
    telno character(15),
    email character varying(50),
    password character varying(40)
);


ALTER TABLE public.privateowner OWNER TO postgres;

--
-- Name: propertyforrent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propertyforrent (
    propertyno character(5) NOT NULL,
    street character varying(35),
    city character varying(10),
    postcode character varying(10),
    type character varying(10),
    rooms smallint,
    rent integer,
    ownerno character(5) NOT NULL,
    staffno character(5),
    branchno character(5)
);


ALTER TABLE public.propertyforrent OWNER TO postgres;

--
-- Name: registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration (
    clientno character(5) NOT NULL,
    branchno character(5) NOT NULL,
    staffno character(5) NOT NULL,
    datejoined date
);


ALTER TABLE public.registration OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staffno character(5) NOT NULL,
    fname character varying(10),
    lname character varying(10),
    "position" character varying(10),
    sex character(1),
    dob date,
    salary integer,
    branchno character(5)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: viewing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viewing (
    clientno character(5) NOT NULL,
    propertyno character(5) NOT NULL,
    viewdate date,
    comment character varying(15)
);


ALTER TABLE public.viewing OWNER TO postgres;

--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.branch VALUES ('B005 ', '22 Deer Rd', 'London', 'SW1 4EH');
INSERT INTO public.branch VALUES ('B007 ', '16 Argyll St', 'Aberdeen', 'AB2 3SU');
INSERT INTO public.branch VALUES ('B003 ', '163 Main St', 'Glasgow', 'G11 9QX');
INSERT INTO public.branch VALUES ('B004 ', '32 Manse Rd', 'Bristol', 'BS99 1NZ');
INSERT INTO public.branch VALUES ('B002 ', '56 Clover Dr', 'London', 'NW10 6EU');


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client VALUES ('CR76 ', 'John', 'Kay', '0171-774-5632  ', 'Flat', 425, 'john.kay@gmail.com');
INSERT INTO public.client VALUES ('CR56 ', 'Aline', 'Steward', '0141-848-1825  ', 'Flat', 350, 'astewart@hotmail.com');
INSERT INTO public.client VALUES ('CR74 ', 'Mike', 'Ritchie', '01475-943-1728 ', 'House', 750, 'mritchie@yahoo.co.uk');
INSERT INTO public.client VALUES ('CR62 ', 'Mary', 'Tregear', '01224-196720   ', 'Flat', 600, 'maryt@hotmail.co.uk');


--
-- Data for Name: privateowner; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.privateowner VALUES ('CO46 ', 'Joe', 'Keogh', '2 Fergus Dr. Aberdeen AB2 ', '01224-861212   ', 'jkeogh@lhh.com', NULL);
INSERT INTO public.privateowner VALUES ('CO87 ', 'Carol', 'Farrel', '6 Achray St. Glasgow G32 9DX', '0141-357-7419  ', 'cfarrel@gmail.com', NULL);
INSERT INTO public.privateowner VALUES ('CO40 ', 'Tina', 'Murphy', '63 Well St. Glasgow G42', '0141-943-1728  ', 'tinam@hotmail.com', NULL);
INSERT INTO public.privateowner VALUES ('CO93 ', 'Tony', 'Shaw', '12 Park Pl. Glasgow G4 0QR', '0141-225-7025  ', 'tony.shaw@ark.com', NULL);


--
-- Data for Name: propertyforrent; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propertyforrent VALUES ('PA14 ', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46 ', 'SA9  ', 'B007 ');
INSERT INTO public.propertyforrent VALUES ('PL94 ', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO87 ', 'SL41 ', 'B005 ');
INSERT INTO public.propertyforrent VALUES ('PG4  ', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40 ', NULL, 'B003 ');
INSERT INTO public.propertyforrent VALUES ('PG36 ', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93 ', 'SG37 ', 'B003 ');
INSERT INTO public.propertyforrent VALUES ('PG21 ', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87 ', 'SG37 ', 'B003 ');
INSERT INTO public.propertyforrent VALUES ('PG16 ', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93 ', 'SG14 ', 'B003 ');


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.registration VALUES ('CR76 ', 'B005 ', 'SL41 ', '2015-01-13');
INSERT INTO public.registration VALUES ('CR56 ', 'B003 ', 'SG37 ', '2014-04-13');
INSERT INTO public.registration VALUES ('CR74 ', 'B003 ', 'SG37 ', '2013-11-16');
INSERT INTO public.registration VALUES ('CR62 ', 'B007 ', 'SA9  ', '2014-03-07');


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff VALUES ('SL21 ', 'John', 'White', 'Manager', 'M', '1965-10-01', 30000, 'B005 ');
INSERT INTO public.staff VALUES ('SG37 ', 'Ann', 'Beech', 'Assistant', 'F', '1980-11-10', 12000, 'B003 ');
INSERT INTO public.staff VALUES ('SG14 ', 'David', 'Ford', 'Supervisor', 'M', '1978-03-24', 18000, 'B003 ');
INSERT INTO public.staff VALUES ('SA9  ', 'Mary', 'Howe', 'Assistant', 'F', '1990-02-19', 9000, 'B007 ');
INSERT INTO public.staff VALUES ('SG5  ', 'Susan', 'Brand', 'Manager', 'F', '1960-06-03', 24000, 'B003 ');
INSERT INTO public.staff VALUES ('SL41 ', 'Julie', 'Lee', 'Assistant', 'F', '1985-06-13', 9000, 'B005 ');


--
-- Data for Name: viewing; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.viewing VALUES ('CR56 ', 'PA14 ', '2015-05-24', 'too small');
INSERT INTO public.viewing VALUES ('CR76 ', 'PG4  ', '2015-04-20', 'too remote');
INSERT INTO public.viewing VALUES ('CR56 ', 'PG4  ', '2015-05-26', '');
INSERT INTO public.viewing VALUES ('CR62 ', 'PA14 ', '2015-05-14', 'no dining room');
INSERT INTO public.viewing VALUES ('CR56 ', 'PG36 ', '2015-04-28', '');


--
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (branchno);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (clientno);


--
-- Name: privateowner privateowner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privateowner
    ADD CONSTRAINT privateowner_pkey PRIMARY KEY (ownerno);


--
-- Name: propertyforrent propertyforrent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_pkey PRIMARY KEY (propertyno);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staffno);


--
-- PostgreSQL database dump complete
--

\unrestrict uZ6awgzhblA5AIbFvG6B7mxlsXaxU5a0sT9SsiMFpCQT3ILR6Aa9nIkJreheX1S

