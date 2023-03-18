--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    meeting_schedule text NOT NULL,
    meeting_location text NOT NULL,
    max_enrollment integer NOT NULL,
    credits integer NOT NULL,
    instructor_id integer NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: courses_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses_students (
    course_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.courses_students OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: instructors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructors (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.instructors OWNER TO postgres;

--
-- Name: instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructors_id_seq OWNER TO postgres;

--
-- Name: instructors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructors_id_seq OWNED BY public.instructors.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text,
    major_department integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accounts (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.user_accounts OWNER TO postgres;

--
-- Name: user_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_accounts_id_seq OWNER TO postgres;

--
-- Name: user_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_accounts_id_seq OWNED BY public.user_accounts.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: instructors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors ALTER COLUMN id SET DEFAULT nextval('public.instructors_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: user_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts ALTER COLUMN id SET DEFAULT nextval('public.user_accounts_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, name, description, meeting_schedule, meeting_location, max_enrollment, credits, instructor_id, department_id) FROM stdin;
1	English 101	Introduction to English	MWF 9:00am	Granger 100	120	3	1	1
3	American History 101	Introduction to American history	TTh 9:00am	Granger 100	120	3	3	2
4	British Literature 101	Introduction to British Literature	TTh 10:30am	Granger 100	120	3	4	1
5	Poetry 101	Introduction to Poetry	MWF 11:00am	Granger 100	120	3	4	1
6	American Literature 101	Introduction to American Literature	MWF 11:00am	Fulton 100	120	3	1	1
7	Trigonometry	Overview of Trigonometry	MWF 12:00pm	Granger 100	120	3	5	4
8	Calculus 101	Introduction to Calculus	TTh 10:30am	Fulton 100	120	3	6	4
9	Advanced Calculus	Advanced Calculus concepts and principles	TTh 10:30am	Higgins 100	50	3	7	4
11	Psychology 101	Introduction to Psychology	MWF 1:00pm	Fulton 100	120	3	9	5
12	Abnormal Psychology	Study of psychological disorders	TTh 12:00pm	Higgins 100	50	3	9	5
13	Microbiology 101	Introduction to Microbiology	TTh 12:00pm	Fulton 100	120	3	8	3
2	European History 101	Introduction to European history	MWF 10:00am	Granger 100	120	3	2	2
10	Biology 101	Introduction to Biology	MWF 1:00pm	Granger 100	120	3	8	3
\.


--
-- Data for Name: courses_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses_students (course_id, student_id) FROM stdin;
1	1
3	1
4	1
7	1
10	1
1	2
2	2
4	2
8	2
11	2
3	3
4	3
5	3
7	3
10	3
2	4
4	4
6	4
7	4
11	4
2	5
4	5
7	5
13	5
2	6
3	6
6	6
7	6
11	6
2	7
3	7
6	7
8	7
11	7
1	8
3	8
5	8
7	8
10	8
1	9
2	9
8	9
10	9
13	9
1	10
3	10
7	10
10	10
13	10
1	11
2	11
7	11
10	11
13	11
2	12
4	12
8	12
10	12
13	12
1	13
3	13
8	13
10	13
13	13
1	14
2	14
9	14
11	14
13	14
3	15
6	15
9	15
11	15
13	15
3	16
6	16
9	16
10	16
11	16
1	17
2	17
7	17
11	17
13	17
2	18
4	18
7	18
11	18
12	18
3	19
6	19
7	19
11	19
12	19
1	20
3	20
7	20
11	20
12	20
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name) FROM stdin;
1	English
2	History
3	Biology
4	Mathematics
5	Psychology
\.


--
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructors (id, first_name, last_name, email) FROM stdin;
1	John	Turner	j.turner@school.edu
2	Gwen	Browning	g.browning@school.edu
3	Violet	Godling	v.golding@school.edu
4	Stuart	Peters	s.peters@school.edu
5	Michael	Green	m.green@school.edu
6	Jennifer	Mullins	j.mullins@school.edu
7	Joseph	Miller	j.miller@school.edu
8	Kevin	Smith	k.smith@school.edu
9	Alexis	Lee	a.lee@school.edu
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, first_name, last_name, email, major_department) FROM stdin;
1	Mary	Johnson	m.johnson@school.edu	1
2	Michael	Smith	m.smith@school.edu	1
3	George	Hernandez	g.hernandez@school.edu	1
4	Lauren	Jones	l.jones@school.edu	1
5	Alexandra	Stevens	a.stevens@school.edu	2
6	William	Jones	w.jones@school.edu	2
7	Anne	Murphy	a.murphy@school.edu	2
8	Blaine	Miller	b.miller@school.edu	2
9	Sophia	Rodriguez	s.rodriguez@school.edu	3
10	Kevin	Turner	k.turner@school.edu	3
11	Ryan	Smith	r.smith@school.edu	3
12	Lauren	Meehan	l.meehan@school.edu	3
13	Thomas	Davis	t.davis@school.edu	4
14	Hope	Thompson	h.thompson@school.edu	4
15	Nathan	Taylor	n.taylor@school.edu	4
16	Brendan	Clark	b.clark@school.edu	4
17	Jason	Campbell	j.campbell@school.edu	5
18	Elizabeth	Lee	e.lee@school.edu	5
19	Carmen	Kwan	c.kwan@school.edu	5
20	Michael	Jones	m.jones@school.edu	5
\.


--
-- Data for Name: user_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_accounts (id, username, password, student_id) FROM stdin;
3	ghernandez	password	3
4	ljones	password	4
5	astevens	password	5
6	wjones	password	6
7	amurphy	password	7
8	bmiller	password	8
9	srodriguez	password	9
10	kturner	password	10
11	rsmith	password	11
12	lmeehan	password	12
13	tdavis	password	13
14	hthompson	password	14
15	ntaylor	password	15
16	bclark	password	16
17	jcampbell	password	17
18	elee	password	18
19	ckwan	password	19
20	mjones	password	20
2	msmith	password1	2
1	mjohnson	c08f3de342e9640aba91fec64a8671f20db3d581897f64a51d6b9d9b54e840a8636639f3c74cc355d004c2190a13a57f83e29895418bc3cc72edb9203dca198a	1
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 14, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 5, true);


--
-- Name: instructors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructors_id_seq', 9, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 21, true);


--
-- Name: user_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_accounts_id_seq', 20, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: courses_students courses_students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses_students
    ADD CONSTRAINT courses_students_pkey PRIMARY KEY (course_id, student_id);


--
-- Name: departments departments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_name_key UNIQUE (name);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: instructors instructors_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_email_key UNIQUE (email);


--
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: user_accounts user_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_pkey PRIMARY KEY (id);


--
-- Name: user_accounts user_accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_username_key UNIQUE (username);


--
-- Name: course_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX course_name ON public.courses USING btree (name);


--
-- Name: courses fk_courses_departments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_departments FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: courses fk_courses_instructors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_instructors FOREIGN KEY (instructor_id) REFERENCES public.instructors(id);


--
-- Name: courses_students fk_courses_students_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses_students
    ADD CONSTRAINT fk_courses_students_courses FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: courses_students fk_courses_students_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses_students
    ADD CONSTRAINT fk_courses_students_students FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- Name: user_accounts fk_user_accounts_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT fk_user_accounts_students FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

