--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    body text,
    review_status integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE members (
    id integer NOT NULL,
    name character varying,
    "position" character varying,
    avatar character varying,
    careers character varying,
    github character varying,
    linkedin character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cartoon character varying,
    priority integer
);


--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    title character varying,
    description character varying,
    logo character varying,
    technology character varying,
    duration integer,
    team_size integer,
    client character varying,
    industry character varying,
    link character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    priority integer
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY articles (id, body, review_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('articles_id_seq', 1, false);


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: -
--

COPY members (id, name, "position", avatar, careers, github, linkedin, created_at, updated_at, cartoon, priority) FROM stdin;
16	Sergiy Naumenko	RoR Strategist	v1448534810/wahm0de5tsrpk52eb5z7.png	http://careers.stackoverflow.com/s.naumenko	https://github.com/NaumenkoSergiy	https://www.linkedin.com/in/snaumenko	2015-11-26 10:46:50.077646	2015-12-07 11:27:39.983965	v1448534810/qgte8rqslflib6bksiac.png	26
9	Viktor Shmigol	RoR Originator	v1448466394/wway6eegljtx9xt2l5fj.png	http://careers.stackoverflow.com/victir	https://github.com/victir	https://www.linkedin.com/in/victir	2015-11-25 15:46:34.772387	2015-12-07 11:22:36.982302	v1448466395/f7kf8umrav8fgtektudg.png	19
20	Oleg Sobchuk	RoR Maven	v1448548272/sqdzgsqmbkbkbb86xdhf.png	http://careers.stackoverflow.com/olegsobchuk	https://github.com/olegsobchuk	https://www.linkedin.com/in/olegsobchuk	2015-11-26 14:31:11.726486	2015-12-07 11:19:48.066504	v1448548274/ywtm8dgkl5fspirsrbur.png	15
26	Alex Stadnik	RoR Wizard	v1448637759/ndv921mtz5y4g5pf0rxx.png	http://careers.stackoverflow.com/stadniklksndr	https://github.com/stadniklksndr	https://www.linkedin.com/in/stadniklksndr	2015-11-27 15:22:38.78315	2015-12-07 11:23:45.715173	v1448637761/y4lxitr6tkg2lklnzafh.png	21
15	Vova Partytskyi	RoR Tactician	image/upload/v1448534380/genvdo0l7lnjmisad1af.png	http://careers.stackoverflow.com/volodimirp	https://github.com/vovap	https://www.linkedin.com/in/vovap	2015-11-26 10:39:40.556132	2015-12-07 11:08:50.430391	image/upload/v1448534380/yhc8nfebgess3l8r1lkc.png	12
8	Oleg Voloshyn	RoR Alchemist	v1448466198/fn16ey2fi0izvgd2vjtd.png	http://careers.stackoverflow.com/voloshyn	https://github.com/oleg-voloshyn	https://www.linkedin.com/in/olegvoloshyn	2015-11-25 15:43:18.138826	2015-12-07 11:20:25.493929	v1448466198/xkjzhikax49bwgnrgndg.png	16
17	Igor Bilan	RoR Guru	v1448534938/ztpxipvash6rmrzjehm0.png	http://careers.stackoverflow.com/igorvbilan	https://github.com/igorb	https://www.linkedin.com/in/igorbilan	2015-11-26 10:48:58.848942	2015-12-05 19:25:00.348972	v1448534939/byoixj0dghlmct9p5xd9.png	5
23	Ruslan Milevskiy	RoR Czar	image/upload/v1448636836/utax3z9yra7dyrvm2mxa.png	http://careers.stackoverflow.com/ruslanm	https://github.com/rpmilevskiy	https://www.linkedin.com/in/ruslanmilevskiy	2015-11-27 15:07:16.27197	2015-12-05 19:13:47.248376	v1448636838/ufm1pvedhrdyvj8ymshx.png	7
3	Dasha	SEO Shamaness	image/upload/v1448881463/m3s9xu1qujh17zx4fiis.png	http://careers.stackoverflow.com/DaryaKuritsyna	https://github.com/daryakuritsyna	http://ua.linkedin.com/in/daryakuritsyna	2015-10-15 20:10:36.015093	2015-12-07 11:04:28.46874	image/upload/v1448881464/ik4frcjd7sc4x39kkykl.png	9
27	Alex Marchenko	Chief Values Officer	v1448892599/bscpy40nhng36suqtut6.png	http://careers.stackoverflow.com/	https://github.com/	http://ua.linkedin.com/in/	2015-11-30 14:09:58.743764	2015-12-07 11:22:13.467724	v1448892601/wklablahkes1veeenpla.png	6
19	Alex Shmatko	RoR  Achiever	v1448547368/tjzqbzxqytcclx4hvgnk.png	https://github.com/AlexShmatko	https://www.linkedin.com/profile/view?id=AAIAABpr2TAB_3gZPfrlntc554Y846EqUSD298E&trk=nav_responsive_tab_profile_pic	https://careers.stackoverflow.com/users/info/626750	2015-11-26 14:16:08.440183	2015-12-07 11:29:51.617026	v1448547369/pes0gvsebde1orldnlcf.png	31
4	Alexey Lukin	RoR Demigod	image/upload/v1448547452/vnaoemvvhveqdvxgmvni.png	http://careers.stackoverflow.com/alexeylukin	https://github.com/Alexey-Lukin	http://ua.linkedin.com/in/lukinalexey	2015-10-19 13:17:36.961763	2015-12-05 19:04:56.78653	image/upload/v1448547454/yeiydxcuy7vvjfdvuiim.png	3
2	Alex Galushka	RoR Solutionist	image/upload/v1448465747/ijlhryfaxcqe8ojicidj.png	http://careers.stackoverflow.com/galulex	https://github.com/galulex	http://ua.linkedin.com/in/galulex	2015-10-15 20:07:53.617243	2015-12-05 19:01:26.510814	image/upload/v1448617345/caqvqqv6cofwdliycs3w.png	2
1	Eugene Korpan	RoR Sensei, CEO	image/upload/v1448465769/cg4cq0pewellp8awuajz.png	http://careers.stackoverflow.com/eugenekorpan	https://github.com/eugenekorpan	https://www.linkedin.com/in/eugenekorpan	2015-10-15 20:05:45.186454	2015-12-05 19:00:27.451267	image/upload/v1449342028/uxigjyhkntbzvdmvlt3a.png	1
24	Alex Tsibulko	RoR Rockstar	v1448637039/xevnikm2q1pozjsyxwwl.png	http://careers.stackoverflow.com/alexTsibulko	https://github.com/bruceliator	https://www.linkedin.com/in/tsibulko	2015-11-27 15:10:38.292062	2015-12-07 11:23:21.410137	v1448637040/llqqsexpc4skgolcayng.png	20
7	Eugene Surzhko	RoR Thinker	image/upload/v1448466046/uipc7z1iuvmaaf52pel6.png	http://careers.stackoverflow.com/eugenesurzhko	https://github.com/Surzhko	https://www.linkedin.com/in/eugenesurzhko	2015-11-25 15:40:45.855512	2015-12-07 11:06:35.562632	image/upload/v1448466046/wbilyrapsdebbqlxom2o.png	10
5	Dima Makodzeba	RoR Ninja	image/upload/v1448465722/aatlitytkjmd9hghar6w.png	http://careers.stackoverflow.com/makodzeba	https://github.com/DeeMak13	https://ua.linkedin.com/in/makodzeba	2015-10-19 13:22:55.259696	2015-12-07 11:18:01.880953	image/upload/v1449487085/ad8jeyzwperwhhkyipq9.png	14
10	Alexey Verbivskyy	RoR Magician	image/upload/v1448466655/slf1uponbe6rokfbdk6a.png	http://careers.stackoverflow.com/alexeyverbivskyy	https://github.com/verbaleks	https://www.linkedin.com/in/verbaleks	2015-11-25 15:50:54.822787	2015-12-06 17:58:11.855133	image/upload/v1448466655/ogxox1xe7kfnkeouglei.png	8
18	Oleg Kononenko	RoR  Apprentice	v1448536836/ucbz3udea9mmy8wnbvda.png	http://careers.stackoverflow.com/Jpriez	https://github.com/JPriez	https://www.linkedin.com/in/jpriez	2015-11-26 11:20:36.720939	2015-12-07 11:28:07.387941	v1448536837/e3vg1qycsgqkbrwzm0sy.png	27
28	Michael Misan	Employee Enrichment Advocate	v1448892998/g4uitzfozsyqwsdlnta9.png	http://careers.stackoverflow.com	https://github.com	https://www.linkedin.com/in	2015-11-30 14:16:37.129446	2015-12-07 11:24:14.469644	v1448892999/ful2r8cdduk9d76njrna.png	22
11	Denis Papushaev	RoR Assassian	v1448466776/kk7tui8fm09xvq0ukkpz.png	http://careers.stackoverflow.com/papushaev	https://github.com/denqxotl	https://www.linkedin.com/in/denqxotl	2015-11-25 15:52:55.645681	2015-12-07 11:25:21.586676	v1448466777/bvppb0aghr9mlbvzmytn.png	24
13	Michael Ostrovskyi	RoR Guerrilla	v1448480689/qmephilp6pf0yavljgdc.png	http://careers.stackoverflow.com/ostrovskyi	https://github.com/abscondite	https://www.linkedin.com/in/ostrovskyi	2015-11-25 19:44:48.856703	2015-12-07 11:26:08.770171	v1448480689/tpwmx5odycdi6pvoqtr0.png	25
21	Ilya Umanets	RoR Constructor	v1448549616/rrminnve9yo4jkyu9a2v.png	http://careers.stackoverflow.com	https://github.com/IlyaUmanets	https://www.linkedin.com/in/ilyaumanets	2015-11-26 14:53:36.043045	2015-12-07 11:29:02.108836	v1448549618/ncsyxdxtds6pidxdtfp3.png	29
6	Pavel Mihailovskiy	Jedi RoR Master	image/upload/v1448465134/nh2nqqurjtx4wjoeno4v.png	http://careers.stackoverflow.com/pavelmihailovskiy	https://github.com/pavel-mihailovskiy	http://ua.linkedin.com/in/pavelmihailovskiy	2015-10-20 18:53:39.396556	2015-12-05 19:06:49.863397	image/upload/v1448526103/wtxedi74wrheieva6bdo.png	4
41	Anton Zimin	RoR Titan	image/upload/v1449240420/ctzy3i62w8sk2q7kfnds.png	http://careers.stackoverflow.com/zimin	https://github.com/antonzimin	https://www.linkedin.com/profile/view?id=AA4AAAZQQ2ABu7uybeeM2dX_arRI8B15hzE9cCY&authType=name&authToken=qfPD&goback=&trk=abook_conn	2015-12-04 14:46:59.770798	2015-12-07 11:07:25.875923	image/upload/v1449240421/fp15aytjzpnfttgov00t.png	11
38	Nastya Andreeva	Chief Fun Officer	image/upload/v1449154861/quv8l5ixwrfb0z1xxqsq.png	http://careers.stackoverflow.com	https://github.com	https://www.linkedin.com/in	2015-12-03 15:00:57.220341	2015-12-07 11:09:34.187606	image/upload/v1449154864/qmdlsvnutziqrxy9ifgw.png	13
37	Vitalii Bondarenko	RoR Innovator	v1449154515/b6a1hcqrvhdspvhmcmg4.png	http://careers.stackoverflow.com/bondarenkovitaliy	https://github.com/Vitaliy-Bondarenko	https://www.linkedin.com/in/bondarenkovitaliy	2015-12-03 14:55:04.940168	2015-12-07 11:21:35.492638	v1449154517/cjzgrexirmlfdsun9da0.png	17
29	Liza Hrytsai	Princess of Design	v1448893904/ccxzascrrx8xutzghmq1.png	http://careers.stackoverflow.com	https://github.com	https://www.linkedin.com/in	2015-11-30 14:31:44.086988	2015-12-07 11:21:53.394492	v1448893907/iv13zbwm1rlpw7x2fhd2.png	18
12	Vitalii Kovtun	RoR Musketeer	v1448533823/m56db7dab7vxhxbancup.png	http://careers.stackoverflow.com/vitaliykovtun	https://github.com/VitaliyKovtun	https://www.linkedin.com/in/vitaliykovtun	2015-11-25 15:54:45.670007	2015-12-07 11:24:35.611856	v1448533824/o1ytscwn2u77tulnxqkt.png	23
39	Vlad Shevtsov	RoR Visionary	v1449156652/hvfct2ubmotcqmarni4r.png	http://careers.stackoverflow.com	https://github.com	https://www.linkedin.com/in	2015-12-03 15:30:52.058193	2015-12-07 11:28:32.384889	v1449156652/wmndp6j8hszg5tmxihzb.png	28
33	Sergiy Savenko	RoR Warrior	v1448896260/f3m3oonrlxuw0xsmfxob.png	http://careers.stackoverflow.com	https://github.com	https://www.linkedin.com/in/	2015-11-30 15:10:59.917039	2015-12-07 11:29:27.278398	v1448896260/jtnicj01tgyqta4uofs9.png	30
32	Alex Partytskyi	RoR Kahuna	v1448896127/yvdchqvhnbprcw08hhos.png	http://careers.stackoverflow.com	https://github.com	https://www.linkedin.com/in/	2015-11-30 15:08:47.286042	2015-12-07 11:30:24.573447	v1448896129/ok1pehzrpdv0tcgkbl4g.png	33
40	Max Serebryansky	RoR Spectre	v1449236612/eljzqbhkghvqw9gmlgsi.png	http://careers.stackoverflow.com	https://github.com	https://www.linkedin.com/in	2015-12-04 13:43:31.673427	2015-12-07 11:30:50.929177	v1449236613/w2zuqlkb1tfbobzbh8eg.png	32
42	Nadya Rasponomareva	Office Flora Queen	image/upload/v1449647889/xwhwbccmkrqfwdiukmgp.png	http://careers.stackoverflow.com	https://github.com	https://www.linkedin.com/in	2015-12-09 07:58:08.506095	2015-12-09 07:58:08.506095	image/upload/v1449647891/ybvjltcpx2gpripjqt4x.png	34
\.


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('members_id_seq', 42, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY projects (id, title, description, logo, technology, duration, team_size, client, industry, link, created_at, updated_at, priority) FROM stdin;
2	DaisyBill	DaisyBill is cloud-based software to submit and manage workers’ compensation medical bills. DasyBill founders built a technology solution that makes work comp billing efficient and transparent. So, bills get paid easy and quickly. DaisyBillers can finally take control of their difficult work comp billing.	v1444941993/ohtukx71ofb4llcvjckn.png	RoR	20	3	DaisyBill	Information Technology and Services	http://www.daisybill.com/	2015-10-15 20:46:33.666835	2015-12-06 21:41:00.888638	20
10	Everseat	Everseat is the revolutionary app that is disrupting the current supply & demand equation for scheduling appointments. Service providers including physicians, dentists, vets, hair-stylists, massage therapists and more can seamlessly fill schedule gaps with interested and available users. Everseat enables consumers to plan, schedule, and book appointments for themselves or their family, at the last minute. It’s faster, easier, and more fun than time-consuming, often unsuccessful phone calls or wait lists. Everseat is free for patients and is available to download on Apple and Android at www.everseat.com.	image/upload/v1449437967/h6i5wnz7r8qej51ewevi.png	RoR, BackBone	5	1	Everseat	HealthCare	https://www.everseat.com/	2015-12-06 21:39:27.51166	2015-12-06 21:39:27.51166	50
3	PreeLine	Browse items that have yet to hit stores. Follow your favorite brands to make the experience your own.	v1444942354/jgvvxdn0gaqkoorz6aps.png	RoR	7	2	Def Method	Internet	https://preeline.com/	2015-10-15 20:52:34.28192	2015-12-06 21:41:18.084267	30
1	ZOZI	ZOZI is a venture-backed San Francisco startup, emerging as the leading brand for adventure. It helps to discover and book extraordinary experiences around the world with celebrity expert guides.  ZOZI offers its clients the best-in-class experiences and delivering them with phenomenal customer service. The idea was born to build a brand that stands for quality, ease of discovery, and passion. ZOZI gives you access to world-famous pioneers of adventure and sport, equip you with the best gear available. This project make it easy for you to get out there and live your passions!	v1444940053/yexxn8kqnsmg2oywrh1n.jpg	ror	14	6	zozi	venture	http://zozi.com	2015-10-15 20:14:13.093891	2015-12-06 21:40:39.323951	10
5	who2try	Is a referral system that rewards existing customers for referring new business and rewards new customers for trying out a business	v1444942643/wahpxb8xsflhblnpxvrl.png	RoR	9	2	ACH Payments	Financial Services	https://www.who2try.com/	2015-10-15 20:57:23.364653	2015-12-06 21:42:40.509436	60
6	eTutorCloud	 is an online tutoring company that matches students who need help with online tutors. Students can receive help either on-demand or by scheduling a lesson.	v1444942821/nm8pynh0di6fdh3u0dnh.png	RoR	9	4	eTutorCloud	E-Learning	https://www.etutorcloud.com	2015-10-15 21:00:21.110623	2015-12-06 21:43:15.904513	70
9	MySchool	Myschool is targeted at students and making their lives easier, giving them access to more information than ever before and throwing in some fun with the ability to Battle and show their school spirit. Pass it along to your kids, nephews, nieces, grand kids, etc. They will thank you!	v1444944202/xjbvphbd1lrepovawkt1.png	RoR	6	2	MySchool	Education	https://www.myschool411.com	2015-10-15 21:23:22.476359	2015-12-06 21:43:34.155324	80
8	MySytes	A web recommendation engine giving you a new way to experience the web. Have you ever had a friend tell you about a website and found it was great. That is what we do tell you about the best of the web based on your preferences and allow you to share those links.	v1448286270/zswp8qjkhfsvizk8c2ve.png	RoR	4	1	Somasoft Inc.	Internet	http://mysytes.com/	2015-10-15 21:21:06.807975	2015-12-06 21:43:55.303199	100
4	WaveLength	WaveLength integrates with Ultraviolet, which is an API for purchasing and controlling access to digital movies.  Wavelength serves is a relatively new role in the UV ecosystem. That acts as a middleman between 3rd parties, who provide access to the actual digital media content and end users. Our is role to become better defined, and we may eventually be reclassified as an actual access portal.	v1444942484/bu6erw9z4mwo03zri9te.png	RoR	6	2	RoughCut	Broadcast Media	http://wavelength.io/	2015-10-15 20:54:44.709011	2015-12-06 21:44:15.713854	90
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('projects_id_seq', 10, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20151006124114
20151009073759
20151019185215
20151204131109
20151204131221
20151208092533
\.


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: index_members_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_members_on_name ON members USING btree (name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

