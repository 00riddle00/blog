--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO riddle00;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO riddle00;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO riddle00;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO riddle00;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO riddle00;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO riddle00;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO riddle00;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO riddle00;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO riddle00;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO riddle00;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO riddle00;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO riddle00;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO riddle00;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO riddle00;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO riddle00;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO riddle00;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO riddle00;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO riddle00;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO riddle00;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO riddle00;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO riddle00;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: website_city; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_city (
    id integer NOT NULL,
    "order" integer NOT NULL,
    name character varying(100) NOT NULL,
    russian_name character varying(100) NOT NULL,
    location character varying(42) NOT NULL,
    zoom character varying(2),
    country_code character varying(10) NOT NULL,
    CONSTRAINT website_city_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.website_city OWNER TO riddle00;

--
-- Name: website_city_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_city_id_seq OWNER TO riddle00;

--
-- Name: website_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_city_id_seq OWNED BY public.website_city.id;


--
-- Name: website_contentblock; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_contentblock (
    id integer NOT NULL,
    "order" integer NOT NULL,
    is_active character varying(10) NOT NULL,
    CONSTRAINT website_contentblock_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.website_contentblock OWNER TO riddle00;

--
-- Name: website_contentblock_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_contentblock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_contentblock_id_seq OWNER TO riddle00;

--
-- Name: website_contentblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_contentblock_id_seq OWNED BY public.website_contentblock.id;


--
-- Name: website_contentblock_translation; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_contentblock_translation (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    internal_link character varying(100) NOT NULL,
    content text NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE public.website_contentblock_translation OWNER TO riddle00;

--
-- Name: website_contentblock_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_contentblock_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_contentblock_translation_id_seq OWNER TO riddle00;

--
-- Name: website_contentblock_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_contentblock_translation_id_seq OWNED BY public.website_contentblock_translation.id;


--
-- Name: website_footer; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_footer (
    id integer NOT NULL,
    "order" integer NOT NULL,
    is_active character varying(10) NOT NULL,
    CONSTRAINT website_footer_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.website_footer OWNER TO riddle00;

--
-- Name: website_footer_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_footer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_footer_id_seq OWNER TO riddle00;

--
-- Name: website_footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_footer_id_seq OWNED BY public.website_footer.id;


--
-- Name: website_footer_translation; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_footer_translation (
    id integer NOT NULL,
    text text NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE public.website_footer_translation OWNER TO riddle00;

--
-- Name: website_footer_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_footer_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_footer_translation_id_seq OWNER TO riddle00;

--
-- Name: website_footer_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_footer_translation_id_seq OWNED BY public.website_footer_translation.id;


--
-- Name: website_images; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_images (
    id integer NOT NULL,
    "order" integer NOT NULL,
    code character varying(50) NOT NULL,
    CONSTRAINT website_images_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.website_images OWNER TO riddle00;

--
-- Name: website_images_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_images_id_seq OWNER TO riddle00;

--
-- Name: website_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_images_id_seq OWNED BY public.website_images.id;


--
-- Name: website_images_translation; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_images_translation (
    id integer NOT NULL,
    image character varying(200),
    language_code character varying(15) NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE public.website_images_translation OWNER TO riddle00;

--
-- Name: website_images_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_images_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_images_translation_id_seq OWNER TO riddle00;

--
-- Name: website_images_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_images_translation_id_seq OWNED BY public.website_images_translation.id;


--
-- Name: website_language; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_language (
    id integer NOT NULL,
    "order" integer NOT NULL,
    image character varying(200),
    language character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    is_default boolean NOT NULL,
    is_active boolean NOT NULL,
    CONSTRAINT website_language_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.website_language OWNER TO riddle00;

--
-- Name: website_language_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_language_id_seq OWNER TO riddle00;

--
-- Name: website_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_language_id_seq OWNED BY public.website_language.id;


--
-- Name: website_metadata; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_metadata (
    id integer NOT NULL
);


ALTER TABLE public.website_metadata OWNER TO riddle00;

--
-- Name: website_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_metadata_id_seq OWNER TO riddle00;

--
-- Name: website_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_metadata_id_seq OWNED BY public.website_metadata.id;


--
-- Name: website_metadata_translation; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_metadata_translation (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description text NOT NULL,
    keywords text NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE public.website_metadata_translation OWNER TO riddle00;

--
-- Name: website_metadata_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_metadata_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_metadata_translation_id_seq OWNER TO riddle00;

--
-- Name: website_metadata_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_metadata_translation_id_seq OWNED BY public.website_metadata_translation.id;


--
-- Name: website_shops; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_shops (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    contacts character varying(100) NOT NULL,
    location character varying(42) NOT NULL,
    country_code character varying(10) NOT NULL
);


ALTER TABLE public.website_shops OWNER TO riddle00;

--
-- Name: website_shops_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_shops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_shops_id_seq OWNER TO riddle00;

--
-- Name: website_shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_shops_id_seq OWNED BY public.website_shops.id;


--
-- Name: website_sliderbox; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_sliderbox (
    id integer NOT NULL,
    "order" integer NOT NULL,
    CONSTRAINT website_sliderbox_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.website_sliderbox OWNER TO riddle00;

--
-- Name: website_sliderbox_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_sliderbox_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_sliderbox_id_seq OWNER TO riddle00;

--
-- Name: website_sliderbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_sliderbox_id_seq OWNED BY public.website_sliderbox.id;


--
-- Name: website_sliderbox_translation; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_sliderbox_translation (
    id integer NOT NULL,
    image character varying(200),
    text character varying(200) NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE public.website_sliderbox_translation OWNER TO riddle00;

--
-- Name: website_sliderbox_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_sliderbox_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_sliderbox_translation_id_seq OWNER TO riddle00;

--
-- Name: website_sliderbox_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_sliderbox_translation_id_seq OWNED BY public.website_sliderbox_translation.id;


--
-- Name: website_strings; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_strings (
    id integer NOT NULL,
    "order" integer NOT NULL,
    code character varying(50) NOT NULL,
    CONSTRAINT website_strings_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.website_strings OWNER TO riddle00;

--
-- Name: website_strings_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_strings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_strings_id_seq OWNER TO riddle00;

--
-- Name: website_strings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_strings_id_seq OWNED BY public.website_strings.id;


--
-- Name: website_strings_translation; Type: TABLE; Schema: public; Owner: riddle00
--

CREATE TABLE public.website_strings_translation (
    id integer NOT NULL,
    string text NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE public.website_strings_translation OWNER TO riddle00;

--
-- Name: website_strings_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: riddle00
--

CREATE SEQUENCE public.website_strings_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_strings_translation_id_seq OWNER TO riddle00;

--
-- Name: website_strings_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: riddle00
--

ALTER SEQUENCE public.website_strings_translation_id_seq OWNED BY public.website_strings_translation.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: website_city id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_city ALTER COLUMN id SET DEFAULT nextval('public.website_city_id_seq'::regclass);


--
-- Name: website_contentblock id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_contentblock ALTER COLUMN id SET DEFAULT nextval('public.website_contentblock_id_seq'::regclass);


--
-- Name: website_contentblock_translation id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_contentblock_translation ALTER COLUMN id SET DEFAULT nextval('public.website_contentblock_translation_id_seq'::regclass);


--
-- Name: website_footer id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_footer ALTER COLUMN id SET DEFAULT nextval('public.website_footer_id_seq'::regclass);


--
-- Name: website_footer_translation id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_footer_translation ALTER COLUMN id SET DEFAULT nextval('public.website_footer_translation_id_seq'::regclass);


--
-- Name: website_images id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_images ALTER COLUMN id SET DEFAULT nextval('public.website_images_id_seq'::regclass);


--
-- Name: website_images_translation id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_images_translation ALTER COLUMN id SET DEFAULT nextval('public.website_images_translation_id_seq'::regclass);


--
-- Name: website_language id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_language ALTER COLUMN id SET DEFAULT nextval('public.website_language_id_seq'::regclass);


--
-- Name: website_metadata id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_metadata ALTER COLUMN id SET DEFAULT nextval('public.website_metadata_id_seq'::regclass);


--
-- Name: website_metadata_translation id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_metadata_translation ALTER COLUMN id SET DEFAULT nextval('public.website_metadata_translation_id_seq'::regclass);


--
-- Name: website_shops id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_shops ALTER COLUMN id SET DEFAULT nextval('public.website_shops_id_seq'::regclass);


--
-- Name: website_sliderbox id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_sliderbox ALTER COLUMN id SET DEFAULT nextval('public.website_sliderbox_id_seq'::regclass);


--
-- Name: website_sliderbox_translation id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_sliderbox_translation ALTER COLUMN id SET DEFAULT nextval('public.website_sliderbox_translation_id_seq'::regclass);


--
-- Name: website_strings id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_strings ALTER COLUMN id SET DEFAULT nextval('public.website_strings_id_seq'::regclass);


--
-- Name: website_strings_translation id; Type: DEFAULT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_strings_translation ALTER COLUMN id SET DEFAULT nextval('public.website_strings_translation_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add FileBrowser	1	add_filebrowser
2	Can change FileBrowser	1	change_filebrowser
3	Can delete FileBrowser	1	delete_filebrowser
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add site	8	add_site
23	Can change site	8	change_site
24	Can delete site	8	delete_site
25	Can add language	9	add_language
26	Can change language	9	change_language
27	Can delete language	9	delete_language
28	Can add slider box	11	add_sliderbox
29	Can change slider box	11	change_sliderbox
30	Can delete slider box	11	delete_sliderbox
31	Can add content block	13	add_contentblock
32	Can change content block	13	change_contentblock
33	Can delete content block	13	delete_contentblock
34	Can add footer	15	add_footer
35	Can change footer	15	change_footer
36	Can delete footer	15	delete_footer
37	Can add shops	16	add_shops
38	Can change shops	16	change_shops
39	Can delete shops	16	delete_shops
40	Can add city	17	add_city
41	Can change city	17	change_city
42	Can delete city	17	delete_city
43	Can add images	19	add_images
44	Can change images	19	change_images
45	Can delete images	19	delete_images
46	Can add strings	21	add_strings
47	Can change strings	21	change_strings
48	Can delete strings	21	delete_strings
49	Can add meta data	23	add_metadata
50	Can change meta data	23	change_metadata
51	Can delete meta data	23	delete_metadata
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$VBIlaXbqy3a6$Qep5OoClYKob1uB1yHK2gTLzxXNjWp/3l8+rvBFZpbk=	2018-04-05 21:02:43.203233+03	t	riddle00			tomasgiedraitis@gmail.com	t	t	2018-04-05 21:02:40.134969+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-04-05 21:06:17.502399+03	1	Apie mane	1	Pridėta.	13	1
2	2018-04-05 21:06:37.468493+03	1	Apie mane	2	Pakeistas content.	13	1
3	2018-04-05 21:06:40.882173+03	1	Apie mane	2	Pakeistas content.	13	1
4	2018-04-05 21:07:05.490778+03	1	Apie mane	2	Nei vienas laukas nepakeistas	13	1
5	2018-04-05 21:07:14.625232+03	2	Kur?	1	Pridėta.	13	1
6	2018-04-05 21:07:35.024162+03	3	Kaip pasirinkti?	1	Pridėta.	13	1
7	2018-04-05 21:08:30.129522+03	2	Lorem ipsum	1	Pridėta.	11	1
8	2018-04-05 21:08:31.74615+03	2	Lorem ipsum	2	Nei vienas laukas nepakeistas	11	1
9	2018-04-05 21:08:35.691498+03	3	Lorem ipsum	1	Pridėta.	11	1
10	2018-04-05 21:08:39.599094+03	4	Lorem ipsum	1	Pridėta.	11	1
11	2018-04-05 21:08:41.289973+03	5	Lorem ipsum	1	Pridėta.	11	1
12	2018-04-05 21:09:21.854756+03	1	Lithuanian	1	Pridėta.	9	1
13	2018-04-05 21:09:23.549363+03	1	Lithuanian	2	Pakeistas image.	9	1
14	2018-04-05 21:10:40.175478+03	1	Vilnius	1	Pridėta.	17	1
15	2018-04-05 21:10:59.425151+03	2	Kaunas	1	Pridėta.	17	1
16	2018-04-05 21:12:44.212278+03	1	Lorem ipsum	1	Pridėta.	16	1
17	2018-04-05 21:13:59.077775+03	2	Lorem Ipsum	1	Pridėta.	16	1
18	2018-04-05 21:14:37.361085+03	1	Header Text	1	Pridėta.	21	1
19	2018-04-05 21:14:55.616478+03	2	Header Button	1	Pridėta.	21	1
20	2018-04-05 21:15:20.561602+03	3	Map Choose City	1	Pridėta.	21	1
21	2018-04-05 21:15:28.794398+03	4	Content Block Text	1	Pridėta.	21	1
22	2018-04-05 21:16:05.995562+03	5	Content Block Text 1	1	Pridėta.	21	1
23	2018-04-05 21:16:11.481383+03	6	Content Block Text 2	1	Pridėta.	21	1
24	2018-04-05 21:16:16.698501+03	7	Content Block Text 3	1	Pridėta.	21	1
25	2018-04-05 21:16:30.400508+03	8	Read More	1	Pridėta.	21	1
26	2018-04-05 21:16:41.017502+03	9	Read More Link	1	Pridėta.	21	1
27	2018-04-05 21:16:50.620538+03	10	Map Heading	1	Pridėta.	21	1
28	2018-04-05 21:16:55.39467+03	11	Map Company Name	1	Pridėta.	21	1
29	2018-04-05 21:17:00.031078+03	12	Map City	1	Pridėta.	21	1
30	2018-04-05 21:17:05.059185+03	13	Map Address	1	Pridėta.	21	1
31	2018-04-05 21:17:10.499441+03	14	Map Contacts	1	Pridėta.	21	1
32	2018-04-05 21:17:14.721448+03	15	About Us Link	1	Pridėta.	21	1
33	2018-04-05 21:17:20.188252+03	16	Where To Buy Link	1	Pridėta.	21	1
34	2018-04-05 21:23:10.37533+03	1	Header Text	2	Pakeistas string.	21	1
35	2018-04-05 21:23:31.637553+03	2	Header Button	2	Pakeistas string.	21	1
36	2018-04-05 21:23:41.73852+03	4	Content Block Text	2	Pakeistas string.	21	1
37	2018-04-05 21:24:04.41552+03	4	Content Block Text	2	Pakeistas string.	21	1
38	2018-04-05 21:24:22.228036+03	6	Content Block Text 2	2	Pakeistas string.	21	1
39	2018-04-05 21:25:35.134865+03	7	Content Block Text 3	2	Pakeistas string.	21	1
40	2018-04-05 21:25:51.638281+03	10	Map Heading	2	Pakeistas string.	21	1
41	2018-04-05 21:26:18.257791+03	11	Map Company Name	2	Pakeistas string.	21	1
42	2018-04-05 21:26:30.684843+03	15	About Us Link	2	Pakeistas string.	21	1
43	2018-04-05 21:26:37.608137+03	16	Where To Buy Link	2	Pakeistas string.	21	1
44	2018-04-05 21:27:08.583483+03	1	Apie mane	2	Nei vienas laukas nepakeistas	13	1
45	2018-04-05 21:27:13.345359+03	2	Kur?	2	Nei vienas laukas nepakeistas	13	1
46	2018-04-05 21:27:28.574749+03	3	Kaip?	2	Pakeistas title ir internal_link.	13	1
47	2018-04-05 21:28:06.378102+03	1	Apie mane	2	Pakeistas content.	13	1
48	2018-04-05 21:28:51.695867+03	2	Kur?	2	Pakeistas content.	13	1
49	2018-04-05 21:28:55.53541+03	3	Kaip?	2	Pakeistas content.	13	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	filebrowser	filebrowser
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	sites	site
9	website	language
10	website	sliderboxtranslation
11	website	sliderbox
12	website	contentblocktranslation
13	website	contentblock
14	website	footertranslation
15	website	footer
16	website	shops
17	website	city
18	website	imagestranslation
19	website	images
20	website	stringstranslation
21	website	strings
22	website	metadatatranslation
23	website	metadata
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-04-05 20:58:01.579647+03
2	auth	0001_initial	2018-04-05 20:58:02.605302+03
3	admin	0001_initial	2018-04-05 20:58:02.873044+03
4	admin	0002_logentry_remove_auto_add	2018-04-05 20:58:02.954212+03
5	contenttypes	0002_remove_content_type_name	2018-04-05 20:58:03.034923+03
6	auth	0002_alter_permission_name_max_length	2018-04-05 20:58:03.067953+03
7	auth	0003_alter_user_email_max_length	2018-04-05 20:58:03.101643+03
8	auth	0004_alter_user_username_opts	2018-04-05 20:58:03.125372+03
9	auth	0005_alter_user_last_login_null	2018-04-05 20:58:03.156229+03
10	auth	0006_require_contenttypes_0002	2018-04-05 20:58:03.167643+03
11	auth	0007_alter_validators_add_error_messages	2018-04-05 20:58:03.190868+03
12	sessions	0001_initial	2018-04-05 20:58:03.351585+03
13	sites	0001_initial	2018-04-05 20:58:03.458999+03
14	sites	0002_alter_domain_unique	2018-04-05 20:58:03.569612+03
15	website	0001_initial	2018-04-05 21:01:14.21317+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
x4irzifyiiyvx19bf350z18vvqndybz1	YmYzNmVkNjc0YWJkYTBhNjYxM2Q0ZDY1OTJjOTQ4NWYzMTc4YzJlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NGQ5ZjU2NDg1ZTExNWQ2Y2Y1M2FlN2RiODRiODhiMmI4OWJjZTJiIn0=	2018-04-19 21:02:43.215092+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: website_city; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_city (id, "order", name, russian_name, location, zoom, country_code) FROM stdin;
1	0	Vilnius	Вильнюс	54.6871555,25.279651400000034	10	lt
2	1	Kaunas	Каунас	54.8985207,23.90359650000005	10	lt
\.


--
-- Data for Name: website_contentblock; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_contentblock (id, "order", is_active) FROM stdin;
1	0	1
2	1	1
3	2	1
\.


--
-- Data for Name: website_contentblock_translation; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_contentblock_translation (id, title, internal_link, content, language_code, master_id) FROM stdin;
1	Apie mane	apie-mane	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>	lt	1
2	Kur?	kur	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>	lt	2
3	Kaip?	kaip	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>	lt	3
\.


--
-- Data for Name: website_footer; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_footer (id, "order", is_active) FROM stdin;
\.


--
-- Data for Name: website_footer_translation; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_footer_translation (id, text, language_code, master_id) FROM stdin;
\.


--
-- Data for Name: website_images; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_images (id, "order", code) FROM stdin;
\.


--
-- Data for Name: website_images_translation; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_images_translation (id, image, language_code, master_id) FROM stdin;
\.


--
-- Data for Name: website_language; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_language (id, "order", image, language, code, is_default, is_active) FROM stdin;
1	0	uploads/lt_flag.png	Lithuanian	lt	t	t
\.


--
-- Data for Name: website_metadata; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_metadata (id) FROM stdin;
\.


--
-- Data for Name: website_metadata_translation; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_metadata_translation (id, title, description, keywords, language_code, master_id) FROM stdin;
\.


--
-- Data for Name: website_shops; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_shops (id, name, city, address, contacts, location, country_code) FROM stdin;
1	Lorem ipsum	Vilnius	Adresas	+370 62462239	54.685733,25.280005	lt
2	Lorem Ipsum	Kaunas	Adresas	+370 62462239	54.895818,23.916667	lt
\.


--
-- Data for Name: website_sliderbox; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_sliderbox (id, "order") FROM stdin;
2	0
3	1
4	2
5	3
\.


--
-- Data for Name: website_sliderbox_translation; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_sliderbox_translation (id, image, text, language_code, master_id) FROM stdin;
1		Lorem ipsum	lt	2
2		Lorem ipsum	lt	3
3		Lorem ipsum	lt	4
4		Lorem ipsum	lt	5
\.


--
-- Data for Name: website_strings; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_strings (id, "order", code) FROM stdin;
3	2	map_choose_city
5	4	content_block_text_1
8	7	read_more
9	8	read_more_link
12	11	map_city
13	12	map_address
14	13	map_contacts
1	0	header_text
2	1	header_button
4	3	content_block_text
6	5	content_block_text_2
7	6	content_block_text_3
10	9	map_heading
11	10	map_company_name
15	14	about_us_link
16	15	where_to_buy_link
\.


--
-- Data for Name: website_strings_translation; Type: TABLE DATA; Schema: public; Owner: riddle00
--

COPY public.website_strings_translation (id, string, language_code, master_id) FROM stdin;
3	Pasirinkite miestą:	lt	3
5	Akumuliatoriaus\r\ntalpa (Ah)	lt	5
8	Skaityti daugiau	lt	8
9	about:blank	lt	9
12	Miestas	lt	12
13	Adresas	lt	13
14	Kontaktai	lt	14
1	Lorem ipsum dolor sit	lt	1
2	Lorem IPSUM!	lt	2
4	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip	lt	4
6	Lorem ipsum \r\ndolor sit	lt	6
7	Lorem ipsum dolor \r\nsit amet, consectetur\r\nadipiscing elit	lt	7
10	Lorem Ipsum	lt	10
11	Lorem ipsum	lt	11
15	apie-mane	lt	15
16	kur	lt	16
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 51, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 49, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 15, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: website_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_city_id_seq', 2, true);


--
-- Name: website_contentblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_contentblock_id_seq', 3, true);


--
-- Name: website_contentblock_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_contentblock_translation_id_seq', 3, true);


--
-- Name: website_footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_footer_id_seq', 1, false);


--
-- Name: website_footer_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_footer_translation_id_seq', 1, false);


--
-- Name: website_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_images_id_seq', 3, true);


--
-- Name: website_images_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_images_translation_id_seq', 1, false);


--
-- Name: website_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_language_id_seq', 1, true);


--
-- Name: website_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_metadata_id_seq', 1, false);


--
-- Name: website_metadata_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_metadata_translation_id_seq', 1, false);


--
-- Name: website_shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_shops_id_seq', 2, true);


--
-- Name: website_sliderbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_sliderbox_id_seq', 5, true);


--
-- Name: website_sliderbox_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_sliderbox_translation_id_seq', 4, true);


--
-- Name: website_strings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_strings_id_seq', 16, true);


--
-- Name: website_strings_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: riddle00
--

SELECT pg_catalog.setval('public.website_strings_translation_id_seq', 16, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: website_city website_city_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_city
    ADD CONSTRAINT website_city_pkey PRIMARY KEY (id);


--
-- Name: website_contentblock website_contentblock_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_contentblock
    ADD CONSTRAINT website_contentblock_pkey PRIMARY KEY (id);


--
-- Name: website_contentblock_translation website_contentblock_translation_language_code_50da4ebe_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_contentblock_translation
    ADD CONSTRAINT website_contentblock_translation_language_code_50da4ebe_uniq UNIQUE (language_code, master_id);


--
-- Name: website_contentblock_translation website_contentblock_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_contentblock_translation
    ADD CONSTRAINT website_contentblock_translation_pkey PRIMARY KEY (id);


--
-- Name: website_footer website_footer_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_footer
    ADD CONSTRAINT website_footer_pkey PRIMARY KEY (id);


--
-- Name: website_footer_translation website_footer_translation_language_code_9eacbbd5_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_footer_translation
    ADD CONSTRAINT website_footer_translation_language_code_9eacbbd5_uniq UNIQUE (language_code, master_id);


--
-- Name: website_footer_translation website_footer_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_footer_translation
    ADD CONSTRAINT website_footer_translation_pkey PRIMARY KEY (id);


--
-- Name: website_images website_images_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_images
    ADD CONSTRAINT website_images_pkey PRIMARY KEY (id);


--
-- Name: website_images_translation website_images_translation_language_code_a4a5faeb_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_images_translation
    ADD CONSTRAINT website_images_translation_language_code_a4a5faeb_uniq UNIQUE (language_code, master_id);


--
-- Name: website_images_translation website_images_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_images_translation
    ADD CONSTRAINT website_images_translation_pkey PRIMARY KEY (id);


--
-- Name: website_language website_language_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_language
    ADD CONSTRAINT website_language_pkey PRIMARY KEY (id);


--
-- Name: website_metadata website_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_metadata
    ADD CONSTRAINT website_metadata_pkey PRIMARY KEY (id);


--
-- Name: website_metadata_translation website_metadata_translation_language_code_b6ddad6c_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_metadata_translation
    ADD CONSTRAINT website_metadata_translation_language_code_b6ddad6c_uniq UNIQUE (language_code, master_id);


--
-- Name: website_metadata_translation website_metadata_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_metadata_translation
    ADD CONSTRAINT website_metadata_translation_pkey PRIMARY KEY (id);


--
-- Name: website_shops website_shops_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_shops
    ADD CONSTRAINT website_shops_pkey PRIMARY KEY (id);


--
-- Name: website_sliderbox website_sliderbox_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_sliderbox
    ADD CONSTRAINT website_sliderbox_pkey PRIMARY KEY (id);


--
-- Name: website_sliderbox_translation website_sliderbox_translation_language_code_2514d079_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_sliderbox_translation
    ADD CONSTRAINT website_sliderbox_translation_language_code_2514d079_uniq UNIQUE (language_code, master_id);


--
-- Name: website_sliderbox_translation website_sliderbox_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_sliderbox_translation
    ADD CONSTRAINT website_sliderbox_translation_pkey PRIMARY KEY (id);


--
-- Name: website_strings website_strings_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_strings
    ADD CONSTRAINT website_strings_pkey PRIMARY KEY (id);


--
-- Name: website_strings_translation website_strings_translation_language_code_f377a17f_uniq; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_strings_translation
    ADD CONSTRAINT website_strings_translation_language_code_f377a17f_uniq UNIQUE (language_code, master_id);


--
-- Name: website_strings_translation website_strings_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_strings_translation
    ADD CONSTRAINT website_strings_translation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: website_city_70a17ffa; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_city_70a17ffa ON public.website_city USING btree ("order");


--
-- Name: website_contentblock_70a17ffa; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_contentblock_70a17ffa ON public.website_contentblock USING btree ("order");


--
-- Name: website_contentblock_translation_60716c2f; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_contentblock_translation_60716c2f ON public.website_contentblock_translation USING btree (language_code);


--
-- Name: website_contentblock_translation_90349b61; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_contentblock_translation_90349b61 ON public.website_contentblock_translation USING btree (master_id);


--
-- Name: website_contentblock_translation_language_code_2fb076aa_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_contentblock_translation_language_code_2fb076aa_like ON public.website_contentblock_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: website_footer_70a17ffa; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_footer_70a17ffa ON public.website_footer USING btree ("order");


--
-- Name: website_footer_translation_60716c2f; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_footer_translation_60716c2f ON public.website_footer_translation USING btree (language_code);


--
-- Name: website_footer_translation_90349b61; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_footer_translation_90349b61 ON public.website_footer_translation USING btree (master_id);


--
-- Name: website_footer_translation_language_code_17e3f54c_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_footer_translation_language_code_17e3f54c_like ON public.website_footer_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: website_images_70a17ffa; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_images_70a17ffa ON public.website_images USING btree ("order");


--
-- Name: website_images_translation_60716c2f; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_images_translation_60716c2f ON public.website_images_translation USING btree (language_code);


--
-- Name: website_images_translation_90349b61; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_images_translation_90349b61 ON public.website_images_translation USING btree (master_id);


--
-- Name: website_images_translation_language_code_fed7adb6_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_images_translation_language_code_fed7adb6_like ON public.website_images_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: website_language_70a17ffa; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_language_70a17ffa ON public.website_language USING btree ("order");


--
-- Name: website_metadata_translation_60716c2f; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_metadata_translation_60716c2f ON public.website_metadata_translation USING btree (language_code);


--
-- Name: website_metadata_translation_90349b61; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_metadata_translation_90349b61 ON public.website_metadata_translation USING btree (master_id);


--
-- Name: website_metadata_translation_language_code_8bf422f0_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_metadata_translation_language_code_8bf422f0_like ON public.website_metadata_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: website_sliderbox_70a17ffa; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_sliderbox_70a17ffa ON public.website_sliderbox USING btree ("order");


--
-- Name: website_sliderbox_translation_60716c2f; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_sliderbox_translation_60716c2f ON public.website_sliderbox_translation USING btree (language_code);


--
-- Name: website_sliderbox_translation_90349b61; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_sliderbox_translation_90349b61 ON public.website_sliderbox_translation USING btree (master_id);


--
-- Name: website_sliderbox_translation_language_code_8e6b4094_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_sliderbox_translation_language_code_8e6b4094_like ON public.website_sliderbox_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: website_strings_70a17ffa; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_strings_70a17ffa ON public.website_strings USING btree ("order");


--
-- Name: website_strings_translation_60716c2f; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_strings_translation_60716c2f ON public.website_strings_translation USING btree (language_code);


--
-- Name: website_strings_translation_90349b61; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_strings_translation_90349b61 ON public.website_strings_translation USING btree (master_id);


--
-- Name: website_strings_translation_language_code_c60d44d9_like; Type: INDEX; Schema: public; Owner: riddle00
--

CREATE INDEX website_strings_translation_language_code_c60d44d9_like ON public.website_strings_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: website_contentblock_translation website_contentbl_master_id_9e3a6bde_fk_website_contentblock_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_contentblock_translation
    ADD CONSTRAINT website_contentbl_master_id_9e3a6bde_fk_website_contentblock_id FOREIGN KEY (master_id) REFERENCES public.website_contentblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: website_footer_translation website_footer_translat_master_id_bb34e1f2_fk_website_footer_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_footer_translation
    ADD CONSTRAINT website_footer_translat_master_id_bb34e1f2_fk_website_footer_id FOREIGN KEY (master_id) REFERENCES public.website_footer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: website_images_translation website_images_translat_master_id_d32e5213_fk_website_images_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_images_translation
    ADD CONSTRAINT website_images_translat_master_id_d32e5213_fk_website_images_id FOREIGN KEY (master_id) REFERENCES public.website_images(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: website_metadata_translation website_metadata_tran_master_id_d054c686_fk_website_metadata_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_metadata_translation
    ADD CONSTRAINT website_metadata_tran_master_id_d054c686_fk_website_metadata_id FOREIGN KEY (master_id) REFERENCES public.website_metadata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: website_sliderbox_translation website_sliderbox_tr_master_id_574162ca_fk_website_sliderbox_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_sliderbox_translation
    ADD CONSTRAINT website_sliderbox_tr_master_id_574162ca_fk_website_sliderbox_id FOREIGN KEY (master_id) REFERENCES public.website_sliderbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: website_strings_translation website_strings_transl_master_id_aaf376f2_fk_website_strings_id; Type: FK CONSTRAINT; Schema: public; Owner: riddle00
--

ALTER TABLE ONLY public.website_strings_translation
    ADD CONSTRAINT website_strings_transl_master_id_aaf376f2_fk_website_strings_id FOREIGN KEY (master_id) REFERENCES public.website_strings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

