--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: unaccented(text); Type: FUNCTION; Schema: public; Owner: ong
--

CREATE FUNCTION unaccented(text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT translate($1,'ÀÁÂÃÄÅĀĂĄÈÉÊËĒĔĖĘĚÌÍÎÏĨĪĮİÒÓÔÕÖØŌŎŐÙÚÛÜŨŪŬŮŰŲàáâãäåāăąèéêëēĕėęěìíîïĩīĭįòóôõöøōŏőùúûüũūŭůųÇçÑñÝýÿĆćĈĉĊċČčĎďĐđĜĝĞğĠġĢģĤĥĦħ',
'AAAAAAAAAEEEEEEEEEIIIIIIIIOOOOOOOOOUUUUUUUUUUaaaaaaaaaeeeeeeeeeiiiiiiiiooooooooouuuuuuuuuCcNnYyyCcCcCcCcDdDdGgGgGgGgHhHh');$_$;


ALTER FUNCTION public.unaccented(text) OWNER TO ong;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acl_role; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE acl_role (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    appaccount_id bigint NOT NULL
);


ALTER TABLE public.acl_role OWNER TO ong;

--
-- Name: acl_role_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE acl_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.acl_role_id_seq OWNER TO ong;

--
-- Name: acl_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE acl_role_id_seq OWNED BY acl_role.id;


--
-- Name: acl_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('acl_role_id_seq', 4, true);


--
-- Name: acl_role_permission; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE acl_role_permission (
    id bigint NOT NULL,
    resource character varying(30) NOT NULL,
    privilege character varying(30) NOT NULL,
    acl_role_id integer NOT NULL
);


ALTER TABLE public.acl_role_permission OWNER TO ong;

--
-- Name: acl_role_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE acl_role_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.acl_role_permission_id_seq OWNER TO ong;

--
-- Name: acl_role_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE acl_role_permission_id_seq OWNED BY acl_role_permission.id;


--
-- Name: acl_role_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('acl_role_permission_id_seq', 88, true);


--
-- Name: appaccount; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE appaccount (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    email character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.appaccount OWNER TO ong;

--
-- Name: TABLE appaccount; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON TABLE appaccount IS 'The owners of accounts in the system';


--
-- Name: appaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE appaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.appaccount_id_seq OWNER TO ong;

--
-- Name: appaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE appaccount_id_seq OWNED BY appaccount.id;


--
-- Name: appaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('appaccount_id_seq', 1, true);


--
-- Name: audit_trail; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE audit_trail (
    id bigint NOT NULL,
    record_id bigint,
    tablename character varying(60) NOT NULL,
    fieldname character varying(60) NOT NULL,
    eventdate timestamp without time zone NOT NULL,
    eventtype character(3) NOT NULL,
    user_id bigint NOT NULL,
    fieldtexttype character(1) DEFAULT false NOT NULL,
    appaccount_id bigint NOT NULL,
    value character varying(260) NOT NULL
);


ALTER TABLE public.audit_trail OWNER TO ong;

--
-- Name: COLUMN audit_trail.eventtype; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN audit_trail.eventtype IS 'INS, UPD, DEL';


--
-- Name: COLUMN audit_trail.fieldtexttype; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN audit_trail.fieldtexttype IS 'Y or N';


--
-- Name: audit_trail_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE audit_trail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.audit_trail_id_seq OWNER TO ong;

--
-- Name: audit_trail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE audit_trail_id_seq OWNED BY audit_trail.id;


--
-- Name: audit_trail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('audit_trail_id_seq', 10, true);


--
-- Name: busunit; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE busunit (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    tradename character varying(100),
    doctaxnumber character varying(20),
    phone character varying(16),
    address character varying(150),
    addressnumber character varying(6),
    addressdetails character varying(150),
    postalcode character varying(9),
    website character varying(255),
    city_id integer,
    appaccount_id bigint NOT NULL,
    head smallint DEFAULT 0 NOT NULL,
    district character varying(50)
);


ALTER TABLE public.busunit OWNER TO ong;

--
-- Name: TABLE busunit; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON TABLE busunit IS 'Headquarter / Branch / Head Office
Only one "main" unit may exist, this will have a relation with appaccount, all other will be child of it';


--
-- Name: COLUMN busunit.doctaxnumber; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN busunit.doctaxnumber IS 'This is the document id - Tax Number (USA), CNPJ (Brasil), CPF (Brasil Pessoa Física)';


--
-- Name: COLUMN busunit.website; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN busunit.website IS 'This is the main url to access in web';


--
-- Name: COLUMN busunit.head; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN busunit.head IS 'Indicates the Headquarter or Head office unit of the app account. Only one is allowed for app account';


--
-- Name: busunit_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE busunit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.busunit_id_seq OWNER TO ong;

--
-- Name: busunit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE busunit_id_seq OWNED BY busunit.id;


--
-- Name: busunit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('busunit_id_seq', 3, true);


--
-- Name: city; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE city (
    id integer NOT NULL,
    name character varying(70) NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.city OWNER TO ong;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO ong;

--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('city_id_seq', 22, true);


--
-- Name: city_region_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE city_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.city_region_id_seq OWNER TO ong;

--
-- Name: city_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('city_region_id_seq', 42, true);


--
-- Name: city_region; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE city_region (
    id bigint DEFAULT nextval('city_region_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    city_id integer NOT NULL,
    parent_id bigint
);


ALTER TABLE public.city_region OWNER TO ong;

--
-- Name: country; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE country (
    id smallint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.country OWNER TO ong;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO ong;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE country_id_seq OWNED BY country.id;


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('country_id_seq', 1, true);


--
-- Name: employee; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE employee (
    id bigint NOT NULL,
    registration_number character varying(20),
    busunit_id integer NOT NULL,
    job_function_id smallint NOT NULL
);


ALTER TABLE public.employee OWNER TO ong;

--
-- Name: expertise_area; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE expertise_area (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(400) NOT NULL,
    appaccount_id bigint NOT NULL
);


ALTER TABLE public.expertise_area OWNER TO ong;

--
-- Name: TABLE expertise_area; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON TABLE expertise_area IS 'Expertise, knowledge, specialization area';


--
-- Name: expertise_area_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE expertise_area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.expertise_area_id_seq OWNER TO ong;

--
-- Name: expertise_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE expertise_area_id_seq OWNED BY expertise_area.id;


--
-- Name: expertise_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('expertise_area_id_seq', 6, true);


--
-- Name: job_function; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE job_function (
    id smallint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(400),
    appaccount_id bigint NOT NULL
);


ALTER TABLE public.job_function OWNER TO ong;

--
-- Name: TABLE job_function; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON TABLE job_function IS 'Describe the job function in a company for persons';


--
-- Name: job_function_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE job_function_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.job_function_id_seq OWNER TO ong;

--
-- Name: job_function_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE job_function_id_seq OWNED BY job_function.id;


--
-- Name: job_function_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('job_function_id_seq', 16, true);


--
-- Name: media; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE media (
    id bigint NOT NULL,
    title character varying(140) DEFAULT 'No title specified'::character varying NOT NULL,
    file character varying(140) NOT NULL,
    filesize bigint NOT NULL,
    mimetype character varying(50) NOT NULL
);


ALTER TABLE public.media OWNER TO ong;

--
-- Name: COLUMN media.file; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN media.file IS 'The name and extension of the file: user-1.png';


--
-- Name: COLUMN media.filesize; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN media.filesize IS 'The size in bytes of the file';


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO ong;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE media_id_seq OWNED BY media.id;


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('media_id_seq', 37, true);


--
-- Name: person; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE person (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    created timestamp without time zone NOT NULL,
    appaccount_id bigint NOT NULL,
    address character varying(150),
    addressdetails character varying(150),
    addressnumber character(6),
    city_id integer,
    mobilephone character(16),
    phone character(16),
    postalcode character(9),
    website character varying(255),
    email character varying(255),
    gender character(1) NOT NULL,
    birthdate date,
    city_region_id bigint,
    marital_status character varying(12)
);


ALTER TABLE public.person OWNER TO ong;

--
-- Name: TABLE person; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON TABLE person IS 'The Person (customer, client, vendor, fabricant, employe, student, user) basic data.
It''s tight related to user table';


--
-- Name: COLUMN person.marital_status; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person.marital_status IS 'single, married, widow(er), separeted, stable union';


--
-- Name: person_docs; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE person_docs (
    id bigint NOT NULL,
    identitycard character varying(20),
    individualdoctaxnumber character varying(20),
    birthcertificate character varying(30),
    professionalcard character varying(20),
    driverslicense character varying(20),
    voterregistration character varying(20),
    militaryregistration character varying(30),
    healthsystemcard character varying(20)
);


ALTER TABLE public.person_docs OWNER TO ong;

--
-- Name: COLUMN person_docs.identitycard; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_docs.identitycard IS 'RG - Brasil';


--
-- Name: COLUMN person_docs.individualdoctaxnumber; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_docs.individualdoctaxnumber IS 'CPF - Brasil';


--
-- Name: COLUMN person_docs.birthcertificate; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_docs.birthcertificate IS 'Certificado de Nascimento - Brasil';


--
-- Name: COLUMN person_docs.professionalcard; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_docs.professionalcard IS 'Carteira Profissional - Brasil';


--
-- Name: COLUMN person_docs.driverslicense; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_docs.driverslicense IS 'Carteira de Motorista - Brasil';


--
-- Name: COLUMN person_docs.voterregistration; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_docs.voterregistration IS 'Título de Eleitor - Brasil';


--
-- Name: COLUMN person_docs.militaryregistration; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_docs.militaryregistration IS 'Carteira de Reservista - Brasil';


--
-- Name: COLUMN person_docs.healthsystemcard; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_docs.healthsystemcard IS 'Cartão do SUS - Brasil';


--
-- Name: person_helped; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE person_helped (
    id bigint NOT NULL,
    religion character varying(100),
    professional_occupation character varying(100) NOT NULL,
    professional_experience character varying(400) NOT NULL,
    live_with_family boolean NOT NULL,
    home_situation character varying(50) NOT NULL,
    home_since date NOT NULL,
    born_city_id integer NOT NULL,
    born_state_id integer NOT NULL,
    home_area character varying(50) NOT NULL,
    home_type character varying(50) NOT NULL,
    home_pieces_number smallint NOT NULL,
    rent_value numeric(10,2),
    first_help_date date
);


ALTER TABLE public.person_helped OWNER TO ong;

--
-- Name: TABLE person_helped; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON TABLE person_helped IS 'Data of person helped by non profit org';


--
-- Name: COLUMN person_helped.id; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_helped.id IS 'Person id';


--
-- Name: COLUMN person_helped.professional_occupation; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_helped.professional_occupation IS 'Seted by app as: Retired, Rural Worker, Unemployed, City Worker, Another (described)';


--
-- Name: COLUMN person_helped.home_situation; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_helped.home_situation IS 'Specified in app as: Owner, Rent, Mortgage, Present, Invasion, Other(describe)';


--
-- Name: COLUMN person_helped.home_area; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_helped.home_area IS 'Described in app as: Urban, Rural, Island, Quilombo, Indian';


--
-- Name: COLUMN person_helped.home_type; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN person_helped.home_type IS 'Spcifeid in app as: Brick, Adobe, Wood, Another(describe)';


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO ong;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('person_id_seq', 1286, true);


--
-- Name: person_media; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE person_media (
    person_id bigint NOT NULL,
    media_id bigint NOT NULL
);


ALTER TABLE public.person_media OWNER TO ong;

--
-- Name: project; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE project (
    id bigint NOT NULL,
    name character varying(60) NOT NULL,
    startdateexpected date,
    abstract character varying(1200) NOT NULL,
    fulldescription text,
    appaccount_id bigint NOT NULL,
    startdatereal date,
    finishdatereal date,
    finishdateexpected date
);


ALTER TABLE public.project OWNER TO ong;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO ong;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE project_id_seq OWNED BY project.id;


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('project_id_seq', 2, true);


--
-- Name: state; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE state (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    country_id smallint NOT NULL,
    abbreviation character(2) NOT NULL
);


ALTER TABLE public.state OWNER TO ong;

--
-- Name: TABLE state; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON TABLE state IS 'State of a Country';


--
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.state_id_seq OWNER TO ong;

--
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE state_id_seq OWNED BY state.id;


--
-- Name: state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('state_id_seq', 28, true);


--
-- Name: task_type; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE task_type (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    description character varying(1200),
    parent_id integer,
    appaccount_id bigint NOT NULL
);


ALTER TABLE public.task_type OWNER TO ong;

--
-- Name: task_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE task_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.task_type_id_seq OWNER TO ong;

--
-- Name: task_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE task_type_id_seq OWNED BY task_type.id;


--
-- Name: task_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('task_type_id_seq', 58, true);


--
-- Name: user; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    email character varying(255) NOT NULL,
    pwd character(32) NOT NULL,
    created timestamp without time zone NOT NULL,
    last_login timestamp without time zone,
    status smallint NOT NULL,
    rnd_salt character varying(32) NOT NULL,
    person_id bigint NOT NULL,
    appaccount_id bigint NOT NULL,
    acl_role_id integer
);


ALTER TABLE public."user" OWNER TO ong;

--
-- Name: TABLE "user"; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON TABLE "user" IS 'User of the system';


--
-- Name: COLUMN "user".status; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN "user".status IS 'Status of the user account. 

-1 	= Blocked
0 	= Not yet activated
1	= Active';


--
-- Name: COLUMN "user".rnd_salt; Type: COMMENT; Schema: public; Owner: ong
--

COMMENT ON COLUMN "user".rnd_salt IS 'Randomic salt to generate the encripted password with MD5';


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: ong
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO ong;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ong
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ong
--

SELECT pg_catalog.setval('user_id_seq', 7, true);


--
-- Name: v_Employee; Type: VIEW; Schema: public; Owner: ong
--

CREATE VIEW "v_Employee" AS
    SELECT p.id, p.name, p.created, p.appaccount_id, p.address, p.addressdetails, p.addressnumber, p.city_id, p.mobilephone, p.phone, p.postalcode, p.website, p.email, p.gender, p.birthdate, p.city_region_id, e.busunit_id, e.registration_number, e.job_function_id FROM (person p JOIN employee e ON ((p.id = e.id)));


ALTER TABLE public."v_Employee" OWNER TO ong;

--
-- Name: volunteer; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE volunteer (
    id bigint NOT NULL
);


ALTER TABLE public.volunteer OWNER TO ong;

--
-- Name: v_Volunteer; Type: VIEW; Schema: public; Owner: ong
--

CREATE VIEW "v_Volunteer" AS
    SELECT p.id, p.name, p.created, p.appaccount_id, p.address, p.addressdetails, p.addressnumber, p.city_id, p.mobilephone, p.phone, p.postalcode, p.website, p.email, p.gender, p.birthdate, p.city_region_id FROM (person p JOIN volunteer v ON ((p.id = v.id)));


ALTER TABLE public."v_Volunteer" OWNER TO ong;

--
-- Name: v_person_helped; Type: VIEW; Schema: public; Owner: ong
--

CREATE VIEW v_person_helped AS
    SELECT p.id, p.name, p.created, p.appaccount_id, p.address, p.addressdetails, p.addressnumber, p.city_id, p.mobilephone, p.phone, p.postalcode, p.website, p.email, p.gender, p.birthdate, p.city_region_id, p.marital_status, ph.religion, ph.professional_occupation, ph.professional_experience, ph.live_with_family, ph.home_situation, ph.home_since, ph.born_city_id, ph.born_state_id, ph.home_area, ph.home_type, ph.home_pieces_number, ph.rent_value FROM (person p JOIN person_helped ph ON ((p.id = ph.id)));


ALTER TABLE public.v_person_helped OWNER TO ong;

--
-- Name: volunteer_expertise_area; Type: TABLE; Schema: public; Owner: ong; Tablespace: 
--

CREATE TABLE volunteer_expertise_area (
    volunteer_id bigint NOT NULL,
    expertise_area_id integer NOT NULL
);


ALTER TABLE public.volunteer_expertise_area OWNER TO ong;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY acl_role ALTER COLUMN id SET DEFAULT nextval('acl_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY acl_role_permission ALTER COLUMN id SET DEFAULT nextval('acl_role_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY appaccount ALTER COLUMN id SET DEFAULT nextval('appaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY audit_trail ALTER COLUMN id SET DEFAULT nextval('audit_trail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY busunit ALTER COLUMN id SET DEFAULT nextval('busunit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY country ALTER COLUMN id SET DEFAULT nextval('country_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY expertise_area ALTER COLUMN id SET DEFAULT nextval('expertise_area_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY job_function ALTER COLUMN id SET DEFAULT nextval('job_function_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY media ALTER COLUMN id SET DEFAULT nextval('media_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY state ALTER COLUMN id SET DEFAULT nextval('state_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY task_type ALTER COLUMN id SET DEFAULT nextval('task_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ong
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: acl_role; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO acl_role VALUES (1, 'Super Administradores', 1);
INSERT INTO acl_role VALUES (2, 'Administrador', 1);
INSERT INTO acl_role VALUES (3, 'Gerente', 1);
INSERT INTO acl_role VALUES (4, 'Lançar Cadastros', 1);


--
-- Data for Name: acl_role_permission; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO acl_role_permission VALUES (43, 'User', 'view', 1);
INSERT INTO acl_role_permission VALUES (44, 'User', 'list', 1);
INSERT INTO acl_role_permission VALUES (45, 'User', 'create', 1);
INSERT INTO acl_role_permission VALUES (46, 'User', 'update', 1);
INSERT INTO acl_role_permission VALUES (47, 'User', 'update-pwd', 1);
INSERT INTO acl_role_permission VALUES (48, 'User', 'delete', 1);
INSERT INTO acl_role_permission VALUES (49, 'UserRole', 'view', 1);
INSERT INTO acl_role_permission VALUES (50, 'UserRole', 'list', 1);
INSERT INTO acl_role_permission VALUES (51, 'UserRole', 'create', 1);
INSERT INTO acl_role_permission VALUES (52, 'UserRole', 'update', 1);
INSERT INTO acl_role_permission VALUES (53, 'UserRole', 'delete', 1);
INSERT INTO acl_role_permission VALUES (54, 'BusinessUnitHeadquarters', 'view', 1);
INSERT INTO acl_role_permission VALUES (55, 'BusinessUnitHeadquarters', 'update', 1);
INSERT INTO acl_role_permission VALUES (56, 'BusinessUnitBranchs', 'view', 1);
INSERT INTO acl_role_permission VALUES (57, 'BusinessUnitBranchs', 'list', 1);
INSERT INTO acl_role_permission VALUES (58, 'BusinessUnitBranchs', 'create', 1);
INSERT INTO acl_role_permission VALUES (59, 'BusinessUnitBranchs', 'update', 1);
INSERT INTO acl_role_permission VALUES (60, 'BusinessUnitBranchs', 'delete', 1);
INSERT INTO acl_role_permission VALUES (61, 'AppAccount', 'view', 1);
INSERT INTO acl_role_permission VALUES (62, 'AppAccount', 'update', 1);
INSERT INTO acl_role_permission VALUES (63, 'User', 'view', 2);
INSERT INTO acl_role_permission VALUES (64, 'User', 'list', 2);
INSERT INTO acl_role_permission VALUES (65, 'UserRole', 'view', 2);
INSERT INTO acl_role_permission VALUES (66, 'UserRole', 'list', 2);
INSERT INTO acl_role_permission VALUES (67, 'BusinessUnitHeadquarters', 'view', 2);
INSERT INTO acl_role_permission VALUES (68, 'BusinessUnitHeadquarters', 'update', 2);
INSERT INTO acl_role_permission VALUES (69, 'BusinessUnitBranchs', 'view', 2);
INSERT INTO acl_role_permission VALUES (70, 'BusinessUnitBranchs', 'list', 2);
INSERT INTO acl_role_permission VALUES (71, 'BusinessUnitBranchs', 'create', 2);
INSERT INTO acl_role_permission VALUES (72, 'BusinessUnitBranchs', 'update', 2);
INSERT INTO acl_role_permission VALUES (73, 'BusinessUnitBranchs', 'delete', 2);
INSERT INTO acl_role_permission VALUES (74, 'AppAccount', 'view', 2);
INSERT INTO acl_role_permission VALUES (75, 'User', 'view', 3);
INSERT INTO acl_role_permission VALUES (76, 'User', 'list', 3);
INSERT INTO acl_role_permission VALUES (77, 'UserRole', 'view', 3);
INSERT INTO acl_role_permission VALUES (78, 'UserRole', 'list', 3);
INSERT INTO acl_role_permission VALUES (79, 'BusinessUnitHeadquarters', 'view', 3);
INSERT INTO acl_role_permission VALUES (80, 'BusinessUnitHeadquarters', 'update', 3);
INSERT INTO acl_role_permission VALUES (81, 'BusinessUnitBranchs', 'view', 3);
INSERT INTO acl_role_permission VALUES (82, 'BusinessUnitBranchs', 'list', 3);
INSERT INTO acl_role_permission VALUES (83, 'BusinessUnitBranchs', 'create', 3);
INSERT INTO acl_role_permission VALUES (84, 'BusinessUnitBranchs', 'update', 3);
INSERT INTO acl_role_permission VALUES (85, 'AppAccount', 'view', 3);
INSERT INTO acl_role_permission VALUES (86, 'BusinessUnitHeadquarters', 'view', 4);
INSERT INTO acl_role_permission VALUES (87, 'BusinessUnitBranchs', 'view', 4);
INSERT INTO acl_role_permission VALUES (88, 'BusinessUnitBranchs', 'list', 4);


--
-- Data for Name: appaccount; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO appaccount VALUES (1, 'Ministério Melhor Viver', 'jeliseumontes@hotmail.com', '2012-12-18 16:12:04');


--
-- Data for Name: audit_trail; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO audit_trail VALUES (1, 1, 'appaccount', 'name', '2012-12-18 18:32:31', 'UPD', 1, ' ', 1, 'Winponta Software');
INSERT INTO audit_trail VALUES (2, 1, 'appaccount', 'email', '2012-12-18 18:32:31', 'UPD', 1, ' ', 1, 'admin@winponta.com.br');
INSERT INTO audit_trail VALUES (3, 1, 'appaccount', 'email', '2012-12-18 18:33:06', 'UPD', 1, ' ', 1, 'pastorjoao@gmail.com');
INSERT INTO audit_trail VALUES (4, 2, 'user', 'name', '2012-12-19 13:56:00', 'UPD', 1, ' ', 1, 'joao2');
INSERT INTO audit_trail VALUES (5, 3, 'user', 'name', '2012-12-19 13:59:07', 'UPD', 1, ' ', 1, 'silvana3');
INSERT INTO audit_trail VALUES (6, 4, 'user', 'name', '2012-12-19 14:01:17', 'UPD', 1, ' ', 1, 'ana4');
INSERT INTO audit_trail VALUES (7, 5, 'user', 'name', '2012-12-19 14:03:02', 'UPD', 1, ' ', 1, 'carolina5');
INSERT INTO audit_trail VALUES (8, 6, 'user', 'name', '2012-12-19 14:04:49', 'UPD', 1, ' ', 1, 'emanuely6');
INSERT INTO audit_trail VALUES (9, 7, 'user', 'name', '2013-08-30 16:33:05', 'UPD', 1, ' ', 1, 'john97');
INSERT INTO audit_trail VALUES (10, 7, 'user', 'email', '2013-08-30 16:33:05', 'UPD', 1, ' ', 1, 'john97@no.validemail.com');


--
-- Data for Name: busunit; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO busunit VALUES (1, 'Ministério Melhor Viver', 'Ministério Melhor Viver', '07.223.960/0001-60', '(42) 3223-9414', 'R. Herculano de Freitas', '751', '', '84015-105', 'http://www.ministeriomelhorviver.com.br', 1, 1, 1, 'Jd Carvalho');
INSERT INTO busunit VALUES (2, 'Comunidade Terapêutica Melhor Viver', '', '07.223.960/0001-60', '(42) 3243-0139', 'Rua Neci Nunes Ferreira', 's/n', '', '', '', 1, 1, 0, 'Lagoa Dourada');
INSERT INTO busunit VALUES (3, 'Chacara Cidade dos santos', '', '07.223.960/0001-60', 'não possui', 'Rua Florestópulis', 's/n', '', '', '', 1, 1, 0, 'Cipa');


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO city VALUES (1, 'Ponta Grossa', 17);
INSERT INTO city VALUES (2, 'Castro', 17);
INSERT INTO city VALUES (3, 'Curitiba', 17);
INSERT INTO city VALUES (4, 'Carambeí', 17);
INSERT INTO city VALUES (5, 'Palmeira', 17);
INSERT INTO city VALUES (6, 'paranavai', 17);
INSERT INTO city VALUES (7, 'Cocos', 5);
INSERT INTO city VALUES (8, 'Bauru', 26);
INSERT INTO city VALUES (9, 'tibagi', 17);
INSERT INTO city VALUES (10, 'telemaco borba', 17);
INSERT INTO city VALUES (11, 'sao paulo', 26);
INSERT INTO city VALUES (12, 'Jaguariaiva', 17);
INSERT INTO city VALUES (13, 'Ortigueira', 17);
INSERT INTO city VALUES (14, 'Uruguaiana', 22);
INSERT INTO city VALUES (15, 'Londrina', 17);
INSERT INTO city VALUES (16, 'Prudentopulis', 17);
INSERT INTO city VALUES (17, 'Ipirang', 17);
INSERT INTO city VALUES (18, 'Marechal Candido Rondom', 17);
INSERT INTO city VALUES (19, 'Joinville', 25);
INSERT INTO city VALUES (20, 'Guarapuava', 17);
INSERT INTO city VALUES (21, 'São João do Ivai', 17);
INSERT INTO city VALUES (22, 'São José dos Pinhais', 16);


--
-- Data for Name: city_region; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO city_region VALUES (1, 'Centro', 1, NULL);
INSERT INTO city_region VALUES (2, 'Parque Ambiental', 1, 1);
INSERT INTO city_region VALUES (3, 'Cipa', 1, NULL);
INSERT INTO city_region VALUES (4, 'Jardim Carvalho', 1, NULL);
INSERT INTO city_region VALUES (5, 'Uvaranas', 1, NULL);
INSERT INTO city_region VALUES (6, 'Lagoa Dourada', 1, 5);
INSERT INTO city_region VALUES (7, 'Boa Vista', 1, NULL);
INSERT INTO city_region VALUES (8, 'Nova Russia', 4, NULL);
INSERT INTO city_region VALUES (9, 'Oficinas', 1, NULL);
INSERT INTO city_region VALUES (10, 'Praça dos Polacos', 1, 1);
INSERT INTO city_region VALUES (11, '31 de março', 1, 5);
INSERT INTO city_region VALUES (12, 'Vila estrela', 1, 9);
INSERT INTO city_region VALUES (13, 'Cel.Claudio', 1, 5);
INSERT INTO city_region VALUES (14, 'Pns das grassas', 1, 7);
INSERT INTO city_region VALUES (15, 'Sta Terezinha', 5, NULL);
INSERT INTO city_region VALUES (16, 'sabara', 1, 7);
INSERT INTO city_region VALUES (17, 'pimentel', 1, 5);
INSERT INTO city_region VALUES (18, 'lelila maria', 1, 7);
INSERT INTO city_region VALUES (19, 'loteamento cachoeira', 1, 6);
INSERT INTO city_region VALUES (20, 'Ronda', 1, 1);
INSERT INTO city_region VALUES (21, 'Santa paula', 1, 1);
INSERT INTO city_region VALUES (23, 'Vilela', 1, 1);
INSERT INTO city_region VALUES (24, 'Vila Liane', 1, NULL);
INSERT INTO city_region VALUES (25, 'Rio Verde', 1, NULL);
INSERT INTO city_region VALUES (26, 'Nossa Senhora dgss', 8, NULL);
INSERT INTO city_region VALUES (27, 'Sao jose', 1, NULL);
INSERT INTO city_region VALUES (28, 'Estrela do Lago', 1, NULL);
INSERT INTO city_region VALUES (29, 'Vila Rio Branco', 1, NULL);
INSERT INTO city_region VALUES (30, 'Baronesa', 1, NULL);
INSERT INTO city_region VALUES (22, 'Nova rusia', 1, 8);
INSERT INTO city_region VALUES (31, 'Palmeirinha', 1, 7);
INSERT INTO city_region VALUES (32, 'Santo Antonio', 1, NULL);
INSERT INTO city_region VALUES (33, 'Olarias', 1, 9);
INSERT INTO city_region VALUES (34, 'Jardim Cachoeira', 1, NULL);
INSERT INTO city_region VALUES (35, 'Vila Margarida', 1, NULL);
INSERT INTO city_region VALUES (36, 'Santa Maria', 1, NULL);
INSERT INTO city_region VALUES (37, 'Congonhas', 1, NULL);
INSERT INTO city_region VALUES (38, 'Cloris', 1, NULL);
INSERT INTO city_region VALUES (39, 'Recanto Verde', 1, NULL);
INSERT INTO city_region VALUES (40, 'Vila rio Branco', 1, 9);
INSERT INTO city_region VALUES (41, 'Cara-Cara', 1, 1);
INSERT INTO city_region VALUES (42, 'Mariana', 1, NULL);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO country VALUES (1, 'Brasil');


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO employee VALUES (6, '', 1, 2);
INSERT INTO employee VALUES (3, '7', 1, 1);
INSERT INTO employee VALUES (5, '2', 1, 1);
INSERT INTO employee VALUES (2, '00', 1, 3);
INSERT INTO employee VALUES (13, '1', 1, 9);
INSERT INTO employee VALUES (14, '2', 2, 10);
INSERT INTO employee VALUES (15, '3', 1, 11);
INSERT INTO employee VALUES (16, '4', 2, 12);
INSERT INTO employee VALUES (17, '5', 1, 12);
INSERT INTO employee VALUES (18, '6', 2, 12);
INSERT INTO employee VALUES (22, '8', 2, 6);
INSERT INTO employee VALUES (23, '9', 2, 4);
INSERT INTO employee VALUES (24, '10', 2, 13);
INSERT INTO employee VALUES (26, '12', 2, 12);
INSERT INTO employee VALUES (27, '13', 2, 12);
INSERT INTO employee VALUES (28, '14', 2, 12);
INSERT INTO employee VALUES (29, '15', 2, 14);
INSERT INTO employee VALUES (30, '16', 2, 1);
INSERT INTO employee VALUES (31, '17', 2, 11);
INSERT INTO employee VALUES (32, '18', 2, 11);
INSERT INTO employee VALUES (33, '19', 2, 15);
INSERT INTO employee VALUES (34, '20', 2, 16);
INSERT INTO employee VALUES (35, '21', 1, 12);
INSERT INTO employee VALUES (36, '22', 1, 8);
INSERT INTO employee VALUES (37, '23', 1, 6);
INSERT INTO employee VALUES (38, '24', 1, 6);
INSERT INTO employee VALUES (39, '25', 3, 12);
INSERT INTO employee VALUES (40, '26', 1, 4);
INSERT INTO employee VALUES (41, '27', 1, 8);
INSERT INTO employee VALUES (42, '28', 1, 7);
INSERT INTO employee VALUES (43, '29', 1, 10);


--
-- Data for Name: expertise_area; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO expertise_area VALUES (1, 'Professor de Informática', 'Aulas de Informática básica', 1);
INSERT INTO expertise_area VALUES (2, 'Professor de Alfabetizaçao', '', 1);
INSERT INTO expertise_area VALUES (3, 'Cozinheiro', '', 1);
INSERT INTO expertise_area VALUES (4, 'Professora de Artesanato', '', 1);
INSERT INTO expertise_area VALUES (5, 'Assistente Social', '', 1);
INSERT INTO expertise_area VALUES (6, 'Administrador de Informática', 'Lança cadastros e administra o programa de informática.', 1);


--
-- Data for Name: job_function; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO job_function VALUES (1, 'Assistente Social', '', 1);
INSERT INTO job_function VALUES (3, 'Presidente', '', 1);
INSERT INTO job_function VALUES (2, 'Estagiário(a) - Auxiliar Administrativo', '', 1);
INSERT INTO job_function VALUES (4, 'Motorista', '', 1);
INSERT INTO job_function VALUES (5, 'Atendente Social', '', 1);
INSERT INTO job_function VALUES (6, 'Coordenador de Unidade', '', 1);
INSERT INTO job_function VALUES (7, 'Pedreiro', '', 1);
INSERT INTO job_function VALUES (8, 'Agente de abordagem', '', 1);
INSERT INTO job_function VALUES (9, 'Diretor (a) de unidade', '', 1);
INSERT INTO job_function VALUES (10, 'Psicólogo (a)', '', 1);
INSERT INTO job_function VALUES (11, 'Cozinheira', '', 1);
INSERT INTO job_function VALUES (12, 'Educador Social', '', 1);
INSERT INTO job_function VALUES (13, 'Prof. Ed. Física', '', 1);
INSERT INTO job_function VALUES (14, 'Auxiliar Administrativo', '', 1);
INSERT INTO job_function VALUES (15, 'Gestor Financeiro', '', 1);
INSERT INTO job_function VALUES (16, 'Zeladora', '', 1);


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO media VALUES (2, 'person_20', '7de4490b8998d6957f133a7d082a4bc0.jpg', 42940, 'application/octet-stream');
INSERT INTO media VALUES (3, 'person_25', 'b784fa7d9d17aca3061dd0a4fa5fc4bc.jpg', 160698, 'application/octet-stream');
INSERT INTO media VALUES (4, 'person_5', '4b770bc6ec98eb43edb3203b19550b47.jpg', 150725, 'application/octet-stream');
INSERT INTO media VALUES (5, 'person_13', 'caaff667d661320df7721397c5870e51.jpg', 73915, 'application/octet-stream');
INSERT INTO media VALUES (6, 'person_14', 'dc443a09b4909bd4ea1e2c41cdd62179.jpg', 164015, 'application/octet-stream');
INSERT INTO media VALUES (7, 'person_15', '7cd5a5c090f2eb02784bbb27621ac0c2.jpg', 22939, 'application/octet-stream');
INSERT INTO media VALUES (8, 'person_17', '5dd512bef04a99f0f6cf8ed560b93325.jpg', 44558, 'application/octet-stream');
INSERT INTO media VALUES (9, 'person_3', '758acc90eb6d8cc9d2d9a5f795ea3432.jpg', 119533, 'application/octet-stream');
INSERT INTO media VALUES (10, 'person_37', 'c10b1716c0e48ac2d312a89604452824.jpg', 96171, 'application/octet-stream');
INSERT INTO media VALUES (11, 'person_38', 'dd6a5ed90d2c081bb7a8f1d33a370590.jpg', 21008, 'application/octet-stream');
INSERT INTO media VALUES (13, 'person_48', '333138af2224b8d6fef6830bd8b3653e.png', 127999, 'application/octet-stream');
INSERT INTO media VALUES (1, 'person_6', 'fe2711c7945c7a095d22f2febe8bd992.jpg', 377198, 'application/octet-stream');
INSERT INTO media VALUES (12, 'person_97', '2a70518eaaf44d81aabb6302c7542d22.jpg', 23067, 'application/octet-stream');
INSERT INTO media VALUES (14, 'person_115', '5e74b98383d1620605d866abebcff78a.png', 143329, 'application/octet-stream');
INSERT INTO media VALUES (15, 'person_109', 'c71903fb3d9ef81a69c62b280c09b38f.png', 123745, 'application/octet-stream');
INSERT INTO media VALUES (16, 'person_70', '16bbd35dc4c4e2ee546cb0e7fd68c880.png', 139953, 'application/octet-stream');
INSERT INTO media VALUES (17, 'person_67', '5d3151772c2558dede2789946bc2621a.png', 117959, 'application/octet-stream');
INSERT INTO media VALUES (19, 'person_71', '15f342e0fc14ae164cbc18c0ce8d751b.png', 106454, 'application/octet-stream');
INSERT INTO media VALUES (20, 'person_54', '3a07cbcd264f4b1fcbbd93cd13ecb461.png', 131523, 'application/octet-stream');
INSERT INTO media VALUES (21, 'person_128', '6822b93e786c625b062e8f85c5ecc081.png', 121359, 'application/octet-stream');
INSERT INTO media VALUES (22, 'person_127', 'e0132ea418d4e5faa406bc472d5d054a.png', 122842, 'application/octet-stream');
INSERT INTO media VALUES (23, 'person_574', '9d7f4ece29a0dd213ba6937cbe915089.png', 111232, 'application/octet-stream');
INSERT INTO media VALUES (24, 'person_103', '39623218e04957adfb59d5bf4cc6c31d.png', 125467, 'application/octet-stream');
INSERT INTO media VALUES (18, 'person_974', '93885fb86a6eede7bc666deaf54328e4.png', 123905, 'application/octet-stream');
INSERT INTO media VALUES (25, 'person_117', 'ee7e798769b1404d1ddf62542f4dbc14.png', 118336, 'application/octet-stream');
INSERT INTO media VALUES (26, 'person_98', 'bd8425318c62f515b7d70e7976f21b05.png', 118787, 'application/octet-stream');
INSERT INTO media VALUES (27, 'person_72', '1389de81c144d0e90a6408bf3d33fd91.png', 116002, 'application/octet-stream');
INSERT INTO media VALUES (28, 'person_753', '951624a605e7aa348c31491cfcbafd04.png', 138790, 'application/octet-stream');
INSERT INTO media VALUES (29, 'person_118', '370eb7462c9da2deb33b990ed649d857.png', 116114, 'application/octet-stream');
INSERT INTO media VALUES (30, 'person_978', 'c4077ed3293579a50779b12e482e986e.png', 128364, 'application/octet-stream');
INSERT INTO media VALUES (31, 'person_60', '7b05c1e7935e291f4c1eb45231a7f64b.png', 130701, 'application/octet-stream');
INSERT INTO media VALUES (32, 'person_122', '2bbe9e6c79ea2002f77e9cfed72143d7.png', 131713, 'application/octet-stream');
INSERT INTO media VALUES (33, 'person_126', '74ac57267c18cfe109cf05b1cdf25e60.png', 121708, 'application/octet-stream');
INSERT INTO media VALUES (34, 'person_124', '8b66916214585fd21ce824a0ca8e9671.png', 127091, 'application/octet-stream');
INSERT INTO media VALUES (35, 'person_132', '0903ad92488e86f33a320cdbcfe2d104.png', 132733, 'application/octet-stream');
INSERT INTO media VALUES (36, 'person_1047', '333138af2224b8d6fef6830bd8b3653e.png', 127999, 'application/octet-stream');
INSERT INTO media VALUES (37, 'person_46', 'c71903fb3d9ef81a69c62b280c09b38f.png', 123745, 'application/octet-stream');


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO person VALUES (2, 'João Eliseu Montes', '2012-12-19 13:12:22', 1, '', '', '      ', 1, '                ', '                ', '         ', '', 'jeliseumontes@hotmail.com', 'm', NULL, NULL, NULL);
INSERT INTO person VALUES (3, 'Silvana Mayer Moro', '2012-12-19 13:12:23', 1, '', '', '      ', 1, '                ', '                ', '         ', '', 'silvanammoro@hotmail.com', 'm', NULL, NULL, NULL);
INSERT INTO person VALUES (41, 'Patrick Fernando Osga', '2013-05-22 16:05:11', 1, 'Rua Herculano de Freitas', '', '743   ', 1, '                ', '                ', '84015105 ', '', '', 'm', NULL, 4, 'married');
INSERT INTO person VALUES (5, 'Carolina Ribeiro Saraiva Muniz', '2012-12-19 14:12:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', 'carolruiva21@hotmail.com', 'f', NULL, NULL, NULL);
INSERT INTO person VALUES (7, 'Teste', '2012-12-19 14:12:39', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', NULL, NULL, NULL);
INSERT INTO person VALUES (42, 'Sebastião Henrique Carneiro', '2013-05-22 16:05:17', 1, 'Rua Florestópulis', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', NULL, 3, 'single');
INSERT INTO person VALUES (1, 'Ademir Mazer Jr', '2012-12-18 16:12:04', 1, '', '', '      ', 1, '42 - 9135.5005  ', '                ', '         ', '', 'ademir@winponta.com.br', 'm', '1974-07-17', NULL, 'married');
INSERT INTO person VALUES (12, 'Francelis Garcia', '2013-05-10 17:05:42', 1, 'Rua Francisco Ribas', '', '1194  ', 1, '(42)99617284    ', '(42) 33235188   ', '84015000 ', '', 'francelis-garcia@hotmail.com', 'f', '1977-10-04', 1, 'single');
INSERT INTO person VALUES (13, 'Ana Flavia Von Heimburg', '2013-05-15 16:05:11', 1, '', '', '      ', 1, '                ', '(42) 3028-8817  ', '         ', '', 'flaviaheimburg@hotmail.com', 'f', '1978-12-29', NULL, 'married');
INSERT INTO person VALUES (14, 'Ana Paula de Souza Pereira', '2013-05-15 16:05:02', 1, '', '', '      ', 1, '                ', '                ', '         ', '', 'anapauladream@yahoo.com.br', 'f', '1987-03-15', NULL, 'married');
INSERT INTO person VALUES (15, 'Carla Andressa de Lara', '2013-05-15 16:05:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1981-10-17', NULL, 'married');
INSERT INTO person VALUES (16, 'Sidnei Roberto scherer', '2013-05-15 16:05:35', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1964-05-30', NULL, 'separated');
INSERT INTO person VALUES (17, 'Cristiano dos Santos souza', '2013-05-15 16:05:01', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1981-11-24', NULL, 'married');
INSERT INTO person VALUES (18, 'Eder Otoni do Nascimento', '2013-05-15 16:05:15', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-05-31', NULL, 'married');
INSERT INTO person VALUES (20, 'Amadeu Rosa', '2013-05-15 17:05:40', 1, 'Rua Florestópulis', '', 's/n   ', 1, '                ', 'não possui      ', '         ', '', '', 'm', '1954-05-28', 3, 'single');
INSERT INTO person VALUES (21, 'Felipe Augusto Scarpim Cruz', '2013-05-22 14:05:07', 1, '', '', '      ', 1, '(42)            ', '(42)3243-0139   ', '         ', '', 'felipemelhorviver@gmail.com', 'm', '1983-06-24', NULL, 'married');
INSERT INTO person VALUES (22, 'Felipe Augusto Scarpim Cruz', '2013-05-22 14:05:10', 1, '', '', '      ', 1, '(42)            ', '(42)3243-0139   ', '         ', '', 'felipemelhorviver@gmail.com', 'm', '1983-06-24', NULL, 'married');
INSERT INTO person VALUES (23, 'Jairo Gaia', '2013-05-22 14:05:13', 1, '', '', '      ', 1, '(42)            ', '(42) 3243-0139  ', '         ', '', '', 'm', '1950-12-14', NULL, 'married');
INSERT INTO person VALUES (24, 'Jardel Aleixo', '2013-05-22 14:05:31', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', NULL, NULL, '');
INSERT INTO person VALUES (25, 'Jhonatan dos Santos Marques', '2013-05-22 14:05:06', 1, '', '', '      ', 1, '(42)            ', '(42) 3243-0139  ', '         ', '', '', 'm', '1989-11-06', NULL, 'married');
INSERT INTO person VALUES (26, 'Luiz Carlos araujo', '2013-05-22 14:05:21', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-09-01', NULL, '');
INSERT INTO person VALUES (27, 'Luiz Carlos Scudlarek', '2013-05-22 14:05:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1960-02-08', NULL, '');
INSERT INTO person VALUES (28, 'Luiz Fernando de Oliveira', '2013-05-22 15:05:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-05-27', NULL, '');
INSERT INTO person VALUES (29, 'Patrick de Lara Correia', '2013-05-22 15:05:15', 1, 'Rua Herculano de Freitads', '', '      ', 1, '(420 8839-0599  ', '(42) 3243-0139  ', '84015105 ', '', 'admcomunidadeterapeutica@hotmail.com', 'm', '1983-09-13', 4, 'single');
INSERT INTO person VALUES (30, 'Valéria Ferreira correia', '2013-05-22 15:05:03', 1, '', '', '      ', 1, '(42) 9919-9195  ', '(42)3243-0139   ', '         ', '', 'servicosocial_valeriaferreira@hotmail.com', 'f', '1989-08-26', NULL, 'single');
INSERT INTO person VALUES (31, 'Vanderleia de Oliveira', '2013-05-22 15:05:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1970-04-18', NULL, '');
INSERT INTO person VALUES (32, 'Cristiane Gomes dos Santos', '2013-05-22 15:05:05', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', NULL, NULL, '');
INSERT INTO person VALUES (33, 'Odino Moro Neto', '2013-05-22 15:05:57', 1, 'Rua Green Halg', '', '      ', 1, '(42) 9972-1952  ', '(42) 3223-9414  ', '         ', '', 'odinomoro@hotmail.com', 'm', '1967-10-19', NULL, 'married');
INSERT INTO person VALUES (34, 'Silvana da Silveira', '2013-05-22 15:05:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', NULL, NULL, '');
INSERT INTO person VALUES (35, 'Juliano Leitner', '2013-05-22 15:05:43', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '                ', '                ', '84015105 ', '', '', 'm', '1985-11-06', 4, 'single');
INSERT INTO person VALUES (36, 'Ladyani Pereira Rodrigues da Costa', '2013-05-22 15:05:05', 1, 'Rua Herculano de Freitas', '', '743   ', 1, '(42)9905-6270   ', '                ', '84015105 ', '', 'ladydedeus@hotamil.com', 'f', '1985-10-31', 4, 'married');
INSERT INTO person VALUES (37, 'Marcel de Geus', '2013-05-22 15:05:41', 1, 'Rua Prefeito José Hofman', '', '207   ', 1, '(42) 9135-7027  ', '(42) 3236-4038  ', '         ', '', 'mdegeus13@hotmail.com', 'm', '1977-06-10', NULL, 'married');
INSERT INTO person VALUES (39, 'Osmar Carneiro da Silva', '2013-05-22 16:05:35', 1, 'Rua florestópulis', '', 's/n   ', 1, 'não possui      ', 'não possui      ', '         ', '', 'não possui', 'm', '1952-12-23', 3, 'single');
INSERT INTO person VALUES (40, 'Manoel Bittencourt', '2013-05-22 16:05:46', 1, '', '', '      ', 1, '(42) 9971-7002  ', '                ', '         ', '', '', 'm', NULL, NULL, 'married');
INSERT INTO person VALUES (43, 'Lais Crissiane Rodrigues da Luz', '2013-05-22 16:05:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', NULL, 1, 'single');
INSERT INTO person VALUES (6, 'Emanuely Pitome', '2012-12-19 14:12:30', 1, 'Rua Alzemiro Lopes', '', '100   ', 1, '(42)9999-5857   ', '(42)3223-9414   ', '         ', '', 'emanuelypitome@hotmail.com', 'f', '1996-07-16', NULL, 'single');
INSERT INTO person VALUES (44, 'Anderson Machado dos Santos', '2013-05-23 14:05:14', 1, 'Rua Herculano de Freitas', '', '743   ', 1, '                ', '                ', '84015105 ', '', '', 'm', '1979-11-19', 4, 'single');
INSERT INTO person VALUES (45, 'Anderson Monteiro Bernardo', '2013-05-23 14:05:03', 1, 'Rua Herculano de Freitas', '', '743   ', 1, '                ', '                ', '84015105 ', '', '', 'm', '1988-10-28', 4, 'single');
INSERT INTO person VALUES (46, 'André Domingues Pinhove', '2013-05-23 14:05:14', 1, 'Rua Herculano de Freitas', '', '743   ', 1, '                ', '                ', '84015105 ', '', '', 'm', '1974-10-23', 4, 'separated');
INSERT INTO person VALUES (47, 'Karina Caroline Rodrigues Fiorin', '2013-05-23 14:05:09', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '                ', '                ', '84015105 ', '', '', 'f', '1985-06-16', 4, 'single');
INSERT INTO person VALUES (48, 'Anderson Machado dos Santos', '2013-06-17 15:06:31', 1, 'rua Herculano de Freitas', 'Jd Carvalho', '751   ', 1, 'não possui      ', 'não possui      ', '84015105 ', '', 'não possui', 'm', '1979-11-19', 4, 'single');
INSERT INTO person VALUES (49, 'Ari Marcos do Nascimento', '2013-06-17 16:06:17', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '                ', '                ', '84015105 ', '', '', 'm', '1976-11-06', 4, 'single');
INSERT INTO person VALUES (50, 'Dirceu José Pires', '2013-06-17 16:06:22', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '                ', '                ', '84015105 ', '', '', 'm', '1970-05-03', 4, 'single');
INSERT INTO person VALUES (51, 'Eliakim Ramos Pires', '2013-06-17 16:06:10', 1, 'rua Herculano de Freitas', '', '751   ', 1, '                ', '                ', '84015105 ', '', '', 'm', '1984-07-07', 4, 'married');
INSERT INTO person VALUES (52, 'Gileard Rafael Lacoski', '2013-06-19 11:06:51', 1, 'Rua Herculano de Freitas', '', '751   ', 1, 'não possui      ', '42 32239414     ', '840151005', 'não possui', 'não possui', 'm', '1981-08-09', 4, 'single');
INSERT INTO person VALUES (53, 'Josué de Almeida', '2013-06-19 11:06:11', 1, 'Rua Herculano de Freitas', '', '751   ', 1, 'não possui      ', '42 32239414     ', '84015105 ', '', 'não possui', 'm', '1981-07-22', 4, 'single');
INSERT INTO person VALUES (54, 'Juliano Leitner', '2013-06-19 11:06:51', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '42 99153864     ', '42 32239414     ', '84015105 ', '', 'não possui', 'm', '1985-11-06', 4, 'single');
INSERT INTO person VALUES (55, 'Ladyani Rodrigues Pereira Osga', '2013-06-19 11:06:25', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '42 99056270     ', '42 32239414     ', '84015105 ', '', 'ladydedeus@hotmail.com', 'm', '1985-10-31', 4, 'married');
INSERT INTO person VALUES (57, 'Milton de Oliveira', '2013-06-19 11:06:36', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '                ', '42 32239414     ', '84015105 ', '', 'não possui', 'm', '1957-02-01', 4, 'single');
INSERT INTO person VALUES (58, 'Nelson José Moraes', '2013-06-19 11:06:00', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '98281726        ', '42 32239414     ', '84015105 ', '', 'não possui', 'm', '1966-08-31', 4, 'separated');
INSERT INTO person VALUES (59, 'Rafael Martins Maciel', '2013-06-19 11:06:44', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '42 98226426     ', '                ', '84015105 ', '', 'r.a.f.amaciel@hotmail.com', 'm', '1983-09-21', 4, 'single');
INSERT INTO person VALUES (60, 'Valdecir Antunes Roth', '2013-06-19 11:06:48', 1, 'Rua Herculano de Freitas', '', '751   ', 1, 'não possui      ', '42 32239414     ', '84015105 ', '', 'não possui', 'm', '1974-07-17', 4, 'single');
INSERT INTO person VALUES (61, 'Valdomiro Lopes', '2013-06-19 11:06:13', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '42 99897915     ', '42 32239414     ', '84015105 ', '', 'não possui', 'm', '1976-05-15', 4, 'single');
INSERT INTO person VALUES (62, 'João Antonio Ramos', '2013-07-02 14:07:43', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015105 ', '', '', 'm', '1951-04-22', 4, 'widow(er)');
INSERT INTO person VALUES (38, 'Mauro Eduardo Hilgemberg', '2013-05-22 16:05:08', 1, 'rua Odino Moro', 'EM frente ao Espazio verde', 's/n   ', 1, '(42) 9146-0033  ', '(42) 3223-9414  ', '         ', '', 'eduhilgemberg@hotmail.com', 'm', '1984-02-07', NULL, 'married');
INSERT INTO person VALUES (63, 'Alecsandro Ponciano da Rocha', '2013-07-02 16:07:38', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1978-12-13', 4, 'single');
INSERT INTO person VALUES (64, 'Eduardo Eloy', '2013-07-02 16:07:41', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1986-06-02', 4, 'single');
INSERT INTO person VALUES (65, 'Everaldo Vinicius da Silva', '2013-07-02 16:07:22', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1973-07-28', 4, 'single');
INSERT INTO person VALUES (66, 'Jeferson Luiz Dummer', '2013-07-02 16:07:59', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1977-03-05', 4, 'separated');
INSERT INTO person VALUES (67, 'Israel Caldas Fortunato', '2013-07-02 16:07:30', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1972-07-05', 4, 'single');
INSERT INTO person VALUES (68, 'Valdomiro de Oliveira', '2013-07-02 16:07:31', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1960-09-20', 4, 'single');
INSERT INTO person VALUES (69, 'Marcos de Moraes', '2013-07-02 16:07:36', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1981-07-30', 4, 'separated');
INSERT INTO person VALUES (70, 'Delton Luiz Maciel', '2013-07-02 16:07:38', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1982-09-03', 4, 'single');
INSERT INTO person VALUES (71, 'Jorge Luiz Madureira', '2013-07-02 16:07:49', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1969-07-04', 4, 'single');
INSERT INTO person VALUES (73, 'Rodrigo Ramos de Lara', '2013-07-02 16:07:31', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1987-11-24', 4, 'single');
INSERT INTO person VALUES (74, 'Cliceu Faria', '2013-07-02 16:07:24', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1981-03-08', 4, 'single');
INSERT INTO person VALUES (75, 'Daniel Pereira', '2013-07-02 16:07:41', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1983-01-14', 4, 'single');
INSERT INTO person VALUES (76, 'Rodrigo José Martins', '2013-07-02 16:07:26', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1985-01-15', 4, 'single');
INSERT INTO person VALUES (77, 'Luiz Fernando Coimbra Alves', '2013-07-02 16:07:24', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1974-11-17', 4, 'single');
INSERT INTO person VALUES (78, 'Orlando Maia Steudel', '2013-07-02 17:07:29', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1968-02-15', 4, 'single');
INSERT INTO person VALUES (79, 'Robson Luiz Almeida Penteado', '2013-07-02 17:07:20', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1989-01-04', 4, 'single');
INSERT INTO person VALUES (80, 'Roberto Carlos Dias', '2013-07-02 17:07:58', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1970-03-29', 4, 'single');
INSERT INTO person VALUES (81, 'Jailson Elvis da Silva', '2013-07-02 17:07:15', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1983-07-29', 4, 'separated');
INSERT INTO person VALUES (82, 'Valdinei Xavier da Silva', '2013-07-02 17:07:59', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1962-10-09', 4, 'single');
INSERT INTO person VALUES (83, 'Adilson de Freitas Miranda', '2013-07-02 17:07:21', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1967-07-29', 4, 'separated');
INSERT INTO person VALUES (84, 'Bruno Elisandro dos Santos', '2013-07-02 17:07:05', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1992-07-03', 4, 'single');
INSERT INTO person VALUES (85, 'João Pedro Ricetti', '2013-07-02 17:07:53', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1993-06-17', 4, 'single');
INSERT INTO person VALUES (86, 'Luiz Vanderlei Fernandes Belon', '2013-07-02 17:07:46', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1973-04-02', 4, 'single');
INSERT INTO person VALUES (87, 'Marcos Aurélio Oliveira dos Santos', '2013-07-02 17:07:42', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1994-09-15', 4, 'single');
INSERT INTO person VALUES (88, 'Mauro Sergio Fernandes', '2013-07-02 17:07:24', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1971-03-08', 4, 'single');
INSERT INTO person VALUES (89, 'Leandro Leite', '2013-07-02 17:07:49', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1989-05-06', 4, 'single');
INSERT INTO person VALUES (90, 'Cleverton Andreata', '2013-07-02 17:07:52', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1981-02-08', 4, 'single');
INSERT INTO person VALUES (91, 'Juarez Martins Fedex', '2013-07-02 17:07:52', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1956-01-30', 4, 'separated');
INSERT INTO person VALUES (92, 'Jorge Lopes de Paula', '2013-07-02 17:07:32', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1981-08-12', 4, 'single');
INSERT INTO person VALUES (93, 'Franciel Rodrigues Dias', '2013-07-02 17:07:58', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1993-01-08', 4, 'single');
INSERT INTO person VALUES (94, 'Edilson da Rocha', '2013-07-02 17:07:20', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1966-12-27', 4, 'single');
INSERT INTO person VALUES (72, 'Tiago Rodrigo Treder dos Santos', '2013-07-02 16:07:42', 1, 'rua herculano de freitas', '', '751   ', 1, '                ', '4232239414      ', '84015-105', '', '', 'm', '1983-05-25', 4, 'married');
INSERT INTO person VALUES (95, 'Elinton Opata', '2013-07-18 09:07:51', 1, 'Rua Marcelino Nogueira', '', '59    ', 1, '99908216        ', '                ', '         ', '', '', 'm', '1986-10-06', NULL, 'single');
INSERT INTO person VALUES (96, 'Mayson Mattos de Oliveira', '2013-07-18 09:07:44', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '                ', '4232239414      ', '84015105 ', '', '', 'm', '1993-07-16', 4, 'single');
INSERT INTO person VALUES (19, 'Adela Garcia Lopez', '2013-05-15 17:05:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', 'princesa_9300@hotmail.com', 'f', '2013-01-20', NULL, 'married');
INSERT INTO person VALUES (98, 'Rober Andersom Severino', '2013-08-20 14:08:13', 1, 'Citrino', '', '77    ', 1, '                ', '                ', '         ', '', '', 'm', '1977-12-13', 11, 'single');
INSERT INTO person VALUES (99, 'Juliano da Siva', '2013-08-20 15:08:23', 1, 'Ebano Ferreira', '', '57    ', 6, '                ', '                ', '         ', '', '', 'm', '1978-11-09', NULL, 'single');
INSERT INTO person VALUES (100, 'Hamilkar Jose Gasparello', '2013-08-20 15:08:47', 1, 'Joao Marcelino Madaloso', '', '183   ', 1, '99883742        ', '32258162        ', '         ', '', '', 'm', '2013-01-20', 12, 'separated');
INSERT INTO person VALUES (101, 'Luiz Fernando Coinbra Alves', '2013-08-20 15:08:29', 1, 'Herculano de Freitas', '', '751   ', 1, '99735704        ', '                ', '8415105  ', '', '', 'm', '1974-11-17', 4, 'single');
INSERT INTO person VALUES (102, 'Luciano das Graças Silva', '2013-08-20 15:08:07', 1, 'Helculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '         ', '', '', 'm', '1980-04-20', 4, 'single');
INSERT INTO person VALUES (103, 'Lucas da Silva Nascimento', '2013-08-20 15:08:55', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '         ', '', '', 'm', '1992-06-06', 4, 'single');
INSERT INTO person VALUES (104, 'Juarez Martins Fedex', '2013-08-20 15:08:18', 1, 'Hereculano de Freitas', '', '751   ', 1, '98099045        ', '                ', '84015105 ', '', '', 'm', '1956-01-31', 4, 'separated');
INSERT INTO person VALUES (105, 'Jorge Lopes de Paula', '2013-08-20 16:08:02', 1, 'Herculano de Freitaas', '', '751   ', 1, '                ', '32239414        ', '         ', '', '', 'm', '1981-08-12', 7, 'single');
INSERT INTO person VALUES (106, 'Joao Antonio Ramos', '2013-08-20 16:08:39', 1, 'Herculano  Freitas', '', '751   ', 5, '                ', '3223 9414       ', '84015105 ', '', '', 'm', '1951-04-22', 15, 'widow(er)');
INSERT INTO person VALUES (107, 'Franciel Rodrigues Silva', '2013-08-20 16:08:01', 1, 'Herculano De Freitas', '', '751   ', 1, '                ', '32239414        ', '         ', '', '', 'm', '1993-01-08', 4, 'single');
INSERT INTO person VALUES (108, 'Cleversom Silva Moura', '2013-08-20 16:08:02', 1, 'Herculano de Freitas', '', '751   ', 7, '                ', '32239414        ', '         ', '', '', 'm', '1992-04-23', 1, 'single');
INSERT INTO person VALUES (109, 'Andre Domingues Pinhove', '2013-08-20 16:08:06', 1, 'Herculano de Freitas', '', '751   ', 8, '(14)98382601    ', '(14)32030989    ', '8405105  ', '', '', 'm', '1974-10-23', NULL, 'separated');
INSERT INTO person VALUES (115, 'Andersom Shneider', '2013-08-21 08:08:46', 1, 'Herculano de Freitas', '', '751   ', 1, '(41)88015682    ', '32239414        ', '84015105 ', '', '', 'm', '1981-06-26', 4, 'separated');
INSERT INTO person VALUES (116, 'Albari Ferreira de Andrade', '2013-08-21 09:08:00', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '8405105  ', '', '', 'm', '1961-12-01', 4, 'separated');
INSERT INTO person VALUES (117, 'Miguel  Angelo da Silva', '2013-08-21 09:08:28', 1, '15 DE Novenbro', '', '1062  ', 1, '(42)99090584    ', '                ', '         ', '', '', 'm', '1969-01-06', 1, 'single');
INSERT INTO person VALUES (56, 'Marcelo Lima dos Santos', '2013-06-19 11:06:28', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '98056308        ', '42 32239414     ', '84015105 ', '', 'marcelotheryla@gmail.com', 'm', '1989-11-13', 4, 'stable union');
INSERT INTO person VALUES (121, 'Tiago Abreu Silva', '2013-08-21 10:08:42', 1, 'Isaque', '', '0     ', 1, '                ', '32239414        ', '         ', '', '', 'm', '1985-12-06', 17, 'separated');
INSERT INTO person VALUES (122, 'Valderly Costa Ferreira', '2013-08-21 10:08:56', 1, 'Herculano Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'm', '1989-12-22', 4, 'separated');
INSERT INTO person VALUES (123, 'Weslley Weldisom da Silva da Rossa', '2013-08-21 10:08:36', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'm', '2002-02-05', 4, 'single');
INSERT INTO person VALUES (124, 'Vitoria da SIlva Rosa', '2013-08-21 10:08:28', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '8405105  ', '', '', 'f', '2007-03-09', 4, 'single');
INSERT INTO person VALUES (126, 'Vinicius da Silva da Rosa', '2013-08-21 10:08:51', 1, 'Heculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'm', '2005-12-05', 4, 'single');
INSERT INTO person VALUES (129, 'Maria Eduarda Sanpaio Lopes', '2013-08-21 10:08:47', 1, 'Heculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '8405105  ', '', '', 'f', '2009-04-16', 4, 'single');
INSERT INTO person VALUES (130, 'Luiz Guilerme Sanpaio Lopes', '2013-08-21 10:08:21', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'm', '2010-11-08', 4, 'single');
INSERT INTO person VALUES (131, 'Samoel Borges', '2013-08-21 10:08:31', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'm', '2003-11-12', 4, 'single');
INSERT INTO person VALUES (133, 'Karina Cardine .R. Fiorin', '2013-08-21 11:08:34', 1, 'Herculano de Freitas', '', '751   ', 1, '(14)33731497    ', '(14)97637650    ', '84015105 ', '', '', 'f', '2013-01-21', 4, 'married');
INSERT INTO person VALUES (134, 'Alam Jair Correia da Luz', '2013-08-21 11:08:09', 1, 'Antonio Saad', '', '61    ', 1, '(42)88208414    ', '(42)32382855    ', '         ', '', '', 'm', '1990-05-12', 7, 'single');
INSERT INTO person VALUES (135, 'Antonio  Demeter Tianakef', '2013-08-21 11:08:56', 1, 'pepeita', '', '      ', 10, '                ', '                ', '         ', '', '', 'm', '1968-04-05', 3, 'single');
INSERT INTO person VALUES (136, 'Andersom Luiz Dutka', '2013-08-21 11:08:24', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-01-19', 1, 'single');
INSERT INTO person VALUES (137, 'Acir da Silva Soares', '2013-08-21 11:08:41', 1, 'rua 13(luiz pereira barreto)', '', '213   ', 1, '                ', '                ', '         ', '', '', 'm', '1994-12-20', 7, 'single');
INSERT INTO person VALUES (138, 'Adriano Rocha de Oliveira', '2013-08-21 13:08:18', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1989-11-12', 1, 'single');
INSERT INTO person VALUES (139, 'Orimarcos do Nascimento', '2013-08-21 13:08:00', 1, 'Nova Londrina', '', '361   ', 1, '(42)99406034    ', '(42)99945423    ', '         ', '', '', 'm', '1976-11-06', NULL, 'single');
INSERT INTO person VALUES (140, 'Ademar Eichellbaum', '2013-08-21 13:08:04', 1, 'Domingos Ferreira Pinto', '', '386   ', 5, '                ', '                ', '         ', '', '', 'm', '1969-05-17', 7, 'married');
INSERT INTO person VALUES (141, 'Alaf Nasario', '2013-08-21 13:08:55', 1, 'republica do peru', '', 's/n   ', 1, '(42)99091387    ', '(42)91068217    ', '         ', '', '', 'm', '1993-07-08', 1, 'single');
INSERT INTO person VALUES (143, 'Alexandre Godoi', '2013-08-21 14:08:11', 1, 'gnl Barros Falcao', '', '500   ', 1, '                ', '                ', '         ', '', '', 'm', '1983-10-10', 7, 'single');
INSERT INTO person VALUES (144, 'Alçfredo Borck', '2013-08-21 15:08:53', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-01-16', 5, 'single');
INSERT INTO person VALUES (147, 'Alexandre  dos Santos Galvao', '2013-08-21 15:08:23', 1, 'Julio Castanho', '', '78    ', 1, '                ', '                ', '         ', '', '', 'm', '1989-06-26', 7, 'single');
INSERT INTO person VALUES (128, 'Karen Naomi de Moraes', '2013-08-21 10:08:05', 1, 'Heculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'f', '2001-08-22', 4, 'single');
INSERT INTO person VALUES (127, 'Kevelin de Fatima Borges dos Santos', '2013-08-21 10:08:14', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '         ', '', '', 'f', '2000-03-30', 4, 'single');
INSERT INTO person VALUES (125, 'Stefany Anelize Silva da Rosa', '2013-08-21 10:08:29', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '8405105  ', '', '', 'f', '1998-02-06', 4, 'single');
INSERT INTO person VALUES (118, 'Tharcilo Sergio Kirchener Correia', '2013-08-21 09:08:29', 1, 'Heculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'm', '1976-12-05', 4, 'single');
INSERT INTO person VALUES (132, 'Wesley Gabriel Sanpaio Gomes', '2013-08-21 11:08:29', 1, 'Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'm', '2008-01-29', 4, 'single');
INSERT INTO person VALUES (148, 'Alencar Jose da Silva', '2013-08-21 15:08:13', 1, 'jaguapita', '', '71    ', 5, '                ', '                ', '         ', '', '', 'm', '1991-02-17', NULL, 'single');
INSERT INTO person VALUES (149, 'Andersom Rogerio de Oliveira', '2013-08-21 15:08:49', 1, 'augusto severino', '', '1870  ', 5, '                ', '                ', '         ', '', '', 'm', '1970-10-05', NULL, 'single');
INSERT INTO person VALUES (150, 'Adolfo Geve Junior', '2013-08-21 15:08:51', 1, 'Jaguapita', '', '41    ', 1, '                ', '                ', '         ', '', '', 'm', '1981-07-11', 7, 'single');
INSERT INTO person VALUES (151, 'Adolfo Geve Junior', '2013-08-21 15:08:10', 1, 'jaguapita', '', '41    ', 1, '                ', '                ', '         ', '', '', 'm', '1981-07-11', 7, 'single');
INSERT INTO person VALUES (152, 'Alex  Sandro Ribeiro dos Santos', '2013-08-21 15:08:36', 1, 'vicente machado', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1981-09-09', 1, 'single');
INSERT INTO person VALUES (153, 'Andersom Tizom dos Santos', '2013-08-21 15:08:56', 1, 'Sao Jose fat', '', '1524  ', 1, '                ', '                ', '         ', '', '', 'm', '1986-02-21', 9, 'single');
INSERT INTO person VALUES (154, 'Albam Santos de Souza', '2013-08-21 16:08:24', 1, 'operarios', '', '1267  ', 1, '                ', '(42)99652919    ', '         ', '', '', 'm', '1992-04-24', 9, 'single');
INSERT INTO person VALUES (155, 'Antonio de Oliveira', '2013-08-21 16:08:06', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1942-09-10', NULL, 'single');
INSERT INTO person VALUES (156, 'Odair Fernandes Machado', '2013-08-21 16:08:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-03-03', 7, 'single');
INSERT INTO person VALUES (157, 'Alisom de Freitas Miranda', '2013-08-21 16:08:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-07-29', 1, 'single');
INSERT INTO person VALUES (158, 'Adilsom Carlos Banisky', '2013-08-21 16:08:31', 1, 'CONDOR', '', '96    ', 1, '(42)91141102    ', '(42)32298117    ', '         ', '', '', 'm', '1981-10-24', 1, 'single');
INSERT INTO person VALUES (159, 'andersom Monteiro Bernardo', '2013-08-21 16:08:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-10-28', 1, 'single');
INSERT INTO person VALUES (160, 'Adair Pereira Batista', '2013-08-21 16:08:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-07-09', NULL, 'single');
INSERT INTO person VALUES (161, 'Andersom Mehret', '2013-08-22 08:08:03', 1, 'modarta', '', '3     ', 5, '                ', '                ', '         ', '', '', 'm', '1984-08-25', 11, 'single');
INSERT INTO person VALUES (162, 'Alam Tomas de Souza dos Anjos', '2013-08-22 08:08:33', 1, 'Cesar Alves', '', '198   ', 1, '                ', '                ', '         ', '', '', 'm', '1997-09-06', 9, '');
INSERT INTO person VALUES (163, 'Andre Hardt da Rocha', '2013-08-22 08:08:11', 1, 'primula', '', '90    ', 1, '                ', '(42)32161656    ', '         ', '', '', 'm', '1974-06-08', 7, 'single');
INSERT INTO person VALUES (164, 'Adinilsom Borges de Oliveira', '2013-08-22 09:08:41', 1, 'Lidia Scheidt Curi', '', '16    ', 1, '(42)99085934    ', '(42)            ', '         ', '', '', 'm', '1979-08-07', 7, 'single');
INSERT INTO person VALUES (165, 'Alisom Santos Rodrigues', '2013-08-22 09:08:31', 1, 'Garoupa', '', '601   ', 1, '                ', '                ', '         ', '', '', 'm', '1993-07-18', 9, 'single');
INSERT INTO person VALUES (166, 'Andersom Aparecido Assunçao', '2013-08-22 09:08:42', 1, '', '', '      ', 12, '                ', '                ', '         ', '', '', 'm', '1985-05-24', NULL, '');
INSERT INTO person VALUES (167, 'Alexandro Porciano da Rocha', '2013-08-22 09:08:20', 1, 'Gralha Azul', '', '124   ', 1, '(42)98815273    ', '(42)99368358    ', '         ', '', '', 'm', '1978-12-03', 9, 'married');
INSERT INTO person VALUES (168, 'Antonio Andrade dos Santos', '2013-08-22 09:08:46', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1971-01-26', NULL, 'single');
INSERT INTO person VALUES (169, 'Ademir Luiz  Gorchoski', '2013-08-22 09:08:24', 1, 'Haiti', 'Haiti', '123   ', 1, '                ', '                ', '         ', '', '', 'm', '1972-10-13', NULL, '');
INSERT INTO person VALUES (170, 'Artur Adriano de Freitas Miranda', '2013-08-22 09:08:51', 1, 'Frei Leandro de Sacramento', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-11-09', 7, 'married');
INSERT INTO person VALUES (171, 'Alexandre Lopes', '2013-08-22 09:08:28', 1, 'Bahia', '', '245   ', 1, '                ', '(43)84082875    ', '         ', '', '', 'm', '1986-12-26', 1, 'single');
INSERT INTO person VALUES (172, 'Adriano josé Lara', '2013-08-22 09:08:16', 1, 'Guartemala', '', '445   ', 1, '                ', '                ', '         ', '', '', 'm', '1986-03-29', 9, 'single');
INSERT INTO person VALUES (173, 'Antonio do Rocio Santos', '2013-08-22 10:08:56', 1, '', '', '      ', 11, '(14)81098212    ', '(14)96015820    ', '         ', '', '', 'm', '1963-09-29', NULL, 'married');
INSERT INTO person VALUES (174, 'Angelo Michel  Pereira', '2013-08-22 10:08:46', 1, 'Dario Velozo', '', '78    ', 1, '                ', '                ', '         ', '', '', 'm', '1986-11-26', NULL, '');
INSERT INTO person VALUES (175, 'Alisom Carvalho Pereira de Almeida', '2013-08-22 10:08:38', 1, 'Alfredo Santana', '', '2     ', 1, '                ', '                ', '         ', '', '', 'm', '2009-03-15', 4, 'single');
INSERT INTO person VALUES (176, 'Alexandro Gonsalves', '2013-08-22 10:08:42', 1, 'garoupa', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-22', 7, 'single');
INSERT INTO person VALUES (177, 'Bruno Elizandro dos Santos', '2013-08-22 10:08:37', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-07-03', NULL, 'single');
INSERT INTO person VALUES (178, 'Benedetito Carlos Munhoz', '2013-08-22 10:08:54', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1948-11-04', NULL, 'married');
INSERT INTO person VALUES (179, 'Bruno Jakinzo Tomas', '2013-08-22 10:08:43', 1, 'espedicionario', '', '224   ', 1, '                ', '                ', '         ', '', '', 'm', '1994-03-21', 1, 'single');
INSERT INTO person VALUES (180, 'Bruno Leal do Valle', '2013-08-22 10:08:38', 1, 'lopes nogueira', '', '31    ', 1, '                ', '                ', '         ', '', '', 'm', '1992-09-04', NULL, 'single');
INSERT INTO person VALUES (181, 'Antonio Nascimento', '2013-08-22 10:08:50', 1, 'rua 4', '', '267   ', 1, '(42)91477218    ', '                ', '         ', '', '', 'm', '1948-04-02', 11, 'widow(er)');
INSERT INTO person VALUES (182, 'Airtom Borges', '2013-08-22 10:08:35', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-01-05', NULL, 'married');
INSERT INTO person VALUES (183, 'Aline Matiozi Macudo', '2013-08-22 10:08:16', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'f', '2013-01-22', NULL, 'married');
INSERT INTO person VALUES (184, 'Antonio de Oliveira', '2013-08-22 10:08:39', 1, 'Fernando Sacrammento', '', '      ', 5, '                ', '                ', '         ', '', '', 'm', '1942-09-10', 20, 'married');
INSERT INTO person VALUES (185, 'Andersom Junior Marques da Rosa', '2013-08-22 10:08:39', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-04-03', NULL, 'widow(er)');
INSERT INTO person VALUES (186, 'Alex Sandro Alabi Ulaile', '2013-08-22 10:08:23', 1, 'Nicolau Clupel Neto', '', '955   ', 1, '                ', '                ', '         ', '', '', 'm', '1987-06-02', 21, 'single');
INSERT INTO person VALUES (187, 'Amauri de Almeida Leal', '2013-08-22 10:08:22', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1970-11-06', NULL, 'single');
INSERT INTO person VALUES (188, 'Amiltom Sesar Barbosa', '2013-08-22 11:08:05', 1, 'Elizandra Alves', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-11-11', 21, 'single');
INSERT INTO person VALUES (189, 'Andre Luiz Rodriguez', '2013-08-22 11:08:06', 1, 'CORONEL Vivido', '', '712   ', 1, '(42)98039565    ', '                ', '84036310 ', '', '', 'm', '1986-07-21', 3, 'single');
INSERT INTO person VALUES (190, 'Antonio Santos Costa', '2013-08-22 11:08:34', 1, 'Monte Alvene', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-22', 12, 'single');
INSERT INTO person VALUES (195, 'Alceu Rodrigues', '2013-08-22 11:08:37', 1, '', '', '      ', 1, '                ', '(42)36240238    ', '         ', '', '', 'm', '1986-08-25', NULL, 'single');
INSERT INTO person VALUES (196, 'Antonio Donizete da Silva', '2013-08-22 11:08:49', 1, 'Santo Mauro', '', '329   ', 1, '                ', '                ', '         ', '', '', 'm', '1956-11-12', NULL, 'single');
INSERT INTO person VALUES (197, 'Alessandro Marques Cordeiro', '2013-08-22 11:08:42', 1, 'Alvaro Albim', '', '664   ', 1, '                ', '                ', '         ', '', '', 'm', '1988-08-23', 4, 'single');
INSERT INTO person VALUES (198, 'Adriano da Silva', '2013-08-22 11:08:23', 1, 'Puciliano Negrao', '', '      ', 1, '(42)98070844    ', '                ', '         ', '', '', 'm', '1989-12-22', 21, 'single');
INSERT INTO person VALUES (199, 'Andri Henrique P Bueno', '2013-08-22 13:08:13', 1, 'Jose Pereira Silveira', '', '632   ', 1, '                ', '                ', '         ', '', '', 'm', '1995-01-06', 1, 'single');
INSERT INTO person VALUES (200, 'Alam dos antos Correia', '2013-08-22 13:08:38', 1, 'Armon', 'Prox ao mercado Prado', '217   ', 1, '(42)            ', '                ', '         ', '', '', 'm', '2013-01-22', NULL, '');
INSERT INTO person VALUES (201, 'Antonio Amiltom do Nascimento', '2013-08-22 14:08:06', 1, '', '', '      ', 1, '(42)99830528    ', '                ', '         ', '', '', 'm', '1953-01-21', 7, 'single');
INSERT INTO person VALUES (202, 'Alissom da silva', '2013-08-22 14:08:37', 1, 'Jaguapita', '', '541   ', 6, '                ', '                ', '         ', '', '', 'm', '1978-08-15', 7, 'single');
INSERT INTO person VALUES (203, 'Alisom de Oliveira', '2013-08-22 14:08:21', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1989-11-19', 1, 'single');
INSERT INTO person VALUES (204, 'Almir Pinheiro Machado', '2013-08-22 15:08:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-04-14', NULL, 'single');
INSERT INTO person VALUES (205, 'Adir Tizom', '2013-08-22 15:08:21', 1, 'Sao Jose Fate', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1969-05-18', 9, 'single');
INSERT INTO person VALUES (206, 'Alisom Jose Veiga', '2013-08-22 15:08:08', 1, 'Espedicionario Miltom', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1999-02-12', NULL, 'single');
INSERT INTO person VALUES (207, 'Antonio Josnei dos Santos', '2013-08-22 15:08:43', 1, 'Sentenario do sul', '', '726   ', 1, '                ', '                ', '         ', '', '', 'm', '1968-06-12', 7, 'single');
INSERT INTO person VALUES (208, 'Adilsom Cabbral', '2013-08-22 15:08:24', 1, 'Cirio libanes (marquise)', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-08-21', 1, 'single');
INSERT INTO person VALUES (209, 'Adilsom Martins', '2013-08-22 15:08:22', 1, 'Alberto Canpos', '', '575   ', 1, '                ', '                ', '         ', '', '', 'm', '1980-12-22', 13, 'single');
INSERT INTO person VALUES (210, 'Alexadre Meira', '2013-08-22 15:08:31', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-08-02', NULL, '');
INSERT INTO person VALUES (211, 'Allam Dionei Marques', '2013-08-22 15:08:52', 1, 'Jaime A dos Santos', '', '      ', 5, '                ', '(42)32244938    ', '         ', '', '', 'm', '1981-10-28', 7, 'single');
INSERT INTO person VALUES (212, 'Amauri de Almeida Leal', '2013-08-22 16:08:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1970-11-06', NULL, 'single');
INSERT INTO person VALUES (213, 'Adolfo Gehr', '2013-08-22 16:08:13', 1, 'RUA 3', '', '62    ', 1, '                ', '                ', '         ', '', '', 'm', '1981-07-11', NULL, 'single');
INSERT INTO person VALUES (214, 'Adilsom da Silva Pinheiro', '2013-08-22 16:08:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-22', NULL, '');
INSERT INTO person VALUES (215, 'Antonio Andrade dos Santos', '2013-08-22 16:08:46', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1961-01-26', NULL, '');
INSERT INTO person VALUES (216, 'Antonio Antunes de Paula', '2013-08-22 16:08:54', 1, 'Izaias de Luz', '', '27    ', 1, '                ', '                ', '         ', '', '', 'm', '1952-02-14', NULL, 'married');
INSERT INTO person VALUES (217, 'Antonio de Teixeira d Paula', '2013-08-22 16:08:04', 1, 'Joao Ditzel', '', '396   ', 1, '                ', '                ', '         ', '', '', 'm', '1974-01-01', NULL, 'married');
INSERT INTO person VALUES (218, 'Antonio Brito', '2013-08-23 08:08:28', 1, 'Sanpaio Bitencurt', '', '201   ', 1, '                ', '                ', '         ', '', '', 'm', '1940-11-24', NULL, 'single');
INSERT INTO person VALUES (219, 'Adriano Ribas', '2013-08-23 08:08:06', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1981-11-03', NULL, 'single');
INSERT INTO person VALUES (220, 'rli Francisco de Lara', '2013-08-23 09:08:50', 1, 'saboudia', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-02-21', 7, 'single');
INSERT INTO person VALUES (221, 'Adilsom  da  Rocha', '2013-08-23 09:08:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1966-12-27', NULL, 'single');
INSERT INTO person VALUES (222, 'Altair de Oliveira', '2013-08-23 09:08:03', 1, 'Nelsom Narciso Centenario', '', '12    ', 1, '                ', '                ', '         ', '', '', 'm', '1953-08-27', 5, 'married');
INSERT INTO person VALUES (223, 'Agnaldo de Sousa', '2013-08-23 09:08:43', 1, 'Julio Perneta', '', '299   ', 1, '                ', '                ', '         ', '', '', 'm', '1969-07-25', 12, 'single');
INSERT INTO person VALUES (224, 'Adalberto Machado Siqueira', '2013-08-23 09:08:48', 1, 'Dralicio Correia', '', '316   ', 1, '                ', '                ', '         ', '', '', 'm', '1968-06-28', 5, 'single');
INSERT INTO person VALUES (225, 'Andersom Maira da Silva', '2013-08-23 09:08:56', 1, 'joao', '', '113   ', 1, '                ', '                ', '         ', '', '', 'm', '1976-06-04', 7, 'single');
INSERT INTO person VALUES (226, 'Alex dos Santos', '2013-08-23 09:08:08', 1, 'agnaldo Guimarens da Cunha', 'Prox ao ginasio de esportes', '199   ', 5, '                ', '                ', '         ', '', '', 'm', '1985-11-23', 7, 'single');
INSERT INTO person VALUES (227, 'Luiz Ricardo de Arruda', '2013-08-23 10:08:07', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-12-31', NULL, 'single');
INSERT INTO person VALUES (228, 'Luciano Algusto da Silva', '2013-08-23 10:08:40', 1, 'woshingtom luiz', '', '24    ', 1, '                ', '(42)32266534    ', '         ', '', '', 'm', '1975-09-24', 23, 'single');
INSERT INTO person VALUES (229, 'Luizimar Costa da Silva', '2013-08-23 10:08:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1980-06-18', NULL, 'single');
INSERT INTO person VALUES (230, 'Lucas R Krik', '2013-08-23 10:08:03', 1, 'Orlindo Miranda', '', '74    ', 1, '(42)99776595    ', '                ', '         ', '', '', 'm', '1985-03-14', NULL, 'single');
INSERT INTO person VALUES (231, 'Luiz Fernando Novak', '2013-08-23 10:08:45', 1, 'Alfredo Pedro Ribas', '', '11    ', 1, '                ', '                ', '         ', '', '', 'm', '1961-09-26', 9, 'single');
INSERT INTO person VALUES (232, 'Luciano Abrreu Soares', '2013-08-23 10:08:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-10-28', NULL, 'single');
INSERT INTO person VALUES (233, 'Leandro de Souza Zanbom', '2013-08-23 10:08:48', 1, 'Rosmar Denis Escobnar', '', '756   ', 1, '                ', '                ', '         ', '', '', 'm', '1992-07-30', 22, 'single');
INSERT INTO person VALUES (234, 'Luciano de Jesus Camargo', '2013-08-23 10:08:51', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-04-22', NULL, 'single');
INSERT INTO person VALUES (235, 'Maysom Matoso de Oliveira', '2013-08-23 10:08:15', 1, 'Habilio Hosmam', '', '2270  ', 1, '                ', '                ', '         ', '', '', 'm', '1993-07-16', 11, 'single');
INSERT INTO person VALUES (236, 'Leandro José Justino', '2013-08-23 11:08:39', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-07-31', NULL, 'single');
INSERT INTO person VALUES (237, 'Luciano de Jesus Gonçalves', '2013-08-23 11:08:45', 1, 'Anita Garibaldi', 'Apfrrox ponte de pedra', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-03-06', NULL, 'single');
INSERT INTO person VALUES (238, 'Luam Patrik de Almeida', '2013-08-23 11:08:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-07-29', NULL, 'single');
INSERT INTO person VALUES (239, 'Luiz Ednilsom Padilha', '2013-08-23 11:08:13', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-09-27', NULL, 'married');
INSERT INTO person VALUES (240, 'Luiz Teofilo Alvez', '2013-08-23 11:08:32', 1, '', '', '      ', 1, '(42)  99195008  ', '                ', '         ', '', '', 'm', '1973-11-17', NULL, 'single');
INSERT INTO person VALUES (241, 'Luiz Vanderlei Fernandes Belon', '2013-08-23 13:08:44', 1, 'Quadra 1 lote 19', 'Prox ao mercado Estrela', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '19973-04-02', 1, 'single');
INSERT INTO person VALUES (242, 'Luiz Carlos Cordeiro', '2013-08-23 13:08:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-04-30', NULL, 'married');
INSERT INTO person VALUES (243, 'Luiz Teofilo Alves', '2013-08-23 13:08:50', 1, 'Mateus Soudam', '', '56    ', 1, '(42)91562267    ', '(42)32268934    ', '         ', '', '', 'm', '1973-11-17', NULL, 'separated');
INSERT INTO person VALUES (244, 'Leandro Leite', '2013-08-23 13:08:43', 1, '', '', '      ', 14, '                ', '                ', '         ', '', '', 'm', '1989-05-06', NULL, 'single');
INSERT INTO person VALUES (247, 'Luiz Carlos Rosa dos Santos', '2013-08-23 13:08:02', 1, '', '', '      ', 1, '(13)87582351    ', '                ', '         ', '', '', 'm', '1980-06-05', NULL, 'single');
INSERT INTO person VALUES (248, 'Luiz Edgar Carvalho', '2013-08-23 14:08:31', 1, 'Beijamim Franklim', '', '727   ', 1, '                ', '                ', '         ', '', '', 'm', '1971-05-05', 9, 'single');
INSERT INTO person VALUES (249, 'Marcos Antonio Martins', '2013-08-23 14:08:59', 1, 'Renato Menarim', '', '275   ', 1, '                ', '                ', '         ', '', '', 'm', '1961-06-08', 9, 'married');
INSERT INTO person VALUES (250, 'Miltom de Oliveira', '2013-08-23 14:08:42', 1, 'DR Rubens Gomes de Souza', '', '61    ', 1, '                ', '                ', '         ', '', '', 'm', '1957-02-01', 14, 'separated');
INSERT INTO person VALUES (251, 'Manoel Antonio dos Santos', '2013-08-23 14:08:30', 1, 'Videl de nogueira', '', '174   ', 1, '                ', '                ', '         ', '', '', 'm', '1964-12-08', 9, 'single');
INSERT INTO person VALUES (252, 'Luiz Fabiano Oliveira dos Santos', '2013-08-23 15:08:54', 1, 'Beta', '', '277   ', 1, '                ', '                ', '         ', '', '', 'm', '1989-10-27', NULL, 'single');
INSERT INTO person VALUES (253, 'Luiz Carlos Pires', '2013-08-23 15:08:04', 1, 'rua dos pardais', '', '23    ', 1, '                ', '                ', '         ', '', '', 'm', '1962-11-15', NULL, 'single');
INSERT INTO person VALUES (254, 'Luiz Tiago Ferreira', '2013-08-23 15:08:57', 1, 'Serra do mar', '', 's/n   ', 5, '                ', '                ', '         ', '', '', 'm', '1987-12-14', NULL, 'single');
INSERT INTO person VALUES (255, 'Lourenço Alves', '2013-08-23 15:08:59', 1, 'General Rondom', '', '750   ', 1, '                ', '                ', '         ', '', '', 'm', '1987-03-25', 22, 'separated');
INSERT INTO person VALUES (256, 'Luiz Carlos de Oliveira', '2013-08-23 15:08:57', 1, 'amortila', '', '131   ', 1, '                ', '                ', '         ', '', '', 'm', '1965-08-06', NULL, 'single');
INSERT INTO person VALUES (257, 'Luiz Rodrigo Carneiro', '2013-08-23 15:08:19', 1, 'Ecilio Arnaldino', '', '632   ', 1, '                ', '                ', '         ', '', '', 'm', '1989-12-20', 17, 'single');
INSERT INTO person VALUES (258, 'Luiz Ednilsom Padilha', '2013-08-23 15:08:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1984-09-27', NULL, 'single');
INSERT INTO person VALUES (261, 'Luiz de Souza Junior', '2013-08-23 15:08:03', 1, '7 de Setenbro', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-10-23', 1, 'single');
INSERT INTO person VALUES (262, 'Luiz  Fernando Pires Cordeiro', '2013-08-23 15:08:05', 1, 'Ico  Risental', '', '325   ', 1, '                ', '                ', '         ', '', '', 'm', '1983-01-03', 1, 'single');
INSERT INTO person VALUES (263, 'Paulo Ricardo Sousa Araujo', '2013-08-23 15:08:07', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-03-11', NULL, 'single');
INSERT INTO person VALUES (264, 'Luiz Gustavo J Pereira', '2013-08-23 15:08:22', 1, 'Paulo  de nadal', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2009-05-23', NULL, '');
INSERT INTO person VALUES (265, 'Jjoao Ferreia Lemes', '2013-08-26 09:08:30', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1956-02-28', NULL, 'single');
INSERT INTO person VALUES (266, 'JoaoCarlos Mileski', '2013-08-26 09:08:29', 1, 'Osvado Cruz', '', '357   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-05-16', 12, 'single');
INSERT INTO person VALUES (267, 'Joao Alcis Pricval', '2013-08-26 09:08:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-26', NULL, '');
INSERT INTO person VALUES (268, 'Joe Joreira', '2013-08-26 09:08:07', 1, 'Julia Pernet', '', '290   ', 1, '                ', '                ', '         ', '', '', 'm', '1964-11-07', 23, 'single');
INSERT INTO person VALUES (269, 'Leoner Soares de Sou', '2013-08-26 09:08:39', 1, 'Ervo Helio Chacvej', '', '150   ', 1, '                ', '                ', '         ', '', '', 'm', '1950-11-16', 5, 'single');
INSERT INTO person VALUES (270, 'Jan Condor  Jegesk', '2013-08-26 10:08:53', 1, 'ana rita', '', '284   ', 1, '                ', '                ', '         ', '', '', 'm', '1983-05-17', NULL, 'single');
INSERT INTO person VALUES (271, 'Jefersom Luiz a dos Santos', '2013-08-26 10:08:44', 1, 'Carlos Cahagas', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-11-23', 23, 'single');
INSERT INTO person VALUES (272, 'Joao dos Santos Filho', '2013-08-26 10:08:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1972-08-17', 21, 'single');
INSERT INTO person VALUES (273, 'Joao Marcelo meira dos Santos', '2013-08-26 10:08:55', 1, 'Barbosa lima', '', '355   ', 1, '                ', '                ', '         ', '', '', 'm', '1976-09-04', NULL, 'single');
INSERT INTO person VALUES (274, 'Jose Valdemir Ribeiro Borges', '2013-08-26 10:08:19', 1, 'joao cheidt', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1967-09-09', NULL, '');
INSERT INTO person VALUES (275, 'Joao Ponijalski', '2013-08-26 13:08:24', 1, 'Chafic Curi', '', '44    ', 5, '(42)84027469    ', '(42)32381449    ', '         ', '', '', 'm', '1960-11-02', NULL, 'married');
INSERT INTO person VALUES (276, 'Juliano Ferreira', '2013-08-26 13:08:48', 1, 'Marcilio Mias', '', '1889  ', 1, '(42)99892414    ', '                ', '         ', '', '', 'm', '1978-08-09', NULL, 'single');
INSERT INTO person VALUES (277, 'Joao Ribeiro de Jesus', '2013-08-26 13:08:49', 1, 'Marcilio dias', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-12-25', NULL, 'single');
INSERT INTO person VALUES (278, 'Jorge Luiz Madureira', '2013-08-26 13:08:20', 1, 'Carlos chagas', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-07-04', 23, 'single');
INSERT INTO person VALUES (279, 'Jose Milrtom Gorchacosk', '2013-08-26 13:08:05', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1956-10-14', NULL, 'single');
INSERT INTO person VALUES (280, 'Jose Fernandes de Lima', '2013-08-26 13:08:22', 1, 'Alfredo Trentini', '', '250   ', 1, '                ', '                ', '         ', '', '', 'm', '1979-05-27', NULL, 'single');
INSERT INTO person VALUES (281, 'Joel Fernandes de Lima', '2013-08-26 13:08:19', 1, 'Alfredo trentim', '', '250   ', 1, '                ', '                ', '         ', '', '', 'm', '0179-05-27', 7, 'single');
INSERT INTO person VALUES (282, 'Jacsom Jonas Cardoso', '2013-08-26 13:08:49', 1, 'R Londrina', '', '486   ', 1, '                ', '                ', '         ', '', '', 'm', '1969-11-13', 21, 'single');
INSERT INTO person VALUES (283, 'Joao Ogarencho', '2013-08-26 13:08:43', 1, '', '', '      ', 1, '                ', '(42)32250568    ', '         ', '', '', 'm', '1955-07-14', NULL, 'single');
INSERT INTO person VALUES (284, 'Joao Batista de Melo', '2013-08-26 13:08:11', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1962-05-07', NULL, '');
INSERT INTO person VALUES (285, 'Jaroslau Kroim', '2013-08-26 13:08:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1956-03-30', NULL, 'single');
INSERT INTO person VALUES (286, 'Marcos Antonio Kobinski', '2013-08-26 14:08:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-07-23', 2, 'single');
INSERT INTO person VALUES (287, 'Luiz Claudio Samiuk', '2013-08-26 14:08:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-12-09', NULL, 'single');
INSERT INTO person VALUES (288, 'Lucas Cortes  Borges', '2013-08-26 14:08:59', 1, 'Pedro Francisco', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-04-11', 4, 'single');
INSERT INTO person VALUES (289, 'Luiz Carlos de Andrade da Rocha', '2013-08-26 14:08:49', 1, 'Aroa Brock', '', '      ', 1, '                ', '(42)32279006    ', '         ', '', '', 'm', '1983-09-09', NULL, 'single');
INSERT INTO person VALUES (290, 'Luiz Fernando Maldonado', '2013-08-26 14:08:59', 1, 'Maringa', '', '698   ', 1, '(42)99362177    ', '(42)32367633    ', '         ', '', '', 'm', '1991-04-27', 7, 'single');
INSERT INTO person VALUES (291, 'Leandro Souza Zamem', '2013-08-26 14:08:49', 1, 'Rosmar Diniz', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-07-30', 21, 'single');
INSERT INTO person VALUES (292, 'Kaique Carvalho Pereira de Almeida', '2013-08-26 14:08:00', 1, 'Alfredo Santana', '', '1     ', 1, '                ', '                ', '         ', '', '', 'm', '2006-12-17', 4, 'single');
INSERT INTO person VALUES (293, 'Jose Mauro Antunes', '2013-08-26 14:08:34', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-07-11', NULL, 'married');
INSERT INTO person VALUES (294, 'Jailsom Elvis Da Silva', '2013-08-26 14:08:34', 1, 'engenheiro virgilho milask', '', '99    ', 1, '                ', '                ', '         ', '', '', 'm', '1983-07-29', 17, 'separated');
INSERT INTO person VALUES (295, 'Jefersom Tomas De Jesus', '2013-08-26 14:08:09', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-05-20', NULL, 'single');
INSERT INTO person VALUES (296, 'Jair Ferreira', '2013-08-26 14:08:10', 1, 'Haiti', '', '232   ', 1, '                ', '                ', '         ', '', '', 'm', '1958-05-02', 23, 'single');
INSERT INTO person VALUES (297, 'Jonatam Jakinso Tomas', '2013-08-26 15:08:11', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1995-11-13', NULL, '');
INSERT INTO person VALUES (298, 'Jose Renam Gonsalves', '2013-08-26 15:08:35', 1, 'Aristopolis', '', '302   ', 1, '                ', '                ', '         ', '', '', 'm', '2000-09-16', NULL, 'single');
INSERT INTO person VALUES (299, 'Jose Padilha', '2013-08-26 15:08:46', 1, 'santa paula2', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1066-01-26', 21, 'single');
INSERT INTO person VALUES (300, 'Jorge Ramiro Marinho', '2013-08-26 15:08:47', 1, 'Cascavel', '', '38    ', 1, '                ', '                ', '         ', '', '', 'm', '1980-10-14', 16, 'married');
INSERT INTO person VALUES (301, 'Jocemar Michel dos Santos', '2013-08-26 15:08:08', 1, 'Enfermeiro Paulino', '', '2916  ', 1, '                ', '                ', '         ', '', '', 'm', '1994-06-12', 13, 'single');
INSERT INTO person VALUES (302, 'Jonathan dos Santos Marques', '2013-08-26 15:08:29', 1, 'Joao Dietzel', '', '396   ', 1, '                ', '                ', '         ', '', '', 'm', '1989-11-06', 7, 'single');
INSERT INTO person VALUES (303, 'Josley Junior Fernandes de Paula', '2013-08-26 16:08:43', 1, 'Emelino de Leao', '', '915   ', 1, '                ', '                ', '         ', '', '', 'm', '1982-05-25', 1, 'single');
INSERT INTO person VALUES (304, 'Jose Mario Vicente de Lima', '2013-08-26 16:08:16', 1, 'Carlos Chagas', '', '370   ', 1, '                ', '                ', '         ', '', '', 'm', '1963-11-04', 23, 'single');
INSERT INTO person VALUES (305, 'Jose Lucio Dos Santos', '2013-08-26 16:08:42', 1, 'lira', '', '81    ', 1, '(42)99664911    ', '                ', '         ', '', '', 'm', '1973-07-06', 16, 'single');
INSERT INTO person VALUES (309, 'Jose Carlos Soaresn', '2013-08-26 16:08:27', 1, 'Dai Luiz Wanber', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-05-02', 1, 'single');
INSERT INTO person VALUES (310, 'Jair de Jesus', '2013-08-26 16:08:42', 1, 'Lucio Alves da Silva', '', '156   ', 1, '                ', '                ', '         ', '', '', 'm', '1960-12-28', 9, 'single');
INSERT INTO person VALUES (311, 'Jose Demetrio Walhoviccz', '2013-08-26 16:08:59', 1, 'br 280', '', 'km 232', 1, '                ', '                ', '85520000 ', '', '', 'm', '1982-09-16', NULL, 'single');
INSERT INTO person VALUES (312, 'Joel Mendes', '2013-08-26 16:08:59', 1, 'Xavier da Silva', '', '227   ', 1, '(42)91276071    ', '                ', '         ', '', '', 'm', '1949-06-20', 1, 'single');
INSERT INTO person VALUES (313, 'Jucinar garcia da Silva', '2013-08-26 16:08:23', 1, 'Alcel de Jamar Guimaraens', '', '288   ', 1, '                ', '                ', '         ', '', '', 'm', '1969-06-30', 20, 'single');
INSERT INTO person VALUES (314, 'Jose roberto Domingos', '2013-08-26 16:08:21', 1, 'Salvador de Mendonça', '', '1     ', 1, '(42)99038504    ', '                ', '         ', '', '', 'm', '1972-01-06', 22, 'single');
INSERT INTO person VALUES (315, 'Jonatam da Cunha Passos', '2013-08-26 17:08:05', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-04-10', NULL, 'single');
INSERT INTO person VALUES (316, 'Janaina dos Santos', '2013-08-27 09:08:31', 1, 'cachoeirinha', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-04-24', NULL, 'married');
INSERT INTO person VALUES (317, 'Jaqueline Zavoski', '2013-08-27 09:08:31', 1, 'Carlos Chagas', '', '612   ', 1, '                ', '                ', '         ', '', '', 'm', '1997-10-06', 23, 'single');
INSERT INTO person VALUES (318, 'Janaina Chamo', '2013-08-27 09:08:17', 1, '7 setenbro', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '2007-07-29', 1, 'single');
INSERT INTO person VALUES (319, 'Jocelia de oliveira', '2013-08-27 09:08:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-27', NULL, 'single');
INSERT INTO person VALUES (320, 'Juvelina A Rodrigues', '2013-08-27 09:08:10', 1, 'Expedicicionario Joao Maetins', '', '95    ', 1, '                ', '                ', '         ', '', '', 'f', '1941-12-13', 5, 'single');
INSERT INTO person VALUES (321, 'Josiane Aparecida Alves dos Santos', '2013-08-27 09:08:03', 1, 'Carlos Chagas', '', '370   ', 1, '                ', '                ', '         ', '', '', 'f', '1984-04-02', 23, 'single');
INSERT INTO person VALUES (322, 'Josine Santos Nascimento', '2013-08-27 09:08:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2005-07-20', NULL, 'separated');
INSERT INTO person VALUES (323, 'Jessica Oliveira Rodrigues', '2013-08-27 09:08:45', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2009-12-12', NULL, 'single');
INSERT INTO person VALUES (324, 'Jeinefer Tainara Mendes de Oliveira', '2013-08-27 09:08:41', 1, 'Abelardo de Brito', '', '15    ', 1, '                ', '                ', '         ', '', '', 'f', '2007-03-08', 5, 'single');
INSERT INTO person VALUES (325, 'Jeisebel Pires de Moraes', '2013-08-27 09:08:58', 1, 'Antonio Carlos', '', '224   ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-27', 12, 'single');
INSERT INTO person VALUES (326, 'Juliana Debora Barbosa da Silva', '2013-08-27 09:08:16', 1, 'Evaristo da Veiga', '', '97    ', 1, '(42)99012287    ', '(42)32250512    ', '         ', '', '', 'f', '1995-06-26', 4, 'married');
INSERT INTO person VALUES (327, 'Josiane Borges', '2013-08-27 10:08:28', 1, 'Garoupa 601', '', '601   ', 1, '                ', '                ', '         ', '', '', 'f', '1973-03-14', 5, 'single');
INSERT INTO person VALUES (328, 'Ingreid de Paula', '2013-08-27 10:08:04', 1, 'Carlos Chagas', '', '56    ', 1, '                ', '                ', '         ', '', '', 'f', '1999-11-25', 23, 'single');
INSERT INTO person VALUES (329, 'Isabel Dias Galvao', '2013-08-27 10:08:56', 1, '', '', '      ', 1, '(42)99093074    ', '                ', '         ', '', '', 'f', '1990-11-09', NULL, 'married');
INSERT INTO person VALUES (330, 'Geisebel Rodrigues', '2013-08-27 10:08:02', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1982-03-25', NULL, 'single');
INSERT INTO person VALUES (331, 'Geova Araujo', '2013-08-27 10:08:30', 1, 'Radialsta Nelsom', '12', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1997-12-31', 7, 'single');
INSERT INTO person VALUES (332, 'Gilva Domingues da Silva', '2013-08-27 10:08:21', 1, 'Souza Franco', '', '420   ', 1, '                ', '                ', '         ', '', '', 'f', '2006-10-07', 23, 'single');
INSERT INTO person VALUES (333, 'Gabriele Ribeiro Santos', '2013-08-27 10:08:12', 1, 'Aide Oliveira Madureira', '', '42    ', 1, '                ', '                ', '         ', '', '', 'f', '2004-04-17', 7, 'single');
INSERT INTO person VALUES (334, 'Gisele Aparecida Rodrigues', '2013-08-27 10:08:20', 1, 'Julio Perneta', '', '299   ', 1, '                ', '                ', '         ', '', '', 'f', '1998-04-22', 23, 'single');
INSERT INTO person VALUES (335, 'Franciele Santos Marques', '2013-08-27 10:08:22', 1, 'Paulo Nadal', '', '197   ', 1, '                ', '                ', '         ', '', '', 'f', '1990-12-30', NULL, '');
INSERT INTO person VALUES (336, 'Franciele Pedroso', '2013-08-27 10:08:11', 1, 'Carlos Chagas', '', '1     ', 1, '                ', '                ', '         ', '', '', 'f', '1999-02-14', 23, 'single');
INSERT INTO person VALUES (337, 'Fabiola Gabriele Sanpaio Gomes', '2013-08-27 10:08:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1999-08-14', 9, 'single');
INSERT INTO person VALUES (338, 'Franciele Krevei de Almeida', '2013-08-27 11:08:05', 1, 'Ercilio  Eslavieiro', '', '13    ', 1, '                ', '                ', '         ', '', '', 'f', '1995-05-29', 7, 'single');
INSERT INTO person VALUES (339, 'Franciele Aparrecida de Paula', '2013-08-27 13:08:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1988-10-01', NULL, 'single');
INSERT INTO person VALUES (340, 'Franciele Franciene Lemes', '2013-08-27 13:08:24', 1, 'Evaristo da Veiga', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'f', '1989-04-16', 23, 'single');
INSERT INTO person VALUES (341, 'Eclair Buher', '2013-08-27 13:08:38', 1, '', '', '      ', 1, '(42)98111698    ', '                ', '         ', '', '', 'm', '1976-05-29', NULL, 'single');
INSERT INTO person VALUES (342, 'Ediane Miquel da Silva', '2013-08-27 13:08:24', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1990-08-23', NULL, 'single');
INSERT INTO person VALUES (343, 'Elisangela Bueno de Almeida', '2013-08-27 13:08:12', 1, 'Eleni Aparecida', '', '1     ', 1, '                ', '                ', '         ', '', '', 'f', '1994-11-11', NULL, 'single');
INSERT INTO person VALUES (344, 'Emanueli de Oliveira Feraz', '2013-08-27 13:08:47', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2005-06-20', NULL, 'single');
INSERT INTO person VALUES (345, 'Emanuela Aparecida Oliveira Barbosa', '2013-08-27 13:08:30', 1, 'nelsom Narciso Vitiato', '', '12    ', 1, '                ', '                ', '         ', '', '', 'f', '2000-04-10', 21, 'single');
INSERT INTO person VALUES (346, 'Elvira Gonçalves', '2013-08-27 13:08:59', 1, 'Garoupa', '1', '60    ', 1, '                ', '                ', '         ', '', '', 'f', '1947-02-22', NULL, '');
INSERT INTO person VALUES (347, 'Denise Jaquinzo', '2013-08-27 13:08:33', 1, 'expedicionario  iltom', '', '224   ', 1, '                ', '                ', '         ', '', '', 'f', '1974-03-03', NULL, '');
INSERT INTO person VALUES (348, 'Derzina de Fatima Santana', '2013-08-27 13:08:38', 1, 'Jose Azevedo de Macedo', '', '14    ', 1, '(42)88226212    ', '(42)32227381    ', '         ', '', '', 'f', '1976-02-27', 13, 'single');
INSERT INTO person VALUES (349, 'Daiane Caroline Maciel Oliveira', '2013-08-27 13:08:41', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1996-05-05', NULL, 'single');
INSERT INTO person VALUES (350, 'Daniela Launa Lourenço', '2013-08-27 13:08:08', 1, 'Aroldo Snenberg', '', '6     ', 1, '                ', '                ', '         ', '', '', 'f', '1988-05-11', 7, '');
INSERT INTO person VALUES (351, 'Daiane Raiane Gonçalves Lemes', '2013-08-27 13:08:14', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2004-05-13', NULL, '');
INSERT INTO person VALUES (352, 'Debora Maiara Gonçalves Lemes', '2013-08-27 13:08:27', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2002-01-01', NULL, 'single');
INSERT INTO person VALUES (353, 'Carla Regiane da Silva', '2013-08-27 14:08:24', 1, 'Haiti', '', '6     ', 1, '                ', '                ', '         ', '', '', 'f', '1982-07-16', 23, 'married');
INSERT INTO person VALUES (354, 'Celia Aparecida Camargo', '2013-08-27 14:08:15', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1974-09-10', NULL, 'married');
INSERT INTO person VALUES (355, 'Cauna Zarosk', '2013-08-27 14:08:53', 1, 'Vanderlei Martins', '', '2     ', 1, '                ', '                ', '         ', '', '', 'f', '2001-08-01', 23, '');
INSERT INTO person VALUES (356, 'Claudia Cristiana Glass', '2013-08-27 14:08:02', 1, 'Alvares de Azevedo', '', '4     ', 1, '                ', '                ', '         ', '', '', 'f', '1977-02-22', 20, 'single');
INSERT INTO person VALUES (357, 'carlos mendes de Oliveira', '2013-08-27 14:08:23', 1, 'Ribeiro de Canpos', '', '761   ', 1, '                ', '                ', '         ', '', '', 'f', '1990-11-09', 13, 'single');
INSERT INTO person VALUES (358, 'Clausiane de Souza Mota', '2013-08-27 14:08:19', 1, 'Carlos Chagas', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1985-06-01', 23, 'single');
INSERT INTO person VALUES (359, 'Carla Miranda de Paula Rocha', '2013-08-27 14:08:12', 1, 'Julio Perneta', '', '3     ', 1, '                ', '                ', '         ', '', '', 'f', '2000-07-10', 9, 'single');
INSERT INTO person VALUES (360, 'Claudineia Pontes', '2013-08-27 14:08:57', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'f', '1900-01-09', NULL, 'single');
INSERT INTO person VALUES (361, 'Caroline reinaldo', '2013-08-27 14:08:19', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'f', '1993-06-18', NULL, 'single');
INSERT INTO person VALUES (362, 'Celia Rodrigues Hanke', '2013-08-27 15:08:24', 1, 'Anita Garibaldi', '', '1674  ', 1, '                ', '                ', '         ', '', '', 'f', '1980-01-20', 7, 'single');
INSERT INTO person VALUES (363, 'Cristiane Moraes Franco', '2013-08-27 15:08:54', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1987-05-07', NULL, 'single');
INSERT INTO person VALUES (364, 'Claudete de Fatima Viana', '2013-08-27 15:08:53', 1, 'Barros Falcao', '', '48    ', 1, '                ', '                ', '         ', '', '', 'f', '1977-04-18', 7, 'single');
INSERT INTO person VALUES (365, 'Bianca Sanpaio Rocha', '2013-08-27 15:08:51', 1, 'Evaristo de Moraes', '', '30    ', 1, '                ', '                ', '         ', '', '', 'f', '1981-01-13', 9, 'single');
INSERT INTO person VALUES (366, 'Bruna Jakinzo Thomas', '2013-08-27 15:08:23', 1, 'Bonifacio ribas', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1998-10-07', 13, 'single');
INSERT INTO person VALUES (367, 'Ariane Aparecida Gonçalves', '2013-08-27 15:08:58', 1, 'Garça Braca', '', '8     ', 1, '                ', '                ', '         ', '', '', 'f', '1993-05-19', 7, 'single');
INSERT INTO person VALUES (368, 'Andreia de Fatima dos Santos', '2013-08-27 15:08:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1975-10-28', NULL, 'single');
INSERT INTO person VALUES (369, 'Adriane de Fatima Melo Gonçalves', '2013-08-27 16:08:46', 1, 'Jaci Monteiro', '', '89    ', 1, '                ', '                ', '         ', '', '', 'f', '1996-09-02', 7, 'single');
INSERT INTO person VALUES (370, 'Ana Caroline Ferreira Santos', '2013-08-27 16:08:42', 1, 'ana de lima', '', '7     ', 1, '                ', '                ', '         ', '', '', 'f', '1996-11-22', 4, 'widow(er)');
INSERT INTO person VALUES (371, 'Alexandra Aparecida Roberto', '2013-08-28 08:08:32', 1, '', '', '      ', 2, '                ', '(42)32231551    ', '         ', '', '', 'f', '1982-07-08', NULL, 'married');
INSERT INTO person VALUES (372, 'Amelia Marria da Luz', '2013-08-28 08:08:58', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1960-04-25', NULL, 'single');
INSERT INTO person VALUES (373, 'Amanda Caroline Mendes', '2013-08-28 09:08:42', 1, 'Reni Gomes  Lopes', '', '52    ', 1, '                ', '                ', '         ', '', '', 'f', '1998-11-06', 7, 'single');
INSERT INTO person VALUES (374, 'Adriele Aparecida Mendes', '2013-08-28 09:08:24', 1, 'Reni Gomes Lopes', '', '52    ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-28', NULL, 'single');
INSERT INTO person VALUES (375, 'Adriele dos Anjos Shultz', '2013-08-28 09:08:38', 1, 'Alfrredo Trentim', '', '83 fds', 1, '(42)99063009    ', '                ', '         ', '', '', 'f', '1992-12-18', 7, 'married');
INSERT INTO person VALUES (376, 'Adriele Genu', '2013-08-28 09:08:13', 1, 'Marcilo Dias', '', '1378  ', 1, '(42)99951563    ', '                ', '         ', '', '', 'f', '2013-01-28', 7, 'single');
INSERT INTO person VALUES (377, 'Adriana Bonim Cunha', '2013-08-28 09:08:16', 1, 'Haiti', '', '123   ', 1, '                ', '                ', '         ', '', '', 'f', '1979-10-12', 23, 'married');
INSERT INTO person VALUES (378, 'Line Molinari', '2013-08-28 09:08:09', 1, 'Argemiro de bula', '', '1140  ', 1, '                ', '                ', '         ', '', '', 'f', '1995-01-19', 1, 'single');
INSERT INTO person VALUES (379, 'Angelica Kimarra Jakinjo', '2013-08-28 09:08:03', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2006-03-17', NULL, 'single');
INSERT INTO person VALUES (380, 'Ana Rosa Ribeiro', '2013-08-28 10:08:22', 1, 'Jaguapita', '', '41    ', 1, '                ', '                ', '         ', '', '', 'f', '1976-03-04', NULL, 'married');
INSERT INTO person VALUES (381, 'Ana luiza De Oliveira', '2013-08-28 10:08:13', 1, 'Nelsom narciso', '', '12    ', 1, '                ', '                ', '         ', '', '', 'f', '1954-07-22', NULL, 'single');
INSERT INTO person VALUES (382, 'Ana Maria de Lima', '2013-08-28 10:08:35', 1, 'Carlos Chagas', '', '370   ', 1, '                ', '                ', '         ', '', '', 'f', '1959-07-26', 23, 'single');
INSERT INTO person VALUES (383, 'Ana Paula Dezetenik', '2013-08-28 10:08:33', 1, 'Carlos Chagas', '', '556   ', 1, '                ', '                ', '         ', '', '', 'f', '1990-01-28', 24, 'single');
INSERT INTO person VALUES (384, 'Andressa de Paula Lima', '2013-08-28 10:08:06', 1, 'Raider de Oliveira', '', '76    ', 1, '                ', '                ', '         ', '', '', 'f', '2008-06-05', 14, 'single');
INSERT INTO person VALUES (385, 'Angela Maria Fagundes', '2013-08-28 10:08:30', 1, '', '', '      ', 5, '                ', '                ', '         ', '', '', 'f', '1979-04-22', NULL, 'single');
INSERT INTO person VALUES (386, 'Andressa Jonak Gonçalves', '2013-08-28 10:08:47', 1, 'Anita Garibaldi', '', '3001  ', 1, '                ', '                ', '         ', '', '', 'f', '1996-03-16', 24, 'single');
INSERT INTO person VALUES (387, 'Adriana da Silva Bueno de Matos', '2013-08-28 10:08:05', 1, 'sebastiao', '', '93    ', 1, '                ', '                ', '         ', '', '', 'f', '1973-05-21', 14, 'single');
INSERT INTO person VALUES (388, 'Adriana Carvalho Muniz', '2013-08-28 10:08:56', 1, 'Pricila Negrao', '', '      ', 1, '99339943        ', '                ', '         ', '', '', 'f', '1988-05-02', NULL, 'single');
INSERT INTO person VALUES (390, 'Alessandra Amaciel de Oliveira', '2013-08-28 10:08:56', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1990-09-02', NULL, 'married');
INSERT INTO person VALUES (391, 'Fabio Garcia Moreira', '2013-08-28 11:08:53', 1, 'Mocidade Alegre', '', '366   ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-28', NULL, 'single');
INSERT INTO person VALUES (392, 'Fabio Guimaraens  dos Santos', '2013-08-28 11:08:42', 1, 'Antonio Chagas', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-28', NULL, 'married');
INSERT INTO person VALUES (393, 'Fernando Ilenek', '2013-08-28 11:08:45', 1, 'Marques de Oliveira', '', '1162  ', 1, '                ', '                ', '         ', '', '', 'm', '1983-05-14', NULL, 'single');
INSERT INTO person VALUES (394, 'Felipe Lucas de LIma', '2013-08-28 11:08:36', 1, 'Maestro Bento Mossorunga', '', '195   ', 1, '                ', '                ', '         ', '', '', 'm', '1990-08-21', 16, 'single');
INSERT INTO person VALUES (395, 'Erivelto da Veiga', '2013-08-29 08:08:28', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1951-06-25', NULL, 'married');
INSERT INTO person VALUES (396, 'Erotilde Xavier da Silva', '2013-08-29 09:08:58', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1947-10-08', NULL, 'single');
INSERT INTO person VALUES (397, 'Erom Junior Rodrigues', '2013-08-29 09:08:44', 1, 'Rosicler Oliveira Madureira', '', '76    ', 1, '                ', '                ', '         ', '', '', 'm', '1994-08-06', 14, 'single');
INSERT INTO person VALUES (398, 'Everaldo Vinicius da Silva', '2013-08-29 09:08:37', 1, 'Radialista Nelsom', '', '122   ', 1, '(42)99173912    ', '(42)32361582    ', '84073460 ', '', '', 'm', '1973-07-28', 14, 'single');
INSERT INTO person VALUES (399, 'Eli Fernades Lima', '2013-08-29 09:08:43', 1, 'Alvaro Alvim', '', '6     ', 1, '                ', '                ', '         ', '', '', 'm', '1943-11-23', NULL, 'widow(er)');
INSERT INTO person VALUES (400, 'Edsom Rodrigues', '2013-08-29 09:08:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1972-04-22', NULL, 'single');
INSERT INTO person VALUES (401, 'Emersom Jean Vrieber', '2013-08-29 09:08:38', 1, 'Miguel Couto', '', '1306  ', 1, '                ', '                ', '         ', '', '', 'm', '1975-12-19', 25, 'separated');
INSERT INTO person VALUES (402, 'Ericsom Horacio Delezuk', '2013-08-29 09:08:25', 1, 'palmeira', '', '      ', 1, '(42)91092787    ', '(42)30271749    ', '         ', '', '', 'm', '1967-03-12', 21, 'married');
INSERT INTO person VALUES (403, 'Enio Clementino Rodrigues Farias', '2013-08-29 09:08:32', 1, 'Manoel Margues', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-02-02', 13, 'single');
INSERT INTO person VALUES (404, 'Everaldo Jaildo de Almeida', '2013-08-29 09:08:24', 1, 'Alfredo Valentim', '', '22    ', 1, '                ', '                ', '         ', '', '', 'm', '1992-02-12', 24, 'single');
INSERT INTO person VALUES (405, 'Elisandro dos Santos Jaques Coelho', '2013-08-29 09:08:18', 1, 'Marcilio Dias', '', '1378  ', 1, '                ', '                ', '         ', '', '', 'm', '1983-08-10', 7, 'single');
INSERT INTO person VALUES (406, 'Fabio Jose dos Santos', '2013-08-29 09:08:14', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-11-06', NULL, 'single');
INSERT INTO person VALUES (407, 'Erico Andrade Diniz', '2013-08-29 10:08:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1981-09-30', NULL, 'married');
INSERT INTO person VALUES (408, 'Eliseu Gonsalves Santos', '2013-08-29 10:08:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-08-27', NULL, 'single');
INSERT INTO person VALUES (409, 'Edso da Silva Marinho', '2013-08-29 10:08:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-02-22', NULL, '');
INSERT INTO person VALUES (410, 'Ezequiel Mathias da Penha', '2013-08-29 10:08:47', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1984-05-25', NULL, 'single');
INSERT INTO person VALUES (411, 'Edivaldo Jose Carneiro', '2013-08-29 10:08:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1962-10-04', NULL, '');
INSERT INTO person VALUES (412, 'Emersom Gonsalves', '2013-08-29 10:08:14', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-01-12', 2, '');
INSERT INTO person VALUES (413, 'Edsom Oliveira dos Santos', '2013-08-29 10:08:22', 1, 'Aristids Simoens', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1971-09-28', 1, 'single');
INSERT INTO person VALUES (414, 'Eduardo Eloi', '2013-08-29 10:08:30', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1986-06-02', NULL, 'single');
INSERT INTO person VALUES (415, 'Elitom Opata', '2013-08-29 10:08:12', 1, 'Maercelino Nogueira', '', '      ', 1, '942)99908216    ', '                ', '         ', '', '', 'm', '1983-10-06', 2, 'single');
INSERT INTO person VALUES (416, 'Eliakim Ramos Pires', '2013-08-29 10:08:52', 1, 'Cornelio', '', '37    ', 1, '(42)99551242    ', '(42)32395468    ', '         ', '', '', 'm', '1984-07-07', 21, 'single');
INSERT INTO person VALUES (417, 'Emersom Luiz Coelho', '2013-08-29 10:08:21', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-07-14', NULL, 'single');
INSERT INTO person VALUES (418, 'Elizeu de Canpos de Paula', '2013-08-29 10:08:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1995-12-17', NULL, 'single');
INSERT INTO person VALUES (419, 'Evertom Jonaque Gonsalves', '2013-08-29 11:08:20', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-09', NULL, 'single');
INSERT INTO person VALUES (420, 'Eraldo Mendes', '2013-08-29 11:08:13', 1, 'Carlos Chagas', '', '551   ', 1, '                ', '                ', '         ', '', '', 'm', '1957-11-03', 23, 'married');
INSERT INTO person VALUES (421, 'Claudinei Severo Da Silva', '2013-08-29 11:08:16', 1, 'Marques Guimarens', '', '287   ', 1, '                ', '                ', '         ', '', '', 'm', '1975-04-04', 20, 'single');
INSERT INTO person VALUES (422, 'Clevertom Andreata', '2013-08-29 11:08:13', 1, 'Paulo Frontim', '', '768   ', 1, '                ', '                ', '         ', '', '', 'm', '1981-02-08', 27, 'single');
INSERT INTO person VALUES (423, 'Edsom Termosk Lemes', '2013-08-29 11:08:20', 1, 'Expeddicionario Adao Buss', '', '3     ', 1, '                ', '                ', '         ', '', '', 'm', '1977-07-02', 23, 'single');
INSERT INTO person VALUES (424, 'Edsom Leteca', '2013-08-29 11:08:20', 1, 'Xavantes', '', '228   ', 1, '                ', '                ', '84035500 ', '', '', 'm', '1974-08-30', 9, 'married');
INSERT INTO person VALUES (425, 'Eduardo Fernandes', '2013-08-29 11:08:43', 1, 'Leandro Saxramento', '', '156   ', 1, '                ', '                ', '         ', '', '', 'm', '1994-10-18', 20, 'single');
INSERT INTO person VALUES (426, 'Edgar Blam c Gonçalves', '2013-08-29 11:08:48', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1957-10-03', NULL, 'single');
INSERT INTO person VALUES (427, 'Juliano Albino dos Santos', '2013-08-29 11:08:21', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-09-10', NULL, 'single');
INSERT INTO person VALUES (428, 'Everaldo c Chavez', '2013-08-29 11:08:11', 1, 'Teixeira de Macedo', '', '985   ', 1, '                ', '                ', '         ', '', '', 'm', '1979-02-19', 13, 'single');
INSERT INTO person VALUES (429, 'Ericssom Blanc Gonçalves', '2013-08-29 11:08:10', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-12-07', NULL, 'single');
INSERT INTO person VALUES (430, 'Eduado Braga', '2013-08-29 11:08:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-09-08', NULL, 'single');
INSERT INTO person VALUES (431, 'Ericsom Barbosa dos Santos', '2013-08-29 11:08:47', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1885-09-20', NULL, 'single');
INSERT INTO person VALUES (432, 'Eltom Cenci', '2013-08-29 11:08:06', 1, 'Constantino Borsato', '', '48    ', 6, '                ', '                ', '         ', '', '', 'm', '1981-11-30', 5, 'single');
INSERT INTO person VALUES (433, 'Edivaldo Bispo Dos Santos', '2013-08-29 11:08:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-12-02', NULL, 'single');
INSERT INTO person VALUES (434, 'Eversom Jose Santana Pereira', '2013-08-29 11:08:22', 1, 'Wenseslau Braz', '', '54    ', 1, '                ', '                ', '         ', '', '', 'm', '1995-06-16', 13, 'single');
INSERT INTO person VALUES (435, 'Emersom Giovane de Lima Bueno', '2013-08-29 11:08:07', 1, 'Eliseu', '', '80    ', 1, '                ', '                ', '         ', '', '', 'm', '1983-01-27', 17, 'single');
INSERT INTO person VALUES (436, 'Dirceu Pereira de Almeida', '2013-08-29 13:08:53', 1, 'Alfredo Santana', '', '2     ', 1, '                ', '                ', '         ', '', '', 'm', '1975-10-14', 4, 'married');
INSERT INTO person VALUES (437, 'Diego Nazario', '2013-08-29 13:08:03', 1, '', '', '      ', 1, '(42)99091387    ', '(42)91068217    ', '         ', '', '', 'm', '1991-05-01', NULL, 'single');
INSERT INTO person VALUES (438, 'Lairde Lucas Dominques', '2013-08-29 13:08:41', 1, 'Visconde Porto Alegre', '', '1265  ', 1, '(42)99385155    ', '(42)30282751    ', '         ', '', '', 'm', '1988-12-28', 7, 'single');
INSERT INTO person VALUES (439, 'Danila Sesar Machado', '2013-08-29 14:08:59', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1947-12-08', NULL, 'widow(er)');
INSERT INTO person VALUES (440, 'Douglas Nogare', '2013-08-29 14:08:56', 1, '7 de Setenbro', '', '466   ', 1, '                ', '                ', '         ', '', '', 'm', '1985-09-04', 1, 'single');
INSERT INTO person VALUES (441, 'Danilo da Silva Marques', '2013-08-29 14:08:32', 1, 'Joao Ditzel', '', '396   ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-29', 14, 'single');
INSERT INTO person VALUES (442, 'Daniel do Nascimento', '2013-08-29 14:08:51', 1, 'Visconde de Barauna', '', '1604  ', 1, '                ', '                ', '         ', '', '', 'm', '1991-10-25', 7, 'single');
INSERT INTO person VALUES (443, 'Dirceu Farias Ferraz', '2013-08-29 14:08:43', 1, 'Tira dentes', '', '112   ', 9, '                ', '                ', '         ', '', '', 'm', '1988-07-24', NULL, 'single');
INSERT INTO person VALUES (444, 'Daniel dos Santos Marques', '2013-08-29 14:08:09', 1, 'Joao Ditzeel', '', '396   ', 1, '                ', '                ', '         ', '', '', 'm', '1968-09-14', 14, 'single');
INSERT INTO person VALUES (445, 'Divonsir Martins de Oliveira', '2013-08-29 14:08:31', 1, 'Canpo Largo', '', '119   ', 1, '                ', '                ', '         ', '', '', 'm', '1969-11-26', 3, 'single');
INSERT INTO person VALUES (446, 'Daltom Madureira Cordal', '2013-08-29 14:08:53', 1, 'Carvalho Pereira Ramos', '', '74    ', 1, '                ', '                ', '         ', '', '', 'm', '1969-10-31', 4, 'single');
INSERT INTO person VALUES (447, 'Davi Teixeira Pinto', '2013-08-29 14:08:10', 1, 'Visconde de Araguaia', '', '601   ', 1, '                ', '                ', '         ', '', '', 'm', '1964-01-09', 27, 'married');
INSERT INTO person VALUES (448, 'Douglas Ferreira Eleotério', '2013-08-29 14:08:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-09', NULL, '');
INSERT INTO person VALUES (449, 'Daniel Arnesto Ribeiro', '2013-08-29 14:08:44', 1, 'Ivo Alvim', '', '6     ', 1, '                ', '                ', '         ', '', '', 'm', '1982-06-23', 23, 'single');
INSERT INTO person VALUES (450, 'Drio das Neves Aleida', '2013-08-29 14:08:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-10-21', 2, 'single');
INSERT INTO person VALUES (451, 'Celson Borges da SILVA', '2013-08-29 14:08:15', 1, 'Jaguapita', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-07-03', NULL, '');
INSERT INTO person VALUES (452, 'Cleosio Neri de Oliveira', '2013-08-29 14:08:53', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-03-05', NULL, 'single');
INSERT INTO person VALUES (453, 'Carlos Santos Sanpaio', '2013-08-29 15:08:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-08-15', 25, 'single');
INSERT INTO person VALUES (454, 'Cleversom Aramis Paes', '2013-08-29 15:08:49', 1, 'Almirante c', '', '120   ', 1, '(42)99558955    ', '                ', '         ', '', '', 'm', '1990-08-03', 9, 'single');
INSERT INTO person VALUES (455, 'Clevrsom Gonçalves', '2013-08-29 16:08:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-05-07', NULL, 'single');
INSERT INTO person VALUES (456, 'Daivid Gonçalves Da Rocha', '2013-08-29 16:08:34', 1, 'General Joao', '', '197   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-12-15', 23, 'single');
INSERT INTO person VALUES (457, 'Carlos Eduardo da Cruz Pirez', '2013-08-30 09:08:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1980-08-15', NULL, 'single');
INSERT INTO person VALUES (458, 'Cleversom Luiz Ferreira', '2013-08-30 09:08:50', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1989-10-17', NULL, 'single');
INSERT INTO person VALUES (459, 'Claudio Conrrado Junior', '2013-08-30 09:08:54', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1973-01-03', NULL, 'single');
INSERT INTO person VALUES (460, 'Carlos Jamil Vaigas', '2013-08-30 09:08:59', 1, 'Colobia', '', '211   ', 1, '                ', '                ', '         ', '', '', 'm', '1969-05-21', 20, 'single');
INSERT INTO person VALUES (461, 'Cristiano Moreira', '2013-08-30 09:08:48', 1, 'Haiti', '', 'sn    ', 1, '                ', '                ', '         ', '', '', 'm', '1965-08-16', 23, 'single');
INSERT INTO person VALUES (462, 'Cristiam Rodrigo Gorchinski', '2013-08-30 09:08:45', 1, 'Enrique Suber', '', '61    ', 1, '                ', '                ', '         ', '', '', 'm', '1980-07-26', 12, 'single');
INSERT INTO person VALUES (463, 'Carlos Alexandre Pedroso', '2013-08-30 09:08:14', 1, 'Carlos Chagas', '', '370   ', 1, '                ', '                ', '         ', '', '', 'm', '1996-09-17', 23, 'single');
INSERT INTO person VALUES (464, 'Cleversom Tomas de Jesus', '2013-08-30 09:08:05', 1, 'Alfredo Elgenio', '', '235   ', 1, '                ', '                ', '         ', '', '', 'm', '1982-01-21', 24, 'married');
INSERT INTO person VALUES (465, 'Cleversom Silva Tecnoski', '2013-08-30 09:08:26', 1, 'lagoa dourada', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-11-27', 6, 'single');
INSERT INTO person VALUES (466, 'Clebertom dos Santos Santana', '2013-08-30 09:08:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, '');
INSERT INTO person VALUES (467, 'Deivid Gonçalves da Rocha', '2013-08-30 10:08:44', 1, 'General joao', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, 'single');
INSERT INTO person VALUES (468, 'Daivd de Almeida', '2013-08-30 10:08:06', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, 'single');
INSERT INTO person VALUES (469, 'Domingues Sidnei Pedroso', '2013-08-30 10:08:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1964-12-31', NULL, 'single');
INSERT INTO person VALUES (470, 'Emersom Sebastiao Gonssalves da Rosa', '2013-08-30 10:08:41', 1, 'Bartolomeu Bueno', '', '16    ', 1, '                ', '                ', '         ', '', '', 'm', '1985-01-02', NULL, 'single');
INSERT INTO person VALUES (471, 'Evandro Weslei Pires da Silva', '2013-08-30 10:08:36', 1, 'presidente kenedy', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-09-25', 21, 'single');
INSERT INTO person VALUES (472, 'Cleitom Nando dos Santos', '2013-08-30 11:08:01', 1, 'Maestro Bento', '', '118   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-05-19', 16, 'single');
INSERT INTO person VALUES (473, 'Carlos Alexandre Cidral Fernandes', '2013-08-30 11:08:39', 1, 'Perdro Sercundino Pelisale', '', '7     ', 1, '                ', '                ', '         ', '', '', 'm', '1980-02-26', 4, 'single');
INSERT INTO person VALUES (474, 'Celso de Moura Matos', '2013-08-30 11:08:15', 1, 'Lenon Silva', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1963-08-15', 1, 'separated');
INSERT INTO person VALUES (475, 'Cleisom Daivd de paula Rosa', '2013-08-30 11:08:20', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, 'single');
INSERT INTO person VALUES (476, 'Adrano Costa Fortes', '2013-08-30 11:08:07', 1, '', '', '      ', 5, '                ', '                ', '         ', '', '', 'm', '1981-09-25', NULL, 'single');
INSERT INTO person VALUES (477, 'Cleber Luiz Monteiro', '2013-08-30 11:08:44', 1, 'Raul Pinheiro Machado', '', '2     ', 1, '(42)99182970    ', '(42) 32385256   ', '         ', '', '', 'm', '1982-11-17', 4, 'single');
INSERT INTO person VALUES (478, 'Clever Sandro Menon', '2013-08-30 11:08:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-07-31', NULL, 'separated');
INSERT INTO person VALUES (479, 'Carlos Beker Neto', '2013-08-30 11:08:47', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-10-17', NULL, 'single');
INSERT INTO person VALUES (480, 'Cleversom Pires De Oliveira', '2013-08-30 11:08:04', 1, 'Brasil Para Cristo', '', '9     ', 1, '                ', '                ', '         ', '', '', 'm', '1981-11-06', 16, 'married');
INSERT INTO person VALUES (481, 'Rodrigo Ramos de Lara', '2013-08-30 13:08:37', 1, 'Dario Veloso', '', '885   ', 1, '                ', '                ', '         ', '', '', 'm', '1987-11-24', 13, 'single');
INSERT INTO person VALUES (482, 'Paulo Sergio Machado', '2013-08-30 14:08:43', 1, 'Teotonio Jorge', '', '37    ', 1, '                ', '                ', '         ', '', '', 'm', '1991-06-10', 22, 'married');
INSERT INTO person VALUES (483, 'Paulo Sergio de Lima', '2013-08-30 14:08:39', 1, 'Alvares de Azevedo', '', '4     ', 1, '                ', '                ', '         ', '', '', 'm', '1992-04-05', 20, 'separated');
INSERT INTO person VALUES (484, 'Pedro Stevam de Camargo', '2013-08-30 14:08:53', 1, 'Paulo Grorte', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1954-06-28', 15, 'single');
INSERT INTO person VALUES (485, 'Peter Salmom de Jesus', '2013-08-30 14:08:02', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1968-04-25', NULL, 'separated');
INSERT INTO person VALUES (486, 'Pedro Raimundo Antero', '2013-08-30 14:08:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-06-05', NULL, 'single');
INSERT INTO person VALUES (487, 'Patrik DE Almeida', '2013-08-30 14:08:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, 'single');
INSERT INTO person VALUES (488, 'Paulo Rodriques Pexinho', '2013-08-30 14:08:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, 'single');
INSERT INTO person VALUES (489, 'Pedro Carlos Iablosk Filho', '2013-08-30 14:08:32', 1, 'Emilio de Menezes', '', '1025  ', 1, '                ', '                ', '         ', '', '', 'm', '1974-05-23', 9, 'single');
INSERT INTO person VALUES (490, 'Pedro Alexandre Andrade', '2013-08-30 14:08:46', 1, 'Visconde de Porto Alegre', '', '733   ', 1, '                ', '                ', '         ', '', '', 'm', '1980-06-29', 7, 'married');
INSERT INTO person VALUES (491, 'Paulo Egidio Darante', '2013-08-30 14:08:50', 1, 'Otavio de Carvalho', '', '469   ', 1, '                ', '                ', '         ', '', '', 'm', '1980-01-07', 4, 'single');
INSERT INTO person VALUES (492, 'Paulo Cesar Gomes', '2013-08-30 14:08:33', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, '');
INSERT INTO person VALUES (493, 'Paulo Henrigue Floriano dos Santos', '2013-08-30 15:08:46', 1, '', '', '      ', 1, '(41)98784733    ', '                ', '         ', '', '', 'm', '1992-04-12', NULL, 'single');
INSERT INTO person VALUES (494, 'Petersom Figueredo', '2013-08-30 15:08:12', 1, 'Mirim', '', '44    ', 1, '                ', '                ', '         ', '', '', 'm', '1984-03-19', 14, 'single');
INSERT INTO person VALUES (495, 'Paulo Cesar da Cruz', '2013-08-30 15:08:17', 1, 'Brasil Para Cristo', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-09-06', 16, 'single');
INSERT INTO person VALUES (496, 'Percio Bronoski', '2013-08-30 15:08:05', 1, 'Dom Geraldo Pelanda', '', '412   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-11-25', 5, 'single');
INSERT INTO person VALUES (497, 'Paulo Vanderlei Pereira', '2013-08-30 15:08:56', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1966-01-26', NULL, 'single');
INSERT INTO person VALUES (498, 'Paulo Cesar Tomas', '2013-08-30 15:08:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1970-07-07', NULL, 'single');
INSERT INTO person VALUES (499, 'Pulo Pires da Silva', '2013-08-30 15:08:58', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1980-11-09', NULL, 'single');
INSERT INTO person VALUES (500, 'Pedro Luiz Cruz', '2013-08-30 15:08:59', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1971-06-05', NULL, 'single');
INSERT INTO person VALUES (501, 'Paulo Robuto Fernandes dos Santos', '2013-08-30 15:08:44', 1, 'Melo Moraes', '', '437   ', 1, '                ', '                ', '         ', '', '', 'm', '1967-07-16', 23, 'single');
INSERT INTO person VALUES (502, 'Paulo Cesar Rocha de Camargo', '2013-08-30 15:08:34', 1, 'Lira,', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1963-05-15', 21, 'single');
INSERT INTO person VALUES (503, 'Pedro Igor Gomes', '2013-08-30 16:08:31', 1, 'Maranhao Sobrinho', '', '1445  ', 8, '                ', '                ', '         ', '', '', 'm', '1994-09-05', NULL, 'single');
INSERT INTO person VALUES (504, 'Patrik Jose Santana Pereira', '2013-08-30 16:08:24', 1, '', '', '      ', 1, '(42)88226212    ', '                ', '         ', '', '', 'm', '1993-07-04', NULL, 'single');
INSERT INTO person VALUES (505, 'Petersom de Lima', '2013-08-30 16:08:56', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1984-11-23', NULL, '');
INSERT INTO person VALUES (506, 'Paulo Sebastiao  Gonsalves da Rosa', '2013-08-30 16:08:54', 1, 'Vila margarida', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1973-08-09', NULL, 'single');
INSERT INTO person VALUES (507, 'Osvaldo Wagner', '2013-08-30 16:08:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1960-10-10', NULL, 'separated');
INSERT INTO person VALUES (508, 'Oto Peplom DA Cunha', '2013-08-30 16:08:57', 1, '', '', '      ', 9, '                ', '                ', '         ', '', '', 'm', '1966-01-14', NULL, 'single');
INSERT INTO person VALUES (509, 'Niltom Cesar Preir', '2013-09-02 09:09:11', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1974-04-28', NULL, 'single');
INSERT INTO person VALUES (510, 'Nisom dos Santo', '2013-09-02 09:09:31', 1, 'Carlos Cagas', '', '37    ', 1, '                ', '                ', '         ', '', '', 'm', '0194-11-05', 23, '');
INSERT INTO person VALUES (511, 'Nilsom Rosa dos Santos', '2013-09-02 09:09:52', 1, 'Egeheiro Shanber', '', 'sn    ', 1, '                ', '                ', '         ', '', '', 'm', '1969-04-25', 1, 'single');
INSERT INTO person VALUES (512, 'Nelsom Jose Mrtins de Canpos', '2013-09-02 10:09:25', 1, '', '', '      ', 17, '                ', '                ', '         ', '', '', 'm', '1955-03-25', NULL, 'widow(er)');
INSERT INTO person VALUES (513, 'Nelsom Santana', '2013-09-02 10:09:03', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1980-02-02', NULL, 'single');
INSERT INTO person VALUES (514, 'Natham JakinzoTomas', '2013-09-02 10:09:22', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2003-04-05', NULL, 'single');
INSERT INTO person VALUES (515, 'Nivaldo Aparecid dos Satos Rigo', '2013-09-02 10:09:22', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1959-03-13', NULL, 'single');
INSERT INTO person VALUES (516, 'Orland Bhandth Guimaraens', '2013-09-02 10:09:54', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1958-11-20', NULL, 'single');
INSERT INTO person VALUES (517, 'Omar de Oliveira', '2013-09-02 10:09:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1958-01-16', NULL, 'single');
INSERT INTO person VALUES (518, 'Odair Jose Comin', '2013-09-02 10:09:37', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-07-20', NULL, 'single');
INSERT INTO person VALUES (519, 'Odenilsom jose de Franca', '2013-09-02 10:09:42', 1, '', '', '      ', 5, '                ', '                ', '         ', '', '', 'm', '1980-02-07', NULL, 'single');
INSERT INTO person VALUES (520, 'Osni de Oliveira', '2013-09-02 11:09:42', 1, 'josuino de liveira', '', '09    ', 1, '                ', '                ', '         ', '', '', 'm', '1976-02-15', 14, 'single');
INSERT INTO person VALUES (521, 'Odar de Carvalho Oliveira', '2013-09-02 11:09:30', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-05-15', NULL, 'single');
INSERT INTO person VALUES (522, 'Orlando Gonçalves dos Sants', '2013-09-02 11:09:01', 1, '', '', '      ', 3, '                ', '(42)36772511    ', '         ', '', '', 'm', '1993-01-08', NULL, 'single');
INSERT INTO person VALUES (523, 'Oelei  r Batista', '2013-09-03 09:09:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1960-02-17', NULL, 'single');
INSERT INTO person VALUES (524, 'Noel Soares de Oliveira', '2013-09-03 09:09:53', 1, 'Centenario do sul', '', '60    ', 1, '                ', '                ', '         ', '', '', 'm', '1984-05-08', 7, 'single');
INSERT INTO person VALUES (525, 'Nailor Ribas', '2013-09-03 09:09:09', 1, 'Av Ana Rita', '', '1230  ', 1, '                ', '                ', '         ', '', '', 'm', '1969-03-19', NULL, 'single');
INSERT INTO person VALUES (526, 'Olavo Brandt Guimarens', '2013-09-03 09:09:03', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1959-11-20', NULL, '');
INSERT INTO person VALUES (527, 'Oracio Roberto Da Silva', '2013-09-03 09:09:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1973-05-22', NULL, 'single');
INSERT INTO person VALUES (528, 'Osvaldo Mrtins Daeski', '2013-09-03 09:09:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1973-10-10', NULL, 'single');
INSERT INTO person VALUES (529, 'Osmar Clein', '2013-09-03 09:09:29', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-12-24', NULL, 'single');
INSERT INTO person VALUES (530, 'Niltom Ferreira de Moraes', '2013-09-03 09:09:44', 1, '', '', '      ', 1, '                ', '(42)32251733    ', '         ', '', '', 'm', '2006-03-13', NULL, 'single');
INSERT INTO person VALUES (531, 'Marcos Aurelio dos Santos', '2013-09-03 09:09:16', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1994-09-15', NULL, 'single');
INSERT INTO person VALUES (532, 'Maicom Luam de Andrade de Pintos', '2013-09-03 10:09:03', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1985-01-03', NULL, 'single');
INSERT INTO person VALUES (533, 'Marcio Jose De Oliveira', '2013-09-03 10:09:58', 1, 'Bela Vista', '', '880   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-07-22', 16, 'single');
INSERT INTO person VALUES (534, 'Marcos Vinicius Santos', '2013-09-03 10:09:06', 1, 'Alvaro Alvim', '', '93    ', 1, '                ', '                ', '         ', '', '', 'm', '1976-03-03', 23, 'single');
INSERT INTO person VALUES (535, 'Maurico Dias de Moraes', '2013-09-03 10:09:25', 1, 'Aroldo Eschenberg', '', '18    ', 1, '                ', '                ', '         ', '', '', 'm', '1979-01-30', 17, 'single');
INSERT INTO person VALUES (536, 'Magno Ricardo  de Moraes', '2013-09-03 10:09:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-09-09', NULL, 'single');
INSERT INTO person VALUES (537, 'Marcio Adriano de Andrade', '2013-09-03 10:09:35', 1, 'Valério', '', '90    ', 1, '                ', '                ', '84030320 ', '', '', 'm', '1976-01-10', 9, 'single');
INSERT INTO person VALUES (538, 'Marcelo de Siqueira Maciel', '2013-09-03 10:09:59', 1, 'Afonço Celso', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-03', 1, '');
INSERT INTO person VALUES (539, 'Mario de Oliveira', '2013-09-03 10:09:03', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-03', NULL, '');
INSERT INTO person VALUES (540, 'Marcos Leandro Ribeiro', '2013-09-03 10:09:30', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-09-15', NULL, 'married');
INSERT INTO person VALUES (541, 'Michael Aparecido  de Sousa', '2013-09-03 10:09:23', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1987-01-10', NULL, '');
INSERT INTO person VALUES (542, 'Marcos Ramos de Carvalho', '2013-09-03 11:09:18', 1, '7 setenbro', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-05-21', 1, 'single');
INSERT INTO person VALUES (543, 'Marcos Antonio Rosa', '2013-09-03 11:09:10', 1, 'Daily luioz Wanber', '', '2     ', 1, '                ', '                ', '         ', '', '', 'm', '1974-08-01', 4, 'single');
INSERT INTO person VALUES (544, 'Marcelo Pupo Teixeira', '2013-09-03 11:09:44', 1, 'Jose Antonio Mendes', '', '1544  ', 1, '                ', '                ', '         ', '', '', 'm', '1988-02-11', 27, 'single');
INSERT INTO person VALUES (545, 'Marcio Gonçalves', '2013-09-03 11:09:36', 1, 'Luiz Oliveira e Silva', '', '42    ', 1, '                ', '                ', '         ', '', '', 'm', '1976-07-16', 12, 'single');
INSERT INTO person VALUES (546, 'Marcio Jose Ravalhete', '2013-09-03 11:09:39', 1, 'Barbara Setim', '', '591   ', 1, '(42)91183065    ', '(42)32228049    ', '         ', '', '', 'm', '1965-05-01', 5, 'single');
INSERT INTO person VALUES (547, 'Mateus Andre Mendes', '2013-09-03 11:09:40', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2003-09-28', NULL, 'single');
INSERT INTO person VALUES (548, 'Moacir de Pulo Ingles Filho', '2013-09-03 11:09:19', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1969-06-27', NULL, '');
INSERT INTO person VALUES (549, 'Maicom Rodrigo Lemes Gonçalvez', '2013-09-03 11:09:27', 1, 'Porto Amazonas', '', 'sn    ', 1, '                ', '                ', '         ', '', '', 'm', '1993-09-29', 3, 'single');
INSERT INTO person VALUES (550, 'Marcio Angelico', '2013-09-03 11:09:37', 1, 'Doutor Luiz Oliveita', '', '233   ', 1, '                ', '                ', '         ', '', '', 'm', '1951-12-15', NULL, 'single');
INSERT INTO person VALUES (551, 'Mario Sergio Vaz Simeão', '2013-09-03 11:09:23', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1988-01-09', NULL, 'single');
INSERT INTO person VALUES (552, 'Muner Ferreira da Silva', '2013-09-03 11:09:24', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-10-10', NULL, 'single');
INSERT INTO person VALUES (553, 'Marco Antonio Rosa', '2013-09-03 11:09:54', 1, 'Laily Luiz', '', '1     ', 1, '                ', '                ', '         ', '', '', 'm', '1974-08-01', 4, 'married');
INSERT INTO person VALUES (554, 'Marcos Fernandes', '2013-09-03 11:09:01', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-10-04', NULL, 'separated');
INSERT INTO person VALUES (555, 'Marcos Aurelio Da Cunha', '2013-09-03 11:09:21', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-12-30', NULL, 'single');
INSERT INTO person VALUES (556, 'Mateus Rafael de Oliveira', '2013-09-04 09:09:24', 1, '', '', '      ', 1, '                ', '(42)30281008    ', '         ', '', '', 'm', '1991-06-19', NULL, 'single');
INSERT INTO person VALUES (557, 'Marcos Rocha', '2013-09-04 09:09:46', 1, 'Ermelino Teixeira', '', '47    ', 1, '                ', '                ', '         ', '', '', 'm', '1973-05-02', 7, 'separated');
INSERT INTO person VALUES (558, 'Marcio Chaves', '2013-09-04 09:09:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-06-14', NULL, 'single');
INSERT INTO person VALUES (559, 'Rafel da Costa Silva', '2013-09-05 09:09:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1987-03-30', NULL, 'single');
INSERT INTO person VALUES (560, 'Jhonathan da Cunhas Passos', '2013-09-05 09:09:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-04-10', NULL, 'single');
INSERT INTO person VALUES (561, 'Cristiam Orencio de Andrade', '2013-09-05 09:09:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-12-12', 14, 'single');
INSERT INTO person VALUES (562, 'Marlene Lizardo Madeira', '2013-09-05 10:09:49', 1, 'Manoel Soares dos Santos', '', '585   ', 1, '                ', '                ', '84015330 ', '', '', 'm', '1998-02-12', 24, 'single');
INSERT INTO person VALUES (563, 'Paulo Cesar Reis', '2013-09-05 10:09:53', 1, 'Jose Branco Ribas', '', '84    ', 1, '(42)98013601    ', '                ', '         ', '', '', 'm', '1991-08-30', 5, 'single');
INSERT INTO person VALUES (564, 'Fernado Estefaniak', '2013-09-05 10:09:50', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-06-13', NULL, 'single');
INSERT INTO person VALUES (565, 'Fabio Rodrigues de Oliveira', '2013-09-05 10:09:46', 1, 'Sousa Mendes', '', '15    ', 1, '(42)91095812    ', '                ', '         ', '', '', 'm', '1989-12-09', 7, 'single');
INSERT INTO person VALUES (566, 'Jonatham Cristovao Kogut Batista', '2013-09-05 10:09:25', 1, 'Homa', '', '132   ', 1, '                ', '                ', '         ', '', '', 'm', '1988-05-01', 7, 'single');
INSERT INTO person VALUES (567, 'Alex Sandro dos Santos', '2013-09-05 10:09:32', 1, 'Silas Sales', '', '556   ', 1, '                ', '(42)32271275    ', '         ', '', '', 'm', '1979-01-01', 7, 'single');
INSERT INTO person VALUES (568, 'Emersom Jose Araujo Canpos', '2013-09-05 11:09:15', 1, 'Frei Caneca', '', '23    ', 1, '                ', '(42)32235907    ', '         ', '', '', 'm', '1975-02-22', 1, 'single');
INSERT INTO person VALUES (569, 'Luiz Carlos Rodrigues', '2013-09-05 11:09:50', 1, 'av Noroeste', '', '38    ', 1, '                ', '(42)99148622    ', '         ', '', '', 'm', '1979-12-17', 16, 'married');
INSERT INTO person VALUES (570, 'Gustavo Felipe  Martinho de Oliveira', '2013-09-05 11:09:45', 1, 'Antonio Rodrigues Santana', '', '15151 ', 1, '(67)91015750    ', '                ', '         ', '', '', 'm', '1993-12-16', 7, 'single');
INSERT INTO person VALUES (571, 'Crislaine Andrade Cardoso', '2013-09-05 11:09:25', 1, 'Eugenio José', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1993-10-29', 7, 'single');
INSERT INTO person VALUES (572, 'Andre Felipe Ferreira', '2013-09-05 11:09:04', 1, 'Algusto Canto', '', '346   ', 1, '(42)99462750    ', '                ', '         ', '', '', 'm', '1990-07-31', 4, 'single');
INSERT INTO person VALUES (573, 'Leandro Gomes de Paula', '2013-09-05 11:09:38', 1, 'Francisco Frajad', '', '8     ', 1, '                ', '                ', '         ', '', '', 'm', '1995-06-26', 9, 'single');
INSERT INTO person VALUES (574, 'Leonel Ferreira de Lima', '2013-09-05 15:09:41', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1959-07-22', NULL, 'single');
INSERT INTO person VALUES (575, 'Josiane Dias Gonçalves', '2013-09-05 15:09:14', 1, 'Francisco Piercosk', '', '33    ', 1, '(42)99706130    ', '                ', '         ', '', '', 'f', '1992-08-11', NULL, 'single');
INSERT INTO person VALUES (576, 'Ana Claudia dos Santos', '2013-09-05 15:09:03', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1976-07-19', NULL, 'single');
INSERT INTO person VALUES (577, 'Amiltom Antunes de Proença', '2013-09-05 15:09:59', 1, 'Jeremias', '', '34    ', 1, '942)98367883    ', '                ', '         ', '', '', 'm', '1966-10-25', 16, 'single');
INSERT INTO person VALUES (578, 'Tainá de Freitas', '2013-09-05 16:09:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1998-01-28', NULL, 'single');
INSERT INTO person VALUES (579, 'Thainara Domingues Da Silva', '2013-09-06 09:09:47', 1, 'Sousa Dantes', '', '420   ', 1, '                ', '                ', '         ', '', '', 'f', '1999-11-10', 23, 'single');
INSERT INTO person VALUES (580, 'Tatiana Aparecida Alves Dos antos', '2013-09-06 09:09:14', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2000-08-08', NULL, 'single');
INSERT INTO person VALUES (581, 'Samanta Gonçalves Soares', '2013-09-06 09:09:51', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2001-05-24', NULL, 'single');
INSERT INTO person VALUES (582, 'Tatiane Aparecida de Paula', '2013-09-06 09:09:55', 1, 'Vitzel Joao', '', '396   ', 1, '                ', '                ', '         ', '', '', 'f', '1999-07-19', 14, 'single');
INSERT INTO person VALUES (583, 'Teresinha Aparecia Martins', '2013-09-06 09:09:15', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1954-06-14', NULL, 'single');
INSERT INTO person VALUES (584, 'Sandra Mara Xavier Batista', '2013-09-06 09:09:35', 1, 'Teodora Klupel Neto', '', '26    ', 1, '                ', '                ', '         ', '', '', 'f', '1961-12-03', 7, '');
INSERT INTO person VALUES (585, 'Sirlei Gonçalves de Deus', '2013-09-06 09:09:27', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1969-05-16', NULL, 'married');
INSERT INTO person VALUES (586, 'Sonia Boniti dos Santos', '2013-09-06 09:09:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1969-02-04', NULL, 'single');
INSERT INTO person VALUES (587, 'Stefani de Paula Ribeiro de  Jesus', '2013-09-06 09:09:48', 1, 'Aide Oliveira', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2004-04-30', 14, 'single');
INSERT INTO person VALUES (588, 'Suelem Viana dos Santos', '2013-09-06 09:09:00', 1, 'General Boinos Falcao', '', '48    ', 1, '                ', '                ', '         ', '', '', 'f', '1993-01-25', 14, 'single');
INSERT INTO person VALUES (589, 'Silmara dos Santos', '2013-09-06 09:09:58', 1, 'Teixeir de macedo', '', '935   ', 1, '                ', '                ', '         ', '', '', 'f', '19979-07-21', 9, 'married');
INSERT INTO person VALUES (590, 'Rosiana Aparecida dos Santos', '2013-09-06 10:09:41', 1, 'Teixeira de Macedo', '', '935   ', 1, '                ', '                ', '         ', '', '', 'f', '1968-07-29', 9, 'single');
INSERT INTO person VALUES (591, 'Raquel Garret dos Santos', '2013-09-06 10:09:16', 1, 'Alexandre Lejanbre', '', '544   ', 1, '                ', '                ', '84062694 ', '', '', 'f', '1973-11-03', NULL, 'married');
INSERT INTO person VALUES (592, 'Lucimeri do Rocio Gonçalves', '2013-09-06 10:09:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1973-08-23', NULL, 'single');
INSERT INTO person VALUES (593, 'Rosalina Martins da Silva', '2013-09-06 10:09:45', 1, 'Sertanopolis', '', '17    ', 1, '                ', '(42)32228089    ', '         ', '', '', 'f', '1932-01-20', 25, 'married');
INSERT INTO person VALUES (594, 'Rosangela Gonçalves', '2013-09-06 10:09:37', 1, 'Pedro Francisco', '', '10    ', 1, '                ', '                ', '         ', '', '', 'f', '1983-01-01', NULL, 'married');
INSERT INTO person VALUES (595, 'Rosiane Aparecida Bueno', '2013-09-06 10:09:01', 1, 'Barbosa Lima', '', '208   ', 1, '                ', '                ', '         ', '', '', 'f', '1982-02-14', 23, 'married');
INSERT INTO person VALUES (596, 'Rosana Aparecida Machado', '2013-09-06 11:09:02', 1, 'Alberto de Oliveira', '', '141   ', 1, '                ', '                ', '         ', '', '', 'f', '1966-03-16', 7, 'single');
INSERT INTO person VALUES (597, 'Roseli Teresinha C da Luz', '2013-09-06 11:09:08', 1, 'Antonio Saad', '', '65    ', 1, '                ', '                ', '         ', '', '', 'f', '1962-10-27', 7, 'single');
INSERT INTO person VALUES (598, 'Rosana Aparecida Aráujo', '2013-09-06 11:09:24', 1, '', '', '      ', 1, '(42)98054815    ', '                ', '         ', '', '', 'f', '1975-08-26', 3, 'single');
INSERT INTO person VALUES (599, 'Raeli de Paula Rosa', '2013-09-06 11:09:29', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1990-11-09', NULL, 'single');
INSERT INTO person VALUES (600, 'Roseli de Fatima Paes', '2013-09-06 11:09:12', 1, 'Almirante', '', '122   ', 1, '(42)99011886    ', '                ', '284036230', '', '', 'f', '1957-02-11', NULL, 'single');
INSERT INTO person VALUES (601, 'Rosiane de Oliveira', '2013-09-06 11:09:50', 1, 'Nelsom Narciso', '', '12    ', 1, '                ', '                ', '         ', '', '', 'f', '1976-07-06', 25, 'separated');
INSERT INTO person VALUES (602, 'Solange de Fatima', '2013-09-06 11:09:36', 1, 'rua o ,31', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1980-02-13', 11, 'married');
INSERT INTO person VALUES (603, 'Solange Cardoso', '2013-09-06 11:09:58', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1980-08-06', 23, 'single');
INSERT INTO person VALUES (604, 'Sirlene Ferreira Catarina', '2013-09-06 11:09:11', 1, 'Farias de Brito', '', '392   ', 1, '                ', '                ', '84016050 ', '', '', 'f', '1972-06-27', 23, 'single');
INSERT INTO person VALUES (605, 'Sarita Fatima Braz', '2013-09-06 11:09:03', 1, 'Jucelino Kubcheck', '', '371   ', 1, '                ', '                ', '         ', '', '', 'f', '1975-12-02', 5, 'single');
INSERT INTO person VALUES (606, 'Roselia Maria Lukasiervicz', '2013-09-09 09:09:45', 1, 'Sabaudia', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'f', '1953-05-24', 7, 'widow(er)');
INSERT INTO person VALUES (607, 'Renata Aparecida Pedroso Ribas', '2013-09-09 09:09:23', 1, 'Bonifaci Ribas', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1998-07-15', 13, 'single');
INSERT INTO person VALUES (608, 'Regiliane da Costa de Almeida', '2013-09-09 09:09:53', 1, 'Santo Antonio da Platina', '', '28    ', 1, '(42)9935765     ', '                ', '         ', '', '', 'f', '1977-11-18', 21, 'married');
INSERT INTO person VALUES (609, 'Pamela Vitorino Rodrigues', '2013-09-09 09:09:30', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2010-08-14', NULL, 'single');
INSERT INTO person VALUES (610, 'Paulina Pires Debas', '2013-09-09 09:09:34', 1, 'Espirito Santo', '', '174   ', 1, '                ', '                ', '         ', '', '', 'f', '1965-06-28', NULL, 'married');
INSERT INTO person VALUES (611, 'Priciele de Paula', '2013-09-09 09:09:59', 1, 'Bonifacio Ribas', '', '1321  ', 1, '                ', '                ', '         ', '', '', 'f', '1993-08-18', 11, 'single');
INSERT INTO person VALUES (612, 'Ovanda Gonçalvez da Silva', '2013-09-09 09:09:11', 1, 'Prof. Jogurte de Oliveira', '', '367   ', 1, '                ', '                ', '         ', '', '', 'f', '1953-09-15', 21, 'separated');
INSERT INTO person VALUES (613, 'Noemi dos Santos Marques', '2013-09-09 09:09:34', 1, 'Silva Sales', '', '185   ', 1, '                ', '                ', '         ', '', '', 'f', '1982-11-27', 7, 'married');
INSERT INTO person VALUES (614, 'Nilcéia da Silva', '2013-09-09 09:09:07', 1, 'rua 11', '', '291   ', 1, '                ', '                ', '         ', '', '', 'f', '1974-03-12', 16, 'single');
INSERT INTO person VALUES (615, 'Mareza Ramos Carvalho', '2013-09-09 09:09:25', 1, 'Alfredo Santana', '', '2     ', 1, '                ', '                ', '         ', '', '', 'f', '2004-06-18', 4, 'single');
INSERT INTO person VALUES (616, 'Marina Carvalho Pereira de Almeida', '2013-09-09 10:09:34', 1, 'Alfredo Santana', '', '2     ', 1, '                ', '                ', '         ', '', '', 'f', '2011-09-20', 4, 'single');
INSERT INTO person VALUES (617, 'Micaelly de Oliveira', '2013-09-09 10:09:54', 1, 'Nielsom Narciso Vitiato', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'f', '2003-11-14', 20, 'single');
INSERT INTO person VALUES (618, 'Maria Regina Alves Santos', '2013-09-09 10:09:05', 1, 'Carlos Chagas', '', '370   ', 1, '                ', '                ', '         ', '', '', 'f', '1991-06-03', 23, 'single');
INSERT INTO person VALUES (619, 'Mayara Livina Ramos', '2013-09-09 10:09:17', 1, 'Expedicionario Dom Bosco', '', '1     ', 1, '                ', '                ', '         ', '', '', 'f', '1998-01-02', 16, 'single');
INSERT INTO person VALUES (620, 'Maria Aparecida Menezes de Lara', '2013-09-09 10:09:07', 1, '', '', '      ', 1, '(42)91420105    ', '                ', '         ', '', '', 'f', '1980-03-20', NULL, 'married');
INSERT INTO person VALUES (621, 'Maria Gabriela Martins do Nascimento', '2013-09-09 10:09:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1985-03-09', NULL, 'single');
INSERT INTO person VALUES (622, 'Maria Daniele Grosevic', '2013-09-09 10:09:23', 1, 'Raimundo Correia', '', '21    ', 1, '(42)91444439    ', '(42)32298730    ', '         ', '', '', 'f', '1977-07-27', 28, 'single');
INSERT INTO person VALUES (623, 'Mariana Rosilda Rodrigues', '2013-09-09 10:09:33', 1, 'Raider Oliveira Madureira', '', '71    ', 1, '                ', '                ', '         ', '', '', 'f', '1972-06-24', 14, 'single');
INSERT INTO person VALUES (624, 'Maria de Lurdes Pinheiro', '2013-09-09 10:09:31', 1, 'Bonifacio Ribas', '', '567   ', 1, '                ', '                ', '         ', '', '', 'f', '1948-12-08', 20, 'widow(er)');
INSERT INTO person VALUES (625, 'Mayara Francine Pereira', '2013-09-09 10:09:08', 1, 'Antonio Carlos', '', '100   ', 1, '                ', '                ', '         ', '', '', 'f', '1991-10-06', 27, 'single');
INSERT INTO person VALUES (626, 'Marcia Regina Ramos Carvalho', '2013-09-09 10:09:54', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1973-06-05', NULL, 'married');
INSERT INTO person VALUES (627, 'Marcia Regina Ramos Carvalho', '2013-09-09 10:09:07', 1, 'Alfredo Santana', '', '2     ', 1, '                ', '                ', '         ', '', '', 'f', '1973-06-05', 4, 'single');
INSERT INTO person VALUES (628, 'Margarete da Rosa Carneiro', '2013-09-09 10:09:33', 1, 'Teodoro Pinheiro Machado', '', '4     ', 1, '                ', '                ', '         ', '', '', 'f', '1982-08-05', 30, 'single');
INSERT INTO person VALUES (629, 'Maria das Graças de Melo', '2013-09-09 11:09:18', 1, 'Jaci Monteiro', '', '89    ', 1, '                ', '                ', '         ', '', '', 'f', '1957-12-01', 14, 'widow(er)');
INSERT INTO person VALUES (630, 'Karina Aparecida Viana', '2013-09-10 09:09:18', 1, 'Rio Grande do Sul', '', '418   ', 1, '                ', '                ', '         ', '', '', 'f', '1979-04-27', 4, 'single');
INSERT INTO person VALUES (631, 'Karem Kaoine dos Santos Marques', '2013-09-10 09:09:10', 1, 'Silas Sales', '', '185   ', 1, '                ', '                ', '         ', '', '', 'f', '2001-07-01', 7, 'single');
INSERT INTO person VALUES (632, 'Leticia Gilu', '2013-09-10 09:09:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1990-11-09', NULL, '');
INSERT INTO person VALUES (633, 'Marta de Oliveira Vitorino', '2013-09-10 09:09:49', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1985-04-14', NULL, 'single');
INSERT INTO person VALUES (634, 'Kinberli Matani Rodrigues', '2013-09-10 09:09:44', 1, 'Prof. Raider Oliveira Madureira', '', '76    ', 1, '                ', '                ', '         ', '', '', 'f', '2001-08-18', 7, 'single');
INSERT INTO person VALUES (635, 'Ketlyn Kauane Jakinso Machado', '2013-09-10 09:09:10', 1, 'Xisto', '', '149   ', 1, '                ', '                ', '         ', '', '', 'f', '2001-02-23', 15, 'single');
INSERT INTO person VALUES (636, 'Kelly Rodrigues Shut', '2013-09-10 10:09:10', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1994-10-10', 14, 'single');
INSERT INTO person VALUES (637, 'Kethelen Camargo', '2013-09-10 10:09:54', 1, 'Abelardo de Brito', '', '15    ', 1, '                ', '                ', '         ', '', '', 'f', '2002-11-24', NULL, 'single');
INSERT INTO person VALUES (638, 'Karoline Rodrigues Ferreira', '2013-09-10 10:09:58', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1997-11-07', NULL, 'single');
INSERT INTO person VALUES (639, 'Lauri Rodrigues da Silva', '2013-09-10 11:09:48', 1, 'Julio Perneta', '', '299   ', 1, '                ', '                ', '         ', '', '', 'f', '2002-10-26', NULL, 'single');
INSERT INTO person VALUES (640, 'Lucinéia Mendes Gonçalves', '2013-09-10 11:09:18', 1, 'Carlos Chagas', '', '15    ', 1, '                ', '                ', '         ', '', '', 'f', '1984-08-18', 17, 'single');
INSERT INTO person VALUES (641, 'Luciane Mendes Gonçalves', '2013-09-10 11:09:41', 1, 'Leocena', '', '249   ', 1, '(42)91187963    ', '                ', '         ', '', '', 'f', '1982-11-04', 13, 'single');
INSERT INTO person VALUES (642, 'Luiza Lopes de Paula', '2013-09-10 11:09:52', 1, '', '', '      ', 5, '                ', '                ', '         ', '', '', 'f', '1986-12-25', NULL, 'married');
INSERT INTO person VALUES (643, 'Luciane Aparecida Pasturcsak', '2013-09-10 11:09:35', 1, 'Cesinha Matos', '', '04    ', 1, '                ', '                ', '         ', '', '', 'f', '1962-06-15', 12, 'married');
INSERT INTO person VALUES (644, 'Lucimara Aparecida Silva', '2013-09-10 11:09:50', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1975-04-05', 2, 'single');
INSERT INTO person VALUES (645, 'Maria Luciana do nascimento', '2013-09-12 09:09:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1969-03-15', NULL, 'single');
INSERT INTO person VALUES (646, 'Margaret Luiz', '2013-09-12 09:09:14', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1979-08-13', NULL, 'single');
INSERT INTO person VALUES (647, 'Margarete Rosa Machado', '2013-09-12 09:09:28', 1, 'Estrada rio Verde', '', '21    ', 1, '                ', '                ', '         ', '', '', 'f', '1965-09-09', 25, 'single');
INSERT INTO person VALUES (648, 'Maria Clarice Cardoso de Paula', '2013-09-12 09:09:01', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1992-12-12', NULL, 'single');
INSERT INTO person VALUES (649, 'Maira Domingues', '2013-09-12 09:09:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1998-05-31', NULL, '');
INSERT INTO person VALUES (650, 'Miriam Rodrigues de Paula', '2013-09-12 09:09:49', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1971-05-24', NULL, 'widow(er)');
INSERT INTO person VALUES (651, 'Marinalva Lima Padilha', '2013-09-12 09:09:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1980-10-10', 7, 'married');
INSERT INTO person VALUES (652, 'Maria Rosa de Jesus', '2013-09-12 09:09:13', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1977-03-02', NULL, 'single');
INSERT INTO person VALUES (653, 'Marina de Brito', '2013-09-12 09:09:14', 1, 'Maecilio Dias', '', '1889  ', 1, '(42)99892414    ', '                ', '         ', '', '', 'f', '1974-07-28', 7, 'single');
INSERT INTO person VALUES (654, 'Marcia Teixeira De Paula', '2013-09-12 09:09:46', 1, 'Roicler Oliveira', '', '76    ', 1, '                ', '                ', '         ', '', '', 'f', '1974-07-28', 14, 'single');
INSERT INTO person VALUES (655, 'Maria Luciane do nascimento', '2013-09-12 09:09:38', 1, 'Prof  Alzira Braga.', '', '1000  ', 1, '                ', '                ', '         ', '', '', 'f', '1969-03-15', 22, 'single');
INSERT INTO person VALUES (656, 'Miram Teresinha Ribeiro dos Santos', '2013-09-12 10:09:34', 1, 'Prof Aide de Oliveira', '', '42    ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-12', 7, '');
INSERT INTO person VALUES (657, 'Maria Rosa Correa Soares', '2013-09-12 10:09:11', 1, 'Alex Feloix Alvares', '', '141   ', 1, '                ', '                ', '         ', '', '', 'f', '1949-10-08', NULL, 'married');
INSERT INTO person VALUES (658, 'Jair de Jesus', '2013-09-12 11:09:49', 1, 'Ermelino de Leao', '', '1161  ', 1, '                ', '                ', '         ', '', '', 'm', '1960-12-28', 9, 'single');
INSERT INTO person VALUES (659, 'Jair de Jesus', '2013-09-13 10:09:00', 1, 'Ermelino de Leao', '', '1161  ', 1, '                ', '                ', '         ', '', '', 'm', '1960-12-28', 1, 'separated');
INSERT INTO person VALUES (660, 'João Ribeiro de Jesus', '2013-09-13 10:09:15', 1, 'João Ditzel', '396', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-02-08', 14, 'married');
INSERT INTO person VALUES (661, 'Jonathan Aihom Vieira', '2013-09-13 10:09:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-04-01', NULL, 'single');
INSERT INTO person VALUES (662, 'João Maria Cardozo de Lima', '2013-09-13 10:09:03', 1, 'rua a jd Atlanta', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1951-01-02', NULL, 'widow(er)');
INSERT INTO person VALUES (663, 'José Roberto', '2013-09-13 10:09:33', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-02-28', NULL, 'single');
INSERT INTO person VALUES (664, 'Jose Eduardo Chagas da Silva', '2013-09-13 10:09:12', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-09', NULL, 'single');
INSERT INTO person VALUES (665, 'Joao Miguel das Neves', '2013-09-13 10:09:56', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-02-25', NULL, 'single');
INSERT INTO person VALUES (666, 'Joao Miguel das Neves', '2013-09-16 09:09:23', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-02-25', NULL, 'single');
INSERT INTO person VALUES (667, 'Julio Cesar De Camargo', '2013-09-16 09:09:27', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-02-11', NULL, 'single');
INSERT INTO person VALUES (668, 'João Vitor Borges dos Santos', '2013-09-16 09:09:40', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2007-09-26', NULL, 'single');
INSERT INTO person VALUES (669, 'Jerfersom Luiz de Souza Lima', '2013-09-16 09:09:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1987-06-25', NULL, 'single');
INSERT INTO person VALUES (670, 'José Enrique Barbosa', '2013-09-16 09:09:06', 1, 'Evaristo d Veiga', '', '97    ', 1, '                ', '                ', '         ', '', '', 'm', '1987-01-20', 23, 'single');
INSERT INTO person VALUES (671, 'Junior Lucas de Lima', '2013-09-16 09:09:40', 1, 'Francisco Mateus', '', '11    ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-17', 3, 'single');
INSERT INTO person VALUES (672, 'Jeniffer Luana Borges dos Santos', '2013-09-16 09:09:49', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1996-08-02', NULL, '');
INSERT INTO person VALUES (673, 'Izael Rodrigues dos Santos', '2013-09-16 09:09:41', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-07-20', NULL, 'single');
INSERT INTO person VALUES (674, 'João Waltrick', '2013-09-16 09:09:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1957-10-09', NULL, 'single');
INSERT INTO person VALUES (675, 'Izael Romoaldo da Cruz', '2013-09-16 09:09:22', 1, '', '', '      ', 1, '                ', '(42)32268918    ', '         ', '', '', 'm', '1954-03-01', NULL, 'married');
INSERT INTO person VALUES (676, 'Ivanil Martins da Silva', '2013-09-16 09:09:56', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-07-10', NULL, 'single');
INSERT INTO person VALUES (677, 'José Cruz dias', '2013-09-16 09:09:01', 1, 'Cavernoso', '', '526   ', 1, '(42)99818692    ', '(42)30255257    ', '84020510 ', '', '', 'm', '2013-01-16', 11, 'single');
INSERT INTO person VALUES (678, 'João Pedro Ricetti', '2013-09-16 09:09:20', 1, 'Antonio Saad', '', '595   ', 1, '(42)99497515    ', '(42)32381753    ', '         ', '', '', 'm', '1993-06-17', 14, 'single');
INSERT INTO person VALUES (679, 'João Mario Rodrigues', '2013-09-16 09:09:09', 1, 'Joao Passiniak Filho', '', '48    ', 1, '(42)99334705    ', '(42)99128552    ', '         ', '', '', 'm', '1995-06-01', 5, 'single');
INSERT INTO person VALUES (680, 'Julino da Silva Lemes', '2013-09-16 09:09:59', 1, 'Arenitos', '', '111   ', 1, '(42)99294138    ', '                ', '         ', '', '', 'm', '1976-05-03', 21, 'single');
INSERT INTO person VALUES (681, 'Igor dos Santos', '2013-09-16 09:09:10', 1, 'Izaias da Luz', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1956-10-19', 14, 'separated');
INSERT INTO person VALUES (682, 'João Marcos Orloski', '2013-09-16 10:09:54', 1, 'Fabio de Mello Binilha', '', '142   ', 1, '                ', '                ', '         ', '', '', 'm', '1973-06-23', 14, 'single');
INSERT INTO person VALUES (683, 'Josmar José Kalenoski', '2013-09-16 10:09:57', 1, 'Ana Elesabeth', '', '275   ', 1, '                ', '(42)32392575    ', '         ', '', '', 'm', '2012-04-02', 16, 'single');
INSERT INTO person VALUES (684, 'José Ediardo Chagas da Silva', '2013-09-16 10:09:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1972-06-07', NULL, 'single');
INSERT INTO person VALUES (685, 'José Agusto Ribas', '2013-09-16 10:09:09', 1, 'Anita Garibaldi', '', '3002  ', 1, '                ', '                ', '         ', '', '', 'm', '1959-02-08', 24, '');
INSERT INTO person VALUES (686, 'José Vanderlei Vaz', '2013-09-16 10:09:34', 1, 'Agostinho Jorge', '', '20    ', 1, '                ', '                ', '         ', '', '', 'm', '1983-06-20', NULL, 'single');
INSERT INTO person VALUES (687, 'Juliano dos Santos Gonçalves', '2013-09-16 10:09:47', 1, 'São José Fate', '', '1369  ', 1, '(42)_99856402   ', '                ', '         ', '', '', 'm', '1988-05-02', 22, 'single');
INSERT INTO person VALUES (688, 'Jefersom Antonio de Lima', '2013-09-16 10:09:18', 1, '', '', '      ', 1, '                ', '(42)_32364770   ', '         ', '', '', 'm', '1981-06-14', NULL, 'single');
INSERT INTO person VALUES (689, 'João Carlos Nunes da Silva', '2013-09-16 10:09:27', 1, 'Francisco Resental', '', '23    ', 1, '                ', '                ', '         ', '', '', 'm', '1968-07-09', 14, 'single');
INSERT INTO person VALUES (690, 'José Aldo Nascimento', '2013-09-16 10:09:05', 1, 'Helena Silas', '', '178   ', 1, '                ', '                ', '         ', '', '', 'm', '1967-03-01', 7, 'single');
INSERT INTO person VALUES (691, 'Francisco Vilmar dos Santos Marques', '2013-09-16 10:09:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1965-10-22', NULL, 'single');
INSERT INTO person VALUES (692, 'Felipe de Paula Oliveira', '2013-09-16 10:09:42', 1, 'Luciano Alves da Silva', '', '31    ', 1, '                ', '                ', '         ', '', '', 'm', '1999-03-18', 9, 'single');
INSERT INTO person VALUES (693, 'Fabine Soares dos Santos', '2013-09-16 10:09:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-11-27', NULL, 'single');
INSERT INTO person VALUES (694, 'Franco Simõens Dias Lencine Junior', '2013-09-16 10:09:05', 1, 'Colonos', '', '302   ', 1, '(42)98233746    ', '(42)_32250481   ', '         ', '', '', 'm', '1990-04-24', 21, 'single');
INSERT INTO person VALUES (695, 'Fabio José dos Santos', '2013-09-16 10:09:29', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-11-06', NULL, 'single');
INSERT INTO person VALUES (696, 'Fabio do Rocio', '2013-09-16 10:09:10', 1, 'Padre antonio', '', '75    ', 1, '                ', '                ', '         ', '', '', 'm', '1985-10-25', 4, 'single');
INSERT INTO person VALUES (697, 'Francisco Ricieri Carneiro', '2013-09-16 11:09:42', 1, 'Cornélio gomes', '', '112   ', 1, '                ', '                ', '         ', '', '', 'm', '1968-09-26', 13, 'married');
INSERT INTO person VALUES (698, 'José Antono Matos', '2013-09-16 11:09:39', 1, 'Certanopolis', '', '61    ', 1, '                ', '                ', '         ', '', '', 'm', '1961-08-19', 6, 'married');
INSERT INTO person VALUES (699, 'José Romulo dos Santos', '2013-09-16 11:09:09', 1, 'Césinha Matos de Souza', '', '04    ', 1, '                ', '                ', '         ', '', '', 'm', '1949-05-25', 29, 'married');
INSERT INTO person VALUES (700, 'João José Evangelista Silva', '2013-09-16 11:09:20', 1, '', '', '      ', 1, '                ', '(33)91403464    ', '         ', '', '', 'm', '1966-09-30', NULL, 'single');
INSERT INTO person VALUES (701, 'Juares Rodrigues', '2013-09-16 11:09:22', 1, '', '', '      ', 2, '                ', '                ', '         ', '', '', 'm', '1963-05-12', NULL, 'single');
INSERT INTO person VALUES (702, 'José Carlos Marques', '2013-09-16 11:09:55', 1, 'Rodrigo Otavio', '', '135   ', 1, '                ', '                ', '         ', '', '', 'm', '1957-03-02', NULL, 'single');
INSERT INTO person VALUES (703, 'João Maria Venancio', '2013-09-16 11:09:29', 1, 'Alfredo Trentim', '', '20    ', 1, '                ', '                ', '         ', '', '', 'm', '1973-09-13', 24, 'single');
INSERT INTO person VALUES (704, 'Jurandir José da Rosa', '2013-09-16 11:09:45', 1, 'Arararuana', '', '8     ', 1, '                ', '                ', '         ', '', '', 'm', '1943-12-22', 3, 'single');
INSERT INTO person VALUES (705, 'José Altair Elias', '2013-09-16 11:09:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-11-29', NULL, 'married');
INSERT INTO person VALUES (706, 'José Osvaldo Viana do Carmo', '2013-09-16 11:09:23', 1, 'Teodoro Sanpaio', '', '595   ', 1, '(42)99906688    ', '(42)32237556    ', '         ', '', '', 'm', '1975-01-31', 3, 'married');
INSERT INTO person VALUES (707, 'Joao Santos de Lacerda', '2013-09-16 11:09:23', 1, 'Francisco Ribas', '', '1125  ', 1, '                ', '                ', '         ', '', '', 'm', '1961-08-12', 1, 'separated');
INSERT INTO person VALUES (708, 'João Maria de Oliveira', '2013-09-16 11:09:18', 1, '', '', '      ', 12, '                ', '                ', '         ', '', '', 'm', '1964-10-11', NULL, 'separated');
INSERT INTO person VALUES (709, 'Gilsom Gonçalves da silva', '2013-09-16 11:09:46', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-07-08', NULL, 'single');
INSERT INTO person VALUES (710, 'Gersom Kelly', '2013-09-16 11:09:18', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1978-09-15', NULL, 'single');
INSERT INTO person VALUES (711, 'Gustavo Henrique Alves', '2013-09-16 11:09:23', 1, '', '', '      ', 12, '                ', '                ', '         ', '', '', 'm', '1992-04-14', NULL, 'single');
INSERT INTO person VALUES (712, 'Herlysom Bamdeira Maia', '2013-09-17 09:09:47', 1, '12 quadra 8', '', '18    ', 1, '(98)82049229    ', '(98)32323007    ', '         ', '', '', 'm', '1988-08-18', NULL, 'single');
INSERT INTO person VALUES (713, 'Hudsom Nunes da Cruz', '2013-09-17 09:09:45', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-01-20', NULL, 'single');
INSERT INTO person VALUES (714, 'Hamilton Soares Sutil', '2013-09-17 09:09:51', 1, 'Sao Jeronimo', '', '55    ', 1, '                ', '                ', '         ', '', '', 'm', '1948-03-14', 19, 'single');
INSERT INTO person VALUES (715, 'Isaias Dopmingos da Silva', '2013-09-17 09:09:44', 1, 'Sousa Dantas', '', '      ', 1, '                ', '                ', '         ', '', '420', 'm', '1995-10-16', 23, 'single');
INSERT INTO person VALUES (716, 'Gustavo Pinheiro da Silva', '2013-09-17 09:09:49', 1, 'Nicolau Frotinjano', '', 'sn    ', 1, '                ', '                ', '         ', '', '', 'm', '1989-01-15', 5, 'single');
INSERT INTO person VALUES (717, 'Gilberto Reis da Silva', '2013-09-17 09:09:18', 1, 'Paes de Andrade', '', '320   ', 1, '                ', '                ', '         ', '', '', 'm', '1973-02-04', 22, 'single');
INSERT INTO person VALUES (718, 'Gersom Soarres da Costa Junior', '2013-09-17 09:09:27', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-07-30', NULL, 'married');
INSERT INTO person VALUES (719, 'Gabriel Angelo Pereira Alves', '2013-09-17 09:09:34', 1, 'Lagoa do Bonfim', '', '25    ', 1, '                ', '                ', '         ', '', '', 'm', '1995-02-21', 28, 'single');
INSERT INTO person VALUES (720, 'Gibram Talfic Camargo Elakkari', '2013-09-17 09:09:58', 1, 'Julia Vanderlei', '', '576   ', 1, '(42099035839    ', '                ', '         ', '', '', 'm', '1995-08-02', 1, 'single');
INSERT INTO person VALUES (721, 'Gabriel Wilhian da Silva', '2013-09-17 10:09:05', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2007-04-30', NULL, '');
INSERT INTO person VALUES (722, 'Gaspar Caetano', '2013-09-17 10:09:46', 1, 'Serra da Saudade', '', '32    ', 1, '                ', '                ', '         ', '', '', 'm', '1966-10-02', 15, 'single');
INSERT INTO person VALUES (723, 'Gregorio Fustenbeg Kressom', '2013-09-17 10:09:03', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1973-11-23', NULL, 'separated');
INSERT INTO person VALUES (724, 'Gilsom Nunes Carraro', '2013-09-17 10:09:16', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1980-12-05', NULL, 'single');
INSERT INTO person VALUES (725, 'Gersom Kelly', '2013-09-17 10:09:31', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-07-15', NULL, 'married');
INSERT INTO person VALUES (726, 'Francisco de Jesus Venancio', '2013-09-17 10:09:13', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-17', NULL, '');
INSERT INTO person VALUES (727, 'Fabricio Donizete Nunes', '2013-09-17 10:09:51', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1979-02-17', NULL, 'single');
INSERT INTO person VALUES (728, 'Francisco dos Reis Filho', '2013-09-17 10:09:34', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-17', NULL, '');
INSERT INTO person VALUES (729, 'Florinal Junir Bueno', '2013-09-17 10:09:41', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-09', NULL, '');
INSERT INTO person VALUES (730, 'Iago Junior Schroeder', '2013-09-17 10:09:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-12-10', 1, 'single');
INSERT INTO person VALUES (731, 'Ivo Sutil Almeida', '2013-09-17 10:09:38', 1, 'Brigadeiro Machado Oliveira', '', '136   ', 1, '                ', '                ', '         ', '', '', 'm', '1982-07-06', 14, 'married');
INSERT INTO person VALUES (732, 'Ismael Roberto Jacky', '2013-09-17 10:09:05', 1, 'Antonio de sá Camargo', '', '11    ', 5, '                ', '                ', '         ', '', '', 'm', '1987-05-18', NULL, 'single');
INSERT INTO person VALUES (733, 'Ivam Fernandes de Almeida', '2013-09-17 10:09:53', 1, 'Julio Perneta', '', '279   ', 1, '                ', '                ', '         ', '', '', 'm', '1990-12-20', 4, 'single');
INSERT INTO person VALUES (734, 'Ivo Cordeiro de Miranda', '2013-09-17 10:09:48', 1, 'Teixeira Mendes', '1834', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1941-07-20', 5, 'widow(er)');
INSERT INTO person VALUES (735, 'Helio Furquim de Camargo''', '2013-09-17 10:09:29', 1, 'Rua 1,', '', '192   ', 1, '                ', '                ', '         ', '', '', 'm', '1973-08-12', 21, 'married');
INSERT INTO person VALUES (736, 'Valdemir Ferraz', '2013-09-17 11:09:12', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-10-07', NULL, 'single');
INSERT INTO person VALUES (737, 'Valdir Pinheiro', '2013-09-17 11:09:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-08-13', NULL, 'single');
INSERT INTO person VALUES (738, 'Valdeir Borges', '2013-09-17 11:09:46', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-02-07', NULL, 'single');
INSERT INTO person VALUES (739, 'Vanderlei Aparecidop', '2013-09-17 11:09:00', 1, 'Enfermeiro Paulino', '', '331   ', 1, '                ', '                ', '         ', '', '', 'm', '1982-09-15', 1, 'single');
INSERT INTO person VALUES (740, 'Vandir Soares dos Santos', '2013-09-17 11:09:09', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '0979-01-23', NULL, 'single');
INSERT INTO person VALUES (741, 'Victor Matheu Picolé de Soua', '2013-09-17 11:09:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-12-12', NULL, 'single');
INSERT INTO person VALUES (742, 'Vitor Jairo de Rosa Lemes', '2013-09-17 11:09:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-10-16', NULL, 'single');
INSERT INTO person VALUES (743, 'Vicente Luiz Pereira', '2013-09-17 11:09:19', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '19667-11-17', NULL, 'married');
INSERT INTO person VALUES (744, 'Valdecir Lemes Pereira', '2013-09-17 11:09:47', 1, '', '', '      ', 1, '(42)99423710    ', '                ', '         ', '', '', 'm', '1975-08-11', NULL, 'single');
INSERT INTO person VALUES (745, 'Valdeci Antonio de Moraes', '2013-09-17 11:09:46', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1970-06-28', NULL, 'single');
INSERT INTO person VALUES (746, 'Vitor Leo Vitorino Rodrigues', '2013-09-17 11:09:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2009-02-15', NULL, 'single');
INSERT INTO person VALUES (747, 'Valdomiro dos Santos Cruz', '2013-09-17 11:09:30', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-17', NULL, 'single');
INSERT INTO person VALUES (748, 'Valdinei Xavier da Silva', '2013-09-17 11:09:33', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1962-10-09', NULL, 'single');
INSERT INTO person VALUES (749, 'Sergio Diego Oliveira', '2013-09-18 09:09:13', 1, '', '', '      ', 12, '                ', '                ', '         ', '', '', 'm', '1986-08-18', NULL, 'single');
INSERT INTO person VALUES (750, 'Tadeu Ribeiro de Lima', '2013-09-18 09:09:02', 1, 'C''canpos Melo', '', '35    ', 1, '                ', '(42)32701115    ', '         ', '', '', 'm', '1980-08-02', 7, 'married');
INSERT INTO person VALUES (751, 'Thiago Barbosa', '2013-09-18 09:09:30', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1988-11-27', NULL, 'single');
INSERT INTO person VALUES (752, 'Thiago Hannch Muller', '2013-09-18 09:09:20', 1, 'Bento Ribeiro', '', '140   ', 1, '                ', '                ', '         ', '', '', 'm', '1989-07-18', NULL, 'single');
INSERT INTO person VALUES (753, 'Thiago Abreu Silva', '2013-09-18 09:09:55', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1985-12-06', NULL, 'single');
INSERT INTO person VALUES (754, 'Thiago do Carmo', '2013-09-18 09:09:12', 1, 'Vereador Raul', '', '3     ', 1, '                ', '                ', '         ', '', '', 'm', '1991-09-02', 24, 'single');
INSERT INTO person VALUES (755, 'Leandro MartinsFerreira', '2013-09-18 09:09:45', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-04-12', NULL, 'single');
INSERT INTO person VALUES (756, 'Thiago Hemrique Gonçalves de Lima', '2013-09-18 09:09:12', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1989-11-06', NULL, 'single');
INSERT INTO person VALUES (757, 'Valdir Dias Rodrigues', '2013-09-18 09:09:16', 1, '', '', '      ', 5, '                ', '                ', '         ', '', '', 'm', '1978-01-12', NULL, 'married');
INSERT INTO person VALUES (758, 'Victor Mtheus Ribeiro da Silva', '2013-09-18 09:09:43', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-05-26', NULL, 'single');
INSERT INTO person VALUES (759, 'Valdemar Ribeiro Meira', '2013-09-18 09:09:39', 1, 'Luiz Noveski', '', '74    ', 1, '                ', '                ', '         ', '', '', 'm', '1981-07-22', 16, 'single');
INSERT INTO person VALUES (760, 'Valdinei de Oliveira Leiria', '2013-09-18 09:09:16', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-01-22', NULL, 'single');
INSERT INTO person VALUES (761, 'Vanderlei Moreira', '2013-09-18 09:09:51', 1, 'Julio Perneta', '', '3     ', 1, '                ', '                ', '         ', '', '', 'm', '1985-09-10', 23, 'single');
INSERT INTO person VALUES (762, 'Vicente Luiz Pereira', '2013-09-18 09:09:42', 1, '', '', '      ', 1, '(42)99933146    ', '                ', '         ', '', '', 'm', '1967-11-17', NULL, 'separated');
INSERT INTO person VALUES (763, 'Valmir Marques dos Santos', '2013-09-18 09:09:00', 1, 'Jacobe Michel', '', '164   ', 1, '                ', '                ', '         ', '', '', 'm', '1960-08-28', 14, 'single');
INSERT INTO person VALUES (764, 'Sandro Gonçalves de Paula', '2013-09-18 10:09:21', 1, 'Plinio Cesaroti', '', '338   ', 1, '(42)91121091    ', '                ', '         ', '', '', 'm', '1977-04-03', 14, 'stable union');
INSERT INTO person VALUES (765, 'Samuel Salatiel  da Costa', '2013-09-18 10:09:31', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1967-11-14', NULL, 'single');
INSERT INTO person VALUES (766, 'Saulo Nogueira', '2013-09-18 10:09:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1953-10-19', NULL, 'married');
INSERT INTO person VALUES (767, 'Sidnei Batista de Oliveira', '2013-09-18 10:09:31', 1, '', '', '      ', 1, '(42)99875977    ', '                ', '         ', '', '', 'm', '1977-07-17', NULL, 'single');
INSERT INTO person VALUES (768, 'Sergio Vilar  Jacintho', '2013-09-18 10:09:14', 1, 'Euzébio de Gueiroz', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1965-02-02', 5, 'separated');
INSERT INTO person VALUES (769, 'Sebastião Pontes Pereira', '2013-09-18 10:09:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-09-26', NULL, 'single');
INSERT INTO person VALUES (770, 'Sergio Moreira', '2013-09-18 10:09:55', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-05-13', NULL, '');
INSERT INTO person VALUES (771, 'Sideval Barbosa da Rosa', '2013-09-18 10:09:11', 1, 'Visconde Araguaia', '', '1151  ', 1, '                ', '                ', '         ', '', '', 'm', '1990-12-12', 27, 'single');
INSERT INTO person VALUES (772, 'Saint-Clair de Lima', '2013-09-18 10:09:29', 1, 'rua 11', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1979-09-07', 4, 'single');
INSERT INTO person VALUES (773, 'Sandro Luiz Lemes Teixeira', '2013-09-18 10:09:59', 1, 'Marcilio Mezomo', '', '4     ', 1, '                ', '                ', '         ', '', '', 'm', '1978-05-09', 7, 'single');
INSERT INTO person VALUES (774, 'Sidnei AndreTA', '2013-09-18 10:09:41', 1, 'Sila Sales', '', '366   ', 1, '                ', '                ', '         ', '', '', 'm', '1975-07-03', 7, 'single');
INSERT INTO person VALUES (775, 'Silmar Ferreira', '2013-09-18 10:09:44', 1, 'Paulo Nadal', '', '197   ', 1, '                ', '                ', '         ', '', '', 'm', '1991-01-23', 17, 'stable union');
INSERT INTO person VALUES (776, 'Sidnei do Nascimento', '2013-09-18 11:09:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-09-04', NULL, 'single');
INSERT INTO person VALUES (777, 'Segio Rodrigues Batista', '2013-09-18 11:09:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-12-14', NULL, 'widow(er)');
INSERT INTO person VALUES (778, 'Santiago Blanc Gonçalves', '2013-09-18 11:09:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1996-05-12', NULL, 'single');
INSERT INTO person VALUES (779, 'Robsom Machado Olinek', '2013-09-18 11:09:00', 1, 'Raul Alberto de Oliveira', '', '1441  ', 1, '                ', '                ', '         ', '', '', 'm', '1991-10-04', 7, 'single');
INSERT INTO person VALUES (780, 'Rene Carneiro', '2013-09-18 11:09:30', 1, 'Julio Perneta', '', '557   ', 1, '                ', '                ', '         ', '', '', 'm', '1965-12-22', 4, 'single');
INSERT INTO person VALUES (781, 'Renato Ribeiro dos Santos', '2013-09-18 11:09:46', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-11-09', NULL, 'single');
INSERT INTO person VALUES (782, 'Rogerio Camargo', '2013-09-18 11:09:21', 1, 'Bitencout Sanpaio', '', '346   ', 1, '                ', '                ', '         ', '', '', 'm', '1985-01-11', 22, 'single');
INSERT INTO person VALUES (783, 'Rafael Maciel Martins', '2013-09-18 11:09:34', 1, '', '', '      ', 1, '(42)88439198    ', '                ', '         ', '', '', 'm', '1983-09-21', NULL, 'single');
INSERT INTO person VALUES (784, 'Robsom de Oliveira Santiago', '2013-09-18 11:09:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1987-02-02', NULL, 'single');
INSERT INTO person VALUES (785, 'Rodrigo Mendes Oliveira Silva', '2013-09-18 11:09:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-05-13', NULL, 'single');
INSERT INTO person VALUES (786, 'Reinaldo Glusczka', '2013-09-18 11:09:53', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1981-07-14', NULL, 'single');
INSERT INTO person VALUES (787, 'Rafael Machado Olinek', '2013-09-18 11:09:50', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-08-16', NULL, 'single');
INSERT INTO person VALUES (788, 'Sergio Olinek', '2013-09-18 11:09:50', 1, 'Apucarana', '', '88    ', 1, '                ', '                ', '         ', '', '', 'm', '1968-01-30', 7, 'single');
INSERT INTO person VALUES (789, 'Saulo Vinicius Martins', '2013-09-18 11:09:37', 1, 'Algusto Faria da Rocha', '', '202   ', 1, '                ', '                ', '         ', '', '', 'm', '1981-07-11', 4, 'married');
INSERT INTO person VALUES (790, 'Sebastião Xavier do Prado', '2013-09-18 11:09:37', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1961-04-24', NULL, 'married');
INSERT INTO person VALUES (791, 'Ronaldo dos Santos Marques', '2013-09-18 13:09:09', 1, 'Aide Madureira', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1998-03-22', 14, 'single');
INSERT INTO person VALUES (792, 'Reginaldo Fogaça dos  Santos', '2013-09-18 13:09:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-18', NULL, 'single');
INSERT INTO person VALUES (793, 'Robsom Geraldo Guilay', '2013-09-18 13:09:22', 1, '', '', '      ', 1, '                ', '(42)322241162   ', '         ', '', '', 'm', '1970-08-28', NULL, 'single');
INSERT INTO person VALUES (794, 'Roberto César Pinheiro', '2013-09-18 13:09:55', 1, 'Arero Romam Batista', '', '2     ', 1, '                ', '                ', '         ', '', '', 'm', '1980-07-02', 21, 'single');
INSERT INTO person VALUES (795, 'Raul Dias Nogueira', '2013-09-18 13:09:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-10-05', NULL, 'single');
INSERT INTO person VALUES (796, 'Rodrigo Apafecido Machado Cruz', '2013-09-18 13:09:04', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1983-12-26', NULL, 'single');
INSERT INTO person VALUES (797, 'Reinaldo Aparecido de Lima', '2013-09-18 13:09:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1969-09-23', 9, 'single');
INSERT INTO person VALUES (798, 'Rodrigo dos Santos Marques', '2013-09-18 13:09:49', 1, 'Isaias da Luz', '', '26    ', 1, '                ', '                ', '         ', '', '', 'm', '1994-11-06', 14, 'single');
INSERT INTO person VALUES (799, 'Rogério Rodrigues', '2013-09-18 14:09:52', 1, 'Cesario Alves', '', '500   ', 1, '                ', '                ', '         ', '', '', 'm', '1962-09-07', 9, 'separated');
INSERT INTO person VALUES (800, 'Ronaldo da Anunciação simõens', '2013-09-19 09:09:34', 1, 'Riachao', '', '1452  ', 1, '(79)91317502    ', '(79)92221411    ', '         ', '', '', 'm', '1973-11-15', NULL, 'single');
INSERT INTO person VALUES (801, 'Rubens Marcio Soares Pinheiro', '2013-09-19 09:09:50', 1, '', '', '      ', 9, '                ', '                ', '         ', '', '', 'm', '1968-10-15', NULL, 'separated');
INSERT INTO person VALUES (802, 'Rodrigo Diogo de Almeida Martins', '2013-09-19 09:09:02', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-09', 25, 'single');
INSERT INTO person VALUES (803, 'Rodrigo Aparecido Machado', '2013-09-19 09:09:47', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1983-12-26', NULL, 'single');
INSERT INTO person VALUES (804, 'Reinaldo Duarte', '2013-09-19 09:09:31', 1, 'Felipe Karam', '', '415   ', 1, '                ', '                ', '         ', '', '', 'm', '1978-09-03', 7, 'single');
INSERT INTO person VALUES (805, 'Rodrigo Carneiro Varrgas', '2013-09-19 09:09:49', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-11-08', NULL, 'single');
INSERT INTO person VALUES (806, 'Roberto Savicski', '2013-09-19 09:09:48', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1965-10-26', NULL, 'single');
INSERT INTO person VALUES (807, 'Rodrigo Machado Alves', '2013-09-19 09:09:16', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1981-07-18', NULL, 'single');
INSERT INTO person VALUES (808, 'Rodrigo Santos Marques', '2013-09-19 09:09:59', 1, 'João Ditzzel', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-01-06', 14, 'single');
INSERT INTO person VALUES (809, 'Rogério Marconatti', '2013-09-19 09:09:42', 1, 'Esteve Martins', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-03-19', 1, 'single');
INSERT INTO person VALUES (810, 'Rudilei Miguel de Oliveira Fereira', '2013-09-19 09:09:08', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1985-06-08', NULL, 'single');
INSERT INTO person VALUES (811, 'Renato Eliel Ribeiro da Silva', '2013-09-19 09:09:45', 1, 'Antonio Saade', '', '65    ', 1, '                ', '                ', '         ', '', '', 'm', '1984-12-09', 14, 'single');
INSERT INTO person VALUES (812, 'Rubens Bahls de Almeida', '2013-09-19 09:09:35', 1, 'Acacio Negro', '', '305   ', 1, '                ', '                ', '         ', '', '', 'm', '1989-05-07', 22, 'single');
INSERT INTO person VALUES (813, 'Roério Rosa de Paula', '2013-09-19 09:09:03', 1, '', '', '      ', 2, '                ', '                ', '         ', '', '', 'm', '1981-02-27', NULL, 'single');
INSERT INTO person VALUES (814, 'Ruamn Domingues da Silva', '2013-09-19 09:09:27', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-09', NULL, 'single');
INSERT INTO person VALUES (815, 'Fabiano Santos Valdarski', '2013-09-19 09:09:29', 1, 'rua 4', '', '      ', 1, '(42)99420197    ', '(42)99986620    ', '         ', '', '', 'm', '1981-12-17', 29, 'single');
INSERT INTO person VALUES (816, 'Ubiratam Morais', '2013-09-19 09:09:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1968-03-01', NULL, 'single');
INSERT INTO person VALUES (817, 'Rodrigo Ramos De Lara', '2013-09-19 10:09:20', 1, 'Dario Velozo', '', '885   ', 1, '                ', '                ', '         ', '', '', 'm', '1987-11-24', 13, 'single');
INSERT INTO person VALUES (818, 'Marcos Ubirajara da Silva', '2013-09-19 10:09:22', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-11-26', NULL, 'separated');
INSERT INTO person VALUES (819, 'Marcio Roberto Meira Santos', '2013-09-19 10:09:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-05-02', NULL, 'single');
INSERT INTO person VALUES (820, 'Marcelo Gabriel de Oliveira Andrade', '2013-09-19 10:09:57', 1, '', '', '      ', 1, '                ', '(42)322269168   ', '         ', '', '', 'm', '1966-12-25', NULL, 'single');
INSERT INTO person VALUES (821, 'Marcio Cristiano Teixeira', '2013-09-19 10:09:49', 1, 'Sousa Dantas', '', '309   ', 1, '                ', '                ', '         ', '', '', 'm', '1975-06-01', 24, '');
INSERT INTO person VALUES (822, 'Marcos Alexandre Schultz Mendes', '2013-09-19 10:09:29', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-08-19', NULL, 'single');
INSERT INTO person VALUES (823, 'Moises Leonel Pedroso', '2013-09-19 10:09:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-07-05', NULL, 'single');
INSERT INTO person VALUES (824, 'Marta de Oliveira Torino', '2013-09-27 09:09:00', 1, 'Garoupa', '', '316   ', 1, '                ', '                ', '         ', '', '', 'f', '1985-04-14', 19, 'married');
INSERT INTO person VALUES (825, 'Micaele de Oliveira', '2013-09-27 09:09:13', 1, 'Nelsom Narciso Ritiato', '', '12    ', 1, '                ', '                ', '         ', '', '', 'f', '2004-11-14', 5, 'single');
INSERT INTO person VALUES (826, 'Monalisa Jenifer Nascimento', '2013-09-27 09:09:34', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1994-11-11', NULL, 'single');
INSERT INTO person VALUES (827, 'Monaliza Nogueira Pereira', '2013-09-27 09:09:47', 1, 'Penteado de  Almeida', '', '9     ', 2, '                ', '                ', '         ', '', '', 'm', '1988-12-30', NULL, 'single');
INSERT INTO person VALUES (828, 'Nancy Aparecida de  Meira', '2013-09-27 09:09:29', 1, 'Rua 21', '', '1     ', 1, '                ', '                ', '         ', '', '', 'f', '1970-01-03', 5, 'single');
INSERT INTO person VALUES (829, 'Valdeniro Sebastiao Ribeiro', '2013-09-27 09:09:03', 1, 'Bela vista do Paraiso', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-27', NULL, 'single');
INSERT INTO person VALUES (830, 'Tiago dos Sants', '2013-09-30 09:09:56', 1, '', '', '      ', 10, '                ', '                ', '         ', '', '', 'm', '1994-12-02', NULL, 'single');
INSERT INTO person VALUES (831, 'Thiago de Freitas de Sa', '2013-09-30 09:09:06', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1997-08-11', NULL, 'single');
INSERT INTO person VALUES (832, 'Sérgio Olinek', '2013-09-30 09:09:41', 1, 'Rua Apucarana', '', '44    ', 1, '                ', '                ', '         ', '', '', 'm', '1968-01-30', 31, 'single');
INSERT INTO person VALUES (833, 'Renato Ramires Ribeiro', '2013-09-30 09:09:57', 1, '', '', '      ', 19, '                ', '                ', '         ', '', '', 'm', '1988-01-01', NULL, 'single');
INSERT INTO person VALUES (834, 'Marilaine da Silva Motel', '2013-09-30 09:09:57', 1, 'Madureira', '', '76    ', 1, '                ', '                ', '         ', '', '', 'm', '1993-02-15', 14, 'single');
INSERT INTO person VALUES (835, 'Ricardo Gomes de freitas', '2013-09-30 09:09:09', 1, 'Pirai do Sul', '', '121   ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', 32, 'single');
INSERT INTO person VALUES (836, 'Romario Vaz', '2013-09-30 09:09:52', 1, 'Lucélio Alves da Silva', '', '33    ', 1, '                ', '                ', '         ', '', '', 'm', '1995-04-18', 33, 'single');
INSERT INTO person VALUES (837, 'Vitor de Oliveira', '2013-09-30 09:09:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2009-04-22', 34, 'single');
INSERT INTO person VALUES (838, 'Virmonde Adriano Cordeiro', '2013-09-30 09:09:15', 1, 'Alvaro Alvim', '', '664   ', 1, '                ', '                ', '         ', '', '', 'm', '1945-09-17', 4, 'married');
INSERT INTO person VALUES (839, 'Vinicius Silva Rosa', '2013-09-30 09:09:45', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-09', 35, 'single');
INSERT INTO person VALUES (840, 'Victrer Manoel M,Souza', '2013-09-30 09:09:16', 1, 'Kliper', '', '410   ', 1, '                ', '                ', '         ', '', '', 'm', '2004-01-12', 33, 'single');
INSERT INTO person VALUES (841, 'Valdinei da Silva Borges', '2013-09-30 09:09:09', 1, 'Marcilo Luiz Mezomo', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-11-30', 7, 'single');
INSERT INTO person VALUES (842, 'Valdinei Moreira', '2013-09-30 09:09:51', 1, 'Julio Perneta', '', '299   ', 1, '                ', '                ', '         ', '', '', 'm', '1987-10-19', 23, 'single');
INSERT INTO person VALUES (843, 'Rosaldo Ribas', '2013-09-30 10:09:59', 1, 'Lucio Alves Da Silva', '', '31    ', 1, '                ', '                ', '         ', '', '', 'm', '1970-08-10', 33, 'single');
INSERT INTO person VALUES (844, 'Sandro Luiz M. Teixeira', '2013-09-30 10:09:31', 1, '', '', '      ', 1, '                ', '(42)32362931    ', '         ', '', '', 'm', '2013-01-30', 7, 'single');
INSERT INTO person VALUES (846, 'Roseval De Andrade', '2013-09-30 10:09:06', 1, 'Rep. do Panama', '', '771   ', 1, '                ', '                ', '         ', '', '', 'm', '1968-07-15', 20, 'single');
INSERT INTO person VALUES (847, 'Andressa De Lima de Paula', '2013-09-30 10:09:54', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-30', NULL, '');
INSERT INTO person VALUES (848, 'Caroline dos Santos', '2013-09-30 10:09:34', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-30', NULL, '');
INSERT INTO person VALUES (849, 'Ygor de Andrade Vaz', '2013-09-30 10:09:31', 1, 'Lucio Alves da Silva', '', '33    ', 1, '                ', '                ', '         ', '', '', 'm', '1998-12-26', 33, 'single');
INSERT INTO person VALUES (850, 'Wilsom Grziebeluka', '2013-09-30 10:09:53', 1, 'Francisco Ribas', '', '1125  ', 1, '                ', '                ', '         ', '', '', 'm', '1960-07-30', 1, 'separated');
INSERT INTO person VALUES (851, 'Wilsom Geraldo Ferreira Santos', '2013-09-30 10:09:19', 1, 'Afonço Sriros', '', '52    ', 1, '                ', '                ', '         ', '', '', 'm', '1972-03-23', 1, 'single');
INSERT INTO person VALUES (852, 'Wiliam A.M', '2013-09-30 10:09:17', 1, 'Manoel Marques', '', '809   ', 1, '                ', '                ', '         ', '', '', 'm', '2007-05-26', 13, 'single');
INSERT INTO person VALUES (853, 'Weslei Vicente Barbosa', '2013-09-30 10:09:53', 1, 'Artilho Gardinal', '', '444   ', 1, '                ', '                ', '         ', '', '', 'm', '1987-12-24', 35, 'single');
INSERT INTO person VALUES (854, 'Wesley Luam Jakinso Machado', '2013-09-30 10:09:39', 1, 'Rua do Xisto', '', '149   ', 1, '                ', '                ', '         ', '', '', 'm', '1998-11-28', 36, 'single');
INSERT INTO person VALUES (855, 'Welintom Padilha da Silva', '2013-09-30 10:09:52', 1, 'Jaguapita/ Fundos', '', '41    ', 1, '                ', '                ', '         ', '', '', 'm', '2003-07-06', 31, 'single');
INSERT INTO person VALUES (856, 'Wendel Aleff Margenstein', '2013-09-30 10:09:07', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, 'single');
INSERT INTO person VALUES (857, 'Walber Douglas A Ripardo', '2013-09-30 10:09:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '19986-05-05', NULL, 'single');
INSERT INTO person VALUES (858, 'Viviliana Padilha da Silva', '2013-09-30 10:09:01', 1, 'João Pereira de Oliveira', '', '197   ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', 35, 'single');
INSERT INTO person VALUES (859, 'Maria Tereza Amaro', '2013-09-30 10:09:22', 1, 'Alfredo Justus', '', '67    ', 1, '                ', '                ', '         ', '', '', 'm', '1944-12-06', 21, 'married');
INSERT INTO person VALUES (860, 'Noemi dos Santos', '2013-09-30 10:09:46', 1, 'Cleber Justus', '', '414   ', 1, '                ', '                ', '         ', '', '', 'f', '1948-08-13', 20, 'married');
INSERT INTO person VALUES (861, 'Pamela Karine de Lima', '2013-09-30 10:09:41', 1, 'Madureira', '', '76    ', 1, '                ', '                ', '         ', '', '', 'f', '1984-08-07', 14, 'stable union');
INSERT INTO person VALUES (862, 'Paola Maiara de Jesus', '2013-09-30 10:09:52', 1, 'Brasil pARA Cristo', '', '168   ', 1, '                ', '                ', '         ', '', '', 'm', '2001-04-26', 16, '');
INSERT INTO person VALUES (863, 'Patriocia Aparecida de Jesus', '2013-09-30 11:09:15', 1, 'Brasil Para Cristo', '', '168   ', 1, '                ', '                ', '         ', '', '', 'f', '1984-10-22', 37, 'married');
INSERT INTO person VALUES (864, 'Ramayane Xavier B Porto', '2013-09-30 11:09:48', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1992-10-02', NULL, 'single');
INSERT INTO person VALUES (865, 'Raiane Maiara Bruno dos Santos', '2013-09-30 11:09:48', 1, 'Barbosa Lima', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2004-04-11', 23, 'single');
INSERT INTO person VALUES (866, 'Guilerme William Lacerda', '2013-09-30 11:09:39', 1, 'Barboza Lima', '', '97    ', 1, '                ', '                ', '         ', '', '', 'm', '1993-07-07', 19, 'single');
INSERT INTO person VALUES (867, 'Guilerme Lourenço De Souza', '2013-09-30 11:09:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-12-10', NULL, '');
INSERT INTO person VALUES (868, 'Geraldo Amaro', '2013-09-30 11:09:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, '');
INSERT INTO person VALUES (869, 'Geovane Martins', '2013-09-30 11:09:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-08-30', 24, '');
INSERT INTO person VALUES (870, 'Evertom Luiz Ferreira', '2013-10-01 09:10:23', 1, 'Dona rita', '', '913   ', 1, '                ', '                ', '         ', '', '', 'm', '1984-05-05', 35, 'single');
INSERT INTO person VALUES (871, 'Fabiano Santos V. Uvar', '2013-10-01 09:10:50', 1, 'rua 7', '', '143   ', 1, '                ', '                ', '         ', '', '', 'm', '1961-04-07', 29, 'single');
INSERT INTO person VALUES (872, 'Felipe Gabriel Francisco', '2013-10-01 09:10:47', 1, 'Lucio Alves da Silva', '', '31    ', 1, '                ', '                ', '         ', '', '', 'm', '1970-08-10', 33, 'single');
INSERT INTO person VALUES (873, 'Fagner Barbosa', '2013-10-01 09:10:55', 1, 'Evaristo da Veiga', '', '97    ', 1, '                ', '                ', '         ', '', '', 'm', '1991-07-20', 23, 'single');
INSERT INTO person VALUES (874, 'Felisbino Jansem', '2013-10-01 09:10:23', 1, 'Teixeira de Freitas', '', '1     ', 1, '                ', '                ', '         ', '', '', 'm', '1950-03-28', 29, 'single');
INSERT INTO person VALUES (875, 'Fernando Vargas', '2013-10-01 09:10:31', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-03-17', 23, 'single');
INSERT INTO person VALUES (876, 'Isaque Cristiano', '2013-10-01 09:10:12', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1978-08-18', NULL, 'single');
INSERT INTO person VALUES (877, 'Israel Fernandes Dos Santos', '2013-10-01 09:10:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1963-06-26', NULL, 'married');
INSERT INTO person VALUES (878, 'Isaias de Jesus borges', '2013-10-01 10:10:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-01', NULL, '');
INSERT INTO person VALUES (879, 'Igor Rosa', '2013-10-01 10:10:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1971-12-27', NULL, 'married');
INSERT INTO person VALUES (880, 'Hendersom Linhares de Abreu', '2013-10-01 10:10:37', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-01', NULL, '');
INSERT INTO person VALUES (881, 'Helintom Isaque Gomes', '2013-10-01 10:10:30', 1, 'Teodoro Kippel', '', '40    ', 1, '                ', '                ', '         ', '', '', 'm', '1993-08-07', 33, 'single');
INSERT INTO person VALUES (882, 'Joao Carlos Pereira', '2013-10-01 10:10:24', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-10-09', NULL, 'single');
INSERT INTO person VALUES (883, 'Jefersom Silvério', '2013-10-01 10:10:47', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-05-05', NULL, 'single');
INSERT INTO person VALUES (884, 'Jefersom Torquato', '2013-10-01 10:10:46', 1, 'Duarte Ronda', '', '510   ', 1, '                ', '                ', '         ', '', '', 'm', '1961-10-16', 20, 'widow(er)');
INSERT INTO person VALUES (885, 'Jefersom Osni de Souza', '2013-10-01 10:10:14', 1, 'rua 7 de setenbro', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1981-05-20', 1, 'single');
INSERT INTO person VALUES (886, 'josé  Ranuldo dos Santos', '2013-10-01 10:10:07', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1949-05-27', NULL, 'single');
INSERT INTO person VALUES (887, 'Luciano Gonsalves', '2013-10-01 10:10:35', 1, 'Senador Afonso Camargo', '', '5     ', 1, '                ', '                ', '         ', '', '', 'f', '1983-08-21', 13, 'single');
INSERT INTO person VALUES (888, 'Luciane Aparecida Pasturzak', '2013-10-01 10:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1962-06-15', NULL, 'married');
INSERT INTO person VALUES (889, 'Ivaldo dos Santos', '2013-10-01 10:10:12', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-06-16', NULL, 'single');
INSERT INTO person VALUES (890, 'Vilmara Mazedika', '2013-10-01 10:10:28', 1, 'Manoel Marques', '', '809   ', 1, '                ', '                ', '         ', '', '', 'f', '1990-07-16', 13, 'single');
INSERT INTO person VALUES (891, 'Wagner Pires de Andrade', '2013-10-01 10:10:06', 1, 'Carvalho', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1988-11-09', 21, 'separated');
INSERT INTO person VALUES (892, 'Wilsom Rafael de Araujo Ferreira', '2013-10-01 11:10:59', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-07-26', NULL, 'single');
INSERT INTO person VALUES (893, 'Pedro Reinaldo Pires', '2013-10-01 11:10:31', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1966-06-29', NULL, 'married');
INSERT INTO person VALUES (894, 'Patricia de Jesus Rodriquues', '2013-10-01 11:10:47', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1983-06-02', NULL, 'married');
INSERT INTO person VALUES (895, 'Osni Mendes', '2013-10-01 11:10:43', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1963-09-29', 24, 'single');
INSERT INTO person VALUES (896, 'Osni Martins de oliveira', '2013-10-01 11:10:39', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1982-12-19', NULL, 'single');
INSERT INTO person VALUES (897, 'Eversom Luiz Becher', '2013-10-02 08:10:41', 1, 'rua 6', '', '136   ', 1, '                ', '                ', '         ', '', '', 'm', '1969-09-24', 11, 'single');
INSERT INTO person VALUES (898, 'Eversom Marks de Oliveira', '2013-10-02 09:10:43', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-03-13', NULL, 'married');
INSERT INTO person VALUES (899, 'Hamltom F. Rodrigues', '2013-10-02 09:10:33', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', NULL, 'single');
INSERT INTO person VALUES (900, 'Hamiltom Soares Sutil', '2013-10-02 09:10:23', 1, 'rua 5', '', '6     ', 1, '                ', '                ', '         ', '', '', 'm', '1948-03-14', 23, 'single');
INSERT INTO person VALUES (901, 'Joao Lucas Leandro', '2013-10-02 09:10:48', 1, 'Julio Perneta', '', '290   ', 1, '                ', '                ', '         ', '', '', 'm', '1997-06-16', 23, 'single');
INSERT INTO person VALUES (902, 'Hamiltom Sezar Barbosa', '2013-10-02 09:10:07', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-11-11', NULL, 'single');
INSERT INTO person VALUES (903, 'Joao Maria de Sousa', '2013-10-02 09:10:49', 1, 'R. Castro', '', '321   ', 1, '                ', '                ', '         ', '', '', 'm', '1967-10-11', 32, '');
INSERT INTO person VALUES (904, 'João Dos Santos', '2013-10-02 09:10:30', 1, 'Rua 5', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1937-04-05', 28, 'married');
INSERT INTO person VALUES (905, 'Joel Silva Rauche', '2013-10-02 09:10:45', 1, 'Jaguapita', '', '42    ', 1, '                ', '                ', '         ', '', '', 'm', '1997-12-10', 31, 'single');
INSERT INTO person VALUES (906, 'Jonathan Taques Mansani', '2013-10-02 09:10:40', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1999-05-25', NULL, 'single');
INSERT INTO person VALUES (907, 'Jonatham Luiz Nascimento', '2013-10-02 09:10:39', 1, 'Teodoro Klupel', '', '408   ', 1, '                ', '                ', '         ', '', '', 'm', '1997-02-11', 33, 'single');
INSERT INTO person VALUES (908, 'Jonas Pefreira', '2013-10-02 09:10:21', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1989-07-02', NULL, 'single');
INSERT INTO person VALUES (909, 'Joao Lucio Alves Da Silva', '2013-10-02 10:10:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1954-05-16', NULL, 'single');
INSERT INTO person VALUES (910, 'Jose Ailsom de Oliveira', '2013-10-02 10:10:53', 1, 'Cascavel', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-06-24', 16, 'single');
INSERT INTO person VALUES (911, 'José Dirceu Pires', '2013-10-02 10:10:59', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', NULL, 'single');
INSERT INTO person VALUES (912, 'José Eduardo Chagas da Silva', '2013-10-02 10:10:02', 1, '', '', '      ', 12, '                ', '                ', '         ', '', '', 'm', '1972-06-07', NULL, 'single');
INSERT INTO person VALUES (913, 'Jose Valdevino Rodriques', '2013-10-02 10:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1969-10-27', NULL, 'single');
INSERT INTO person VALUES (914, 'Jose Padilha', '2013-10-02 11:10:24', 1, 'Cornelio de Geus', '', '9     ', 1, '                ', '                ', '         ', '', '', 'm', '1966-01-26', 29, 'single');
INSERT INTO person VALUES (915, 'Juliano Manoel Moreira', '2013-10-02 11:10:36', 1, 'Julio Perneta', '', '4     ', 1, '                ', '                ', '         ', '', '', 'm', '1994-05-16', 23, 'single');
INSERT INTO person VALUES (916, 'Julio Carlos Vian do Carmo', '2013-10-02 11:10:36', 1, 'Rua Pará', '', '365   ', 1, '                ', '                ', '         ', '', '', 'm', '1960-06-02', 33, 'married');
INSERT INTO person VALUES (917, 'Julio Sesar da Silva', '2013-10-02 13:10:30', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1985-07-15', NULL, 'single');
INSERT INTO person VALUES (918, 'Leandro Alam Sheiffer', '2013-10-02 13:10:57', 1, 'Beijamim Franklim', '', '81    ', 1, '                ', '                ', '         ', '', '', 'm', '1994-12-27', 33, 'single');
INSERT INTO person VALUES (919, 'Leandro Kauê de Oliveira', '2013-10-02 14:10:38', 1, 'Julio Perneta', '', '250   ', 1, '                ', '                ', '         ', '', '', 'm', '2000-05-22', 23, 'single');
INSERT INTO person VALUES (920, 'Leandro Gomes de Paula', '2013-10-02 14:10:13', 1, 'Teodoro kluppel', '', '8     ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', 33, 'single');
INSERT INTO person VALUES (921, 'Liberato de Oliveira', '2013-10-02 14:10:12', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', NULL, 'single');
INSERT INTO person VALUES (922, 'Lourival de Jesus Rodrigues', '2013-10-02 14:10:00', 1, 'Bela vista do Paraiso', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', 16, 'single');
INSERT INTO person VALUES (923, 'Lourival Martins', '2013-10-02 14:10:15', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1964-12-26', NULL, 'single');
INSERT INTO person VALUES (924, 'Luciano Emidio Vieria', '2013-10-02 14:10:56', 1, 'Cristino Justus', '', 'S/N   ', 1, '                ', '                ', '         ', '', '', 'm', '1980-09-20', 7, 'single');
INSERT INTO person VALUES (925, 'Luiz  Gabriel Gonçalves Lemes', '2013-10-02 14:10:23', 1, 'Pedro francisco', '', '10    ', 1, '                ', '                ', '         ', '', '', 'm', '2006-02-07', 35, 'single');
INSERT INTO person VALUES (926, 'Luiz Algusto da Silva', '2013-10-02 14:10:02', 1, 'Haiti', '', 'fd/123', 1, '                ', '                ', '         ', '', '', 'm', '1975-05-09', 5, 'single');
INSERT INTO person VALUES (927, 'Luiz Fernades Munosk', '2013-10-02 14:10:29', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1961-07-29', NULL, 'married');
INSERT INTO person VALUES (928, 'Maicom Rodrigo Lemes', '2013-10-02 14:10:15', 1, 'Vila Margarida', '', '8     ', 1, '                ', '                ', '         ', '', '', 'm', '1993-09-29', 35, 'single');
INSERT INTO person VALUES (929, 'Manrcelo Ferreira', '2013-10-02 14:10:31', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-06-18', NULL, 'single');
INSERT INTO person VALUES (930, 'Marcelo Rodrigues dos Santos', '2013-10-02 15:10:40', 1, 'Paz de Andrade', '', '540   ', 1, '                ', '                ', '         ', '', '', 'm', '1987-07-28', 20, 'single');
INSERT INTO person VALUES (931, 'Marcelo da Luz Pinto', '2013-10-02 15:10:37', 1, 'Paulo Grote', '', '19    ', 1, '                ', '                ', '         ', '', '', 'm', '1980-02-22', 7, 'single');
INSERT INTO person VALUES (932, 'Maicom Rodrigo Mendes Gonçalves', '2013-10-02 15:10:46', 1, 'Anita Garibaldi s/n', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1993-09-29', 35, 'single');
INSERT INTO person VALUES (933, 'Mario Adriano Maciel Lourenço', '2013-10-02 15:10:06', 1, 'Haiti', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1981-05-11', 23, 'single');
INSERT INTO person VALUES (934, 'Luiz Antonio Barbosa', '2013-10-02 15:10:34', 1, '', '', '      ', 17, '                ', '                ', '         ', '', '', 'm', '1968-06-10', NULL, 'single');
INSERT INTO person VALUES (935, 'Adriano Castro', '2013-10-02 15:10:04', 1, 'Alfredo Kepper', '', '70    ', 1, '                ', '                ', '         ', '', '', 'm', '1975-05-13', 4, 'single');
INSERT INTO person VALUES (936, 'Ari Jakelim', '2013-10-02 15:10:13', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1968-06-13', NULL, 'single');
INSERT INTO person VALUES (937, 'Algostinho Sebastião Ferreira da Silva', '2013-10-02 15:10:09', 1, 'Navegador Ernani', '', '31    ', 1, '                ', '                ', '         ', '', '', 'm', '1960-02-14', 4, 'single');
INSERT INTO person VALUES (938, 'Antonio Roberto Rodrigues', '2013-10-02 15:10:58', 1, 'César Alvim', '', '137   ', 1, '                ', '                ', '         ', '', '', 'm', '1960-04-14', 33, 'single');
INSERT INTO person VALUES (939, 'Amanda Ribeiro', '2013-10-02 15:10:21', 1, 'Haity', '', '147   ', 1, '                ', '                ', '         ', '', '', 'f', '2007-07-28', 23, 'single');
INSERT INTO person VALUES (940, 'André Luiz Nascimento', '2013-10-02 15:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', NULL, 'single');
INSERT INTO person VALUES (941, 'Alessandro Pereira Antunes', '2013-10-02 15:10:07', 1, '', '', '      ', 10, '                ', '                ', '         ', '', '', 'm', '1981-03-02', NULL, 'married');
INSERT INTO person VALUES (942, 'Andersom W da Silva de Oliveira', '2013-10-02 15:10:19', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-08-13', NULL, 'married');
INSERT INTO person VALUES (943, 'Alexandro de Goes', '2013-10-02 15:10:13', 1, 'Francisco Risental', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-05-28', 14, 'separated');
INSERT INTO person VALUES (944, 'Edsom Luiz de Lima', '2013-10-02 15:10:19', 1, 'Ernande Batista Rosa', '', '141   ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', 4, 'single');
INSERT INTO person VALUES (945, 'Elias Padilha de Castro', '2013-10-02 15:10:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-07-28', NULL, 'single');
INSERT INTO person VALUES (946, 'Evertom Luiz Ferreira', '2013-10-02 15:10:54', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1984-04-05', NULL, 'single');
INSERT INTO person VALUES (947, 'Enerstina  Bueno', '2013-10-02 15:10:06', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', NULL, 'single');
INSERT INTO person VALUES (948, 'Emile Parecida Bueno de Oliveira', '2013-10-02 16:10:51', 1, 'Barbosa Lima', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '2002-02-02', 23, 'single');
INSERT INTO person VALUES (949, 'Emanuele Aparecida Oliveira Barbosa', '2013-10-02 16:10:08', 1, 'Nelso Narciso Vitiato', '', '12    ', 1, '                ', '                ', '         ', '', '', 'm', '2000-04-10', 25, 'single');
INSERT INTO person VALUES (950, 'Fabio Cauam H.Q da Silva', '2013-10-02 16:10:59', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2006-04-08', 33, 'single');
INSERT INTO person VALUES (951, 'Felipe Sebastião Junio', '2013-10-02 16:10:29', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-05-28', NULL, '');
INSERT INTO person VALUES (952, 'Francisco Camargo Junior', '2013-10-02 16:10:47', 1, 'Rua Ivai', '', '555   ', 1, '                ', '                ', '         ', '', '', 'm', '1963-03-03', NULL, 'single');
INSERT INTO person VALUES (953, 'Fabricio Pereira', '2013-10-02 16:10:56', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1975-03-06', NULL, 'single');
INSERT INTO person VALUES (954, 'Florisvaldo Cordeiro', '2013-10-02 16:10:41', 1, 'Jardim Meneleu', '', '7     ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', 33, 'married');
INSERT INTO person VALUES (955, 'Francisco Cruz Dos Santos', '2013-10-02 16:10:18', 1, 'Salvador Mendonça', '', '386   ', 1, '                ', '                ', '         ', '', '', 'm', '1964-03-25', 20, 'single');
INSERT INTO person VALUES (956, 'Francisco dos Reis Filho', '2013-10-02 16:10:17', 1, 'Cornélio de Geus', '', '9     ', 1, '                ', '                ', '         ', '', '', 'm', '1959-07-03', 12, 'single');
INSERT INTO person VALUES (957, 'Guilerme Luiz da Silva', '2013-10-02 16:10:18', 1, 'bartolomeu Gusmão', '', '280   ', 1, '                ', '                ', '         ', '', '', 'm', '1995-01-13', 36, 'single');
INSERT INTO person VALUES (958, 'Gisele Aparecida Rodrigues', '2013-10-02 16:10:00', 1, 'Julio Perneta', '', '990   ', 1, '                ', '                ', '         ', '', '', 'm', '1998-04-17', 23, 'single');
INSERT INTO person VALUES (959, 'Julio Manoel Moreira', '2013-10-02 16:10:58', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-02', NULL, 'single');
INSERT INTO person VALUES (960, 'José Ivonei de Brito Nascimento', '2013-10-02 16:10:43', 1, 'RUA B', '', '15    ', 1, '                ', '                ', '         ', '', '', 'm', '1992-05-18', 38, 'single');
INSERT INTO person VALUES (961, 'Josiel Andrei de Lima', '2013-10-02 16:10:17', 1, 'Bitencurt Sanpaio', '', '398   ', 1, '                ', '                ', '         ', '', '', 'm', '1997-09-17', 22, 'single');
INSERT INTO person VALUES (962, 'Jaciara Alves Santos', '2013-10-02 16:10:24', 1, 'Bitencurt ASnpaio', '', '398   ', 1, '                ', '                ', '         ', '', '', 'm', '2001-10-18', 22, 'single');
INSERT INTO person VALUES (845, 'teste', '2013-09-30 10:09:28', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-30', NULL, '');
INSERT INTO person VALUES (963, 'Jeam Carlos S Ferreira', '2013-10-02 16:10:07', 1, 'Visconde de Nacar', '', '129   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-06-23', 1, 'single');
INSERT INTO person VALUES (964, 'Jaime Rodriques Matins', '2013-10-02 16:10:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1964-11-02', NULL, 'single');
INSERT INTO person VALUES (965, 'Juarez De Jesus Oliveira', '2013-10-03 10:10:50', 1, 'Lucio Alvez da Silva', '', '32    ', 1, '                ', '                ', '         ', '', '', 'm', '1967-08-24', 33, 'single');
INSERT INTO person VALUES (966, 'Mauro Ribeiro da Cruz', '2013-10-03 11:10:47', 1, 'Teixeir de Freitas', '', '502   ', 1, '                ', '                ', '         ', '', '', 'm', '1967-04-15', 35, 'single');
INSERT INTO person VALUES (967, 'Osmar de Oliveira', '2013-10-03 11:10:41', 1, 'Evaristo Moraes', '', '20    ', 1, '                ', '                ', '         ', '', '', 'm', '1967-08-23', 33, 'single');
INSERT INTO person VALUES (968, 'Naiara Karine Ferri', '2013-10-03 11:10:57', 1, 'Teodoro Kluppel', '', '422   ', 1, '                ', '                ', '         ', '', '', 'm', '2001-06-21', 33, 'single');
INSERT INTO person VALUES (969, 'Orlando Maia Steudel', '2013-10-03 11:10:19', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1968-02-15', NULL, 'single');
INSERT INTO person VALUES (970, 'Jocelito Alves Meira', '2013-10-03 11:10:40', 1, 'Tobias Moscoso', '', '14    ', 1, '                ', '                ', '         ', '', '', 'm', '1969-05-04', 20, 'single');
INSERT INTO person VALUES (971, 'Marcio dos Santos Silva', '2013-10-04 09:10:40', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-11-15', NULL, 'single');
INSERT INTO person VALUES (972, 'Arlindo Cezar de Oliveira', '2013-10-04 09:10:05', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1970-08-21', NULL, 'single');
INSERT INTO person VALUES (973, 'Luiz Roberto do Prado', '2013-10-04 09:10:43', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1972-11-30', NULL, 'single');
INSERT INTO person VALUES (974, 'Luciano de Bastos', '2013-10-04 10:10:03', 1, 'Foz do Iguaçu', '', '119   ', 1, '                ', '                ', '         ', '', '', 'm', '1980-06-11', 16, 'single');
INSERT INTO person VALUES (975, 'Edsom Felipe Ribeiro', '2013-10-04 10:10:22', 1, 'Antonio Victor Burgmam', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1985-11-28', 4, 'single');
INSERT INTO person VALUES (976, 'Jose Adriano Ramos', '2013-10-04 13:10:40', 1, 'Eugenio José Bochi', '', '8     ', 1, '                ', '                ', '         ', '', '', 'm', '1986-01-01', 7, 'single');
INSERT INTO person VALUES (977, 'Edosm Luiz Eleuterio', '2013-10-04 15:10:08', 1, '15 de Novenbro', '', '977   ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-04', 1, 'single');
INSERT INTO person VALUES (978, 'Valdecir Antonio de Moraes', '2013-10-04 15:10:24', 1, '', '', '      ', 1, '                ', '32267710        ', '         ', '', '', 'm', '1970-06-28', NULL, '');
INSERT INTO person VALUES (979, 'Jhony da Silva Nunes', '2013-10-04 15:10:38', 1, '', '', '      ', 1, '(42)99112844    ', '                ', '         ', '', '', 'm', '1995-03-22', NULL, 'single');
INSERT INTO person VALUES (980, 'Luciano dos Anjos de Oliveira', '2013-10-04 16:10:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-04', NULL, '');
INSERT INTO person VALUES (981, 'Jose Ricardo Main Forno', '2013-10-04 16:10:53', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1966-12-07', NULL, 'single');
INSERT INTO person VALUES (982, 'Rauam Mizael da Silca', '2013-10-07 08:10:01', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-07', 25, '');
INSERT INTO person VALUES (983, 'Leonardo Gomes da Silva', '2013-10-07 09:10:31', 1, 'Francisco Frajaido', '', '8     ', 1, '                ', '                ', '         ', '', '', 'm', '1995-06-15', 33, 'single');
INSERT INTO person VALUES (984, 'Crislaine Arruda Cardoso', '2013-10-07 09:10:41', 1, 'Dr Eugenio José', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1993-10-29', 7, '');
INSERT INTO person VALUES (985, 'José Eduardo Santana da Luz', '2013-10-07 09:10:45', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-07', NULL, 'single');
INSERT INTO person VALUES (1035, 'Marcelo Arcenio Gregorio', '2013-10-08 10:10:32', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1980-01-01', NULL, 'single');
INSERT INTO person VALUES (986, 'Renato dos Ajos de Oliveira', '2013-10-07 09:10:40', 1, 'Quadra 6 lote 120', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-07', 39, 'single');
INSERT INTO person VALUES (987, 'Jonathan Santana da Luz', '2013-10-07 09:10:39', 1, 'Quadra 9 lote 189', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-07', 39, '');
INSERT INTO person VALUES (988, 'Francisco Allberto da Silva', '2013-10-07 09:10:31', 1, 'Cornelio de Geus', '', '66    ', 1, '(42)98131861    ', '                ', '         ', '', '', 'm', '1986-05-16', 12, 'single');
INSERT INTO person VALUES (989, 'Alissom Aparecido Barreto de Paula', '2013-10-07 09:10:56', 1, 'Visconde de Jaguari', '', '103   ', 1, '                ', '(42)32277009    ', '         ', '', '', 'm', '1990-03-23', 14, 'single');
INSERT INTO person VALUES (990, 'Glênio Muller', '2013-10-07 09:10:24', 1, 'Teodoro Sanpaio', '', '763   ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-07', NULL, 'single');
INSERT INTO person VALUES (991, 'José Dair Ribeiro', '2013-10-07 09:10:01', 1, 'Fransico Beltrao', '', '51    ', 1, '                ', '                ', '         ', '', '', 'm', '1977-08-28', 16, 'single');
INSERT INTO person VALUES (992, 'Jamile Ribeiro Batista', '2013-10-07 09:10:34', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-07', NULL, '');
INSERT INTO person VALUES (993, 'Marcelo Soares', '2013-10-07 09:10:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1984-07-02', NULL, 'single');
INSERT INTO person VALUES (994, 'João Rocha dos Santos', '2013-10-07 09:10:03', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-04-05', NULL, '');
INSERT INTO person VALUES (995, 'Valeria de Almeida F Bertoletti', '2013-10-07 09:10:33', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-10-11', 20, 'single');
INSERT INTO person VALUES (996, 'Thaline G Leandro Monteiro', '2013-10-07 09:10:01', 1, 'Julio Perneta', '', '290   ', 1, '                ', '                ', '         ', '', '', 'm', '1999-02-18', 23, 'single');
INSERT INTO person VALUES (997, 'Jassiane de Freitas', '2013-10-07 09:10:54', 1, 'Marcilio Luiz', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1996-12-02', 7, 'single');
INSERT INTO person VALUES (998, 'Solange de Fatima', '2013-10-07 09:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1986-02-13', NULL, 'single');
INSERT INTO person VALUES (999, 'Sheila Francine Trugillo', '2013-10-07 09:10:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-07', NULL, '');
INSERT INTO person VALUES (1000, 'Santana E Ribeiro', '2013-10-07 09:10:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-03-25', NULL, 'single');
INSERT INTO person VALUES (1001, 'Rosimery Aparecido Bueno', '2013-10-07 09:10:32', 1, 'Baarbosa Lima', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1982-02-14', 23, 'single');
INSERT INTO person VALUES (1002, 'Rosimeri Aparecida dos  Santos', '2013-10-07 09:10:14', 1, 'Teixeira de macedo', '', '935   ', 1, '                ', '                ', '         ', '', '', 'f', '1968-07-29', 33, 'single');
INSERT INTO person VALUES (1003, 'Rosangela Maria Bueno', '2013-10-07 10:10:11', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1985-11-27', NULL, 'single');
INSERT INTO person VALUES (1004, 'Rosenette Banderley', '2013-10-07 10:10:12', 1, 'Bento de Amaral', '', '137   ', 1, '                ', '                ', '         ', '', '', 'm', '1975-12-24', 29, 'married');
INSERT INTO person VALUES (1005, 'Rosana Aprecida Gonçalves', '2013-10-07 10:10:23', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1982-01-16', 13, 'single');
INSERT INTO person VALUES (1006, 'Reginaldo Cardoso Carlos de Asis', '2013-10-07 10:10:37', 1, '', '', '      ', 8, '                ', '                ', '         ', '', '', 'm', '1969-06-12', NULL, 'single');
INSERT INTO person VALUES (1007, 'Andersom Maciel Alves', '2013-10-07 10:10:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-10-10', NULL, 'single');
INSERT INTO person VALUES (1008, 'Alceu Alves França', '2013-10-07 10:10:21', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-11-01', NULL, 'single');
INSERT INTO person VALUES (1009, 'Ana Maria Moreira de Lima', '2013-10-07 10:10:31', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1972-03-06', NULL, 'single');
INSERT INTO person VALUES (1010, 'Antonio Claudio de Oliveira', '2013-10-07 10:10:27', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1965-09-25', NULL, 'single');
INSERT INTO person VALUES (1011, 'Arlindo da Luz Paulista', '2013-10-07 10:10:35', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1951-09-29', 31, 'single');
INSERT INTO person VALUES (1012, 'Miltom Ribeiro', '2013-10-07 11:10:20', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-07', NULL, '');
INSERT INTO person VALUES (1013, 'Vandir Soares dos Santos', '2013-10-07 11:10:56', 1, 'Barao de Peneda', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-01-23', NULL, 'single');
INSERT INTO person VALUES (1014, 'Vera Lucia Capiatez', '2013-10-07 11:10:38', 1, 'Raul Quil Cordeiro', '', '13    ', 1, '                ', '                ', '         ', '', '', 'f', '1969-08-01', 3, 'single');
INSERT INTO person VALUES (1015, 'Daiane Oliveira Ferrera', '2013-10-08 09:10:20', 1, 'Abelardo de Brito', '', '15    ', 1, '                ', '                ', '         ', '', '', 'f', '1994-03-18', 20, 'single');
INSERT INTO person VALUES (1016, 'Delmira Gomes Drose', '2013-10-08 09:10:18', 1, 'Avidor Gastao  Soares', '68', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1949-04-15', 4, 'widow(er)');
INSERT INTO person VALUES (1017, 'Elaine Vieira dos Santos', '2013-10-08 09:10:02', 1, 'Theodoro Kluppel', '', '402   ', 1, '                ', '                ', '         ', '', '', 'f', '1982-03-25', 33, 'single');
INSERT INTO person VALUES (1018, 'Emanuele Aparecida Oliveira Barbosa', '2013-10-08 09:10:15', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2000-04-10', NULL, 'single');
INSERT INTO person VALUES (1019, 'Emile dos Santos', '2013-10-08 09:10:22', 1, 'Nestor Victor', '', '100   ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-08', NULL, '');
INSERT INTO person VALUES (1020, 'Erica Pedroso Pekado', '2013-10-08 09:10:07', 1, 'Carlos Chagas', '', '400   ', 1, '                ', '                ', '         ', '', '', 'f', '1996-11-22', 23, 'single');
INSERT INTO person VALUES (1021, 'Eunice Ferreira', '2013-10-08 09:10:42', 1, 'José Face', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1976-09-15', 20, 'single');
INSERT INTO person VALUES (1022, 'Evelym Jeniffer Nascimento', '2013-10-08 10:10:53', 1, 'Theodoro Cluppel', '', '408   ', 1, '                ', '                ', '         ', '', '', 'f', '1996-03-07', 33, 'single');
INSERT INTO person VALUES (1023, 'Helena de Lara Cardoso', '2013-10-08 10:10:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1955-08-21', NULL, 'separated');
INSERT INTO person VALUES (1024, 'Giovana dos Santos', '2013-10-08 10:10:06', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-08', NULL, '');
INSERT INTO person VALUES (1025, 'Irene de Fatima Ribeiro', '2013-10-08 10:10:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1954-03-16', NULL, 'single');
INSERT INTO person VALUES (1026, 'Josiane Alves Ferreira', '2013-10-08 10:10:52', 1, 'Serra da Canastra', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'f', '1986-07-23', 27, 'single');
INSERT INTO person VALUES (1027, 'Katia Rose do Nacimento', '2013-10-08 10:10:38', 1, 'Haitin fds 122', '', '122   ', 1, '                ', '                ', '         ', '', '', 'f', '1986-04-11', 23, 'single');
INSERT INTO person VALUES (1028, 'Kauane Isabele da Silva', '2013-10-08 10:10:14', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2003-07-14', NULL, 'single');
INSERT INTO person VALUES (1029, 'Kauane Meira Amaral', '2013-10-08 10:10:57', 1, 'Tobias Moscoso', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-08', 20, 'single');
INSERT INTO person VALUES (1030, 'Larissa Tamires Duarte', '2013-10-08 10:10:55', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-08', NULL, 'single');
INSERT INTO person VALUES (1031, 'Lauriemely Rodrigues Silva', '2013-10-08 10:10:14', 1, 'Julio Perneta', '', '299   ', 1, '                ', '                ', '         ', '', '', 'm', '2002-10-26', 23, 'single');
INSERT INTO person VALUES (1032, 'Luana Karoline Francisco', '2013-10-08 10:10:57', 1, 'Ademar Horn', '', '116   ', 1, '                ', '                ', '         ', '', '', 'f', '1995-08-12', 24, 'single');
INSERT INTO person VALUES (1033, 'Maiara Loriane Desentenike', '2013-10-08 10:10:58', 1, 'Haiti', '', '123   ', 1, '                ', '                ', '         ', '', '', 'f', '2006-02-13', 23, 'single');
INSERT INTO person VALUES (1034, 'Joao Maria  Almeida', '2013-10-08 10:10:37', 1, 'Brigadeiro Machado', '', '136   ', 1, '                ', '                ', '         ', '', '', 'f', '1955-01-23', 14, 'single');
INSERT INTO person VALUES (1036, 'Leonardo Gomes de Paula', '2013-10-08 10:10:49', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-08', NULL, 'single');
INSERT INTO person VALUES (1037, 'Luciano Ferreira', '2013-10-08 10:10:56', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-02-18', NULL, 'single');
INSERT INTO person VALUES (1038, 'Luiz Carlos dos Santos', '2013-10-08 10:10:50', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1960-03-02', NULL, 'single');
INSERT INTO person VALUES (1039, 'Luiz de Sousa Junior', '2013-10-08 10:10:04', 1, 'Curitiba', '', '87    ', 1, '                ', '                ', '         ', '', '', 'm', '1967-10-23', 33, 'single');
INSERT INTO person VALUES (1040, 'Luiz Claudio Romeira', '2013-10-08 10:10:19', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1974-04-28', NULL, 'single');
INSERT INTO person VALUES (1041, 'Leandro de Oliveira', '2013-10-08 10:10:22', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-10-06', NULL, 'single');
INSERT INTO person VALUES (1042, 'Laudenis Serzovski dos Santos', '2013-10-08 11:10:41', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1966-03-05', NULL, 'single');
INSERT INTO person VALUES (1043, 'Lauri Bueno de Camargo', '2013-10-08 11:10:37', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1965-03-21', NULL, 'single');
INSERT INTO person VALUES (1044, 'Luiz Rega', '2013-10-08 11:10:52', 1, 'Braulina Carneiro', '', '416   ', 1, '                ', '                ', '         ', '', '', 'm', '1969-07-30', 20, 'single');
INSERT INTO person VALUES (1045, 'Caroline Leticia  dos Santos', '2013-10-08 11:10:37', 1, 'Fraias de Brito', '', '65    ', 1, '                ', '                ', '         ', '', '', 'f', '2004-01-22', 23, 'single');
INSERT INTO person VALUES (1046, 'Kevilim Vitoria', '2013-10-08 11:10:33', 1, 'Senador Afonso Camargo', '', '5     ', 1, '                ', '                ', '         ', '', '', 'f', '2006-06-08', 13, 'single');
INSERT INTO person VALUES (97, 'John Lenon Costa sagais', '2013-08-20 14:08:51', 1, 'Rua Herculano de Freitas', '', '751   ', 1, '                ', '32239414        ', '84015105 ', '', '', 'm', '1990-11-09', 4, 'single');
INSERT INTO person VALUES (1047, 'Andersom Machado dos Santos', '2013-10-09 11:10:03', 1, 'Herculano de Freitas', '', '751   ', 1, '4232239414      ', '32239414        ', '84015105 ', '', '', 'm', '1979-11-19', 4, 'single');
INSERT INTO person VALUES (1048, 'Maicom Luiz Rodrigo Lermes', '2013-10-09 13:10:55', 1, 'Evaristo da Veiga', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-09-29', NULL, 'single');
INSERT INTO person VALUES (1049, 'Maiara Carvalho Barbosa', '2013-10-09 13:10:29', 1, 'Bonifacio Ribas', '', '557   ', 1, '                ', '                ', '         ', '', '', 'm', '2009-01-03', 13, 'single');
INSERT INTO person VALUES (1050, 'Michael Leandro dos Santos', '2013-10-09 13:10:57', 1, 'Teixeira de Macedo', '', '435   ', 1, '                ', '                ', '         ', '', '', 'm', '1995-01-23', 33, 'single');
INSERT INTO person VALUES (1051, 'Maria Helena C Barbosa', '2013-10-09 13:10:08', 1, 'Alfredo Pedro Dias', '', '665   ', 1, '                ', '                ', '         ', '', '', 'm', '2004-04-16', 25, 'single');
INSERT INTO person VALUES (1052, 'Vilsom Ferreira Pinto', '2013-10-09 13:10:28', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1985-05-28', NULL, 'single');
INSERT INTO person VALUES (1053, 'Noel Barbosa', '2013-10-09 13:10:46', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1958-07-17', NULL, '');
INSERT INTO person VALUES (1054, 'Jaqueline Lavoski', '2013-10-09 14:10:01', 1, 'Carlos Chagas', '', '612   ', 1, '                ', '                ', '         ', '', '', 'f', '1990-10-09', 23, 'single');
INSERT INTO person VALUES (1055, 'Nilsom Aparecido Amaral Fereira', '2013-10-09 14:10:33', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1968-05-23', NULL, 'single');
INSERT INTO person VALUES (1056, 'Emanuela Aparecida Oliveira Barbosa', '2013-10-09 14:10:23', 1, 'Nelsom Narciso Hatro', '', '12    ', 1, '                ', '                ', '         ', '', '', 'f', '2000-04-10', 25, 'single');
INSERT INTO person VALUES (1057, 'Atlio Feereira da Silva Filho', '2013-10-09 14:10:29', 1, 'Engen Chanber', '', '287   ', 1, '                ', '                ', '         ', '', '', 'm', '1971-06-08', 1, 'single');
INSERT INTO person VALUES (1058, 'Adilsom dos Santos', '2013-10-09 14:10:09', 1, 'Sebastiao Parana', '', '678   ', 1, '                ', '                ', '         ', '', '', 'm', '1954-07-24', 20, 'single');
INSERT INTO person VALUES (1059, 'Antonio Carlos Miranda', '2013-10-09 14:10:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1968-11-07', NULL, 'single');
INSERT INTO person VALUES (1060, 'Brendo de Andrade Vaz', '2013-10-09 14:10:01', 1, 'Lucio alves da Silva', '', '33    ', 1, '                ', '                ', '         ', '', '', 'm', '1997-05-05', 33, 'single');
INSERT INTO person VALUES (1061, 'Antonio Carlos da Silva', '2013-10-09 14:10:49', 1, 'Azaléia', '', '63    ', 1, '                ', '                ', '         ', '', '', 'm', '1986-08-15', 21, 'single');
INSERT INTO person VALUES (1062, 'Bento Severino Soares', '2013-10-09 14:10:09', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1935-07-21', 27, '');
INSERT INTO person VALUES (1063, 'Bruno Ferreira', '2013-10-09 14:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-09', NULL, '');
INSERT INTO person VALUES (1064, 'Bener Schember', '2013-10-09 14:10:53', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-08-11', NULL, '');
INSERT INTO person VALUES (1065, 'Julio Mendes', '2013-10-10 09:10:30', 1, 'rua 3', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2000-07-30', 7, 'married');
INSERT INTO person VALUES (1066, 'José Sebastião Pinto', '2013-10-10 09:10:08', 1, 'Carlos Chagas', '', '370   ', 1, '                ', '                ', '         ', '', '', 'm', '1972-10-10', 23, 'single');
INSERT INTO person VALUES (1067, 'Janaira Alves Santos', '2013-10-10 09:10:27', 1, 'Bitencurt Sanpaio', '', '398   ', 1, '                ', '                ', '         ', '', '', 'f', '1992-09-29', 22, 'single');
INSERT INTO person VALUES (1068, 'Jocemeri Ferreira Alves Santos', '2013-10-10 09:10:58', 1, 'Bitencurt Sanpaio', '', '398   ', 1, '                ', '                ', '         ', '', '', 'f', '1974-11-27', 22, 'married');
INSERT INTO person VALUES (1069, 'Jerri Rodrigo Nalifico', '2013-10-10 09:10:22', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1988-09-27', NULL, 'single');
INSERT INTO person VALUES (1070, 'José Evandro dos Santos', '2013-10-10 09:10:39', 1, 'Teodoro Cluppel', '', '408   ', 1, '                ', '                ', '         ', '', '', 'm', '1983-12-02', 33, 'single');
INSERT INTO person VALUES (1071, 'Josnei dos Santos', '2013-10-10 10:10:06', 1, 'rui Barbosa', '', '71    ', 1, '                ', '                ', '         ', '', '', 'm', '1978-03-10', 1, 'single');
INSERT INTO person VALUES (1072, 'Junior Lucas de Lima', '2013-10-10 10:10:14', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-11-16', NULL, 'single');
INSERT INTO person VALUES (1073, 'José Lels', '2013-10-10 10:10:54', 1, 'londrina', '', '15    ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-10', 32, '');
INSERT INTO person VALUES (1074, 'Joao Laves de Brito', '2013-10-10 10:10:11', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1961-03-09', NULL, '');
INSERT INTO person VALUES (1075, 'Luiz Carlos de Oliveira', '2013-10-10 10:10:54', 1, 'Marques de Sapucai', '', '2     ', 1, '                ', '                ', '         ', '', '', 'm', '1979-05-06', NULL, 'married');
INSERT INTO person VALUES (1076, 'Luiz Antonio de Oliveira', '2013-10-10 10:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1983-06-15', NULL, 'single');
INSERT INTO person VALUES (1077, 'Luiz Carlos de Freitas', '2013-10-10 10:10:13', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1952-03-25', NULL, 'widow(er)');
INSERT INTO person VALUES (1078, 'Luiz Carlos Nascimento', '2013-10-10 10:10:19', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-05-14', NULL, 'single');
INSERT INTO person VALUES (1079, 'Luiz Antonio Ribeiro Gomes', '2013-10-10 10:10:49', 1, 'Barao de serro Azul', '', '147   ', 1, '                ', '                ', '         ', '', '', 'm', '1960-07-28', 1, 'separated');
INSERT INTO person VALUES (1080, 'Loriane Kleye', '2013-10-10 11:10:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1964-05-16', NULL, '');
INSERT INTO person VALUES (1081, 'Luana Ramos', '2013-10-10 11:10:28', 1, 'Nestor Victor', '', '100   ', 1, '                ', '                ', '         ', '', '', 'f', '2013-01-10', 32, 'single');
INSERT INTO person VALUES (1082, 'Luiz Carlos Macedo', '2013-10-14 08:10:20', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1957-02-10', NULL, 'single');
INSERT INTO person VALUES (1083, 'Laudelino Gomes Veta', '2013-10-14 08:10:46', 1, 'Marechal Hermes', '', '731   ', 1, '                ', '                ', '         ', '', '', 'm', '1963-12-23', 20, 'single');
INSERT INTO person VALUES (1084, 'Luiz Albero da Silva', '2013-10-14 09:10:20', 1, 'Maria Ursula de Abreu', '', '13    ', 1, '                ', '                ', '         ', '', '', 'm', '1979-08-01', 34, 'single');
INSERT INTO person VALUES (1085, 'Ketlim Fabiane Iurk', '2013-10-14 09:10:48', 1, 'Dominicio da Gama', '', '980   ', 1, '                ', '                ', '         ', '', '', 'f', '1993-06-03', 33, '');
INSERT INTO person VALUES (1086, 'Ketly Maiara C Barbosa', '2013-10-14 09:10:20', 1, 'Alfredo Pedro Ribas', '', '665   ', 1, '                ', '                ', '         ', '', '', 'f', '1995-10-07', 40, 'single');
INSERT INTO person VALUES (1087, 'Kauane Gonçalves Ribeiro', '2013-10-14 09:10:53', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2003-03-12', NULL, 'single');
INSERT INTO person VALUES (1088, 'Diana Aparecida Rodrigues', '2013-10-14 09:10:51', 1, 'Julio Perneta', '', '299   ', 1, '                ', '                ', '         ', '', '', 'm', '1995-10-17', 23, 'single');
INSERT INTO person VALUES (1089, 'Cristiane Martins Moritz', '2013-10-14 09:10:43', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2007-05-16', NULL, 'single');
INSERT INTO person VALUES (1090, 'Clara Pereira', '2013-10-14 09:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1961-08-12', 13, 'single');
INSERT INTO person VALUES (1091, 'bida Patricia Preme', '2013-10-14 09:10:06', 1, 'rua 3', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '0183-11-16', 7, 'single');
INSERT INTO person VALUES (1092, 'Jaqueline Bueno Mendes', '2013-10-14 09:10:19', 1, '', '', '      ', 5, '                ', '                ', '         ', '', '', 'f', '1987-09-22', NULL, 'single');
INSERT INTO person VALUES (1093, 'Adriano Carvalho Chaves', '2013-10-14 10:10:03', 1, 'Alfredo Pereira Ribas', '', '665   ', 1, '                ', '                ', '         ', '', '', 'm', '1970-07-29', 5, 'single');
INSERT INTO person VALUES (1094, 'Paulo Sergio Pinheiro', '2013-10-14 10:10:37', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1972-06-25', NULL, 'single');
INSERT INTO person VALUES (1095, 'Paulo Sergio Rodrigues', '2013-10-14 10:10:40', 1, 'Visconde de Araguaia', '', '10    ', 1, '                ', '                ', '         ', '', '', 'm', '1967-06-27', 32, 'single');
INSERT INTO person VALUES (1096, 'Pedro Correia', '2013-10-14 10:10:29', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1971-04-03', NULL, 'single');
INSERT INTO person VALUES (1097, 'Pedro Liz da Cruz', '2013-10-14 10:10:24', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1971-06-05', NULL, 'single');
INSERT INTO person VALUES (1098, 'Paulo Sergio M de Oliveira', '2013-10-14 10:10:01', 1, 'Maria Veling Braga', '', '34    ', 1, '                ', '                ', '         ', '', '', 'm', '1988-12-30', 36, 'single');
INSERT INTO person VALUES (1099, 'Petersom Jeam Gonsalves dos Santos', '2013-10-14 10:10:07', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-05-18', 32, 'single');
INSERT INTO person VALUES (1100, 'Roberto de Oliveira', '2013-10-14 10:10:04', 1, 'Chacara bom Jesus', '', '      ', 17, '                ', '                ', '         ', '', '', 'm', '1966-04-05', NULL, 'single');
INSERT INTO person VALUES (1101, 'Ronaldo Gomes Leopoldino', '2013-10-14 10:10:20', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1977-05-17', NULL, 'single');
INSERT INTO person VALUES (1102, 'Rene Carneiro', '2013-10-14 10:10:05', 1, 'Julio Perneta', '', '557   ', 1, '                ', '                ', '         ', '', '', 'm', '1965-12-23', 4, 'single');
INSERT INTO person VALUES (1103, 'Israel Ferreira Da Silva', '2013-10-14 10:10:37', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1959-09-24', NULL, 'single');
INSERT INTO person VALUES (1104, 'Rossana Fatima Gomes', '2013-10-14 10:10:50', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1970-01-23', NULL, 'single');
INSERT INTO person VALUES (1105, 'Rogerio Gomes dos Santos', '2013-10-14 10:10:26', 1, 'Pedro Gador', '', '608   ', 1, '                ', '                ', '         ', '', '', 'm', '1995-09-15', 14, 'single');
INSERT INTO person VALUES (1106, 'Roberto Jesus Cunha', '2013-10-14 10:10:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1966-08-24', NULL, 'single');
INSERT INTO person VALUES (1107, 'Rafael Preinotti de Rmaos', '2013-10-14 10:10:26', 1, 'Bento do Amaral', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1985-10-18', 40, 'single');
INSERT INTO person VALUES (1108, 'Roerio de Camargo', '2013-10-14 10:10:34', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1985-01-11', NULL, '');
INSERT INTO person VALUES (1109, 'Reinolde Ferreira', '2013-10-14 10:10:50', 1, 'rua Londrina', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1978-11-20', 32, 'single');
INSERT INTO person VALUES (1110, 'Renato Balduino ereira', '2013-10-14 10:10:23', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-01-06', NULL, 'single');
INSERT INTO person VALUES (1111, 'Ricardo Ramom Fagundes', '2013-10-14 10:10:38', 1, 'teofilo Otoni', '', '282   ', 1, '                ', '                ', '         ', '', '', 'm', '1996-05-03', 23, 'single');
INSERT INTO person VALUES (1112, 'Rauan Misael da Silva', '2013-10-14 10:10:47', 1, 'final da Barbosa Lima', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1999-10-29', 23, 'single');
INSERT INTO person VALUES (1113, 'Sebastião Sesar Alves Prestes', '2013-10-14 10:10:37', 1, 'Alcebiades Miranda', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-10-21', 14, 'single');
INSERT INTO person VALUES (1114, 'Sergio Rodrigues Batista', '2013-10-14 10:10:12', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-12-14', NULL, 'single');
INSERT INTO person VALUES (1115, 'Solange Aparecida Ferri', '2013-10-14 10:10:02', 1, 'Todoro kluppel', '', '422   ', 1, '                ', '                ', '         ', '', '', 'm', '1968-05-15', 33, 'single');
INSERT INTO person VALUES (1116, 'Samuel correia Leite', '2013-10-14 10:10:21', 1, 'Corunpias', '', '122   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-12-09', 36, 'single');
INSERT INTO person VALUES (1117, 'sidnei Valentim', '2013-10-14 10:10:34', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1969-12-05', NULL, 'single');
INSERT INTO person VALUES (1118, 'Sheldan Werda', '2013-10-14 11:10:21', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-01-17', 25, 'single');
INSERT INTO person VALUES (1119, 'Teresa Rodrigues', '2013-10-14 11:10:13', 1, 'Julio Perneta', '', '230   ', 1, '                ', '                ', '         ', '', '', 'm', '1978-05-14', 23, 'single');
INSERT INTO person VALUES (1120, 'Thais Rodrigues da Silva', '2013-10-14 11:10:36', 1, 'São Josafate', '', '81    ', 1, '                ', '                ', '         ', '', '', 'f', '1985-07-15', 7, 'married');
INSERT INTO person VALUES (1121, 'Thais Jaqueline de Moraes', '2013-10-14 11:10:40', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-08-29', NULL, '');
INSERT INTO person VALUES (1122, 'Thiago José dos Santos', '2013-10-14 11:10:48', 1, 'Theodoro Klupell', '', '410   ', 1, '                ', '                ', '         ', '', '', 'm', '1988-03-08', 33, 'single');
INSERT INTO person VALUES (1123, 'Valdomiro Alves', '2013-10-14 11:10:35', 1, 'Bitencurt Sanpaio', '', '398   ', 1, '                ', '                ', '         ', '', '', 'm', '1973-05-03', 22, 'single');
INSERT INTO person VALUES (1124, 'Vicente de Paula Freitas', '2013-10-14 11:10:11', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1965-12-24', NULL, 'married');
INSERT INTO person VALUES (1125, 'Vivaldo Rodriques dos Santos', '2013-10-14 11:10:46', 1, 'Nossa Senhora da Luz', '', '59    ', 1, '                ', '                ', '         ', '', '', 'm', '1959-11-16', 8, 'single');
INSERT INTO person VALUES (1126, 'Vitor Manoel M Souza', '2013-10-14 11:10:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2004-03-30', NULL, 'single');
INSERT INTO person VALUES (1127, 'Valdinéia da Silva', '2013-10-14 11:10:27', 1, 'Praia Bpm Jesus', '', '14    ', 1, '                ', '                ', '         ', '', '', 'f', '1980-01-11', 21, '');
INSERT INTO person VALUES (1128, 'Aline Gabriel S de Oliveira', '2013-10-14 14:10:40', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '2000-07-13', NULL, 'single');
INSERT INTO person VALUES (1129, 'Alaor  Gonçalves Vieira', '2013-10-14 14:10:47', 1, 'Brigadeiro Machado', '', '67    ', 1, '                ', '                ', '         ', '', '', 'm', '1967-01-08', 14, 'single');
INSERT INTO person VALUES (1130, 'Andrei Souza Dias', '2013-10-14 14:10:34', 1, 'rua 13 de Março', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-03-13', 27, 'single');
INSERT INTO person VALUES (1131, 'Anderson Wilian Silva Oliveira', '2013-10-14 14:10:07', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1979-08-13', NULL, 'single');
INSERT INTO person VALUES (389, 'Ana Paula de Lima', '2013-08-28 10:08:46', 1, 'Nelsom Vitor', '', '77    ', 1, '                ', '                ', '         ', '', '', 'f', '1983-06-05', 20, 'married');
INSERT INTO person VALUES (1132, 'Evaldo Maciel Alves', '2013-10-14 14:10:24', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1968-08-11', NULL, 'single');
INSERT INTO person VALUES (1133, 'Eva de Lima', '2013-10-14 14:10:42', 1, 'Bitencourt Sanpaio', '', '398   ', 1, '                ', '                ', '         ', '', '', 'm', '1953-07-18', 22, '');
INSERT INTO person VALUES (1134, 'Eloir Pereira', '2013-10-14 14:10:28', 1, 'Ernandes Batista rosa', '', '141   ', 1, '                ', '                ', '         ', '', '', 'm', '1971-01-02', 4, 'single');
INSERT INTO person VALUES (1135, 'Eli Alexandrina Gomes', '2013-10-14 14:10:40', 1, '', '', '      ', 3, '                ', '                ', '         ', '', '', 'm', '1977-09-18', NULL, 'single');
INSERT INTO person VALUES (1136, 'Diego Silva de Mello', '2013-10-14 15:10:37', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1987-10-15', NULL, 'single');
INSERT INTO person VALUES (1137, 'Daiana Aparecida Rodrigues', '2013-10-14 15:10:49', 1, '', '', '      ', 16, '                ', '                ', '         ', '', '', 'f', '2013-01-14', 31, '');
INSERT INTO person VALUES (1138, 'iDavid Leandro Ferri', '2013-10-14 15:10:22', 1, 'Teodoro Kluppel 422', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1998-10-07', 33, 'single');
INSERT INTO person VALUES (1139, 'Davi Blank', '2013-10-14 15:10:02', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1963-11-04', NULL, 'single');
INSERT INTO person VALUES (1140, 'Deniam Roberto Popik', '2013-10-14 15:10:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1968-01-10', NULL, 'single');
INSERT INTO person VALUES (1141, 'Dirso Ivasyssym', '2013-10-14 15:10:22', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1960-12-26', NULL, 'single');
INSERT INTO person VALUES (1142, 'Daniel Carneiro', '2013-10-14 15:10:34', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-14', NULL, 'single');
INSERT INTO person VALUES (1143, 'David de Jesus Gonçalves Silva', '2013-10-14 15:10:28', 1, 'Alfreedo Eugenio Battista RosA', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-03-12', 24, 'single');
INSERT INTO person VALUES (1144, 'Dirceu de Freita Junior', '2013-10-14 15:10:58', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-12-14', NULL, 'single');
INSERT INTO person VALUES (1145, 'Darci Juares Santos', '2013-10-14 15:10:25', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1964-01-01', NULL, '');
INSERT INTO person VALUES (1146, 'Dirceu de Freitas', '2013-10-14 15:10:37', 1, 'Pr Cida de Oliveira', '', '36    ', 1, '                ', '                ', '         ', '', '', 'm', '1969-03-28', 14, 'single');
INSERT INTO person VALUES (1147, 'Dilacir Antunes de Proença', '2013-10-14 15:10:09', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1963-11-05', NULL, 'single');
INSERT INTO person VALUES (1148, 'Daniele dos Santos', '2013-10-14 15:10:55', 1, 'Bitencurt Sanpaio', '', '398   ', 1, '                ', '                ', '         ', '', '', 'm', '1989-01-13', 22, 'single');
INSERT INTO person VALUES (1149, 'Daniel Correia Leite', '2013-10-14 15:10:06', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1984-08-27', NULL, 'single');
INSERT INTO person VALUES (1150, 'Daniel Correia Leite', '2013-10-14 15:10:18', 1, 'Corrupião Leite', '', '122   ', 1, '                ', '                ', '         ', '', '', 'm', '1984-08-27', 36, 'single');
INSERT INTO person VALUES (1151, 'Camila Veriane Nascimento da Silva', '2013-10-14 16:10:30', 1, 'haiti', '', '123   ', 1, '                ', '                ', '         ', '', '', 'm', '2004-08-03', 23, 'single');
INSERT INTO person VALUES (1152, 'Carla dos SaNTOS', '2013-10-14 16:10:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1989-09-15', NULL, 'single');
INSERT INTO person VALUES (1153, 'Cristiane Rocha Guedes', '2013-10-14 16:10:11', 1, 'Teodoro Kluppel', '', '410   ', 1, '                ', '                ', '         ', '', '', 'm', '1983-04-24', 33, 'single');
INSERT INTO person VALUES (1154, 'Cintia Lavoski Maartins', '2013-10-14 16:10:39', 1, 'Carlos Chagas', '', '612   ', 1, '                ', '                ', '         ', '', '', 'm', '1994-08-07', 23, 'single');
INSERT INTO person VALUES (1155, 'Claudio Braz', '2013-10-14 16:10:10', 1, 'Alzira Braga Ribas', '', '364   ', 1, '                ', '                ', '         ', '', '', 'm', '1964-11-28', 35, 'single');
INSERT INTO person VALUES (1156, 'Carlos Edenilsom Pacheco', '2013-10-14 16:10:16', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1966-10-01', NULL, 'single');
INSERT INTO person VALUES (1157, 'Claudinei Jesus Teixeira', '2013-10-14 16:10:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1973-04-18', NULL, 'single');
INSERT INTO person VALUES (1158, 'Claudio Pereira de Almeida', '2013-10-14 16:10:59', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-03-04', NULL, 'single');
INSERT INTO person VALUES (1159, 'Caalos Alberto Vida', '2013-10-14 16:10:45', 1, '', '', '      ', 5, '                ', '                ', '         ', '', '', 'm', '1973-11-08', NULL, 'single');
INSERT INTO person VALUES (1160, 'Claudinei Alves dos Santos', '2013-10-14 16:10:13', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-08-15', NULL, 'single');
INSERT INTO person VALUES (1161, 'Claudete Aparecida Santos Costa', '2013-10-14 16:10:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1968-12-01', NULL, 'single');
INSERT INTO person VALUES (1162, 'Alisom José Baals', '2013-10-14 16:10:40', 1, 'Teodoro doro Kluppel', '', '408   ', 1, '                ', '                ', '         ', '', '', 'm', '1999-08-07', 33, '');
INSERT INTO person VALUES (1163, 'Adriana de Jesus de Cavalho', '2013-10-14 16:10:11', 1, 'Alfredo Pedro', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1975-04-11', 40, 'single');
INSERT INTO person VALUES (1168, 'alessandro de almeida', '2013-10-14 16:10:02', 1, 'Bitencurte sanpaio', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1999-09-02', 22, 'single');
INSERT INTO person VALUES (1169, 'Andreia de OliveiraFerreia', '2013-10-14 17:10:41', 1, 'Abelardo de Brito', '', '15    ', 1, '                ', '                ', '         ', '', '', 'f', '1988-12-12', 20, 'single');
INSERT INTO person VALUES (1170, 'Adriane Aparecida Santos', '2013-10-14 17:10:27', 1, '13', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1994-03-11', 3, '');
INSERT INTO person VALUES (1171, 'Aline Monalisa Santos', '2013-10-16 09:10:12', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-11-26', NULL, '');
INSERT INTO person VALUES (1172, 'Andressa Godeski', '2013-10-16 09:10:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1900-12-26', NULL, '');
INSERT INTO person VALUES (1173, 'Alessandro Gonçalves dos Santos', '2013-10-16 09:10:14', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1998-01-01', 32, 'single');
INSERT INTO person VALUES (1174, 'Antonio de Oliveira', '2013-10-16 09:10:33', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1950-04-01', NULL, 'single');
INSERT INTO person VALUES (1175, 'Adilsom do Rocio de Freitas', '2013-10-16 09:10:01', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-07-10', 7, '');
INSERT INTO person VALUES (1176, 'Adir Gomes', '2013-10-16 09:10:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1948-09-07', NULL, 'single');
INSERT INTO person VALUES (1177, 'Cristiane Pedroso', '2013-10-16 09:10:47', 1, 'Manoel Margues', '', '84    ', 1, '                ', '                ', '         ', '', '', 'f', '1985-11-09', 13, '');
INSERT INTO person VALUES (1178, 'Almiraci Antonio  Alves', '2013-10-16 09:10:49', 1, 'Ataide Ferreira Menezes', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1975-09-09', 7, 'single');
INSERT INTO person VALUES (1179, 'Carlos Adriano Mendes', '2013-10-16 09:10:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-16', NULL, '');
INSERT INTO person VALUES (1180, 'Claudia Regina Ferreira', '2013-10-16 09:10:37', 1, 'Enfermeiro Paulino', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-11-04', NULL, 'single');
INSERT INTO person VALUES (1181, 'Claudia Veiga', '2013-10-16 09:10:13', 1, 'Padre Anacleto', '', '1234  ', 1, '                ', '                ', '         ', '', '', 'f', '1970-09-21', 1, '');
INSERT INTO person VALUES (1182, 'Airtom dos Santos', '2013-10-16 09:10:49', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-16', NULL, 'single');
INSERT INTO person VALUES (1183, 'Jaquelina Aparecida do Nascimento', '2013-10-16 10:10:03', 1, 'Farias de Brito', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1987-10-23', 23, 'single');
INSERT INTO person VALUES (1184, 'José Juares Hibilski', '2013-10-16 10:10:37', 1, 'Martins Pena', '', '515   ', 1, '                ', '                ', '         ', '', '', 'm', '1945-12-21', 22, 'single');
INSERT INTO person VALUES (1185, 'Joao Maria Pedroso Ribas', '2013-10-16 10:10:00', 1, 'Pedro Lisboa Gonçalves', '', '288   ', 1, '                ', '                ', '         ', '', '', 'm', '1962-03-04', 5, '');
INSERT INTO person VALUES (1186, 'Jonatha,m Teixeira', '2013-10-16 10:10:47', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-10-01', NULL, 'single');
INSERT INTO person VALUES (1187, 'Jose Carlos Santiago de Oliveira', '2013-10-16 10:10:20', 1, 'Teodoro Rosas', '', '118   ', 1, '                ', '                ', '         ', '', '', 'm', '1966-10-31', 1, '');
INSERT INTO person VALUES (1188, 'Jose Claudio dos Santos', '2013-10-16 10:10:18', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-16', NULL, '');
INSERT INTO person VALUES (1189, 'Jorge Luiz Teixeira', '2013-10-16 10:10:44', 1, 'Prof Braulino', '', '387   ', 1, '                ', '                ', '         ', '', '', 'm', '1955-09-27', 20, 'single');
INSERT INTO person VALUES (1190, 'Jeam Henrique Ramos', '2013-10-16 10:10:59', 1, 'Sao Jose Fate', '', '81    ', 1, '                ', '                ', '         ', '', '', 'm', '2006-03-15', 32, 'single');
INSERT INTO person VALUES (1191, 'Jefersom  Luiz Soares', '2013-10-16 10:10:01', 1, '', '', '      ', 11, '                ', '                ', '         ', '', '', 'm', '1976-06-12', NULL, 'single');
INSERT INTO person VALUES (1192, 'Junior Ribsom da Silva', '2013-10-16 10:10:38', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-10-25', NULL, 'single');
INSERT INTO person VALUES (1193, 'Jose Ricardo Vidal', '2013-10-16 10:10:48', 1, 'Rio Iapo', '', '558   ', 1, '                ', '                ', '         ', '', '', 'm', '1978-10-31', 25, 'single');
INSERT INTO person VALUES (1194, 'Joao Ribeirop de Lima', '2013-10-16 10:10:48', 1, 'SURUQUA', '', '153   ', 1, '                ', '                ', '         ', '', '', 'm', '1956-09-11', 36, 'widow(er)');
INSERT INTO person VALUES (1195, 'Jonatham Deangui', '2013-10-16 10:10:04', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-06-13', NULL, '');
INSERT INTO person VALUES (1196, 'Josnei de Freitas', '2013-10-16 10:10:51', 1, 'Visconde de Macaé', 'i', '323   ', 1, '                ', '                ', '         ', '', '', 'm', '1979-04-30', 22, 'single');
INSERT INTO person VALUES (1197, 'Marcos Roberto Machado', '2013-10-16 11:10:00', 1, 'Israel de Barbosa Lima', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-08-20', 23, 'married');
INSERT INTO person VALUES (1198, 'Marco Antonio Gopnçalves', '2013-10-16 11:10:22', 1, 'Alvaro Avim', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1967-07-12', 23, 'single');
INSERT INTO person VALUES (1199, 'Marcio Roberto Meira dos Santos', '2013-10-16 11:10:24', 1, 'Barbosa Lima', '', '355   ', 1, '                ', '                ', '         ', '', '', 'm', '1975-05-02', 13, 'married');
INSERT INTO person VALUES (1200, 'Armando Oscar Alexandre', '2013-10-16 11:10:31', 1, 'Guaracy', '', '164   ', 1, '                ', '                ', '         ', '', '', 'm', '1981-09-01', 14, 'single');
INSERT INTO person VALUES (1201, 'Arcisio Veiga ''', '2013-10-16 11:10:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1952-10-11', NULL, 'single');
INSERT INTO person VALUES (1202, 'Antonio Josnei dos Santos', '2013-10-16 11:10:13', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-16', NULL, '');
INSERT INTO person VALUES (1203, 'Antonio de Oliveira', '2013-10-16 11:10:17', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1952-04-01', NULL, 'single');
INSERT INTO person VALUES (1204, 'Alvaro Partricio Camargo', '2013-10-16 11:10:55', 1, 'Rincao da Cruz', '', '299   ', 1, '                ', '                ', '         ', '', '', 'm', '1977-03-13', 1, 'single');
INSERT INTO person VALUES (1205, 'Alisom Santos Rodriques', '2013-10-16 11:10:22', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-07-18', NULL, 'single');
INSERT INTO person VALUES (1206, 'Alisom Vinicius Schechtel', '2013-10-16 11:10:48', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1988-07-18', NULL, 'single');
INSERT INTO person VALUES (1207, 'Alexandro dos Santos', '2013-10-16 11:10:14', 1, 'Rua 7', '', '143   ', 1, '                ', '                ', '         ', '', '', 'm', '1978-05-18', 12, 'single');
INSERT INTO person VALUES (1208, 'Alercio Machado dos Santos', '2013-10-16 11:10:51', 1, 'Bela vista do Paraiso', '', '4     ', 1, '                ', '                ', '         ', '', '', 'm', '1968-08-10', 16, 'single');
INSERT INTO person VALUES (1209, 'Alam Wiliam Notel Vieira', '2013-10-16 11:10:59', 1, 'Madureira', '', '76    ', 1, '                ', '                ', '         ', '', '', 'm', '2008-02-26', 14, 'single');
INSERT INTO person VALUES (1210, 'Alaf Adriano Sanpaio', '2013-10-16 11:10:53', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-02-06', NULL, 'married');
INSERT INTO person VALUES (1211, 'Adriano Gustavo Vieira', '2013-10-16 11:10:18', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1981-03-01', NULL, '');
INSERT INTO person VALUES (1212, 'Adriano Damas da Silva', '2013-10-16 15:10:22', 1, 'Teofilo Otoni', '', '282   ', 1, '                ', '                ', '         ', '', '', 'm', '1990-12-18', 4, 'single');
INSERT INTO person VALUES (1213, 'Addriam Henrique dos Santos', '2013-10-16 16:10:45', 1, 'Theodoro Cluppel Neto', '', '400   ', 1, '                ', '                ', '         ', '', '', 'm', '1997-09-24', 33, 'single');
INSERT INTO person VALUES (1214, 'Adilsom de Almeida', '2013-10-16 16:10:27', 1, 'Minas Gerais', '', '1825  ', 18, '                ', '                ', '         ', '', '', 'm', '1984-09-25', NULL, 'single');
INSERT INTO person VALUES (1215, 'vanessa anielle de Moraes', '2013-10-16 16:10:48', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1995-02-21', NULL, 'single');
INSERT INTO person VALUES (1216, 'Pedro Machado Martins', '2013-10-16 16:10:21', 1, 'Jose Pedro Godoi Gomes', '', '522   ', 1, '                ', '                ', '         ', '', '', 'm', '1993-10-18', 14, 'single');
INSERT INTO person VALUES (1217, 'Petersom Perinoti de Ramos', '2013-10-16 16:10:43', 1, 'bento do amarl', '', '421   ', 1, '                ', '                ', '         ', '', '', 'm', '1981-05-03', 5, 'married');
INSERT INTO person VALUES (1218, 'Pedrop Ademir Silva', '2013-10-16 16:10:02', 1, 'sete de Setembro', '', 's/n   ', 1, '                ', '                ', '         ', '', '', 'm', '1968-11-11', 1, 'single');
INSERT INTO person VALUES (1219, 'Paulo Roberto Shen', '2013-10-16 16:10:31', 1, 'Ataide Ferreira', '', '8     ', 1, '                ', '                ', '         ', '', '', 'm', '1969-06-30', 7, 'single');
INSERT INTO person VALUES (1220, 'Paulo Cesaer Santos', '2013-10-16 16:10:41', 1, 'Jose Miara', '', '27    ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-16', 24, '');
INSERT INTO person VALUES (1221, 'Moacir dos Santos', '2013-10-21 08:10:12', 1, 'Marques de Sapucai', '', '501   ', 1, '                ', '                ', '         ', '', '', 'm', '1966-09-01', 32, 'single');
INSERT INTO person VALUES (1222, 'Marcelo Evandro de Lima', '2013-10-21 08:10:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1976-07-03', NULL, 'married');
INSERT INTO person VALUES (1223, 'Monica dos Santos Gonçalves', '2013-10-21 09:10:19', 1, 'Salvador Mendonça', '', '386   ', 1, '                ', '                ', '         ', '', '', 'm', '1994-11-12', 22, 'single');
INSERT INTO person VALUES (1224, 'Marcia Adriana de Vila', '2013-10-21 09:10:27', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-03-29', NULL, 'single');
INSERT INTO person VALUES (1225, 'Marco Aurelio de Oliveira', '2013-10-21 09:10:29', 1, 'Sabaldia', '', '645   ', 1, '                ', '                ', '         ', '', '', 'm', '1971-05-29', 31, 'single');
INSERT INTO person VALUES (1226, 'Marla Marli Costa Sigueira', '2013-10-21 09:10:11', 1, 'rua Londrina', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1948-10-10', 32, 'single');
INSERT INTO person VALUES (1227, 'Michele Caaroline de Oliveira', '2013-10-21 09:10:28', 1, 'rua Prai bom Jesus', '', 'l 02  ', 1, '                ', '                ', '         ', '', '', 'm', '2006-11-16', 21, 'single');
INSERT INTO person VALUES (1228, 'Monique dos Santos  Gonçalves', '2013-10-21 09:10:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1998-09-25', NULL, 'single');
INSERT INTO person VALUES (1229, 'Mauro Vicente de Matos', '2013-10-21 09:10:25', 1, 'Cruz de Souza', '', '279   ', 1, '                ', '                ', '         ', '', '', 'm', '1961-01-19', 4, 'separated');
INSERT INTO person VALUES (1230, 'Marco Davi de Jesus Lemes', '2013-10-21 09:10:44', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2006-07-28', NULL, 'single');
INSERT INTO person VALUES (1231, 'Macelo da Luz Pinto', '2013-10-21 09:10:59', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1980-02-22', NULL, 'single');
INSERT INTO person VALUES (1232, 'Marli Aparecida dos Santops', '2013-10-21 09:10:51', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1966-08-22', NULL, 'single');
INSERT INTO person VALUES (1233, 'Marcio Eliezer Just', '2013-10-21 09:10:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1974-10-15', NULL, 'single');
INSERT INTO person VALUES (1234, 'Evadio Joaquim Ferreira  da Silva', '2013-10-21 09:10:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1957-09-02', NULL, 'single');
INSERT INTO person VALUES (1235, 'Andersom Linhares de Abreu', '2013-10-21 09:10:09', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1973-05-28', NULL, 'single');
INSERT INTO person VALUES (1236, 'Welitom Aparecido Ternoski', '2013-10-25 08:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1999-01-01', NULL, '');
INSERT INTO person VALUES (1237, 'Wilsom Nunes da Silva', '2013-10-25 09:10:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1963-03-25', NULL, 'single');
INSERT INTO person VALUES (1238, 'Yoshio Matsuk', '2013-10-25 09:10:15', 1, 'Sete de Setenbro', '', '1512  ', 1, '                ', '                ', '         ', '', '', 'm', '1950-11-07', 1, 'married');
INSERT INTO person VALUES (1239, 'Washington Luiz', '2013-10-25 09:10:16', 1, '', '', '      ', 1, '                ', '(42)32261682    ', '         ', '', '', 'm', '1977-06-14', NULL, 'single');
INSERT INTO person VALUES (1240, 'Yago Matheus Ribeiro dos Santos', '2013-10-25 09:10:02', 1, 'Hunberto de Canpos', '', '757   ', 1, '                ', '                ', '         ', '', '', 'm', '1996-10-01', 5, 'single');
INSERT INTO person VALUES (1241, 'Rodrigo Martins Oliveira Silva', '2013-11-14 13:11:40', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-05-13', 1, 'single');
INSERT INTO person VALUES (1242, 'Jose Roberto Marcondes dos Santos', '2013-11-14 13:11:29', 1, 'Capital Rocha', '', '3700  ', 20, '(42)99856891    ', '                ', '         ', '', '', 'm', '1991-02-28', NULL, 'single');
INSERT INTO person VALUES (1243, 'Leandro Ribeiro Coutinho', '2013-11-14 13:11:26', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-07-21', NULL, 'single');
INSERT INTO person VALUES (1244, 'Jair de Jesus', '2013-11-14 13:11:55', 1, 'Ermelino de Leao', '', '914   ', 1, '                ', '                ', '         ', '', '', 'm', '1960-12-28', 1, 'single');
INSERT INTO person VALUES (1245, 'Danilo da Rocha Paulino', '2013-11-14 13:11:33', 1, 'Paia', '', '193   ', 1, '                ', '                ', '         ', '', '', 'm', '2013-01-14', 33, 'single');
INSERT INTO person VALUES (1246, 'Hebrom Skolut', '2013-11-14 13:11:41', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1992-10-15', NULL, 'single');
INSERT INTO person VALUES (1247, 'Paulo Cesar de olIeira', '2013-11-14 13:11:57', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1978-02-19', NULL, 'single');
INSERT INTO person VALUES (1248, 'Ludimila sIliva Pezzoti', '2013-11-14 13:11:42', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'f', '1982-05-25', NULL, 'married');
INSERT INTO person VALUES (1249, 'Israel do Prado', '2013-11-14 13:11:18', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1991-05-06', NULL, 'single');
INSERT INTO person VALUES (1276, 'Welingtom da Silva Ferreira', '2013-11-20 15:11:58', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1995-04-28', NULL, 'single');
INSERT INTO person VALUES (1250, 'Homero Antonio Medeiros', '2013-11-14 13:11:49', 1, 'Nogueira', '', '845   ', 1, '(42)99384336    ', '(42)32277891    ', '         ', '', '', 'm', '1963-04-01', 21, 'single');
INSERT INTO person VALUES (1251, 'Claudio Jose Ferreira', '2013-11-14 14:11:17', 1, 'Amadeu Magi', '', 's/n   ', 1, '(42)98171098    ', '(42)32314531    ', '         ', '', '', 'm', '2013-01-14', 24, 'single');
INSERT INTO person VALUES (1252, 'Rodrigo Maciel Honorio', '2013-11-14 14:11:53', 1, '', '', '      ', 8, '                ', '                ', '         ', '', '', 'm', '1990-11-18', NULL, 'single');
INSERT INTO person VALUES (1253, 'José Valdori Lopes', '2013-11-14 14:11:02', 1, 'Dominicio da Gama', '', '56    ', 1, '                ', '                ', '         ', '', '', 'm', '1991-01-04', 33, 'single');
INSERT INTO person VALUES (1254, 'Samuel de Sousa Ramos', '2013-11-14 14:11:10', 1, 'Avenida tubarão', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1993-11-15', NULL, 'single');
INSERT INTO person VALUES (1255, 'Nilsom Ferreiras PINTO', '2013-11-14 14:11:21', 1, '', '', '      ', 22, '                ', '                ', '         ', '', '', 'm', '1985-05-28', NULL, 'single');
INSERT INTO person VALUES (1256, 'Luiz Henrique Chamoski', '2013-11-14 14:11:15', 1, 'Ipanema', '', '270   ', 1, '(42)98145900    ', '(42)32296984    ', '         ', '', '', 'm', '1994-05-13', 41, 'single');
INSERT INTO person VALUES (1257, 'Odair Joaquim Gomes', '2013-11-14 14:11:02', 1, 'Avelino Pereira Canpos', '', '149   ', 1, '(42)99343282    ', '(42)32366154    ', '         ', '', '', 'm', '1969-04-23', 16, 'single');
INSERT INTO person VALUES (1258, 'Elisabethe Dabrowoski', '2013-11-14 14:11:18', 1, '', '', '      ', 1, '                ', '(42)32267867    ', '         ', '', '', 'm', '1971-08-14', NULL, 'single');
INSERT INTO person VALUES (1259, 'Emanoelç do Carmo Lima', '2013-11-14 14:11:08', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1964-02-19', NULL, 'single');
INSERT INTO person VALUES (1260, 'Anilda de Jesus Camargo de Camargo', '2013-11-14 15:11:03', 1, '', '', '      ', 1, '                ', '(42)32365696    ', '         ', '', '', 'f', '1942-08-06', NULL, 'single');
INSERT INTO person VALUES (1261, 'Clicel Faria', '2013-11-14 15:11:46', 1, 'Dom geraldo Pelanda', '', '1066  ', 1, '(42)88206541    ', '                ', '         ', '', '', 'm', '1981-03-08', 5, 'single');
INSERT INTO person VALUES (1262, 'Yago Mateus dos Santos', '2013-11-14 15:11:41', 1, 'Hunberto de canpos', '', '7757  ', 1, '                ', '                ', '         ', '', '', 'm', '1996-10-01', 5, 'single');
INSERT INTO person VALUES (1263, 'Waschingtom Luiz Costa', '2013-11-14 15:11:39', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1977-06-14', NULL, 'single');
INSERT INTO person VALUES (1264, 'Wlanir paschoal Gomes', '2013-11-14 15:11:36', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1970-04-14', NULL, 'single');
INSERT INTO person VALUES (1265, 'Marcelo da Silva', '2013-11-19 17:11:05', 1, 'Haroldo Schenberg', '', '82    ', 1, '                ', '                ', '         ', '', '', 'm', '1999-08-22', 1, 'single');
INSERT INTO person VALUES (1266, 'Rogério Rodrigues', '2013-11-19 17:11:27', 1, 'Prof. Balbina Branco', '', '138   ', 1, '                ', '                ', '         ', '', '', 'm', '1963-09-07', 42, 'single');
INSERT INTO person VALUES (1267, 'Carlos Eduardo de Siqueira', '2013-11-19 17:11:00', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1990-06-29', NULL, 'single');
INSERT INTO person VALUES (1268, 'Antonio Elizeu Martins', '2013-11-19 17:11:13', 1, 'Alvorada do Sul', '', '1113  ', 1, '(42)99409214    ', '(42)32275119    ', '         ', '', '', 'm', '1967-02-05', 16, 'single');
INSERT INTO person VALUES (1269, 'Wlanir Paschoal Gomes', '2013-11-20 14:11:09', 1, 'Paulo de Frontim', '', '680   ', 1, '                ', '                ', '         ', '', '', 'm', '1970-04-14', 33, 'married');
INSERT INTO person VALUES (1270, 'Wiliam Vunicius de Oliveira', '2013-11-20 14:11:54', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2006-03-08', NULL, 'single');
INSERT INTO person VALUES (1271, 'illiam Ricardo Candido', '2013-11-20 14:11:51', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-11-02', NULL, 'single');
INSERT INTO person VALUES (1272, 'Wilsom Grzieebelucka', '2013-11-20 14:11:47', 1, 'Francisco Ribas', '', '1125  ', 1, '(42)99715959    ', '(42)32369867    ', '         ', '', '', 'm', '1960-07-30', 1, 'single');
INSERT INTO person VALUES (1273, 'Valdomiro de Oliveira', '2013-11-20 15:11:39', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1960-09-20', NULL, 'single');
INSERT INTO person VALUES (1274, 'William Marrques Pinheiro', '2013-11-20 15:11:16', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '2009-05-04', NULL, 'single');
INSERT INTO person VALUES (1275, 'Walter José Perreira', '2013-11-20 15:11:23', 1, 'Mato Grosso', '', '410   ', 1, '                ', '                ', '         ', '', '', 'm', '1958-03-18', 5, 'single');
INSERT INTO person VALUES (1277, 'William Fabio Gonçalves', '2013-11-20 15:11:04', 1, 'Anita Garibaldi', '', '3001  ', 1, '                ', '                ', '         ', '', '', 'm', '1987-05-01', 24, 'single');
INSERT INTO person VALUES (1278, 'William Lincom da Silva', '2013-11-20 15:11:52', 1, '', '', '      ', 1, '                ', '                ', '         ', '', '', 'm', '1986-03-23', NULL, 'single');
INSERT INTO person VALUES (1279, 'Wilsom Luiz da Silva', '2013-11-20 15:11:58', 1, 'rua 07', '', '459   ', 1, '                ', '                ', '         ', '', '', 'm', '1959-10-24', 13, 'single');
INSERT INTO person VALUES (1280, 'Cleversom Luiz Ferreira', '2013-12-16 13:12:22', 1, 'Republica do Paraná', '', '745   ', 1, '                ', '                ', '         ', '', '', 'm', '1989-10-17', 20, 'single');
INSERT INTO person VALUES (1281, 'Sérgio Renato Nima', '2013-12-16 13:12:08', 1, 'Jaguariaiva', '', '127   ', 1, '(42)99403802    ', '                ', '         ', '', '', 'm', '1963-05-09', 5, 'married');
INSERT INTO person VALUES (1282, 'Fabio Barom', '2013-12-16 13:12:33', 1, 'Pref. Brasilio Lilas', '', '350   ', 1, '(42)99217614    ', '(42)32293514    ', '         ', '', '', 'm', '1975-11-29', 27, 'single');
INSERT INTO person VALUES (1283, 'Aroldo Leite', '2013-12-16 14:12:33', 1, 'Antonio Wiliam Santos', '', '50    ', 1, '                ', '                ', '         ', '', '', 'm', '1965-08-28', 30, 'single');
INSERT INTO person VALUES (1284, 'Wagner Marques de Miranda Urbam', '2013-12-16 14:12:28', 1, 'Aleluia', '', '41    ', 1, '(42)9806        ', '                ', '         ', '', '', 'm', '1987-02-07', 21, 'single');
INSERT INTO person VALUES (1285, 'João Maaria Pires', '2013-12-16 14:12:42', 1, '', '', '      ', 1, '(42)98383722    ', '                ', '         ', '', '', 'm', '1967-05-20', NULL, 'single');
INSERT INTO person VALUES (1286, 'John Maico Franco', '2013-12-18 13:12:29', 1, 'Herculano de Freitas', '', '751   ', 1, '(42)99507920    ', '(42)99944199    ', '84015105 ', '', 'johnfranco22@gmail.com', 'm', '1996-03-14', 4, 'single');


--
-- Data for Name: person_docs; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO person_docs VALUES (20, '4.424.682-1', '427.413.279-04', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (29, '', '089.930.289-07', '', '207.63241.42.8', '', '', '', '');
INSERT INTO person_docs VALUES (37, '57233842', '02135631930', '', '', '02617166899', '64431720604', '', '');
INSERT INTO person_docs VALUES (38, '81699542', '05098323932', '25392', '64892500001', '05265507176', '078199840604', '81699542', '');
INSERT INTO person_docs VALUES (6, '13.375.707-4', '103.079.529-08', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (44, '8.136.705-1', '058.709.659-42', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (45, '13.044.920-4', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (46, '29.317.090-3', '170.360.598-50', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (35, '13.699.563-4', '012.513.759-10', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (47, '4.612.999-4', '319.764.658-42', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (62, '812.801-4', '', '', '', '', '007924400620', '', '');
INSERT INTO person_docs VALUES (97, '12333455-8', '088993839-36', '', '14238866270', '', '', '', '');
INSERT INTO person_docs VALUES (104, '39315017', '44236271915', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (54, '136995634', '01251375910', '', '', '', '105291010639', '151832930870', '');
INSERT INTO person_docs VALUES (103, '48193786', '40465569862', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (105, '95479480', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (106, '', '', '', '', '', '007924400620', '', '');
INSERT INTO person_docs VALUES (108, '18577476', '10982885644', '', '', '', '172867640299', '', '');
INSERT INTO person_docs VALUES (109, '293170903', '17036059850', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (116, '66782158', '56214286920', '', '00440975001', '', '', '', '');
INSERT INTO person_docs VALUES (117, '70202123', '04900630985', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (58, '53894992', '70256934991', '', '3719219', '', '031514720639', '', '');
INSERT INTO person_docs VALUES (88, '084517015519801', '', '', '00011030000488676', '', '', '', '');
INSERT INTO person_docs VALUES (79, '99064080', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (80, '77297405', '01046759930', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (76, '88639626', '', '', '3838670', '', '', '', '');
INSERT INTO person_docs VALUES (73, '107944877', '07602223985', '', '16631407401', '', '91855660671', '', '');
INSERT INTO person_docs VALUES (42, '54545592', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (121, '84958409', '04872570901', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (60, '138413856', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (123, '', '', '104584', '', '', '', '', '');
INSERT INTO person_docs VALUES (124, '', '', '38409378', '', '', '', '', '');
INSERT INTO person_docs VALUES (126, '', '', '032655', '', '', '', '', '');
INSERT INTO person_docs VALUES (127, '', '', '4249223', '', '', '', '', '');
INSERT INTO person_docs VALUES (128, '', '', '1562867', '', '', '', '', '');
INSERT INTO person_docs VALUES (129, '', '', '468004031', '', '', '', '', '');
INSERT INTO person_docs VALUES (130, '', '', '30517083061', '', '', '', '', '');
INSERT INTO person_docs VALUES (131, '', '', '15301067', '', '', '', '', '');
INSERT INTO person_docs VALUES (133, '46129994', '31976465842', '', '933931284 sp', '', '', '', '');
INSERT INTO person_docs VALUES (134, '101867676', '07275779994', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (135, '105714963', '74181955915', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (136, '394042529', '02730703985', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (138, '', '06418709900', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (139, '70878623', '00411056999', '', '22641', '', '', '', '8980011222788268');
INSERT INTO person_docs VALUES (140, '51041410', '', '', '', '', '45214400698', '', '');
INSERT INTO person_docs VALUES (143, '82931112', '', '', '', '', '', '151832592886', '');
INSERT INTO person_docs VALUES (144, '78520370', '02307207902', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (147, '95513743', '01115996959', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (152, '88317041', '03892558906', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (154, '1233945433', '01243858931', '', '3477668', '', '', '', '');
INSERT INTO person_docs VALUES (158, '83164310', '88273326934', '', '2416595040', '', '', '', '');
INSERT INTO person_docs VALUES (160, '78286866', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (161, '93237773', '06174727939', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (163, '59201980', '05439848932', '', '12341172646', '', '057135780698', '438189', '');
INSERT INTO person_docs VALUES (164, '80686870', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (165, '132583013', '09191613914', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (167, '80099231', '02589715927', '', '88659', '', '', '', '');
INSERT INTO person_docs VALUES (170, '57753250', '88318621972', '', '', '01071186621', '', '', '');
INSERT INTO person_docs VALUES (171, '96765886', '06457367917', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (172, '100138700', '06328089937', '', '', '', '085526150623', '', '');
INSERT INTO person_docs VALUES (173, '35165150', '47979712900', '', '', '', '043948790604', '', '');
INSERT INTO person_docs VALUES (175, '', '', '127584', '', '', '', '', '');
INSERT INTO person_docs VALUES (178, '22396110', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (181, '6902294', '41128419904', '', '', '', '007818400680', '', '');
INSERT INTO person_docs VALUES (183, '6145311 (sp)', '02927521999 (sp)', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (186, '', '06283027970', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (187, '54137699', '80135595991', '', '123308888122', '', '', '', '');
INSERT INTO person_docs VALUES (189, '96954670', '05712013932', '', '', '', '0085534970680', '151832686951', '');
INSERT INTO person_docs VALUES (190, '', '', '', '8361432', '', '', '', '');
INSERT INTO person_docs VALUES (196, '18723344', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (197, '109719951', '07460993980', '', '0683422', '', '096757000604', '151832733589', '');
INSERT INTO person_docs VALUES (198, '126059469', '08814753946', '', '', '', '091781262055', '151832820782', '');
INSERT INTO person_docs VALUES (199, '127881988', '08720364997', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (200, '133700200', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (201, '3316066900', '43477585968', '', '1870043', '', '', '', '');
INSERT INTO person_docs VALUES (204, '9240823', '05999156920', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (205, '41568496', '', '', '27177', '', '', '', '');
INSERT INTO person_docs VALUES (207, '4r2864086', '72941502904', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (208, '62052554', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (209, '109853941', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (210, '81555397', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (212, '54137699', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (220, '9404663-7', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (222, '15443618', '24443620982', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (223, '123366417', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (224, '78361360', '02651799980', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (225, '10779012', '03813889645', '', '', '757340100', '', '150022105608', '');
INSERT INTO person_docs VALUES (227, '126893132', '08143948927', '', '', '', '096285470680', '', '');
INSERT INTO person_docs VALUES (230, '105193319', '', '', '', '', '', '698944', '');
INSERT INTO person_docs VALUES (231, '31994101', '50078151953', '', '10822026055', '', '07575080647', '', '');
INSERT INTO person_docs VALUES (232, '0000160587930', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (234, '82115161', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (235, '135712817', '', '', '22160180030', '', '', '', '');
INSERT INTO person_docs VALUES (236, '105043872', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (237, '97281939', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (238, '133705759', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (239, '8735806', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (240, '36933054', '92594026972', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (241, '5381097', '', '', '88878', '', '', '', '');
INSERT INTO person_docs VALUES (242, '65865823', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (243, '36933054', '92594026972', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (244, '07329730904', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (247, '132727791', '29579070890', '', '0675556', '', '', '', '');
INSERT INTO person_docs VALUES (248, '63239941', '82038325987', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (250, '35452729', '32116500915', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (251, '39028379', '52013340915', '', '29220370030', '', '008067310671', '', '');
INSERT INTO person_docs VALUES (252, '52435', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (253, '36281251', '', '', '7644906', '', '0037861450604', '309916', '');
INSERT INTO person_docs VALUES (256, '14060060', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (257, '95731066', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (258, '97358060', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (262, '9312070', '04991250960', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (268, '78361395', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (269, '82792350', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (272, '58447404', '00988482916', '', '12491215243', '', '048289160671', '', '');
INSERT INTO person_docs VALUES (273, '76146214', '00409353965', '', '', '', '064433370647', '', '');
INSERT INTO person_docs VALUES (275, '31824486', '37490591953', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (276, '75613221', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (277, '104415334', '06833947970', '', '8967463', '', '', '', '');
INSERT INTO person_docs VALUES (278, '', '78336252991', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (281, '4998963', '04308933960', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (283, '32065970', '37165330925', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (286, '24523543', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (115, '86234742', '01120168988', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (290, '191677150', '07480527985', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (292, '019672', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (293, '2r3215995', '79309950978', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (296, '18188988', '46516573972', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (304, '52623987', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (305, '60861528', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (310, '32885764', '', '', '', '', '007580290604', '', '');
INSERT INTO person_docs VALUES (311, '90655272', '06434530919', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (312, '15965', '05732417915', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (318, '93442326', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (319, '70738465', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (322, '104366155', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (325, '073893', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (326, '128359508', '08811411947', '', '1849992', '', '', '', '');
INSERT INTO person_docs VALUES (329, '632267856', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (335, '102223578', '07937754931', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (339, '107233504', '07513791902', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (341, '100466309', '05815286974', '', '', '', '062851380612', '', '');
INSERT INTO person_docs VALUES (348, '83126760', '02266817930', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (350, '89756265', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (361, '128322850', '08793584911', '', '', '', '097806690620', '', '');
INSERT INTO person_docs VALUES (364, '90650882', '04395505996', '', '', '', '075228520612', '', '');
INSERT INTO person_docs VALUES (367, '125919324', '08394716962', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (375, '', '', '', '14020961278', '', '09782750671', '', '');
INSERT INTO person_docs VALUES (376, '103019370', '08849542933', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (378, '130302319', '09080121959', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (398, '57877243', '70107904934', '', '', '', '05342090663', '', '');
INSERT INTO person_docs VALUES (399, '126863420', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (401, '61590846', '03903525944', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (402, '37004952', '70510911900', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (407, '88662949', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (408, '132891893', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (409, '60493430', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (410, '98886214', '05514417980', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (413, '821756', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (416, '', '05286636900', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (417, '23838427', '00580672999', '', '42627745030', '', '', '', '');
INSERT INTO person_docs VALUES (420, '57881356', '44098359987', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (421, '62681144', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (424, '55824819', '95798390934', '', '', '', '05551460671', '616090052', '');
INSERT INTO person_docs VALUES (426, '33160356', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (428, '81979629', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (432, '82848053', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (433, '', '01243823984', '', '12609799537', '', '', '', '');
INSERT INTO person_docs VALUES (436, '80843682', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (438, '1082836898', '07379354990', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (439, '', '71522891900', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (440, '0826810612', '05724454904', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (443, '109806415', '07903573993', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (444, '234393212', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (445, '73886457', '70833010930', '', '', '', '043856730604', '', '');
INSERT INTO person_docs VALUES (447, '39430770', '60922699968', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (449, '102241563', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (452, '61366792', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (457, '73846650', '03586350988', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (462, '850999370', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (464, '81312818', '04076523962', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (465, '127884277', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (468, '32981992', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (470, '950210890', '05519242925', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (471, '88808223', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (473, '69046681', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (474, '3939009', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (477, '87235270', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (478, '69465186', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (481, '107944877', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (485, '42412003', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (486, '76207585', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (489, '61442243', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (490, '24/30/5279', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (491, '67582608', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (494, '87678288', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (496, '60493270', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (501, '59189280', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (502, '35653830', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (503, '0329342320079', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (504, '127885354', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (505, '96723288', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (506, '97488193', '01197249958', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (507, '38778188', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (508, '', '', '5183', '', '', '', '', '');
INSERT INTO person_docs VALUES (510, '32026923', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (511, '52572371', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (517, '1707217', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (519, '100388050', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (521, '105048254', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (522, '102953363', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (531, '568501688', '41991027877', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (535, '2584585', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (536, '129040173', '08562793906', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (537, '185072', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (541, '94441277', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (545, '72225341', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (546, '41514850', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (550, '', '', '', '10582007485', '', '', '', '');
INSERT INTO person_docs VALUES (552, '103315950', '06675381946', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (554, '90626841', '64502333972', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (556, '130202535', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (558, '72225821', '02518255907', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (559, '2003010018447', '02773395379', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (560, '10514507', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (561, '', '', '', '12967641490', '', '', '', '');
INSERT INTO person_docs VALUES (564, '87381994', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (565, '110729618', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (568, '128075224', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (572, '99445580', '07834737961', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (574, '19913180', '09946786907', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (576, '81925488', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (577, '52232821', '67005292987', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (118, '64505181', '04476551912', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (585, '96143630', '00982221983', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (587, '', '', '113514', '', '', '', '', '');
INSERT INTO person_docs VALUES (591, '100137658', '66604397904', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (597, '47485614', '67004130959', '', '3024602', '', '', '', '');
INSERT INTO person_docs VALUES (598, '89618380', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (600, '65476983', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (601, '1964490', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (604, '73444314', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (605, '257911571', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (606, '20846127', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (608, '79340774', '02592044981', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (610, '85574710', '88266400920', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (612, '105585357', '07726501871', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (614, '83817348', '03733709977', '', '0173811', '', '', '', '');
INSERT INTO person_docs VALUES (615, '113421', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (616, '30537968263', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (621, '80742096', '07250846930', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (622, '64192892', '00407797939', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (623, '233175349', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (624, '', '04177542997', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (625, '', '10052309940', '', '', '', '21065267047', '', '');
INSERT INTO person_docs VALUES (626, '103291879', '01204392986', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (627, '103291879', '', '', '', '', '101791550604', '', '');
INSERT INTO person_docs VALUES (628, '105627300', '07343251937', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (629, '60064741', '44167326949', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (630, '81383154', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (633, '129937556', '01226462901', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (644, '90722131', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (646, '105048289', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (648, '132594988', '09698539980', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (650, '56238511', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (654, '122071123', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (657, '83822311', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (658, '32885764', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (660, '73059097', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (663, '128589490', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (664, '51458575', '93164700997', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (666, '67451635', '91194709915', '', '55462100038', '', '5191933506147', '151812048628', '');
INSERT INTO person_docs VALUES (667, '401350915', '22248720890', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (669, '124335698', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (670, '', '07154230967', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (671, '98992499', '09081149903', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (674, '48373305', '25338196204', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (677, '1317335', '33984727968', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (678, '124764394', '08362147903', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (679, '125146775', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (680, '127886075', '08754378931', '', '079750261', '', '', '', '');
INSERT INTO person_docs VALUES (682, '76487286', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (683, '6036399', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (688, '83291672', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (689, '84137057', '67871836900', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (691, '99244810', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (693, '99183306', '05498919948', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (694, '10792672', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (697, '401433572', '70866414991', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (698, '81489890', '', '', '', '', '069710080620', '', '');
INSERT INTO person_docs VALUES (699, '11449077', '33851840968', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (701, '32607', '47283009949', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (702, '327779483', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (704, '16279927', '10023704934', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (706, '57916060', '95791612915', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (709, '68849110', '04769113978', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (710, '00298758490', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (712, '0200210520025', '04195600332', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (713, '24549100', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (714, '58625647', '28730712904', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (717, '66782867', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (719, '129668202', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (722, '23182882', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (723, '52028809', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (724, '3334196474', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (727, '295433486', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (732, '8904444', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (734, '1208816', '83480684904', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (736, '12507', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (738, '80312253', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (739, '81861773', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (740, '84039977', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (749, '99316535', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (750, '96143397', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (751, '99551113', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (752, '104972098', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (755, '77788078100', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (758, '131342209', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (762, '41976918', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (764, '72468805', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (765, '70570882', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (766, '14044175', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (767, '72585143', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (768, '33135076', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (774, '252692123', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (775, '123854330', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (777, '44956101', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (779, '99474327', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (781, '133741380', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (782, '89340411', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (783, '0242171762', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (784, '105626827', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (785, '95524802', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (786, '81497885', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (789, '83203676', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (790, '33983883', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (793, '53937756', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (794, '88699149', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (795, '0061337060', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (796, '430266819', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (797, '12341683497', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (798, '131609825', '09692736903', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (800, '948576', '60160446520', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (803, '', '', '31271', '', '', '', '', '');
INSERT INTO person_docs VALUES (804, '88512430', '02710055996', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (818, '80272405', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (820, '41366280', '60105615900', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (822, '131965125', '09572268961', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (838, '13252696', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (843, '50242080', '75584921904', '', '', '00349199733', '', '', '');
INSERT INTO person_docs VALUES (850, '33061730', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (858, '', '02448643903', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (859, '84645850', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (875, '64516892', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (877, '211725869', '08762075810', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (895, '81364940', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (897, '53333230', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (898, '101518499', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (903, '44597713', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (912, '51458575', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (914, '47226112', '58314202991', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (916, '31223369', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (917, '370158271', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (954, '45780704', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (974, '', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (976, '125404944', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (977, '43689991', '62271903904', '', '756693250010', '', '', '', '');
INSERT INTO person_docs VALUES (978, '66777024', '76121186968', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (990, '63828629', '97346039904', '', '', '', '64779600620', '151832301577', '');
INSERT INTO person_docs VALUES (991, '80850239', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (995, '239793493', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1004, '60264740', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1025, '105056605', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1039, '41911123', '64560759987', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (70, '87104230', '04430214905', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (100, '51149416', '76121437987', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (67, '138247740', '40921077220', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (71, '7054', '78336252991', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (98, '71683079', '00427653908', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (72, '73483336', '04518073916', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (753, '84958409', '04872570901', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1047, '81367051', '05870965942', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1101, '9096019493', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1103, '30951093', '39652734934', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1106, '679951104', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1124, '20115265', '10253450888', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1141, '42153451', '40996441972', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1158, '75888830', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1175, '75540752', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1185, '40822909', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1202, '4r2864086', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1220, '42639931', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1226, '83076283', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1238, '5247281', '66529204849', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1243, '139342712', '08311582980', '', '1635700531', '', '1971775480213', '', '');
INSERT INTO person_docs VALUES (1247, '73393086', '97981893968', '', '', '', '604066206139', '', '');
INSERT INTO person_docs VALUES (1249, '127780840', '', '', '16235757388', '', '', '', '');
INSERT INTO person_docs VALUES (1252, '471012671', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1253, '65684608', '00071720952', '', '', '', '5149553058080', '', '');
INSERT INTO person_docs VALUES (1254, '129249897', '09056127950', '', '4262501', '', '', '', '');
INSERT INTO person_docs VALUES (1255, '88178106', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1261, '362731500', '04223423940', '', '62177450030', '', '', '', '');
INSERT INTO person_docs VALUES (1265, '84745693', '01109915918', '', '', '', '', '151832458161', '');
INSERT INTO person_docs VALUES (1267, '103613426', '06670157959', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1268, '44832577', '63868466991', '', '', '03069384722', '', '', '');
INSERT INTO person_docs VALUES (1269, '45460145', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1271, '85668757', '06742313927', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1272, '33061730', '39581926968', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1275, '20163119', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1277, '99906766', '05716191932', '', '', '', '085553810663', '151832694260', '');
INSERT INTO person_docs VALUES (1278, '100048531', '06650399990', '', '', '', '0085543380612', '', '');
INSERT INTO person_docs VALUES (1279, '21495166', '', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1280, '99909145', '06225135910', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1282, '69262023', '88309878915', '10998121138', '', '', '', '', '');
INSERT INTO person_docs VALUES (1283, '46565339', '65409590953', '', '', '', '', '', '');
INSERT INTO person_docs VALUES (1284, '83296437', '04405291900', '', '16555695707', '', '0086434120680', '', '');
INSERT INTO person_docs VALUES (1286, '', '', '25293/f.82/l.30a', '7300818', '', '', '', '');


--
-- Data for Name: person_helped; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO person_helped VALUES (62, 'Cristão', 'desempregado', 'músico, percussão, carteiro.', false, 'aluguel', '2012-01-05', 1, 17, 'urbano', 'tijolo', 9, NULL, NULL);
INSERT INTO person_helped VALUES (95, 'Crente', 'desempregado', 'Servente de pedreiro', false, 'cedida', '2012-03-07', 1, 17, 'urbano', 'madeira', 5, NULL, NULL);
INSERT INTO person_helped VALUES (97, 'Evangélico', 'desempregado', 'HortiFruti granjeiro', false, 'Acolhido em Associação', '2013-09-08', 1, 17, 'urbano', 'tijolo', 15, NULL, NULL);
INSERT INTO person_helped VALUES (109, 'evangelico', 'trabalhador urbano', 'cozinheiro', false, 'cedida', '2013-01-08', 8, 26, 'boa', 'tijolo', 15, 12.00, NULL);
INSERT INTO person_helped VALUES (115, 'evangelico', 'desempregado', 'colheita de fumo', false, 'cedida', '2011-02-03', 1, 17, 'urbana', 'tijolo', 1, NULL, NULL);
INSERT INTO person_helped VALUES (134, 'catolico', 'trabalhador rural', 'rural', false, 'proprietário', '2012-10-07', 9, 17, 'urbano', 'tijolo', 6, NULL, NULL);
INSERT INTO person_helped VALUES (170, 'evangelico', 'desempregado', '', true, 'proprietário', '1970-01-01', 1, 17, 'urbano', 'tijolo', 3, NULL, '2012-02-11');
INSERT INTO person_helped VALUES (189, 'catolico', 'desempregado', 'aux geral', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2012-11-21');
INSERT INTO person_helped VALUES (190, 'evangelico', 'desempregado', '', false, 'aluguel', '1970-01-01', 1, 17, 'urbano', 'tijolo', 5, 300.00, '2008-05-18');
INSERT INTO person_helped VALUES (199, 'avavngelico', 'desempregado', '', false, 'proprietário', '1970-01-01', 15, 17, 'urbano', 'tijolo', 2, NULL, '20011-09-21');
INSERT INTO person_helped VALUES (201, 'nao tem', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 5, NULL, '2012-04-24');
INSERT INTO person_helped VALUES (222, 'evangelico', 'desempregado', 'soldador', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2013-01-23');
INSERT INTO person_helped VALUES (262, 'evangelico', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 5, NULL, '2013-01-23');
INSERT INTO person_helped VALUES (266, 'Catolico', 'autonomo', 'autonomo', false, 'aluguel', '1970-01-01', 1, 17, 'urbano', 'tijolo', 6, 150.00, '2008-05-31');
INSERT INTO person_helped VALUES (268, 'evangelico', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 3, NULL, '2010-05-22');
INSERT INTO person_helped VALUES (273, 'catolico', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2008-05-18');
INSERT INTO person_helped VALUES (277, 'catolico', 'desempregado', 'servente de pedreiro', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 5, NULL, '2011-05-04');
INSERT INTO person_helped VALUES (281, 'catolico', 'desempregado', 'marceneiro', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 3, NULL, '2010-12-11');
INSERT INTO person_helped VALUES (296, 'evengelico', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2011-05-26');
INSERT INTO person_helped VALUES (317, 'catolica', 'desempregado', '', false, 'proprietário', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2012-03-14');
INSERT INTO person_helped VALUES (318, 'evangelica', 'desempregado', 'reciclagem', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2010-07-31');
INSERT INTO person_helped VALUES (320, 'evangelica', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 5, NULL, '2007-03-27');
INSERT INTO person_helped VALUES (321, 'evangelica', 'desempregado', 'do lar', false, 'proprietário', '1970-01-01', 1, 17, 'urbano', 'tijolo', 6, NULL, '2008-05-31');
INSERT INTO person_helped VALUES (328, 'evangelica', 'estudante', '', false, 'proprietário', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2010-05-22');
INSERT INTO person_helped VALUES (353, 'evengelica ', 'desempregado', 'catadora', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 6, NULL, '2008-05-31');
INSERT INTO person_helped VALUES (357, 'evangelico', 'trabalhador urbano', '', false, 'proprietário', '1970-01-15', 1, 17, 'urbano', 'tijolo', 2, NULL, '2010-03-20');
INSERT INTO person_helped VALUES (358, 'catolica', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 7, NULL, '2012-09-28');
INSERT INTO person_helped VALUES (359, 'evangelica', 'estudante', '', false, 'proprietário', '1970-01-01', 1, 17, 'urbano', 'madeira', 2, NULL, '2010-07-03');
INSERT INTO person_helped VALUES (361, 'evangelico', 'desempregado', '', false, 'cedida', '1970-01-01', 11, 26, 'urbano', 'tijolo', 3, NULL, '2012-04-09');
INSERT INTO person_helped VALUES (364, 'evangelico', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'ilha', 'tijolo', 8, NULL, '2011-08-11');
INSERT INTO person_helped VALUES (376, 'catolica', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'madeira', 4, NULL, '2012-05-29');
INSERT INTO person_helped VALUES (198, 'evangelico', 'desempregado', '', false, 'aluguel', '1970-01-01', 14, 22, 'urbano', 'tijolo', 8, 250.00, '2012-10-22');
INSERT INTO person_helped VALUES (556, 'evangelico', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 7, NULL, '2012-12-03');
INSERT INTO person_helped VALUES (559, 'evangelico', 'desempregado', '', false, 'cedida', '1970-01-01', 13, 6, 'urbano', 'tijolo', 5, NULL, '2013-01-05');
INSERT INTO person_helped VALUES (613, 'evangélica', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 16, 'urbano', 'tijolo', 3, NULL, '2009-08-15');
INSERT INTO person_helped VALUES (623, 'sem', 'trabalhador urbano', 'Atendente de Idosos', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2009-08-15');
INSERT INTO person_helped VALUES (630, 'catolica', 'trabalhador urbano', 'Professora( MAGISTÉRIO )', true, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 8, NULL, '2010-01-25');
INSERT INTO person_helped VALUES (636, 'sem', 'estudante', '', false, 'aluguel', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, 130.00, '2009-12-12');
INSERT INTO person_helped VALUES (641, 'evangelica', 'aposentado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 3, NULL, '2008-05-17');
INSERT INTO person_helped VALUES (827, 'catolica', 'grafica', 'copy disigner', false, 'aluguel', '1970-01-01', 2, 17, 'urbano', 'tijolo', 8, 150.00, '2008-03-01');
INSERT INTO person_helped VALUES (834, 'catolico', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 4, NULL, '2009-11-21');
INSERT INTO person_helped VALUES (841, 'catolico', 'aposentado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 5, NULL, '2010-05-22');
INSERT INTO person_helped VALUES (1241, 'cristao', 'desempregado', '', false, 'cedida', '1970-01-01', 1, 17, 'urbano', 'tijolo', 2, NULL, '2013-11-12');


--
-- Data for Name: person_media; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO person_media VALUES (6, 1);
INSERT INTO person_media VALUES (20, 2);
INSERT INTO person_media VALUES (25, 3);
INSERT INTO person_media VALUES (5, 4);
INSERT INTO person_media VALUES (13, 5);
INSERT INTO person_media VALUES (14, 6);
INSERT INTO person_media VALUES (15, 7);
INSERT INTO person_media VALUES (17, 8);
INSERT INTO person_media VALUES (3, 9);
INSERT INTO person_media VALUES (37, 10);
INSERT INTO person_media VALUES (38, 11);
INSERT INTO person_media VALUES (97, 12);
INSERT INTO person_media VALUES (48, 13);
INSERT INTO person_media VALUES (115, 14);
INSERT INTO person_media VALUES (109, 15);
INSERT INTO person_media VALUES (70, 16);
INSERT INTO person_media VALUES (67, 17);
INSERT INTO person_media VALUES (974, 18);
INSERT INTO person_media VALUES (71, 19);
INSERT INTO person_media VALUES (54, 20);
INSERT INTO person_media VALUES (128, 21);
INSERT INTO person_media VALUES (127, 22);
INSERT INTO person_media VALUES (574, 23);
INSERT INTO person_media VALUES (103, 24);
INSERT INTO person_media VALUES (117, 25);
INSERT INTO person_media VALUES (98, 26);
INSERT INTO person_media VALUES (72, 27);
INSERT INTO person_media VALUES (753, 28);
INSERT INTO person_media VALUES (118, 29);
INSERT INTO person_media VALUES (978, 30);
INSERT INTO person_media VALUES (60, 31);
INSERT INTO person_media VALUES (122, 32);
INSERT INTO person_media VALUES (126, 33);
INSERT INTO person_media VALUES (124, 34);
INSERT INTO person_media VALUES (132, 35);
INSERT INTO person_media VALUES (1047, 36);
INSERT INTO person_media VALUES (46, 37);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: ong
--



--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO state VALUES (1, 'Acre', 1, 'AC');
INSERT INTO state VALUES (2, 'Alagoas', 1, 'AL');
INSERT INTO state VALUES (3, 'Amapá', 1, 'AP');
INSERT INTO state VALUES (4, 'Amazonas', 1, 'AM');
INSERT INTO state VALUES (5, 'Bahia', 1, 'BA');
INSERT INTO state VALUES (6, 'Ceará', 1, 'CE');
INSERT INTO state VALUES (7, 'Distrito Federal', 1, 'DF');
INSERT INTO state VALUES (8, 'Espírito Santo', 1, 'ES');
INSERT INTO state VALUES (9, 'Goiás', 1, 'GO');
INSERT INTO state VALUES (10, 'Maranhão', 1, 'MA');
INSERT INTO state VALUES (11, 'Mato Grosso', 1, 'MT');
INSERT INTO state VALUES (12, 'Mato Grosso do Sul', 1, 'MS');
INSERT INTO state VALUES (14, 'Pará', 1, 'PA');
INSERT INTO state VALUES (16, 'Paraíba', 1, 'PB');
INSERT INTO state VALUES (17, 'Paraná', 1, 'PR');
INSERT INTO state VALUES (18, 'Pernambuco', 1, 'PE');
INSERT INTO state VALUES (19, 'Piauí', 1, 'PI');
INSERT INTO state VALUES (20, 'Rio de Janeiro', 1, 'RJ');
INSERT INTO state VALUES (21, 'Rio Grande do Norte', 1, 'RN');
INSERT INTO state VALUES (22, 'Rio Grande do Sul', 1, 'RS');
INSERT INTO state VALUES (23, 'Rondônia', 1, 'RO');
INSERT INTO state VALUES (24, 'Roraima', 1, 'RR');
INSERT INTO state VALUES (25, 'Santa Catarina', 1, 'SC');
INSERT INTO state VALUES (26, 'São Paulo', 1, 'SP');
INSERT INTO state VALUES (27, 'Sergipe', 1, 'SE');
INSERT INTO state VALUES (28, 'Tocantins', 1, 'TO');


--
-- Data for Name: task_type; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO task_type VALUES (1, 'Atendimento Social', '', NULL, 1);
INSERT INTO task_type VALUES (2, 'Casa da Acolhida', '', 1, 1);
INSERT INTO task_type VALUES (3, 'Conselho Tutelar', '', 1, 1);
INSERT INTO task_type VALUES (4, 'CREAS', '', 1, 1);
INSERT INTO task_type VALUES (5, 'CRAS', '', 1, 1);
INSERT INTO task_type VALUES (6, 'Encaminhamento Júridico', '', 1, 1);
INSERT INTO task_type VALUES (7, 'Visita Social', '', 1, 1);
INSERT INTO task_type VALUES (8, 'Auxilio Documentação', '', 1, 1);
INSERT INTO task_type VALUES (9, 'Encaminhamento Emprego', '', 1, 1);
INSERT INTO task_type VALUES (10, 'Saúde', '', NULL, 1);
INSERT INTO task_type VALUES (11, 'Doação de Medicamentos', '', 10, 1);
INSERT INTO task_type VALUES (12, 'Pronto Socorro', '', 10, 1);
INSERT INTO task_type VALUES (13, 'Odontologia', '', 10, 1);
INSERT INTO task_type VALUES (14, 'Consulta Médica', '', 10, 1);
INSERT INTO task_type VALUES (15, 'Exame de Laboratório', '', 10, 1);
INSERT INTO task_type VALUES (16, 'Casa de recuperação', '', 10, 1);
INSERT INTO task_type VALUES (17, 'Psicologia-CRA', '', 10, 1);
INSERT INTO task_type VALUES (18, 'Alimentação', '', NULL, 1);
INSERT INTO task_type VALUES (19, 'Café da manhã', '', 18, 1);
INSERT INTO task_type VALUES (20, 'Almoço', '', 18, 1);
INSERT INTO task_type VALUES (21, 'Lanche da Tarde', '', 18, 1);
INSERT INTO task_type VALUES (22, 'Jantar', '', 18, 1);
INSERT INTO task_type VALUES (23, 'Doações', '', NULL, 1);
INSERT INTO task_type VALUES (24, 'Doação de Brinquedos', '', 23, 1);
INSERT INTO task_type VALUES (25, 'Doação de Cesta Básica', '', 23, 1);
INSERT INTO task_type VALUES (26, 'Doação de Comida Caseira', '', 23, 1);
INSERT INTO task_type VALUES (27, 'Doação de Calçado', '', 23, 1);
INSERT INTO task_type VALUES (28, 'Doação de Roupa', '', 23, 1);
INSERT INTO task_type VALUES (29, 'Doação de Coberta', '', 23, 1);
INSERT INTO task_type VALUES (30, 'Higiene', '', NULL, 1);
INSERT INTO task_type VALUES (31, 'Lavagem de Roupas', '', 30, 1);
INSERT INTO task_type VALUES (32, 'Escovação de dentes', '', 30, 1);
INSERT INTO task_type VALUES (33, 'Banho', '', 30, 1);
INSERT INTO task_type VALUES (34, 'Corte de Cabelo', '', 30, 1);
INSERT INTO task_type VALUES (35, 'Corte de Barba', '', 30, 1);
INSERT INTO task_type VALUES (36, 'Corte de Unhas', '', 30, 1);
INSERT INTO task_type VALUES (37, 'Eventos e Recreação', '', NULL, 1);
INSERT INTO task_type VALUES (38, 'Tênis de Mesa', '', 37, 1);
INSERT INTO task_type VALUES (39, 'Atletismo', '', 37, 1);
INSERT INTO task_type VALUES (40, 'Basquete', '', 37, 1);
INSERT INTO task_type VALUES (41, 'Futebol', '', 37, 1);
INSERT INTO task_type VALUES (42, 'Recreação', '', 37, 1);
INSERT INTO task_type VALUES (43, 'Festa do Natal', '', 37, 1);
INSERT INTO task_type VALUES (44, 'Dia das crianças', '', 37, 1);
INSERT INTO task_type VALUES (45, 'Estudo', '', NULL, 1);
INSERT INTO task_type VALUES (46, 'Culinária', '', 45, 1);
INSERT INTO task_type VALUES (47, 'Babá', '', 45, 1);
INSERT INTO task_type VALUES (48, 'Assistente do Lar', '', 45, 1);
INSERT INTO task_type VALUES (49, 'Informática', '', 45, 1);
INSERT INTO task_type VALUES (50, 'Reciclagem', '', 45, 1);
INSERT INTO task_type VALUES (51, 'Jardinagem', '', 45, 1);
INSERT INTO task_type VALUES (52, 'Criação de aves', '', 45, 1);
INSERT INTO task_type VALUES (53, 'Fruticultura', '', 45, 1);
INSERT INTO task_type VALUES (54, 'Pano de Prato', '', 45, 1);
INSERT INTO task_type VALUES (55, 'Mulher Virtuosa', '', 45, 1);
INSERT INTO task_type VALUES (56, 'Pró Jovem', '', 45, 1);
INSERT INTO task_type VALUES (57, 'Paraná Alfabetizado', '', 45, 1);
INSERT INTO task_type VALUES (58, 'Religião e Moral', '', 45, 1);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO "user" VALUES (3, 'silvana', 'silvanammoro@hotmail.com', '19b9089c92c4fc62e3bac528182127c8', '2012-12-19 13:12:53', '2012-12-19 13:59:28', 1, '367cd6eaeadf455090096b2fddcb7de1', 3, 1, 3);
INSERT INTO "user" VALUES (5, 'carolina', 'carolruiva21@hotmail.com', '52ace7cff7c215d0f17e202c55f23f5d', '2012-12-19 14:12:55', '2012-12-19 14:03:46', 1, '1e83fb4a9ab15ec09526c10406623bda', 5, 1, 3);
INSERT INTO "user" VALUES (2, 'pastorjoao', 'jeliseumontes@hotmail.com', '9358e17f7e785a2d15ec86d3b20fbd9d', '2012-12-19 13:12:35', '2013-01-02 14:35:56', 1, '4190e00a26f5cc292c0c9509030e1041', 2, 1, 2);
INSERT INTO "user" VALUES (6, 'manu', 'emanuelypitome@hotmail.com', '095a146ba4da9ef153ae4967979216a3', '2012-12-19 14:12:41', '2013-12-09 13:50:13', 1, 'c22c4fcf4ddc55198d72b23c27824223', 6, 1, 3);
INSERT INTO "user" VALUES (1, 'superadmin', 'ademir@winponta.com.br', 'c748e2bd0fa8787f20751da29aa4b14a', '2012-12-18 16:12:04', '2013-12-18 11:26:23', 1, 'cdb8e86d07375cc2d71e1751d5a88977', 1, 1, 1);
INSERT INTO "user" VALUES (7, 'john', 'johnsagais@outlook.com', 'dd7bed55926844926c9c37706e0fc5e8', '2013-08-30 16:08:36', '2013-12-18 13:41:06', 1, 'c57bd1407356938791ef3a3826060c6a', 97, 1, 4);


--
-- Data for Name: volunteer; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO volunteer VALUES (6);
INSERT INTO volunteer VALUES (3);
INSERT INTO volunteer VALUES (19);
INSERT INTO volunteer VALUES (97);
INSERT INTO volunteer VALUES (755);


--
-- Data for Name: volunteer_expertise_area; Type: TABLE DATA; Schema: public; Owner: ong
--

INSERT INTO volunteer_expertise_area VALUES (6, 3);
INSERT INTO volunteer_expertise_area VALUES (6, 2);
INSERT INTO volunteer_expertise_area VALUES (3, 5);
INSERT INTO volunteer_expertise_area VALUES (19, 4);
INSERT INTO volunteer_expertise_area VALUES (97, 6);
INSERT INTO volunteer_expertise_area VALUES (755, 5);


--
-- Name: acl_role_permission_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY acl_role_permission
    ADD CONSTRAINT acl_role_permission_pk PRIMARY KEY (id);


--
-- Name: acl_role_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY acl_role
    ADD CONSTRAINT acl_role_pk PRIMARY KEY (id);


--
-- Name: appaccount_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY appaccount
    ADD CONSTRAINT appaccount_pk PRIMARY KEY (id);


--
-- Name: audit_trail_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY audit_trail
    ADD CONSTRAINT audit_trail_pk PRIMARY KEY (id);


--
-- Name: busunit_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY busunit
    ADD CONSTRAINT busunit_pk PRIMARY KEY (id);


--
-- Name: city_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pk PRIMARY KEY (id);


--
-- Name: city_region_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY city_region
    ADD CONSTRAINT city_region_pk PRIMARY KEY (id);


--
-- Name: country_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pk PRIMARY KEY (id);


--
-- Name: employee_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (id);


--
-- Name: expertise_area_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY expertise_area
    ADD CONSTRAINT expertise_area_pk PRIMARY KEY (id);


--
-- Name: job_function_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY job_function
    ADD CONSTRAINT job_function_pk PRIMARY KEY (id);


--
-- Name: media_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_pk PRIMARY KEY (id);


--
-- Name: person_docs_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY person_docs
    ADD CONSTRAINT person_docs_pk PRIMARY KEY (id);


--
-- Name: person_media_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY person_media
    ADD CONSTRAINT person_media_pk PRIMARY KEY (person_id, media_id);


--
-- Name: person_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pk PRIMARY KEY (id);


--
-- Name: pkperson_helped; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY person_helped
    ADD CONSTRAINT pkperson_helped PRIMARY KEY (id);


--
-- Name: project_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pk PRIMARY KEY (id);


--
-- Name: state_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY state
    ADD CONSTRAINT state_pk PRIMARY KEY (id);


--
-- Name: task_type_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY task_type
    ADD CONSTRAINT task_type_pk PRIMARY KEY (id);


--
-- Name: user_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: volunteer_expertise_area_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY volunteer_expertise_area
    ADD CONSTRAINT volunteer_expertise_area_pk PRIMARY KEY (volunteer_id, expertise_area_id);


--
-- Name: volunteer_pk; Type: CONSTRAINT; Schema: public; Owner: ong; Tablespace: 
--

ALTER TABLE ONLY volunteer
    ADD CONSTRAINT volunteer_pk PRIMARY KEY (id);


--
-- Name: acl_role_name_idx; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE UNIQUE INDEX acl_role_name_idx ON acl_role USING btree (name, appaccount_id);


--
-- Name: appaccount_idx_name; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE UNIQUE INDEX appaccount_idx_name ON appaccount USING btree (name);


--
-- Name: busunit_appaccount_fk; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE INDEX busunit_appaccount_fk ON busunit USING btree (appaccount_id);


--
-- Name: busunit_idx_name; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE UNIQUE INDEX busunit_idx_name ON busunit USING btree (name);


--
-- Name: employee_registration_idx; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE UNIQUE INDEX employee_registration_idx ON employee USING btree (registration_number, busunit_id);


--
-- Name: person_name_idx; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE INDEX person_name_idx ON person USING btree (name);


--
-- Name: person_name_like_idx; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE INDEX person_name_like_idx ON person USING btree (name varchar_pattern_ops);


--
-- Name: person_name_pattern_idx; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE INDEX person_name_pattern_idx ON person USING btree (name text_pattern_ops);


--
-- Name: state_unq_country_abbreviation; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE UNIQUE INDEX state_unq_country_abbreviation ON state USING btree (abbreviation, country_id);


--
-- Name: user_idx_email; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE UNIQUE INDEX user_idx_email ON "user" USING btree (email);


--
-- Name: user_idx_name; Type: INDEX; Schema: public; Owner: ong; Tablespace: 
--

CREATE UNIQUE INDEX user_idx_name ON "user" USING btree (name);


--
-- Name: acl_role_acl_role_permission_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY acl_role_permission
    ADD CONSTRAINT acl_role_acl_role_permission_fk FOREIGN KEY (acl_role_id) REFERENCES acl_role(id) ON DELETE CASCADE;


--
-- Name: acl_role_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT acl_role_user_fk FOREIGN KEY (acl_role_id) REFERENCES acl_role(id) ON DELETE RESTRICT;


--
-- Name: appaccount_acl_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY acl_role
    ADD CONSTRAINT appaccount_acl_role_fk FOREIGN KEY (appaccount_id) REFERENCES appaccount(id) ON DELETE RESTRICT;


--
-- Name: appaccount_busunit_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY busunit
    ADD CONSTRAINT appaccount_busunit_fk FOREIGN KEY (appaccount_id) REFERENCES appaccount(id) ON DELETE RESTRICT;


--
-- Name: appaccount_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person
    ADD CONSTRAINT appaccount_person_fk FOREIGN KEY (appaccount_id) REFERENCES appaccount(id) ON DELETE CASCADE;


--
-- Name: appaccount_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT appaccount_user_fk FOREIGN KEY (appaccount_id) REFERENCES appaccount(id) ON DELETE RESTRICT;


--
-- Name: busunit_employee_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT busunit_employee_fk FOREIGN KEY (busunit_id) REFERENCES busunit(id) ON DELETE RESTRICT;


--
-- Name: city_city_region_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY city_region
    ADD CONSTRAINT city_city_region_fk FOREIGN KEY (city_id) REFERENCES city(id) ON DELETE RESTRICT;


--
-- Name: city_organization_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY busunit
    ADD CONSTRAINT city_organization_fk FOREIGN KEY (city_id) REFERENCES city(id) ON DELETE RESTRICT;


--
-- Name: city_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person
    ADD CONSTRAINT city_person_fk FOREIGN KEY (city_id) REFERENCES city(id) ON DELETE RESTRICT;


--
-- Name: city_region_person_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person
    ADD CONSTRAINT city_region_person_fk FOREIGN KEY (city_region_id) REFERENCES city_region(id) ON DELETE RESTRICT;


--
-- Name: country_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY state
    ADD CONSTRAINT country_state_fk FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE RESTRICT;


--
-- Name: expertise_area_volunteer_expertise_area_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY volunteer_expertise_area
    ADD CONSTRAINT expertise_area_volunteer_expertise_area_fk FOREIGN KEY (expertise_area_id) REFERENCES expertise_area(id) ON DELETE RESTRICT;


--
-- Name: fk_person_helped_city; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person_helped
    ADD CONSTRAINT fk_person_helped_city FOREIGN KEY (born_city_id) REFERENCES city(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_person_helped_person; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person_helped
    ADD CONSTRAINT fk_person_helped_person FOREIGN KEY (id) REFERENCES person(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_person_helped_state; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person_helped
    ADD CONSTRAINT fk_person_helped_state FOREIGN KEY (born_state_id) REFERENCES state(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: job_function_employee_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT job_function_employee_fk FOREIGN KEY (job_function_id) REFERENCES job_function(id) ON DELETE RESTRICT;


--
-- Name: media_person_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person_media
    ADD CONSTRAINT media_person_media_fk FOREIGN KEY (media_id) REFERENCES media(id) ON DELETE RESTRICT;


--
-- Name: parent_city_region_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY city_region
    ADD CONSTRAINT parent_city_region_fk FOREIGN KEY (parent_id) REFERENCES city_region(id) ON DELETE RESTRICT;


--
-- Name: person_employee_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT person_employee_fk FOREIGN KEY (id) REFERENCES person(id);


--
-- Name: person_person_docs_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person_docs
    ADD CONSTRAINT person_person_docs_fk FOREIGN KEY (id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: person_person_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY person_media
    ADD CONSTRAINT person_person_media_fk FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE;


--
-- Name: person_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT person_user_fk FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE RESTRICT;


--
-- Name: person_volunteer_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY volunteer
    ADD CONSTRAINT person_volunteer_fk FOREIGN KEY (id) REFERENCES person(id) ON DELETE RESTRICT;


--
-- Name: state_city_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY city
    ADD CONSTRAINT state_city_fk FOREIGN KEY (state_id) REFERENCES state(id) ON DELETE RESTRICT;


--
-- Name: task_type_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY task_type
    ADD CONSTRAINT task_type_parent_fk FOREIGN KEY (parent_id) REFERENCES task_type(id) ON DELETE RESTRICT;


--
-- Name: volunteer_volunteer_expertise_area_fk; Type: FK CONSTRAINT; Schema: public; Owner: ong
--

ALTER TABLE ONLY volunteer_expertise_area
    ADD CONSTRAINT volunteer_volunteer_expertise_area_fk FOREIGN KEY (volunteer_id) REFERENCES volunteer(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: acl_role; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE acl_role FROM PUBLIC;
REVOKE ALL ON TABLE acl_role FROM ong;
GRANT ALL ON TABLE acl_role TO ong;


--
-- Name: acl_role_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE acl_role_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE acl_role_id_seq FROM ong;
GRANT ALL ON SEQUENCE acl_role_id_seq TO ong;


--
-- Name: acl_role_permission; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE acl_role_permission FROM PUBLIC;
REVOKE ALL ON TABLE acl_role_permission FROM ong;
GRANT ALL ON TABLE acl_role_permission TO ong;


--
-- Name: acl_role_permission_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE acl_role_permission_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE acl_role_permission_id_seq FROM ong;
GRANT ALL ON SEQUENCE acl_role_permission_id_seq TO ong;


--
-- Name: appaccount; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE appaccount FROM PUBLIC;
REVOKE ALL ON TABLE appaccount FROM ong;
GRANT ALL ON TABLE appaccount TO ong;


--
-- Name: appaccount_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE appaccount_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE appaccount_id_seq FROM ong;
GRANT ALL ON SEQUENCE appaccount_id_seq TO ong;


--
-- Name: audit_trail; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE audit_trail FROM PUBLIC;
REVOKE ALL ON TABLE audit_trail FROM ong;
GRANT ALL ON TABLE audit_trail TO ong;


--
-- Name: audit_trail_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE audit_trail_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE audit_trail_id_seq FROM ong;
GRANT ALL ON SEQUENCE audit_trail_id_seq TO ong;


--
-- Name: busunit; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE busunit FROM PUBLIC;
REVOKE ALL ON TABLE busunit FROM ong;
GRANT ALL ON TABLE busunit TO ong;


--
-- Name: busunit_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE busunit_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE busunit_id_seq FROM ong;
GRANT ALL ON SEQUENCE busunit_id_seq TO ong;


--
-- Name: city; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE city FROM PUBLIC;
REVOKE ALL ON TABLE city FROM ong;
GRANT ALL ON TABLE city TO ong;


--
-- Name: city_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE city_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE city_id_seq FROM ong;
GRANT ALL ON SEQUENCE city_id_seq TO ong;


--
-- Name: city_region_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE city_region_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE city_region_id_seq FROM ong;
GRANT ALL ON SEQUENCE city_region_id_seq TO ong;


--
-- Name: city_region; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE city_region FROM PUBLIC;
REVOKE ALL ON TABLE city_region FROM ong;
GRANT ALL ON TABLE city_region TO ong;


--
-- Name: country; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE country FROM PUBLIC;
REVOKE ALL ON TABLE country FROM ong;
GRANT ALL ON TABLE country TO ong;


--
-- Name: country_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE country_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE country_id_seq FROM ong;
GRANT ALL ON SEQUENCE country_id_seq TO ong;


--
-- Name: employee; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE employee FROM PUBLIC;
REVOKE ALL ON TABLE employee FROM ong;
GRANT ALL ON TABLE employee TO ong;


--
-- Name: expertise_area; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE expertise_area FROM PUBLIC;
REVOKE ALL ON TABLE expertise_area FROM ong;
GRANT ALL ON TABLE expertise_area TO ong;


--
-- Name: expertise_area_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE expertise_area_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE expertise_area_id_seq FROM ong;
GRANT ALL ON SEQUENCE expertise_area_id_seq TO ong;


--
-- Name: job_function; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE job_function FROM PUBLIC;
REVOKE ALL ON TABLE job_function FROM ong;
GRANT ALL ON TABLE job_function TO ong;


--
-- Name: job_function_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE job_function_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE job_function_id_seq FROM ong;
GRANT ALL ON SEQUENCE job_function_id_seq TO ong;


--
-- Name: media; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE media FROM PUBLIC;
REVOKE ALL ON TABLE media FROM ong;
GRANT ALL ON TABLE media TO ong;


--
-- Name: media_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE media_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE media_id_seq FROM ong;
GRANT ALL ON SEQUENCE media_id_seq TO ong;


--
-- Name: person; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE person FROM PUBLIC;
REVOKE ALL ON TABLE person FROM ong;
GRANT ALL ON TABLE person TO ong;


--
-- Name: person_docs; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE person_docs FROM PUBLIC;
REVOKE ALL ON TABLE person_docs FROM ong;
GRANT ALL ON TABLE person_docs TO ong;


--
-- Name: person_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE person_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE person_id_seq FROM ong;
GRANT ALL ON SEQUENCE person_id_seq TO ong;


--
-- Name: person_media; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE person_media FROM PUBLIC;
REVOKE ALL ON TABLE person_media FROM ong;
GRANT ALL ON TABLE person_media TO ong;


--
-- Name: project; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE project FROM PUBLIC;
REVOKE ALL ON TABLE project FROM ong;
GRANT ALL ON TABLE project TO ong;


--
-- Name: project_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE project_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE project_id_seq FROM ong;
GRANT ALL ON SEQUENCE project_id_seq TO ong;


--
-- Name: state; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE state FROM PUBLIC;
REVOKE ALL ON TABLE state FROM ong;
GRANT ALL ON TABLE state TO ong;


--
-- Name: state_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE state_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE state_id_seq FROM ong;
GRANT ALL ON SEQUENCE state_id_seq TO ong;


--
-- Name: task_type; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE task_type FROM PUBLIC;
REVOKE ALL ON TABLE task_type FROM ong;
GRANT ALL ON TABLE task_type TO ong;


--
-- Name: task_type_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE task_type_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE task_type_id_seq FROM ong;
GRANT ALL ON SEQUENCE task_type_id_seq TO ong;


--
-- Name: user_id_seq; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON SEQUENCE user_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE user_id_seq FROM ong;
GRANT ALL ON SEQUENCE user_id_seq TO ong;


--
-- Name: volunteer; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE volunteer FROM PUBLIC;
REVOKE ALL ON TABLE volunteer FROM ong;
GRANT ALL ON TABLE volunteer TO ong;


--
-- Name: volunteer_expertise_area; Type: ACL; Schema: public; Owner: ong
--

REVOKE ALL ON TABLE volunteer_expertise_area FROM PUBLIC;
REVOKE ALL ON TABLE volunteer_expertise_area FROM ong;
GRANT ALL ON TABLE volunteer_expertise_area TO ong;


--
-- PostgreSQL database dump complete
--
