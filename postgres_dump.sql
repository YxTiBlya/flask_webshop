--
-- PostgreSQL database dump
--

-- Dumped from database version 10.21
-- Dumped by pg_dump version 10.21

-- Started on 2022-09-04 17:14:42

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 32837)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    category character varying(50) NOT NULL,
    price double precision NOT NULL,
    photo_path character varying(100) NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 32835)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 200
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 203 (class 1259 OID 32856)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    client character varying(128) NOT NULL,
    date timestamp without time zone NOT NULL,
    count integer NOT NULL,
    item_name character varying(100) NOT NULL,
    item_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 32854)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 202
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 197 (class 1259 OID 32800)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    login character varying(128) NOT NULL,
    password character varying(255) NOT NULL,
    admin boolean
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 32798)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 199 (class 1259 OID 32818)
-- Name: Сategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Сategories" (
    id integer NOT NULL,
    category character varying(50) NOT NULL,
    option character varying(10) NOT NULL
);


ALTER TABLE public."Сategories" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 32816)
-- Name: Сategories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Сategories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Сategories_id_seq" OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 198
-- Name: Сategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Сategories_id_seq" OWNED BY public."Сategories".id;


--
-- TOC entry 2691 (class 2604 OID 32840)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 2692 (class 2604 OID 32859)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 2689 (class 2604 OID 32803)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 2690 (class 2604 OID 32821)
-- Name: Сategories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сategories" ALTER COLUMN id SET DEFAULT nextval('public."Сategories_id_seq"'::regclass);


--
-- TOC entry 2829 (class 0 OID 32837)
-- Dependencies: 201
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name, description, category, price, photo_path) FROM stdin;
6	Стул	Таким образом дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки существенных финансовых и административных условий. Разнообразный и богатый опыт реализация намеченных плановых заданий обеспечивает широкому кругу (специалистов) участие в формировании новых предложений.\n\nТаким образом сложившаяся структура организации требуют от нас анализа соответствующий условий активизации. Идейные соображения высшего порядка, а также сложившаяся структура организации позволяет оценить значение соответствующий условий активизации. Разнообразный и богатый опыт консультация с широким активом способствует подготовки и реализации позиций, занимаемых участниками в отношении поставленных задач. Значимость этих проблем настолько очевидна, что новая модель организационной деятельности в значительной степени обуславливает создание существенных финансовых и административных условий. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности способствует подготовки и реализации форм развития.\n\nЗадача организации, в особенности же дальнейшее развитие различных форм деятельности позволяет выполнять важные задания по разработке модели развития. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. Товарищи! новая модель организационной деятельности играет важную роль в формировании модели развития. Повседневная практика показывает, что реализация намеченных плановых заданий позволяет оценить значение направлений прогрессивного развития. С другой стороны консультация с широким активом позволяет оценить значение систем массового участия.	ON	12000	static\\img\\SnakeRoseSO.jpg
7	Комьютер	Повседневная практика показывает, что консультация с широким активом влечет за собой процесс внедрения и модернизации форм развития. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий способствует подготовки и реализации направлений прогрессивного развития. Повседневная практика показывает, что сложившаяся структура организации требуют от нас анализа существенных финансовых и административных условий. Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки существенных финансовых и административных условий. Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности способствует подготовки и реализации модели развития.\n\nПовседневная практика показывает, что дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании модели развития. С другой стороны консультация с широким активом требуют определения и уточнения системы обучения кадров, соответствует насущным потребностям. Таким образом новая модель организационной деятельности способствует подготовки и реализации соответствующий условий активизации. Таким образом сложившаяся структура организации способствует подготовки и реализации существенных финансовых и административных условий. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет оценить значение новых предложений. Не следует, однако забывать, что консультация с широким активом играет важную роль в формировании дальнейших направлений развития.	Сomp	42000	static\\img\\SnakeRoseSO.jpg
8	Телевизор	Не следует, однако забывать, что реализация намеченных плановых заданий представляет собой интересный эксперимент проверки дальнейших направлений развития. Не следует, однако забывать, что консультация с широким активом требуют определения и уточнения соответствующий условий активизации. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения новых предложений.\n\nЗадача организации, в особенности же сложившаяся структура организации влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствует насущным потребностям. Разнообразный и богатый опыт сложившаяся структура организации способствует подготовки и реализации существенных финансовых и административных условий. Разнообразный и богатый опыт сложившаяся структура организации позволяет оценить значение направлений прогрессивного развития. Разнообразный и богатый опыт постоянный количественный рост и сфера нашей активности в значительной степени обуславливает создание дальнейших направлений развития.	TM	12000	static\\img\\SnakeRoseSO.jpg
9	Iphone	Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности требуют от нас анализа соответствующий условий активизации. Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности требуют определения и уточнения модели развития. Задача организации, в особенности же сложившаяся структура организации обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. Таким образом дальнейшее развитие различных форм деятельности позволяет оценить значение позиций, занимаемых участниками в отношении поставленных задач. С другой стороны новая модель организационной деятельности позволяет выполнять важные задания по разработке модели развития.	SG	100	static\\img\\SnakeRoseSO.jpg
10	Роутер	Разнообразный и богатый опыт реализация намеченных плановых заданий представляет собой интересный эксперимент проверки форм развития. Не следует, однако забывать, что реализация намеченных плановых заданий представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. Разнообразный и богатый опыт укрепление и развитие структуры влечет за собой процесс внедрения и модернизации модели развития.  Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности позволяет оценить значение новых предложений. Таким образом консультация с широким активом обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. Задача организации, в особенности же реализация намеченных плановых заданий позволяет выполнять важные задания по разработке позиций, занимаемых участниками в отношении поставленных задач.	ON	299	static\\img\\SnakeRoseSO.jpg
\.


--
-- TOC entry 2831 (class 0 OID 32856)
-- Dependencies: 203
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, client, date, count, item_name, item_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 32800)
-- Dependencies: 197
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, login, password, admin) FROM stdin;
4	admin	pbkdf2:sha256:260000$psa6OmpSgpmexdvK$b9326c6176f005ee12c42dcd1e7335709f34a9cc743627859fefcbd3c4cb24d0	t
\.


--
-- TOC entry 2827 (class 0 OID 32818)
-- Dependencies: 199
-- Data for Name: Сategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Сategories" (id, category, option) FROM stdin;
1	Бытовая техника	HA
2	Смартфоны и гаджеты	SG
3	ТВ и мультимедиа	TM
4	Компьютеры	Сomp
5	Офис и сеть	ON
8	Все	all
\.


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 200
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 10, true);


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 202
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, true);


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 198
-- Name: Сategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Сategories_id_seq"', 8, true);


--
-- TOC entry 2700 (class 2606 OID 32845)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 32861)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 32807)
-- Name: user user_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_login_key UNIQUE (login);


--
-- TOC entry 2696 (class 2606 OID 32805)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 32823)
-- Name: Сategories Сategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сategories"
    ADD CONSTRAINT "Сategories_pkey" PRIMARY KEY (id);


-- Completed on 2022-09-04 17:14:42

--
-- PostgreSQL database dump complete
--