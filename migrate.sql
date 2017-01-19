--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: examples; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE examples (
    id integer NOT NULL,
    verb_id integer NOT NULL,
    name text DEFAULT 'Example'::text,
    description text DEFAULT ''::text,
    request text DEFAULT ''::text,
    response text DEFAULT ''::text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE examples OWNER TO "tyler.liu";

--
-- Name: examples_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE examples_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE examples_id_seq OWNER TO "tyler.liu";

--
-- Name: examples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE examples_id_seq OWNED BY examples.id;


--
-- Name: model_properties; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE model_properties (
    id integer NOT NULL,
    model_id integer NOT NULL,
    "position" integer DEFAULT 0,
    name text NOT NULL,
    data_type text NOT NULL,
    description text NOT NULL,
    format text DEFAULT ''::text,
    required boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE model_properties OWNER TO "tyler.liu";

--
-- Name: model_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE model_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE model_properties_id_seq OWNER TO "tyler.liu";

--
-- Name: model_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE model_properties_id_seq OWNED BY model_properties.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE models (
    id integer NOT NULL,
    specification_id integer NOT NULL,
    name text NOT NULL,
    properties_text text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE models OWNER TO "tyler.liu";

--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE models_id_seq OWNER TO "tyler.liu";

--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE models_id_seq OWNED BY models.id;


--
-- Name: path_parameters; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE path_parameters (
    id integer NOT NULL,
    specification_id integer NOT NULL,
    name text NOT NULL,
    data_type text NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    format text DEFAULT ''::text,
    required boolean DEFAULT true,
    "position" integer DEFAULT 0
);


ALTER TABLE path_parameters OWNER TO "tyler.liu";

--
-- Name: path_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE path_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE path_parameters_id_seq OWNER TO "tyler.liu";

--
-- Name: path_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE path_parameters_id_seq OWNED BY path_parameters.id;


--
-- Name: paths; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE paths (
    id integer NOT NULL,
    specification_id integer NOT NULL,
    uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE paths OWNER TO "tyler.liu";

--
-- Name: paths_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE paths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paths_id_seq OWNER TO "tyler.liu";

--
-- Name: paths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE paths_id_seq OWNED BY paths.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE permissions (
    id integer NOT NULL,
    specification_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE permissions OWNER TO "tyler.liu";

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_id_seq OWNER TO "tyler.liu";

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: query_parameters; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE query_parameters (
    id integer NOT NULL,
    verb_id integer NOT NULL,
    name text NOT NULL,
    data_type text NOT NULL,
    format text DEFAULT ''::text,
    required boolean DEFAULT false,
    description text NOT NULL,
    "position" integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE query_parameters OWNER TO "tyler.liu";

--
-- Name: query_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE query_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE query_parameters_id_seq OWNER TO "tyler.liu";

--
-- Name: query_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE query_parameters_id_seq OWNED BY query_parameters.id;


--
-- Name: request_body_properties; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE request_body_properties (
    id integer NOT NULL,
    verb_id integer NOT NULL,
    "position" integer DEFAULT 0,
    name text NOT NULL,
    data_type text NOT NULL,
    description text NOT NULL,
    format text DEFAULT ''::text,
    required boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE request_body_properties OWNER TO "tyler.liu";

--
-- Name: request_body_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE request_body_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE request_body_properties_id_seq OWNER TO "tyler.liu";

--
-- Name: request_body_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE request_body_properties_id_seq OWNED BY request_body_properties.id;


--
-- Name: response_body_properties; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE response_body_properties (
    id integer NOT NULL,
    verb_id integer NOT NULL,
    "position" integer DEFAULT 0,
    name text NOT NULL,
    data_type text NOT NULL,
    description text NOT NULL,
    format text DEFAULT ''::text,
    required boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE response_body_properties OWNER TO "tyler.liu";

--
-- Name: response_body_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE response_body_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE response_body_properties_id_seq OWNER TO "tyler.liu";

--
-- Name: response_body_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE response_body_properties_id_seq OWNED BY response_body_properties.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE schema_migrations (
    version text NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "tyler.liu";

--
-- Name: specifications; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE specifications (
    id integer NOT NULL,
    version text NOT NULL,
    title text NOT NULL,
    description text,
    "termsOfService" text,
    host text,
    "basePath" text,
    schemes text,
    produces text,
    consumes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    path_parameters_text text DEFAULT ''::text,
    permissions_text text DEFAULT ''::text
);


ALTER TABLE specifications OWNER TO "tyler.liu";

--
-- Name: specifications_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE specifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specifications_id_seq OWNER TO "tyler.liu";

--
-- Name: specifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE specifications_id_seq OWNED BY specifications.id;


--
-- Name: verbs; Type: TABLE; Schema: public; Owner: tyler.liu
--

CREATE TABLE verbs (
    id integer NOT NULL,
    path_id integer NOT NULL,
    method text NOT NULL,
    name text NOT NULL,
    batch boolean DEFAULT false,
    visibility text NOT NULL,
    status text DEFAULT ''::text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    query_parameters_text text DEFAULT ''::text,
    request_body_text text DEFAULT ''::text,
    response_body_text text DEFAULT ''::text,
    since text DEFAULT ''::text,
    description text DEFAULT ''::text,
    api_group text DEFAULT ''::text,
    permissions text DEFAULT ''::text,
    tags character varying DEFAULT ''::character varying
);


ALTER TABLE verbs OWNER TO "tyler.liu";

--
-- Name: verbs_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler.liu
--

CREATE SEQUENCE verbs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE verbs_id_seq OWNER TO "tyler.liu";

--
-- Name: verbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler.liu
--

ALTER SEQUENCE verbs_id_seq OWNED BY verbs.id;


--
-- Name: examples id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY examples ALTER COLUMN id SET DEFAULT nextval('examples_id_seq'::regclass);


--
-- Name: model_properties id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY model_properties ALTER COLUMN id SET DEFAULT nextval('model_properties_id_seq'::regclass);


--
-- Name: models id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY models ALTER COLUMN id SET DEFAULT nextval('models_id_seq'::regclass);


--
-- Name: path_parameters id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY path_parameters ALTER COLUMN id SET DEFAULT nextval('path_parameters_id_seq'::regclass);


--
-- Name: paths id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY paths ALTER COLUMN id SET DEFAULT nextval('paths_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: query_parameters id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY query_parameters ALTER COLUMN id SET DEFAULT nextval('query_parameters_id_seq'::regclass);


--
-- Name: request_body_properties id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY request_body_properties ALTER COLUMN id SET DEFAULT nextval('request_body_properties_id_seq'::regclass);


--
-- Name: response_body_properties id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY response_body_properties ALTER COLUMN id SET DEFAULT nextval('response_body_properties_id_seq'::regclass);


--
-- Name: specifications id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY specifications ALTER COLUMN id SET DEFAULT nextval('specifications_id_seq'::regclass);


--
-- Name: verbs id; Type: DEFAULT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY verbs ALTER COLUMN id SET DEFAULT nextval('verbs_id_seq'::regclass);


--
-- Data for Name: examples; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY examples (id, verb_id, name, description, request, response, created_at, updated_at) FROM stdin;
3	25	Example 1	Update status	PUT /restapi/v1.0/account/1735171004/extension/~ HTTP/1.1\nAuthorization: Bearer U0pDMDFQMDFQQVMwM3xBQURiN1lJRkROUTIyby1mSHlTSHBuNHQ\nContent-Type: application/json\nContent-Length: 119\n\n{\n   "status": "Disabled",\n   "statusInfo": {\n    "reason": "Involuntary",\n    "comment": "Just banned"\n  }     \n}	HTTP/1.1 200 OK\nContent-Language: en-US\nContent-Type: application/json; charset=UTF-8\nContent-Length: 4249\n\n{\n  "uri" : "https.../restapi/v1.0/account/1735171004/extension/1735173004",\n  "id" : 1735173004,\n  "extensionNumber" : "102",\n  "contact" : {\n    "firstName" : "Jack",\n    "lastName" : "White",\n    "email" : "jack.white@mycompany.com"\n  },\n  "name" : "Jack White",\n  "type" : "User",\n  "status" : "Disabled",\n  "statusInfo" : {\n    "reason" : "Involuntary",\n    "comment" : "Just banned"\n  },\n  "serviceFeatures" : [ {\n    "featureName" : "SMS",\n    "enabled" : true\n  }, {\n    "featureName" : "SMSReceiving",\n    "enabled" : true\n  }, {\n    "featureName" : "Pager",\n    "enabled" : true\n  }, {\n    "featureName" : "PagerReceiving",\n    "enabled" : true\n  }, {\n    "featureName" : "Voicemail",\n    "enabled" : true\n  }, {\n    "featureName" : "Fax",\n    "enabled" : true\n  }, {\n    "featureName" : "FaxReceiving",\n    "enabled" : true\n  }, {\n    "featureName" : "DND",\n    "enabled" : true\n  }, {\n    "featureName" : "RingOut",\n    "enabled" : true\n  }, {\n    "featureName" : "InternationalCalling",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "Presence",\n    "enabled" : true\n  }, {\n    "featureName" : "VideoConferencing",\n    "enabled" : true\n  }, {\n    "featureName" : "SalesForce",\n    "enabled" : true\n  }, {\n    "featureName" : "Intercom",\n    "enabled" : true\n  }, {\n    "featureName" : "Paging",\n    "enabled" : true\n  }, {\n    "featureName" : "Conferencing",\n    "enabled" : true\n  }, {\n    "featureName" : "VoipCalling",\n    "enabled" : true\n  }, {\n    "featureName" : "FreeSoftPhoneLines",\n    "enabled" : true\n  }, {\n    "featureName" : "HipaaCompliance",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "CallPark",\n    "enabled" : true\n  }, {\n    "featureName" : "OnDemandCallRecording",\n    "enabled" : true\n  }, {\n    "featureName" : "Reports",\n    "enabled" : true\n  }, {\n    "featureName" : "CallForwarding",\n    "enabled" : true\n  }, {\n    "featureName" : "DeveloperPortal",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "EncryptionAtRest",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "BlockedMessageForwarding",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "EmergencyCalling",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "HDVoice",\n    "enabled" : false,\n    "reason" : "AccountTypeLimitation"\n  }, {\n    "featureName" : "SingleExtensionUI",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "CallSupervision",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "VoicemailToText",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "WebPhone",\n    "enabled" : false,\n    "reason" : "AccountLimitation"\n  }, {\n    "featureName" : "RCTeams",\n    "enabled" : true\n  } ],\n  "regionalSettings" : {\n    "timezone" : {\n      "uri" : "https.../restapi/v1.0/dictionary/timezone/14",\n      "id" : "14",\n      "name" : "Europe/Moscow",\n      "description" : "Moscow, St. Petersburg, Volgograd"\n    },\n    "homeCountry" : {\n      "uri" : "https.../restapi/v1.0/dictionary/country/1",\n      "id" : "1",\n      "name" : "United States",\n      "isoCode" : "US",\n      "callingCode" : "1"\n    },\n    "language" : {\n      "id" : "1033",\n      "name" : "English (United States)",\n      "localeCode" : "en-US"\n    },\n    "greetingLanguage" : {\n      "id" : "1033",\n      "name" : "English (United States)",\n      "localeCode" : "en-US"\n    },\n    "formattingLocale" : {\n      "id" : "1033",\n      "name" : "English (United States)",\n      "localeCode" : "en-US"\n    }\n  },\n  "setupWizardState" : "NotStarted",\n  "permissions" : {\n    "admin" : {\n      "enabled" : true\n    },\n    "internationalCalling" : {\n      "enabled" : true\n    }\n  },\n  "profileImage" : {\n    "uri" : "https.../restapi/v1.0/account/1735171004/extension/1735173004/profile-image"\n  }\n}	2016-06-21 11:01:18.127732	2016-06-21 11:01:18.127732
4	181	Example		GET /restapi/v1.0/account/402946441008/extension/402946441008/meeting HTTP/1.1\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbweWJQT2N0NHc	HTTP/1.1 200 OK\nContent-Language: en-US\nContent-Type: application/json; charset=UTF-8\n\n{\n  "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/?page=1&perPage=100",\n  "records" : [ {\n    "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/1497110573",\n    "id" : "1497110573",\n    "topic" : "My meeting #1",\n    "meetingType" : "Scheduled",\n    "password" : "123456",\n    "status" : "NotStarted",\n    "links" : {\n      "startUri" : "https.../1497110573?zpk=l044IGCQxRe4hZMsobr02CzB15ZxZqhx7P4beQiruY8.BwYAAAFUXLh6BgAAHCAkOWJkNAMNDAyOTQ2NDQxMDA4AAIB",\n      "joinUri" : "https.../1497110573?pwd=tWzAHHXJzXQ%3D"\n    },\n    "schedule" : {\n      "startTime" : "2015-11-03T12:00:00Z",\n      "durationInMinutes" : 30,\n      "timeZone" : {\n        "id" : "57"\n      }\n    },\n    "allowJoinBeforeHost" : true,\n    "startHostVideo" : true,\n    "startParticipantsVideo" : true,\n    "audioOptions" : [ "Phone", "ComputerAudio" ]\n  }, {\n    "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/1482027796",\n    "id" : "1482027796",\n    "topic" : "My meeting #2",\n    "meetingType" : "Scheduled",\n    "password" : "123456",\n    "status" : "NotStarted",\n    "links" : {\n      "startUri" : "https.../1482027796?zpk=l044IGCQxRe4hZMsobr02CzB15ZxZqhx7P4beQiruY8.BwYAAAFUXLh6BgAAHAdGQUtFX1RLAAAMNDAyOTQ2NDQxMDA4AAIB",\n      "joinUri" : "https.../j/1482027796?pwd=tWzAHHXJzXQ%3D"\n    },\n    "schedule" : {\n      "startTime" : "2015-11-03T12:00:00Z",\n      "durationInMinutes" : 30,\n      "timeZone" : {\n        "id" : "57"\n      }\n    },\n    "allowJoinBeforeHost" : true,\n    "startHostVideo" : true,\n    "startParticipantsVideo" : true,\n    "audioOptions" : [ "Phone", "ComputerAudio" ]\n  }, {\n    "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/1488807342",\n    "id" : "1488807342",\n    "topic" : "My meeting",\n    "meetingType" : "Scheduled",\n    "password" : "123456",\n    "status" : "NotStarted",\n    "links" : {\n      "startUri" : "https.../1488807342?zpk=l044IGCQxRe4hZMsobr02CzB15ZxZqhx7P4beQiruY8.BwYAAAFww0MDI5NDY0NDEwMDhiAAdGQUtFX1RLAAAMNDAyOTQ2NDQxMDA4AAIB",\n      "joinUri" : "https.../1488807342?pwd=tWzAHHXJzXQ%3D"\n    },\n    "schedule" : {\n      "startTime" : "2015-11-03T12:00:00Z",\n      "durationInMinutes" : 30,\n      "timeZone" : {\n        "id" : "57"\n      }\n    },\n    "allowJoinBeforeHost" : true,\n    "startHostVideo" : true,\n    "startParticipantsVideo" : true,\n    "audioOptions" : [ "Phone", "ComputerAudio" ]\n  } ],\n  "paging" : {\n    "page" : 1,\n    "totalPages" : 1,\n    "perPage" : 100,\n    "totalElements" : 3,\n    "pageStart" : 0,\n    "pageEnd" : 2\n  },\n  "navigation" : {\n    "firstPage" : {\n      "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/?page=1&perPage=100"\n    },\n    "lastPage" : {\n      "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/?page=1&perPage=100"\n    }\n  }\n} 	2016-06-22 03:19:43.877925	2016-06-22 03:19:43.877925
5	182	Example 1	Scheduled Meeting	POST https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting HTTP/1.1\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhtRnprYjNEMHVKM3hWJQT2N0NHc\nContent-Type: application/json\nContent-Length: 354\n\n{\n  "topic": "My meeting",\n  "meetingType": "Scheduled",\n  "schedule": {\n    "startTime": "2015-11-03T12:00:00Z",\n    "durationInMinutes": 30,\n    "timeZone": {"id" : "57"}\n  },\n  "password": "123456",\n  "allowJoinBeforeHost": true,\n  "startHostVideo": true,\n  "startParticipantsVideo": true,\n  "audioOptions": [\n    "Phone",\n    "ComputerAudio"\n   ]\n}	HTTP/1.1 201 Created\nContent-Language: en-US\nContent-Type: application/json; charset=UTF-8\n\n{\n  "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/1488807342",\n  "id" : "1488807342",\n  "topic" : "My meeting",\n  "meetingType" : "Scheduled",\n  "password" : "123456",\n  "status" : "NotStarted",\n  "links" : {\n    "startUri" : "https:.../1488807342?zpk=iLlp939Oz_nvJTdmi6Fz1NrxP4pS5KoT1ee-LpPIScw.BwYAAAFUXLhujgAAHCAkYTg4DA4AAIB",\n    "joinUri" : "https:.../1488807342?pwd=tWzAHHXJzXQ%3D"\n  },\n  "schedule" : {\n    "startTime" : "2015-11-03T12:00:00Z",\n    "durationInMinutes" : 30,\n    "timeZone" : {\n      "id" : "57"\n    }\n  },\n  "allowJoinBeforeHost" : true,\n  "startHostVideo" : true,\n  "startParticipantsVideo" : true,\n  "audioOptions" : [ "Phone", "ComputerAudio" ]\n}	2016-06-22 05:08:01.718501	2016-06-22 05:08:01.718501
6	182	Example 2	Instant Meeting	POST /restapi/v1.0/account/402946441008/extension/402946441008/meeting HTTP/1.1\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbsN3N8MG9sT3JBfGt3TUdzUVUzeVJkY2YweWJQT2N0NHc\nContent-Type: application/json\nContent-Length: 159\n\n{\n  "topic": "My meeting topic",\n  "meetingType": "Instant"                                \n}	HTTP/1.1 201 Created\nContent-Language: en-US\nContent-Type: application/json; charset=UTF-8\n\n{\n  "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/1493182856",\n  "id" : "1493182856",\n  "topic" : "My meeting topic",\n  "meetingType" : "Instant",\n  "password" : "",\n  "status" : "NotStarted",\n  "links" : {\n    "startUri" : "https.../1493182856?zpk=cKGl5Bdhqdr5JjxWhWNsW4fecMyquIHs4Rh0kiMW3fs.BwYAAAFUXDM5NS00ODQwLWI0DA4AAIB",\n    "joinUri" : "https.../1493182856"\n  },\n  "allowJoinBeforeHost" : false,\n  "startHostVideo" : true,\n  "startParticipantsVideo" : true,\n  "audioOptions" : [ "Phone", "ComputerAudio" ]\n}	2016-06-22 05:08:48.847081	2016-06-22 05:08:48.847081
7	109	Example		GET /restapi/v1.0/account/401452676008/recording/401786818008\nAuthorization: Bearer U0pDMDFQMDFKV1MwMXy9Si---LvnH71KL52CevzJvUovkt\nContent-Type=application/json;charset=UTF-8	HTTP 200 OK\n\n{\n  "id" : "401786818008",\n  "contentUri" : "https.../restapi/v1.0/account/401452676008/recording/401786818008/content",\n  "contentType" : "audio/x-wav",\n  "duration" : 30\n}	2016-06-22 05:17:49.869929	2016-06-22 05:17:49.869929
8	1	Example		GET /restapi/ HTTP/1.1\nAccept: application/json\nAuthorization: Bearer U0pDMDFQMDFQQVMwMXxBQUFWZmY4ZXoxMlhvSmlGdjlQc1	HTTP/1.1 200 OK\nDate: Mon, 13 Oct 2014 13:24:10 GMT\nRoutingKey: SJC01P01PAS01\nContent-Type: application/json\nContent-Language: en\nContent-Length: 312\n\n{\n  "uri" : "https.../restapi/",\n  "apiVersions" : [ {\n    "uri" : "https.../restapi/v1.0",\n    "versionString" : "1.0.14",\n    "releaseDate" : "2014-10-31T00:00:00.000Z",\n    "uriString" : "v1.0"\n  } ],\n  "serverVersion" : "7.0.0.551",\n  "serverRevision" : "598ed4edcc56"\n}	2016-06-23 02:12:34.538656	2016-06-23 02:12:34.538656
11	37	Example		GET /restapi/v1.0/account/~/extension/~/address-book/group/3259390008 HTTP/1.1\r\nAccept: application/json\r\nAuthorization: Bearer U0pDMDFQMDFKV1MwMnw5TRtoi76ezCY77BDaEVB4V8OiiQ	HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{\r\n  "uri" : ".../account/284818008/extension/284818008/address-book/group/3259390008",\r\n  "contacts" : {\r\n    "uri" : ".../account/284818008/extension/284818008/address-book/group/3259390008/contact"\r\n  },\r\n  "id" : 3259390008,\r\n  "notes" : "Notes",\r\n  "groupName" : "Group 1",\r\n  "contactsCount" : 2\r\n}	2016-07-15 07:13:54.129379	2016-07-15 07:13:54.129379
12	183	Example		GET /restapi/v1.0/account/402946441008/extension/402946441008/meeting/1488807342 HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhtRnprYjNEMHVKM3haOS1kWT2N0NHc	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/1488807342",\r\n  "id" : "1488807342",\r\n  "topic" : "My meeting",\r\n  "meetingType" : "Scheduled",\r\n  "password" : "123456",\r\n  "status" : "NotStarted",\r\n  "links" : {\r\n    "startUri" : "https:.../1488807342?zpk=68gQpL4dOOUGLdwzsnI-897aF_2T4VWFUpYC0DCbLc4.BwYAAAFUXMOTQ2NDQxMDA4AAIB",\r\n    "joinUri" : "https:.../1488807342?pwd=tWzAHHXJzXQ%3D"\r\n  },\r\n  "schedule" : {\r\n    "startTime" : "2015-11-03T12:00:00Z",\r\n    "durationInMinutes" : 30,\r\n    "timeZone" : {\r\n      "id" : "57"\r\n    }\r\n  },\r\n  "allowJoinBeforeHost" : true,\r\n  "startHostVideo" : true,\r\n  "startParticipantsVideo" : true,\r\n  "audioOptions" : [ "Phone", "ComputerAudio" ]\r\n}       	2016-07-15 07:36:02.914768	2016-07-15 07:36:02.914768
13	184	Example		PUT /restapi/v1.0/account/402946441008/extension/402946441008/meeting/1492807401 HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhtRnprYjkY2YweWJQT2N0NHc\r\nContent-Type: application/json\r\nContent-Length: 352\r\n\r\n{\r\n  "topic": "My awesome meeting",\r\n  "meetingType": "Scheduled",\r\n  "schedule": {\r\n    "startTime": "2016-12-03T12:00:00Z",\r\n    "durationInMinutes": 30,\r\n    "timeZone": {"id" : "1"}\r\n  },\r\n  "password": "123456",\r\n  "allowJoinBeforeHost": false,\r\n  "startHostVideo": true,\r\n  "startParticipantsVideo": true,\r\n  "audioOptions": [\r\n    "Phone",\r\n    "ComputerAudio"\r\n   ]\r\n}	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/1492807401",\r\n  "id" : "1492807401",\r\n  "topic" : "My awesome meeting",\r\n  "meetingType" : "Scheduled",\r\n  "password" : "123456",\r\n  "status" : "NotStarted",\r\n  "links" : {\r\n    "startUri" : "https:.../1492807401?zpk=9QK_uwm5ioO1MebVv45LJYq6x9twqb2PyHvMnCALnVM.BwYAAAFUXNKVugAA2NDQxMDA4AAIB",\r\n    "joinUri" : "https:.../1492807401?pwd=tWzAHHXJzXQ%3D"\r\n  },\r\n  "schedule" : {\r\n    "startTime" : "2016-12-03T12:00:00Z",\r\n    "durationInMinutes" : 30,\r\n    "timeZone" : {\r\n      "id" : "1"\r\n    }\r\n  },\r\n  "allowJoinBeforeHost" : false,\r\n  "startHostVideo" : true,\r\n  "startParticipantsVideo" : true,\r\n  "audioOptions" : [ "Phone", "ComputerAudio" ]\r\n}	2016-07-15 07:39:59.917174	2016-07-15 07:39:59.917174
14	185	Example		DELETE /restapi/v1.0/account/402946441008/extension/402946441008/meeting/1492807401 HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhtRnprYjkY2YweWJQT2N0NHc	HTTP/1.1 204 No Content	2016-07-15 07:43:41.170374	2016-07-15 07:43:41.170374
15	186	Example		POST /restapi/v1.0/account/403784066008/extension/403784066008/meeting/1486579931/end HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhEbXNST0pDbzNMNNbmRyclE\r\nContent-Type: application/json	HTTP/1.1 204 No Content	2016-07-15 07:54:05.443439	2016-07-15 07:54:05.443439
16	187	Example		GET /restapi/v1.0/account/402946441008/extension/402946441008/meeting/service-info HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhtRnprYjNEMHVKM32N0NHc	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/402946441008/extension/402946441008/meeting/service-info",\r\n  "supportUri" : "https://success.ringcentral.com",\r\n  "intlDialInNumbersUri" : "https://meetings.ringcentral.com/teleconference",\r\n  "externalUserInfo" : {\r\n    "userId" : "XWI77HvbQna0-_h3oncGTg",\r\n    "accountId" : "402946441008",\r\n    "userType" : 2,\r\n    "userToken" : "q58565aTqJAdUZ4Dv2Yzbo7lSHTWqNImGS-4ELL0YhU.CAIAAAFUXKl7CQAAAHgYYzJXNmpxaTU0aE5BeS9FeXNCQ3VBzPQ"\r\n  },\r\n  "dialInNumbers" : [ {\r\n    "phoneNumber" : "+16055623185",\r\n    "formattedNumber" : "(605) 562-3185",\r\n    "country" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/country/1",\r\n      "id" : "1",\r\n      "name" : "United States",\r\n      "isoCode" : "US",\r\n      "callingCode" : "1"\r\n    }\r\n  } ]\r\n}	2016-07-15 08:19:54.382262	2016-07-15 08:19:54.382262
17	29	Example		GET /restapi/v1.0/account/403800692008/extension/403800692008/address-book/contact?sortBy=FirstName&page=1&phoneNumber=16502223344&phoneNumber=16503334455 HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwM3xBQURIZjAzWFFySGpMMHpFRXkyWTZCbVgzYnBJYW0wWWZSX2tf	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/403800692008/extension/403800692008/address-book/contact?phoneNumber=16502223344&phoneNumber=16503334455&sortBy=FirstName",\r\n  "records" : [ {\r\n    "uri" : "https.../restapi/v1.0/account/403800692008/extension/403800692008/address-book/contact/405030022008",\r\n    "availability" : "Alive",\r\n    "id" : 405030022008,\r\n    "firstName" : "Leo",\r\n    "lastName" : "Wonders",\r\n    "birthday" : "1970-01-01T00:00:00.000Z",\r\n    "mobilePhone" : "+16503334455"\r\n  }, {\r\n    "uri" : "https.../restapi/v1.0/account/403800692008/extension/403800692008/address-book/contact/405030021008",\r\n    "availability" : "Alive",\r\n    "id" : 405030021008,\r\n    "firstName" : "Paul",\r\n    "lastName" : "Smith",\r\n    "birthday" : "1970-01-01T00:00:00.000Z",\r\n    "mobilePhone" : "+16502223344"\r\n  } ],\r\n  "paging" : {\r\n    "page" : 1,\r\n    "totalPages" : 1,\r\n    "perPage" : 100,\r\n    "totalElements" : 2,\r\n    "pageStart" : 0,\r\n    "pageEnd" : 1\r\n  },\r\n  "navigation" : {\r\n    "firstPage" : {\r\n      "uri" : "https.../restapi/v1.0/account/403800692008/extension/403800692008/address-book/contact?phoneNumber=16502223344&phoneNumber=16503334455&sortBy=FirstName&page=1&perPage=100"\r\n    },\r\n    "lastPage" : {\r\n      "uri" : "https.../restapi/v1.0/account/403800692008/extension/403800692008/address-book/contact?phoneNumber=16502223344&phoneNumber=16503334455&sortBy=FirstName&page=1&perPage=100"\r\n    }\r\n  },\r\n  "groups" : {\r\n    "uri" : "https.../restapi/v1.0/account/403800692008/extension/403800692008/address-book/group"\r\n  }\r\n}	2016-07-18 08:51:08.268203	2016-07-18 08:51:08.268203
18	7	Example		GET /restapi/v1.0/account/3003867004/service-info HTTP/1.1	HTTP/1.1 200 OK\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/3003867004/service-info",\r\n  "servicePlanName" : "RingCentral Professional",\r\n  "brand" : {\r\n    "id" : "1210",\r\n    "name" : "RingCentral",\r\n    "homeCountry" : {\r\n      "id" : "1",\r\n      "uri" : "https.../restapi/v1.0/dictionary/country/1",\r\n      "name" : "United States",\r\n      "isoCode" : "US",\r\n      "callingCode" : "1"\r\n    }\r\n  },\r\n  "servicePlan" : {\r\n    "id" : "1216",\r\n    "name" : "Professional",\r\n    "edition" : "Unknown"\r\n  },\r\n  "billingPlan" : {\r\n    "id" : "159",\r\n    "name" : "Monthly",\r\n    "durationUnit" : "Month",\r\n    "duration" : 1,\r\n    "type" : "Regular"\r\n  },\r\n  "serviceFeatures" : [ {\r\n    "featureName" : "InternationalCalling",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "Presence",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "OnDemandCallRecording",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "Fax",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "CallPark",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "FreeSoftPhoneLines",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "RCTeams",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "Calendar",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "SMSReceiving",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "Paging",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "Conferencing",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "RingOut",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "Intercom",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "BlockedMessageForwarding",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "VideoConferencing",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "EmergencyCalling",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "CallSupervision",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "WebPhone",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "HipaaCompliance",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "PagerReceiving",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "EncryptionAtRest",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "SMS",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "VoipCalling",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "HDVoice",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "SalesForce",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "Voicemail",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "CallForwarding",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "DeveloperPortal",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "VoicemailToText",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "Pager",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "UserManagement",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "DND",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "SingleExtensionUI",\r\n    "enabled" : false\r\n  }, {\r\n    "featureName" : "FaxReceiving",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "SoftPhoneUpdate",\r\n    "enabled" : true\r\n  }, {\r\n    "featureName" : "Reports",\r\n    "enabled" : true\r\n  } ],\r\n  "limits" : {\r\n    "freeSoftPhoneLinesPerExtension" : 0,\r\n    "meetingSize" : 0,\r\n    "maxMonitoredExtensionsPerUser" : 0\r\n  }\r\n}	2016-08-03 04:39:13.556298	2016-09-29 05:34:44.755591
19	20	Example		GET /restapi/v1.0/account/1729587004/dialing-plan?page=1&perPage=2 HTTP/1.1\r\nAuthorization: Bearer U0pDMDFQMDFQQVMwMnxBQURzcmlnRWM4LTJDdEJKZ003UzhJZXBxT0s	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\nContent-Length: 753\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/1729587004/dialing-plan?page=1&perPage=2",\r\n  "records" : [ {\r\n    "uri" : "https.../restapi/v1.0/dictionary/country/1",\r\n    "id" : "1",\r\n    "name" : "United States",\r\n    "isoCode" : "US",\r\n    "callingCode" : "1"\r\n  } ],\r\n  "paging" : {\r\n    "page" : 1,\r\n    "totalPages" : 1,\r\n    "perPage" : 2,\r\n    "totalElements" : 1,\r\n    "pageStart" : 0,\r\n    "pageEnd" : 0\r\n  },\r\n  "navigation" : {\r\n    "firstPage" : {\r\n      "uri" : "https.../restapi/v1.0/account/1729587004/dialing-plan?page=1&perPage=2"\r\n    },\r\n    "lastPage" : {\r\n      "uri" : "https.../restapi/v1.0/account/1729587004/dialing-plan?page=1&perPage=2"\r\n    }\r\n  }\r\n}	2016-08-10 01:11:13.700565	2016-08-10 01:11:13.700565
31	193	Example		GET /restapi/v1.0/account/1455897004/extension/1455897004/greeting/10148004 HTTP/1.1\r\nAuthorization: Bearer U0pDMDFQMDFQQVMwMXxBQURIZjAzWFFySGpMMGxPaEhMaFR0WEVYcVk1U1E	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/1455897004/extension/1455897004/greeting/10148004",\r\n  "id" : "10148004",\r\n  "type" : "Introductory",\r\n  "contentType" : "audio/wav",\r\n  "contentUri" : "https.../restapi/v1.0/account/1455897004/extension/1455897004/greeting/10148004/content"\r\n}	2016-09-23 10:41:52.039652	2016-09-23 10:41:52.039652
20	44	Example		GET /restapi/v1.0/account/401172177008/extension/401172177008/authz-profile HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwMXxBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhoellPbT	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/401172177008/extension/401172177008/authz-profile",\r\n  "permissions" : [ {\r\n    "permission" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/permission/AccountAdministration",\r\n      "id" : "AccountAdministration"\r\n    },\r\n    "scopes" : [ "Account" ]\r\n  }, {\r\n    "permission" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/permission/AccountValidation",\r\n      "id" : "AccountValidation"\r\n    },\r\n    "scopes" : [ "Account" ]\r\n  }, {\r\n    "permission" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/permission/ActiveDirectory",\r\n      "id" : "ActiveDirectory"\r\n    },\r\n    "scopes" : [ "Account" ]\r\n  }, {\r\n    "permission" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/permission/AddRemoveDevices",\r\n      "id" : "AddRemoveDevices"\r\n    },\r\n    "scopes" : [ "Account" ]\r\n  }, {\r\n    "permission" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/permission/AddRemoveGroups",\r\n      "id" : "AddRemoveGroups"\r\n    },\r\n    "scopes" : [ "NonUserExtensions" ]\r\n  }, \r\n   {...}\r\n  ]\r\n\r\n}	2016-09-09 08:35:35.472714	2016-09-09 08:35:35.472714
21	45	Example 1	If 'successful' parameter value is 'True'	GET /restapi/v1.0/account/401172177008/extension/401172177008/authz-profile/check?permissionId=ReadMessages&targetExtensionId=401172186008 HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwMXxBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhoellPbTBtendaQ	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/401172177008/extension/401172177008/authz-profile/check?permissionId=ReadMessages&targetExtensionId=401172186008",\r\n  "successful" : true,\r\n  "details" : {\r\n    "permission" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/permission/ReadMessages",\r\n      "id" : "ReadMessages"\r\n    },\r\n    "scopes" : [ "AllExtensions" ]\r\n  }\r\n}\r\n	2016-09-09 08:36:18.023579	2016-09-09 08:36:18.023579
22	45	Example 2	If 'successful' parameter value is 'False'	GET /restapi/v1.0/account/401172177008/extension/401172177008/authz-profile/check?permissionId=UserManagement&targetExtensionId=401172186008 HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwMXxBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhoellbkE	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/401172177008/extension/401172177008/authz-profile/check?permissionId=UserManagement&targetExtensionId=401172186008",\r\n  "successful" : false\r\n}	2016-09-09 08:36:49.742005	2016-09-09 08:36:49.742005
23	188	Example		GET /restapi/v1.0/account/2601711004/extension/~/answering-rule HTTP/1.1\r\nAuthorization: Bearer U0pDMDFQMDFQQVMwMXxBQUJFU3VOMlp2bjZFSGY2SUZmcEdhNHQ3W5NbXc	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\nContent-Length: 1670\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/2601711004/extension/2601711004/answering-rule?page=1&perPage=100",\r\n  "records" : [ {\r\n    "uri" : "https.../restapi/v1.0/account/2601711004/extension/2601711004/answering-rule/business-hours-rule",\r\n    "id" : "business-hours-rule",\r\n    "type" : "BusinessHours",\r\n    "enabled" : true,\r\n    "schedule" : {\r\n      "ref" : "BusinessHours"\r\n    },\r\n    "callHandlingAction" : "ForwardCalls"\r\n  }, {\r\n    "uri" : "https.../restapi/v1.0/account/2601711004/extension/2601711004/answering-rule/after-hours-rule",\r\n    "id" : "after-hours-rule",\r\n    "type" : "AfterHours",\r\n    "enabled" : true,\r\n    "schedule" : {\r\n      "ref" : "AfterHours"\r\n    },\r\n    "callHandlingAction" : "ForwardCalls"\r\n  }, {\r\n    "uri" : "https.../restapi/v1.0/account/2601711004/extension/2601711004/answering-rule/4495878004",\r\n    "id" : "4495878004",\r\n    "type" : "Custom",\r\n    "name" : "My Rule 1",\r\n    "enabled" : true,\r\n    "schedule" : { },\r\n    "calledNumbers" : [ {\r\n      "phoneNumber" : "+15397770020"\r\n    } ],\r\n    "callHandlingAction" : "ForwardCalls"\r\n  } ],\r\n  "paging" : {\r\n    "page" : 1,\r\n    "totalPages" : 1,\r\n    "perPage" : 100,\r\n    "totalElements" : 3,\r\n    "pageStart" : 0,\r\n    "pageEnd" : 2\r\n  },\r\n  "navigation" : {\r\n    "firstPage" : {\r\n      "uri" : "https.../restapi/v1.0/account/2601711004/extension/2601711004/answering-rule?page=1&perPage=100"\r\n    },\r\n    "lastPage" : {\r\n      "uri" : "https.../restapi/v1.0/account/2601711004/extension/2601711004/answering-rule?page=1&perPage=100"\r\n    }\r\n  }\r\n}	2016-09-23 08:21:51.641669	2016-09-23 08:21:51.641669
24	189	Example 1		POST /restapi/v1.0/account/400430664008/extension/400430664008/answering-rule HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwMXxBQURIZjAzWFFySGpMMHpFRXkyWTZCbVg2bHUzNUtm\r\nContent-Type: application/json\r\nContent-Length: 91\r\n\r\n{\r\n\t"callers":[\r\n\t\t{"callerId": "+46843216868"\r\n\t\t},\r\n\t\t{"callerId": "+46843216860"\r\n\t\t}\r\n\t]\r\n\t\r\n\t}	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/400430664008/extension/400430664008/answering-rule/400592844008",\r\n  "id" : "400592844008",\r\n  "type" : "Custom",\r\n  "name" : "My Rule 2",\r\n  "enabled" : true,\r\n  "callers" : [ {\r\n    "callerId" : "46843216860"\r\n  }, {\r\n    "callerId" : "46843216868"\r\n  } ],\r\n  "callHandlingAction" : "ForwardCalls",\r\n  "forwarding" : {\r\n    "notifyMySoftPhones" : true,\r\n    "notifyAdminSoftPhones" : false,\r\n    "softPhonesRingCount" : 1,\r\n    "ringingMode" : "Sequentially"\r\n  },\r\n  "voicemail" : {\r\n    "enabled" : true,\r\n    "recipient" : {\r\n      "uri" : "https.../restapi/v1.0/account/400430664008/extension/400430664008",\r\n      "id" : 400430664008\r\n    }\r\n  },\r\n  "greetings" : [ {\r\n    "type" : "Voicemail",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/65792",\r\n      "id" : "65792",\r\n      "name" : "Default"\r\n    }\r\n  }, {\r\n    "type" : "Introductory",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66301",\r\n      "id" : "66301",\r\n      "name" : "None"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingAudio",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66310",\r\n      "id" : "66310",\r\n      "name" : "Acoustic"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingMessage",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/68867",\r\n      "id" : "68867",\r\n      "name" : "Default"\r\n    }\r\n  } ]\r\n}	2016-09-23 08:37:00.895721	2016-09-23 08:37:00.895721
25	189	Example 2		POST /restapi/v1.0/account/400430664008/extension/400430664008/answering-rule HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwMXxBQURIZjAzWFFySGpMMHpFRXkyWTZCbVg2bHUzNUHc\r\nContent-Type: application/json\r\nContent-Length: 798\r\n\r\n{\r\n    "schedule": {\r\n        "weeklyRanges": {\r\n            "tuesday": [\r\n                {\r\n                    "from": "09:00",\r\n                    "to": "18:00"\r\n                }\r\n            ],\r\n            "friday": [\r\n                {\r\n                    "from": "09:00",\r\n                    "to": "18:00"\r\n                }\r\n            ],\r\n            "thursday": [\r\n                {\r\n                    "from": "09:00",\r\n                    "to": "18:00"\r\n                }\r\n            ],\r\n            "wednesday": [\r\n                {\r\n                    "from": "09:00",\r\n                    "to": "18:00"\r\n                }\r\n            ],\r\n            "monday": [\r\n                {\r\n                    "from": "09:00",\r\n                    "to": "18:00"\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\nContent-Length: 386\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/400430664008/extension/400430664008/answering-rule/400604613008",\r\n  "id" : "400604613008",\r\n  "type" : "Custom",\r\n  "name" : "My Rule 3",\r\n  "enabled" : true,\r\n  "schedule" : {\r\n    "weeklyRanges" : {\r\n      "monday" : [ {\r\n        "from" : "09:00",\r\n        "to" : "18:00"\r\n      } ],\r\n      "tuesday" : [ {\r\n        "from" : "09:00",\r\n        "to" : "18:00"\r\n      } ],\r\n      "wednesday" : [ {\r\n        "from" : "09:00",\r\n        "to" : "18:00"\r\n      } ],\r\n      "thursday" : [ {\r\n        "from" : "09:00",\r\n        "to" : "18:00"\r\n      } ],\r\n      "friday" : [ {\r\n        "from" : "09:00",\r\n        "to" : "18:00"\r\n      } ]\r\n    }\r\n  },\r\n  "callHandlingAction" : "ForwardCalls",\r\n  "forwarding" : {\r\n    "notifyMySoftPhones" : true,\r\n    "notifyAdminSoftPhones" : false,\r\n    "softPhonesRingCount" : 1,\r\n    "ringingMode" : "Sequentially"\r\n  },\r\n  "voicemail" : {\r\n    "enabled" : true,\r\n    "recipient" : {\r\n      "uri" : "https.../restapi/v1.0/account/400430664008/extension/400430664008",\r\n      "id" : 400430664008\r\n    }\r\n  }\r\n}	2016-09-23 08:37:43.670473	2016-09-23 08:37:43.670473
26	39	Example 1	Get Custom Rule	GET /restapi/v1.0/account/934789004/extension/~/answering-rule/1553002004 HTTP/1.1\r\nAuthorization: Bearer U0pDMDFQMDFQQVMwMXxBQUJFU3VOMlp2bjZFQmN4UnV6MF9QS1VJcU3c	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/934789004/extension/934789004/answering-rule/1553002004",\r\n  "id" : "1553002004",\r\n  "type" : "Custom",\r\n  "name" : "My Rule #1",\r\n  "enabled" : true,\r\n  "callers" : [ {\r\n    "callerId" : "46843216860"\r\n  }, {\r\n    "callerId" : "46843216868"\r\n  } ],\r\n  "callHandlingAction" : "ForwardCalls",\r\n  "forwarding" : {\r\n    "notifyMySoftPhones" : true,\r\n    "notifyAdminSoftPhones" : false,\r\n    "softPhonesRingCount" : 5,\r\n    "ringingMode" : "Sequentially",\r\n    "rules" : [ {\r\n      "index" : 1,\r\n      "ringCount" : 3,\r\n      "forwardingNumbers" : [ {\r\n        "uri" : "https.../restapi/v1.0/account/934789004/extension/934789004/forwarding-number/1253646004",\r\n        "id" : "1253646004",\r\n        "phoneNumber" : "+16500000001",\r\n        "label" : "Work"\r\n      } ]\r\n    }, {\r\n      "index" : 2,\r\n      "ringCount" : 4,\r\n      "forwardingNumbers" : [ {\r\n        "uri" : "https.../restapi/v1.0/account/934789004/extension/934789004/forwarding-number/1253903004",\r\n        "id" : "1253903004",\r\n        "phoneNumber" : "+16500009001",\r\n        "label" : "Home"\r\n      } ]\r\n    } ]\r\n  },\r\n  "voicemail" : {\r\n    "enabled" : true,\r\n    "recipient" : {\r\n      "uri" : "https.../restapi/v1.0/account/934789004/extension/934789004",\r\n      "id" : 934789004\r\n    }\r\n  },\r\n  "greetings" : [ {\r\n    "type" : "Voicemail",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/65792",\r\n      "id" : "65792",\r\n      "name" : "Default"\r\n    }\r\n  }, {\r\n    "type" : "Introductory",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66301",\r\n      "id" : "66301",\r\n      "name" : "None"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingAudio",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66310",\r\n      "id" : "66310",\r\n      "name" : "Acoustic"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingMessage",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/68867",\r\n      "id" : "68867",\r\n      "name" : "Default"\r\n    }\r\n  } ]\r\n}	2016-09-23 09:11:56.004814	2016-09-23 09:11:56.004814
27	39	Example 2	Get Business Hours Rule	GET /restapi/v1.0/account/2601711004/extension/~/answering-rule/business-hours-rule HTTP/1.1\r\nAuthorization: Bearer U0pDMDFQMDFQQVMwMXxBQUJFU3VOMlp2bjZFSGY2SUZmcEdhNHQ3aGdTMUTXNYYW5NbXc	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\nContent-Length: 697\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/2601711004/extension/2601711004/answering-rule/business-hours-rule",\r\n  "id" : "business-hours-rule",\r\n  "type" : "BusinessHours",\r\n  "enabled" : true,\r\n  "schedule" : {\r\n    "ref" : "BusinessHours"\r\n  },\r\n  "callHandlingAction" : "ForwardCalls",\r\n  "forwarding" : {\r\n    "notifyMySoftPhones" : true,\r\n    "notifyAdminSoftPhones" : false,\r\n    "softPhonesRingCount" : 1,\r\n    "ringingMode" : "Sequentially",\r\n    "rules" : [ ]\r\n  },\r\n    "voicemail" : {\r\n    "enabled" : true,\r\n    "recipient" : {\r\n      "uri" : "https.../restapi/v1.0/account/2601711004/extension/2601711004",\r\n      "id" : 2601711004\r\n      }\r\n     },\r\n   "greetings" : [ {\r\n    "type" : "Voicemail",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/65792",\r\n      "id" : "65792",\r\n      "name" : "Default"\r\n    }\r\n  }, {\r\n    "type" : "Introductory",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66301",\r\n      "id" : "66301",\r\n      "name" : "None"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingAudio",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66310",\r\n      "id" : "66310",\r\n      "name" : "Acoustic"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingMessage",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/68867",\r\n      "id" : "68867",\r\n      "name" : "Default"\r\n    }\r\n  } ]\r\n }	2016-09-23 09:12:27.859728	2016-09-23 09:12:27.859728
28	190	Example		PUT /restapi/v1.0/account/400750830008/extension/400750830008/answering-rule/401166074008 HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwMXxBQUJFU3VOMlp2bjZFR2VwOWp4bXpkODhxNjIwWHRaaRXc\r\nContent-Type: application/json\r\nContent-Length: 400\r\n\r\n{\r\n    "name": "My Rule #1",\r\n    "enabled" : "true",\r\n    "forwarding" : {\r\n        "notifyMySoftPhones" : true,\r\n        "softPhonesRingCount" : 5,\r\n        "ringingMode" : "Sequentially",\r\n        "rules": [\r\n       {\r\n         "index": 1,\r\n         "ringCount" : 3,\r\n         "forwardingNumbers": [ { "id": "401019103008" } ]\r\n       }, \r\n       {\r\n         "index": 2,\r\n         "forwardingNumbers": [ { "id": "401019101008" } ]\r\n       }\r\n    ]\r\n  },\r\n  "greetings" : [ {\r\n    "type" : "Voicemail",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/65792",\r\n      "id" : "65792",\r\n      "name" : "Default"\r\n    }\r\n  }, {\r\n    "type" : "Introductory",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66301",\r\n      "id" : "66301",\r\n      "name" : "None"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingAudio",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66310",\r\n      "id" : "66310",\r\n      "name" : "Acoustic"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingMessage",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/68867",\r\n      "id" : "68867",\r\n      "name" : "Default"\r\n    }\r\n  } ]\r\n}	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/400750830008/extension/400750830008/answering-rule/401166074008",\r\n  "id" : "401166074008",\r\n  "type" : "Custom",\r\n  "name" : "My Rule #1",\r\n  "enabled" : true,\r\n  "calledNumbers" : [ {\r\n    "phoneNumber" : "+13018680001"\r\n  } ],\r\n  "callHandlingAction" : "ForwardCalls",\r\n  "forwarding" : {\r\n    "notifyMySoftPhones" : true,\r\n    "notifyAdminSoftPhones" : false,\r\n    "softPhonesRingCount" : 5,\r\n    "ringingMode" : "Sequentially",\r\n    "rules" : [ {\r\n      "index" : 1,\r\n      "ringCount" : 3,\r\n      "forwardingNumbers" : [ {\r\n        "uri" : "https.../restapi/v1.0/account/400750830008/extension/400750830008/forwarding-number/401019103008",\r\n        "id" : "401019103008",\r\n        "phoneNumber" : "+16500000003",\r\n        "label" : "Home"\r\n      } ]\r\n    }, {\r\n      "index" : 2,\r\n      "ringCount" : 4,\r\n      "forwardingNumbers" : [ {\r\n        "uri" : "https.../restapi/v1.0/account/400750830008/extension/400750830008/forwarding-number/401019101008",\r\n        "id" : "401019101008",\r\n        "phoneNumber" : "+16500000001",\r\n        "label" : "Work"\r\n      } ]\r\n    } ]\r\n  },\r\n  "voicemail" : {\r\n    "enabled" : true,\r\n    "recipient" : {\r\n      "uri" : "https.../restapi/v1.0/account/400750830008/extension/400750830008",\r\n      "id" : 400750830008\r\n    } \r\n    },\r\n  "greetings" : [ {\r\n    "type" : "Voicemail",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/65792",\r\n      "id" : "65792",\r\n      "name" : "Default"\r\n    }\r\n  }, {\r\n    "type" : "Introductory",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66301",\r\n      "id" : "66301",\r\n      "name" : "None"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingAudio",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/66310",\r\n      "id" : "66310",\r\n      "name" : "Acoustic"\r\n    }\r\n  }, {\r\n    "type" : "ConnectingMessage",\r\n    "preset" : {\r\n      "uri" : "https.../restapi/v1.0/dictionary/greeting/68867",\r\n      "id" : "68867",\r\n      "name" : "Default"\r\n    }\r\n  } ]\r\n}	2016-09-23 09:16:07.474911	2016-09-23 09:16:07.474911
29	191	Example		DELETE /restapi/v1.0/account/400660389008/extension/~/answering-rule/401000267008 HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwMXxBQUJFU3VOMlp2bjZFREJ5ejN5\r\nContent-Type: application/json\r\nContent-Length: 0	HTTP/1.1 204 No Content\r\nContent-Language: en-US	2016-09-23 09:21:22.233193	2016-09-23 09:21:22.233193
30	192	Example		POST /restapi/v1.0/account/1455897004/extension/1455897004/greeting HTTP/1.1\r\nAuthorization: Bearer U0pDMDFQMDFQQVMwMXxBQURIZjAzWFFySGpMMGxPaEhMaFR0\r\nContent-Type: multipart/mixed;boundary=0123456789\r\nContent-Length: 376\r\n\r\n--0123456789\r\nContent-Disposition: form-data; name="json"\r\nContent-Type: application/json; charset=UTF-8\r\nContent-Transfer-Encoding: binary\r\n\r\n{\r\n "type": "Voicemail",\r\n "answeringRule": { "id": "2515566004" }\r\n }\r\n--0123456789\r\nContent-Disposition: form-data; name="binary"; filename="mygreeting.wav"\r\nContent-Transfer-Encoding: binary\r\nContent-Type: audio/wav\r\n\r\n<...binary data...>\r\n\r\n--0123456789--	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/1455897004/extension/1455897004/greeting/10145004",\r\n  "id" : "10145004",\r\n  "type" : "Voicemail",\r\n  "contentType" : "audio/wav",\r\n  "contentUri" : "https.../restapi/v1.0/account/1455897004/extension/1455897004/greeting/10145004/content",\r\n  "answeringRule" : {\r\n    "uri" : "https.../restapi/v1.0/account/1455897004/extension/1455897004/answering-rule/2515566004",\r\n    "id" : "2515566004"\r\n  }\r\n}	2016-09-23 09:44:35.802024	2016-09-23 09:44:35.802024
32	3	Example		POST /restapi/v1.0/account HTTP/1.1\r\nAuthorization: Bearer U0pDMDFQMDFQQVMwMXxBQUJFU3VOMlp2bj\r\nContent-Type: application/json\r\nAccept: application/json\r\n\r\n{\r\n    "serviceInfo": {\r\n        "brand": {\r\n            "id": "1230"\r\n        },\r\n        "targetServicePlan": {\r\n            "id": "1234"\r\n        }\r\n    },\r\n    "mainNumber": "18009110050",\r\n    "operator": {\r\n        "type": "DigitalUser",\r\n        "contact": {\r\n            "firstName": "Fedor",\r\n            "lastName": "Bobin",\r\n            "email": "Fedor.Bobin@mycompany.com",\r\n            "company": "MyCompany Inc.",\r\n            "businessPhone": "+19602664567",\r\n            "businessAddress": {\r\n                "street": "Broadway",\r\n                "city": "New York",\r\n                "state": "New York",\r\n                "country": "USA",\r\n                "zip": "97855"\r\n            }\r\n        },\r\n             "company": "MyCompany Inc."\r\n                },\r\n                "type": "DigitalUser",\r\n\r\n                "partnerId": "S00D0009321"\r\n                },\r\n                "reservationId":"aZU5fw5G9EjXkUkzdKsDfy/m2xRo0yWgTKrR1n/rrcY=",\r\n                "partnerId": "B00N0009123"\r\n}	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\nContent-Length: 878\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/400556227008",\r\n  "id" : 400556227008,\r\n  "operator" : {\r\n    "uri" : "https.../restapi/v1.0/account/400556227008/extension/400556227008",\r\n    "id" : 400556227008,\r\n    "partnerId" : "S00D0009321",\r\n    "extensionNumber" : "101",\r\n    "secretQuestion" : {\r\n      "id" : "1"\r\n    }\r\n  },\r\n  "mainNumber" : "18009110050",\r\n  "partnerId" : "B00N0009123",\r\n  "status" : "Initial",\r\n  "statusInfo" : {\r\n    "till" : "2015-10-24T09:18:28.000Z"\r\n  },\r\n  "serviceInfo" : {\r\n    "brand" : {\r\n      "id" : "1230",\r\n      "name" : "Business"\r\n    },\r\n    "servicePlan" : {\r\n      "id" : "1231",\r\n      "name" : "Initial Edition"\r\n    },\r\n    "targetServicePlan" : {\r\n      "id" : "1234",\r\n      "name" : "Standard Edition"\r\n    }\r\n  },\r\n  "signupInfo" : {\r\n    "tosAccepted" : true\r\n  }\r\n}	2016-09-29 05:41:08.235103	2016-09-29 05:41:08.235103
33	194	Example		GET /restapi/v1.0/subscription HTTP/1.1\r\nAuthorization: Bearer QU1TMDJQMDFQQVMwMXxBQURIZjAzWFFySGpMMHpFRXkyWTZCbVhV1RpTWc	HTTP/1.1 200 OK\r\nContent-Language: en-US\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/subscription",\r\n  "records" : [ {\r\n    "uri" : "https.../restapi/v1.0/subscription/eb709175-74a0-4099-883e-f7b93db872cd",\r\n    "id" : "eb709175-74a0-4099-883e-f7b93db872cd",\r\n    "creationTime" : "2016-04-03T11:16:19.407Z",\r\n    "status" : "Active",\r\n    "eventFilters" : [ "/restapi/v1.0/account/401094081008/extension/401094081008/incoming-call-pickup", \r\n                       "/restapi/v1.0/account/401094081008/extension/401094081008/message-store" ],\r\n    "expirationTime" : "2016-05-03T11:16:19.410Z",\r\n    "expiresIn" : 2591427,\r\n    "deliveryMode" : {\r\n      "transportType" : "PubNub/APNS",\r\n      "encryption" : false,\r\n      "address" : "1039185327791820_25067690",\r\n      "subscriberKey" : "sub-c-a41b24aa-65ca-11e5-9c7c-0619f8945a4f",\r\n      "registrationId" : "d30414dce391bbdf111f7b30e0e61444494acac555c21b38debbbb3ebe887fc0",\r\n      "certificateName" : "com.ringcentral.RingCentralMobile"\r\n    }\r\n  }, {\r\n    "uri" : "https.../restapi/v1.0/subscription/29a57435-535b-457b-a265-bb52311ac7da",\r\n    "id" : "29a57435-535b-457b-a265-bb52311ac7da",\r\n    "creationTime" : "2016-04-03T11:16:03.563Z",\r\n    "status" : "Active",\r\n    "eventFilters" : [ "/restapi/v1.0/account/401094081008/extension/401094081008/presence" ],\r\n    "expirationTime" : "2016-04-03T11:31:03.810Z",\r\n    "expiresIn" : 312,\r\n    "deliveryMode" : {\r\n      "transportType" : "PubNub",\r\n      "encryption" : true,\r\n      "address" : "1039169654747671_e12d4948",\r\n      "subscriberKey" : "sub-c-b8b9cd8c-e906-11e2-b383-02ee2ddab7fe",\r\n      "encryptionAlgorithm" : "AES",\r\n      "encryptionKey" : "lWtIUyDQfLuiXTLu1pcI2Q=="\r\n    }\r\n  }, {\r\n    "uri" : "https.../restapi/v1.0/subscription/e7a9e696-08c5-4937-a0e1-06b37995eca8",\r\n    "id" : "e7a9e696-08c5-4937-a0e1-06b37995eca8",\r\n    "creationTime" : "2016-04-03T11:16:25.142Z",\r\n    "status" : "Active",\r\n    "eventFilters" : [ "/restapi/v1.0/account/401094081008/extension/401094081008/presence", \r\n                       "/restapi/v1.0/account/401094081008/extension/401094081008/message-store" ],\r\n    "expirationTime" : "2016-04-10T11:16:25.161Z",\r\n    "expiresIn" : 604233,\r\n    "deliveryMode" : {\r\n      "transportType" : "WebHook",\r\n      "encryption" : false,\r\n      "address" : "https://consumer-host.example.com/consumer/path"\r\n      }\r\n  } ]\r\n}	2016-12-23 07:00:39.409192	2016-12-23 07:00:39.409192
34	12	Example 1	If the view parameter value is 'Simple'	GET /restapi/v1.0/account/400643090008/call-log?view=Simple&dateFrom=2015-11-24T12:07:53.175Z&dateTo=2015-11-25T12:07:53.175Z&page=1&perPage=2 HTTP/1.1	HTTP/1.1 200 OK\r\n\r\n{\r\n  "uri" : "https.../restapi/v1.0/account/400643090008/call-log?view=Simple&dateFrom=2015-11-24T12:07:53.175Z&dateTo=2015-11-25T12:07:53.175Z&page=1&perPage=2",\r\n  "records" : [ {\r\n    "uri" : "https.../restapi/v1.0/account/400643090008/call-log/IWM7cJogEv7xlu8?view=Simple",\r\n    "id" : "IWM7cJogEv7xlu8",\r\n    "sessionId" : "403631628008",\r\n    "startTime" : "2015-11-25T12:07:51.000Z",\r\n    "duration" : 10,\r\n    "type" : "Voice",\r\n    "direction" : "Outbound",\r\n    "action" : "VoIP Call",\r\n    "result" : "Call connected",\r\n    "to" : {\r\n      "phoneNumber" : "+16505556678"\r\n    },\r\n    "from" : {\r\n      "phoneNumber" : "+18883930031",\r\n      "name" : "John Smith"\r\n    }\r\n  }, {\r\n    "uri" : "https.../restapi/v1.0/account/400643090008/call-log/IWM7bHBPqeZTlu8?view=Simple",\r\n    "id" : "IWM7bHBPqeZTlu8",\r\n    "sessionId" : "403631625008",\r\n    "startTime" : "2015-11-25T12:07:51.000Z",\r\n    "duration" : 10,\r\n    "type" : "Voice",\r\n    "direction" : "Outbound",\r\n    "action" : "VoIP Call",\r\n    "result" : "Call connected",\r\n    "to" : {\r\n      "phoneNumber" : "+16504445567",\r\n      "location" : "Palo Alto, CA"\r\n    },\r\n    "from" : {\r\n      "phoneNumber" : "+18883930031",\r\n      "name" : "John Smith"\r\n    }\r\n  } ],\r\n  "paging" : {\r\n    "page" : 1,\r\n    "perPage" : 2,\r\n    "pageStart" : 0,\r\n    "pageEnd" : 1\r\n  },\r\n  "navigation" : {\r\n    "nextPage" : {\r\n      "uri" : "https.../restapi/v1.0/account/400643090008/call-log?view=Simple&dateFrom=2015-11-24T12:07:53.175Z&dateTo=2015-11-25T12:07:53.175Z&page=2&perPage=2"\r\n    },\r\n    "firstPage" : {\r\n      "uri" : "https.../restapi/v1.0/account/400643090008/call-log?view=Simple&dateFrom=2015-11-24T12:07:53.175Z&dateTo=2015-11-25T12:07:53.175Z&page=1&perPage=2"\r\n    }\r\n  }\r\n}	2016-12-29 09:06:02.864951	2016-12-29 09:06:02.864951
\.


--
-- Name: examples_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('examples_id_seq', 34, true);


--
-- Data for Name: model_properties; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY model_properties (id, model_id, "position", name, data_type, description, format, required, created_at, updated_at) FROM stdin;
6	4	0	id	string	Internal identifier of an extension		f	2016-05-09 15:58:03.52459	2016-05-09 15:58:03.52459
7	4	1	uri	string	Canonical URI of an extension		f	2016-05-09 15:58:03.528493	2016-05-09 15:58:03.528493
8	4	2	contact	ContactInfo	Contact detailed information		f	2016-05-09 15:58:03.534705	2016-05-09 15:58:03.534705
9	4	3	departments	array	Information on department extension(s), to which the requested extension belongs. Returned only for user extensions, members of department, requested by single extensionId	DepartmentInfo	f	2016-05-09 15:58:03.539468	2016-09-01 12:07:14.005324
10	4	4	extensionNumber	string	Number of department extension		f	2016-05-09 15:58:03.543219	2016-05-09 15:58:03.543219
11	4	5	name	string	Extension user name		f	2016-05-09 15:58:03.549214	2016-05-09 15:58:03.549214
12	4	6	partnerId	string	For Partner Applications Internal identifier of an extension created by partner. The RingCentral supports the mapping of accounts and stores the corresponding account ID/extension ID for each partner ID of a client application. In request URIs partner IDs are accepted instead of regular RingCentral native IDs as path parameters using pid = XXX clause. Though in response URIs contain the corresponding account IDs and extension IDs. In all request and response bodies these values are reflected via partnerId attributes of account and extension		f	2016-05-09 15:58:03.553213	2016-05-09 15:58:03.553213
13	4	7	permissions	ExtensionPermissions	Extension permissions, corresponding to the Service Web permissions 'Admin' and 'InternationalCalling'		f	2016-05-09 15:58:03.556788	2016-05-09 15:58:03.556788
14	4	8	profileImage	ProfileImageInfo	Information on profile image		f	2016-05-09 15:58:03.561129	2016-05-09 15:58:03.561129
15	4	9	references	array	List of non-RC internal identifiers assigned to an extension	ReferenceInfo	f	2016-05-09 15:58:03.567276	2016-05-09 15:58:03.567276
16	4	10	regionalSettings	RegionalSettings	Extension region data (timezone, home country, language)		f	2016-05-09 15:58:03.571122	2016-05-09 15:58:03.571122
17	4	11	serviceFeatures	array	Extension service features returned in response only when the logged-in user requests his/her own extension info, see also Extension Service Features	ExtensionServiceFeatureInfo	f	2016-05-09 15:58:03.574813	2016-05-09 15:58:03.574813
18	4	12	setupWizardState	string	Specifies extension configuration wizard state (web service setup). The default value is 'NotStarted'	'NotStarted' | 'Incomplete' | 'Completed'	f	2016-05-09 15:58:03.579305	2016-05-09 15:58:03.579305
19	4	13	status	string	Extension current state. If the status is 'Unassigned'. Returned for all extensions	'Enabled' | 'Disabled' | 'NotActivated' | 'Unassigned'	f	2016-05-09 15:58:03.584671	2016-05-09 15:58:03.584671
20	4	14	statusInfo	StatusInfo	Status information (reason, comment). Returned for 'Disabled' status only		f	2016-05-09 15:58:03.588591	2016-05-09 15:58:03.588591
21	4	15	type	string	Extension type	'User' | 'FaxUser' | 'VirtualUser' | 'DigitalUser' | 'Department' | 'Announcement' | 'Voicemail' | 'SharedLinesGroup' | 'PagingOnlyGroup' | 'IvrMenu' | 'ApplicationExtension' | 'ParkLocation'	f	2016-05-09 15:58:03.592164	2016-05-09 15:58:03.592164
22	5	0	firstName	string	For User extension type only. Extension user first name		f	2016-05-09 15:58:58.971314	2016-05-09 15:58:58.971314
23	5	1	lastName	string	For User extension type only. Extension user last name		f	2016-05-09 15:58:58.97518	2016-05-09 15:58:58.97518
24	5	2	company	string	Extension user company name		f	2016-05-09 15:58:58.980659	2016-05-09 15:58:58.980659
25	5	3	email	string	Email of extension user		f	2016-05-09 15:58:58.984553	2016-05-09 15:58:58.984553
26	5	4	businessPhone	string	Extension user contact phone number		f	2016-05-09 15:58:58.988295	2016-05-09 15:58:58.988295
27	5	5	businessAddress	ContactAddressInfo	Business address of extension user company		f	2016-05-09 15:58:58.991913	2016-05-09 15:58:58.991913
28	6	0	country	string	Country name of extension user company. Not returned for Address Book		f	2016-05-09 15:59:20.947732	2016-05-09 15:59:20.947732
29	6	1	state	string	State/province name of extension user company		f	2016-05-09 15:59:20.951588	2016-05-09 15:59:20.951588
30	6	2	city	string	City name of extension user company		f	2016-05-09 15:59:20.955124	2016-05-09 15:59:20.955124
31	6	3	street	string	Street address of extension user company		f	2016-05-09 15:59:20.959058	2016-05-09 15:59:20.959058
32	6	4	zip	string	Zip code of extension user company		f	2016-05-09 15:59:20.964267	2016-05-09 15:59:20.964267
33	7	0	id	string	Internal identifier of a department extension		f	2016-05-09 16:00:06.141054	2016-05-09 16:00:06.141054
34	7	1	uri	string	Canonical URI of a department extension		f	2016-05-09 16:00:06.144823	2016-05-09 16:00:06.144823
35	7	2	extensionNumber	string	Number of a department extension		f	2016-05-09 16:00:06.151068	2016-05-09 16:00:06.151068
36	8	0	admin	PermissionInfo	Admin permission		f	2016-05-09 16:00:43.391563	2016-05-09 16:00:43.391563
37	8	1	internationalCalling	PermissionInfo	International Calling permission		f	2016-05-09 16:00:43.395298	2016-05-09 16:00:43.395298
38	9	0	enabled	boolean	Specifies if a permission is enabled or not		f	2016-05-09 16:01:01.973407	2016-05-09 16:01:01.973407
39	10	0	uri	string	Link to a profile image. If an image is not uploaded for an extension, only uri is returned		f	2016-05-09 16:01:25.922516	2016-05-09 16:01:25.922516
40	10	1	etag	string	Identifier of an image		f	2016-05-09 16:01:25.926152	2016-05-09 16:01:25.926152
41	10	2	lastModified	string	The datetime when an image was last updated in ISO 8601 format, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-09 16:01:25.931401	2016-05-09 16:01:25.931401
42	10	3	contentType	string	The type of an image		f	2016-05-09 16:01:25.935865	2016-05-09 16:01:25.935865
43	10	4	scales	array	List of URIs to profile images in different dimensions	ImageUri	f	2016-05-09 16:01:25.939647	2016-08-31 10:06:32.662933
44	11	0	ref	string	Non-RC identifier of an extension		f	2016-05-09 16:02:22.772903	2016-05-09 16:02:22.772903
45	11	1	type	string	Type of external identifier	'PartnerId' | 'CustomerDirectoryId'	f	2016-05-09 16:02:22.776462	2016-05-09 16:02:22.776462
46	12	0	homeCountry	CountryInfo	Extension country information		f	2016-05-09 16:02:46.257844	2016-05-09 16:02:46.257844
47	12	1	timezone	TimezoneInfo	Extension timezone information		f	2016-05-09 16:02:46.26158	2016-05-09 16:02:46.26158
48	12	2	language	LanguageInfo	User interface language data		f	2016-05-09 16:02:46.265192	2016-05-09 16:02:46.265192
49	12	3	greetingLanguage	GreetingLanguageInfo	Information on language used for telephony greetings		f	2016-05-09 16:02:46.270245	2016-05-09 16:02:46.270245
50	12	4	formattingLocale	FormattingLocaleInfo	Formatting language preferences for numbers, dates and currencies		f	2016-05-09 16:02:46.275142	2016-05-09 16:02:46.275142
51	13	0	id	string	Internal identifier of a timezone		f	2016-05-09 16:03:03.588404	2016-05-09 16:03:03.588404
52	13	1	uri	string	Canonical URI of a timezone		f	2016-05-09 16:03:03.59326	2016-05-09 16:03:03.59326
53	13	2	name	string	Short name of a timezone		f	2016-05-09 16:03:03.597833	2016-05-09 16:03:03.597833
54	13	3	description	string	Meaningful description of the timezone		f	2016-05-09 16:03:03.602145	2016-05-09 16:03:03.602145
55	14	0	id	string	Internal identifier of a language		f	2016-05-09 16:03:22.911319	2016-05-09 16:03:22.911319
56	14	1	uri	string	Canonical URI of a language		f	2016-05-09 16:03:22.915142	2016-05-09 16:03:22.915142
57	14	2	greeting	boolean	Indicates whether a language is available as greeting language		f	2016-05-09 16:03:22.918841	2016-05-09 16:03:22.918841
58	14	3	formattingLocale	boolean	Indicates whether a language is available as formatting locale		f	2016-05-09 16:03:22.924016	2016-05-09 16:03:22.924016
59	14	4	localeCode	string	Localization code of a language		f	2016-05-09 16:03:22.928894	2016-05-09 16:03:22.928894
60	14	5	name	string	Official name of a language		f	2016-05-09 16:03:22.932826	2016-05-09 16:03:22.932826
61	14	6	ui	boolean	Indicates whether a language is available as UI language		f	2016-05-09 16:03:22.936757	2016-05-09 16:03:22.936757
62	15	0	id	string	Internal identifier of a greeting language		f	2016-05-09 16:03:46.512056	2016-05-09 16:03:46.512056
63	15	1	localeCode	string	Localization code of a greeting language		f	2016-05-09 16:03:46.515529	2016-05-09 16:03:46.515529
64	15	2	name	string	Official name of a greeting language		f	2016-05-09 16:03:46.519699	2016-05-09 16:03:46.519699
65	16	0	id	string	Internal identifier of a formatting language		f	2016-05-09 16:04:05.780725	2016-05-09 16:04:05.780725
66	16	1	localeCode	string	Localization code of a formatting language		f	2016-05-09 16:04:05.785502	2016-05-09 16:04:05.785502
67	16	2	name	string	Official name of a formatting language		f	2016-05-09 16:04:05.790266	2016-05-09 16:04:05.790266
68	17	0	enabled	boolean	Feature status; shows feature availability for an extension		f	2016-05-09 16:04:36.458688	2016-05-09 16:04:36.458688
69	17	1	featureName	string	Feature name, see all available values in Service Feature List		f	2016-05-09 16:04:36.4622	2016-05-09 16:04:36.4622
70	17	2	reason	string	Reason of limitation for a particular service feature. Returned only if the enabled parameter value is 'False', see Service Feature Limitations and Reasons. When retrieving service features for an extension, the reasons for the limitations, if any, are returned in response		f	2016-05-09 16:04:36.46735	2016-05-09 16:04:36.46735
71	18	0	comment	string	A free-form user comment, describing the status change reason		f	2016-05-09 16:05:10.930249	2016-05-09 16:05:10.930249
72	18	1	reason	string	Type of suspension	'Voluntarily' | 'Involuntarily'	f	2016-05-09 16:05:10.933768	2016-05-09 16:05:10.933768
73	19	0	uri	string	Canonical URI of a service info resource		f	2016-05-10 03:26:09.447432	2016-05-10 03:26:09.447432
74	19	1	billingPlan	BillingPlanInfo	Information on account billing plan		f	2016-05-10 03:26:09.451261	2016-05-10 03:26:09.451261
75	19	2	brand	BrandInfo	Information on account brand		f	2016-05-10 03:26:09.455582	2016-05-10 03:26:09.455582
76	19	3	servicePlan	ServicePlanInfo	Information on account service plan		f	2016-05-10 03:26:09.46223	2016-05-10 03:26:09.46223
77	19	4	targetServicePlan	TargetServicePlanInfo	Information on account target service plan		f	2016-05-10 03:26:09.466159	2016-05-10 03:26:09.466159
78	20	0	id	string	Internal identifier of a billing plan		f	2016-05-10 03:26:58.204119	2016-05-10 03:26:58.204119
79	20	1	name	string	Billing plan name		f	2016-05-10 03:26:58.207807	2016-05-10 03:26:58.207807
80	20	2	durationUnit	string	Duration period	'Month' | 'Day'	f	2016-05-10 03:26:58.214261	2016-05-10 03:26:58.214261
81	20	3	duration	string	Number of duration units		f	2016-05-10 03:26:58.219311	2016-05-10 03:26:58.219311
82	20	4	type	string	Billing plan type	'Initial' | 'Regular' | 'Suspended' | 'Trial' | 'TrialNoCC' | 'Free'	f	2016-05-10 03:26:58.22302	2016-05-10 03:26:58.22302
83	21	0	id	string	Internal identifier of a brand		f	2016-05-10 03:30:53.226833	2016-05-10 03:30:53.226833
84	21	1	name	string	Brand name, for example "RingCentral UK", "ClearFax"		f	2016-05-10 03:30:53.230744	2016-05-10 03:30:53.230744
85	21	2	homeCountry	CountryInfo	Home country information		f	2016-05-10 03:30:53.234554	2016-05-10 03:30:53.234554
86	22	0	id	string	Internal identifier of a home country		f	2016-05-10 03:31:35.704806	2016-05-10 03:31:35.704806
87	22	1	uri	string	Canonical URI of a home country		f	2016-05-10 03:31:35.711069	2016-05-10 03:31:35.711069
88	22	2	name	string	Official name of a home country		f	2016-05-10 03:31:35.714703	2016-05-10 03:31:35.714703
89	23	0	id	string	Internal identifier of a service plan		f	2016-05-10 05:08:27.622619	2016-05-10 05:08:27.622619
90	23	1	name	string	Name of a service plan		f	2016-05-10 05:08:27.626341	2016-05-10 05:08:27.626341
91	23	2	edition	string	Edition of a service plan		f	2016-05-10 05:08:27.631406	2016-05-10 05:08:27.631406
92	24	0	id	string	Internal identifier of a target service plan		f	2016-05-10 05:08:53.027286	2016-05-10 05:08:53.027286
93	24	1	name	string	Name of a target service plan		f	2016-05-10 05:08:53.033882	2016-05-10 05:08:53.033882
94	25	0	id	string	Internal identifier of a cal log record		f	2016-05-10 05:50:30.782176	2016-05-10 05:50:30.782176
95	25	1	uri	string	Canonical URI of a call log record		f	2016-05-10 05:50:30.789443	2016-05-10 05:50:30.789443
96	25	2	sessionId	string	Internal identifier of a call session		f	2016-05-10 05:50:30.793439	2016-05-10 05:50:30.793439
97	25	3	from	CallerInfo	Caller information		f	2016-05-10 05:50:30.797471	2016-05-10 05:50:30.797471
98	25	4	to	CallerInfo	Callee information		f	2016-05-10 05:50:30.803967	2016-05-10 05:50:30.803967
99	25	5	type	string	Call type	'Voice' | 'Fax'	f	2016-05-10 05:50:30.808302	2016-05-10 05:50:30.808302
100	25	6	direction	string	Call direction	'Inbound' | 'Outbound'	f	2016-05-10 05:50:30.812201	2016-05-10 05:50:30.812201
101	25	7	action	string	Action description of the call operation	'Unknown' | 'Phone Call' | 'Phone Login' | 'Incoming Fax' | 'Accept Call' | 'FindMe' | 'FollowMe' | 'Outgoing Fax' | 'Call Return' | 'Calling Card' | 'Ring Directly' | 'RingOut Web' | 'VoIP Call' | 'RingOut PC' | 'RingMe' | 'Transfer' | '411 Info' | 'Emergency' | 'E911 Update' | 'Support' | 'RingOut Mobile'	f	2016-05-10 05:50:30.819057	2016-05-10 05:50:30.819057
102	25	8	result	string	Status description of the call operation	'Unknown' | 'ResultInProgress' | 'Missed' | 'Call accepted' | 'Voicemail' | 'Rejected' | 'Reply' | 'Received' | 'Receive Error' | 'Fax on Demand' | 'Partial Receive' | 'Blocked' | 'Call connected' | 'No Answer' | 'International Disabled' | 'Busy' | 'Send Error' | 'Sent' | 'No fax machine' | 'ResultEmpty' | 'Account ' | 'Suspended' | 'Call Failed' | 'Call Failure' | 'Internal Error' | 'IP Phone offline' | 'Restricted Number' | 'Wrong Number' | 'Stopped' | 'Hang up' | 'Poor Line Quality' | 'Partially Sent' | 'International Restriction' | 'Abandoned' | 'Declined' | 'Fax Receipt Error' | 'Fax Send Error'	f	2016-05-10 05:50:30.823726	2016-05-11 08:37:38.818353
103	25	9	startTime	string	The call start datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-10 05:50:30.827691	2016-05-10 05:50:30.827691
104	25	10	duration	integer	Call duration in seconds		f	2016-05-10 05:50:30.833182	2016-05-10 05:50:30.833182
105	25	11	recording	RecordingInfo	Call recording data. Returned if the call is recorded, the withRecording parameter is set to 'True' in this case		f	2016-05-10 05:50:30.838894	2016-05-10 05:50:30.838894
106	25	12	lastModifiedTime	string	For 'Detailed' view only. The datetime when the call log record was modified in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-10 05:50:30.842902	2016-05-10 05:50:30.842902
107	25	13	transport	string	For 'Detailed' view only. Call transport	'PSTN' | 'VoIP'	f	2016-05-10 05:50:30.846986	2016-05-10 05:50:30.846986
108	25	14	legs	array	For 'Detailed' view only. Leg description	LegInfo	f	2016-05-10 05:50:30.854481	2016-05-10 05:50:30.854481
109	26	0	phoneNumber	string	Phone number of a party. Usually it is a plain number including country and area code like 18661234567. But sometimes it could be returned from database with some formatting applied, for example (866)123-4567. This property is filled in all cases where parties communicate by means of global phone numbers, for example when calling to direct numbers or sending/receiving SMS		f	2016-05-10 05:51:31.543969	2016-05-10 05:51:31.543969
110	26	1	extensionNumber	string	Extension short number (usually 3 or 4 digits). This property is filled when parties communicate by means of short internal numbers, for example when calling to other extension or sending/receiving Company Pager message		f	2016-05-10 05:51:31.547758	2016-05-10 05:51:31.547758
111	26	2	location	string	Contains party location (city, state) if one can be determined from phoneNumber. This property is filled only when phoneNumber is not empty and server can calculate location information from it (for example, this information is unavailable for US toll-free numbers)		f	2016-05-10 05:51:31.554179	2016-05-10 05:51:31.554179
249	48	3	subscriberKey	string	PubNub subscriber credentials required to subscribe to the channel		f	2016-05-10 11:42:34.638565	2016-05-10 11:42:34.638565
112	26	3	name	string	Symbolic name associated with a party. If the phone does not belong to the known extension, only the location is returned, the name is not determined then		f	2016-05-10 05:51:31.558972	2016-05-10 05:51:31.558972
113	27	0	action	string	Action description of the call operation	'Unknown' | 'Phone Call' | 'Phone Login' | 'Incoming Fax' | 'Accept Call' | 'FindMe' | 'FollowMe' | 'Outgoing Fax' | 'Call Return' | 'Calling Card' | 'Ring Directly' | 'RingOut Web' | 'VoIP Call' | 'RingOut PC' | 'RingMe' | 'Transfer' | '411 Info' | 'Emergency' | 'E911 Update' | 'Support' | 'RingOut Mobile'	f	2016-05-10 05:52:16.615292	2016-05-10 05:52:16.615292
114	27	1	direction	string	Call direction	'Inbound' | 'Outbound'	f	2016-05-10 05:52:16.619983	2016-05-10 05:52:16.619983
115	27	2	duration	integer	Call duration in seconds		f	2016-05-10 05:52:16.624751	2016-05-10 05:52:16.624751
116	27	3	extension	LegInfo.ExtensionInfo	Information on extension		f	2016-05-10 05:52:16.62879	2016-05-10 05:56:43.178837
117	27	4	legType	string	Leg type		f	2016-05-10 05:52:16.632861	2016-05-10 05:52:16.632861
118	27	5	startTime	string	The call start datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-10 05:52:16.637516	2016-05-10 05:52:16.637516
119	27	6	type	string	Call type	'Voice' | 'Fax'	f	2016-05-10 05:52:16.64433	2016-05-10 05:52:16.64433
120	27	7	result	string	Status description of the call operation	'Unknown' | 'ResultInProgress' | 'Missed' | 'Call accepted' | 'Voicemail' | 'Rejected' | 'Reply' | 'Received' | 'Receive Error' | 'Fax on Demand' | 'Partial Receive' | 'Blocked' | 'Call connected' | 'No Answer' | 'International Disabled' | 'Busy' | 'Send Error' | 'Sent' | 'No fax machine' | 'ResultEmpty' | 'Account ' | 'Suspended' | 'Call Failed' | 'Call Failure' | 'Internal Error' | 'IP Phone offline' | 'Restricted Number' | 'Wrong Number' | 'Stopped' | 'Hang up' | 'Poor Line Quality' | 'Partially Sent' | 'International Restriction' | 'Abandoned' | 'Declined' | 'Fax Receipt Error' | 'Fax Send Error'	f	2016-05-10 05:52:16.648495	2016-05-11 08:35:15.24823
121	27	8	from	CallerInfo	Caller information		f	2016-05-10 05:52:16.653728	2016-05-10 05:52:16.653728
122	27	9	to	CallerInfo	Callee information		f	2016-05-10 05:52:16.659719	2016-05-10 05:52:16.659719
123	27	10	transport	string	Call transport	'PSTN' | 'VoIP'	f	2016-05-10 05:52:16.663639	2016-05-10 05:52:16.663639
124	27	11	recording	RecordingInfo	Call recording data. Returned if the call is recorded		f	2016-05-10 05:52:16.667841	2016-05-10 05:52:16.667841
126	28	1	uri	string	Link to the call recording metadata resource		f	2016-05-10 05:54:24.890624	2016-05-10 05:54:24.890624
127	28	2	type	string	Indicates recording mode used	'Automatic' | 'OnDemand'	f	2016-05-10 05:54:24.895906	2016-05-10 05:54:24.895906
128	28	3	contentUri	string	Link to the call recording binary content		f	2016-05-10 05:54:24.899825	2016-05-10 05:54:24.899825
130	29	1	uri	string	Canonical URI of an extension		f	2016-05-10 05:56:14.891596	2016-05-10 05:56:14.891596
131	30	0	firstPage	Page	First page of the list		f	2016-05-10 06:00:31.26745	2016-07-18 08:18:42.69641
132	30	1	nextPage	Page	Next page of the list		f	2016-05-10 06:00:31.271382	2016-07-18 08:18:42.702211
133	30	2	previousPage	Page	Previous page of the list		f	2016-05-10 06:00:31.277383	2016-07-18 08:18:42.706207
134	30	3	lastPage	Page	Last page of the list		f	2016-05-10 06:00:31.281232	2016-07-18 08:18:42.710155
135	31	0	page	integer	The current page number. 1-indexed, so the first page is 1 by default. May be omitted if result is empty (because non-existent page was specified or perPage=0 was requested)		f	2016-05-10 06:01:03.034217	2016-05-10 06:01:03.034217
136	31	1	perPage	integer	Current page size, describes how many items are in each page. Default value is 100. Maximum value is 1000. If perPage value in the request is greater than 1000, the maximum value (1000) is applied		f	2016-05-10 06:01:03.038467	2016-05-10 06:01:03.038467
137	31	2	pageStart	integer	The zero-based number of the first element on the current page. Omitted if the page is omitted or result is empty		f	2016-05-10 06:01:03.043991	2016-05-10 06:01:03.043991
138	31	3	pageEnd	integer	The zero-based index of the last element on the current page. Omitted if the page is omitted or result is empty		f	2016-05-10 06:01:03.048308	2016-05-10 06:01:03.048308
139	31	4	totalPages	integer	The total number of pages in a dataset. May be omitted for some resources due to performance reasons		f	2016-05-10 06:01:03.052738	2016-05-10 06:01:03.052738
140	31	5	totalElements	integer	The total number of elements in a dataset. May be omitted for some resource due to performance reasons		f	2016-05-10 06:01:03.056806	2016-05-10 06:01:03.056806
141	32	0	country	string	Name of a country		f	2016-05-10 06:06:28.227048	2016-05-10 06:06:28.227048
142	32	1	state	string	Name of a state/province		f	2016-05-10 06:06:28.230928	2016-05-10 06:06:28.230928
143	32	2	city	string	Name of a city		f	2016-05-10 06:06:28.23485	2016-05-10 06:06:28.23485
144	32	3	street	string	Street address		f	2016-05-10 06:06:28.241273	2016-05-10 06:06:28.241273
145	32	4	zip	string	Zip code		f	2016-05-10 06:06:28.245213	2016-05-10 06:06:28.245213
146	33	0	id	string	Internal identifier of a message		f	2016-05-10 08:33:24.327631	2016-05-10 08:33:24.327631
147	33	1	uri	string	Canonical URI of a message		f	2016-05-10 08:33:24.333307	2016-05-10 08:33:24.333307
148	33	2	attachments	array	The list of message attachments	MessageAttachmentInfo	f	2016-05-10 08:33:24.339725	2016-05-10 08:33:24.339725
149	33	3	availability	string	Message availability status. Message in 'Deleted' state is still preserved with all its attachments and can be restored. 'Purged' means that all attachments are already deleted and the message itself is about to be physically deleted shortly	'Alive' | 'Deleted' | 'Purged'	f	2016-05-10 08:33:24.347452	2016-05-10 08:33:24.347452
150	33	4	conversationId	integer	SMS and Pager only. Identifier of the conversation the message belongs to	int64	f	2016-05-10 08:33:24.354684	2016-05-10 08:33:24.354684
151	33	5	creationTime	string	Message creation datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-10 08:33:24.362126	2016-05-10 08:33:24.362126
152	33	6	deliveryErrorCode	string	SMS only. Delivery error code returned by gateway		f	2016-05-10 08:33:24.37	2016-05-10 08:33:24.37
153	33	7	direction	string	Message direction. Note that for some message types not all directions are allowed. For example voicemail messages can be only inbound	'Inbound' | 'Outbound'	f	2016-05-10 08:33:24.378235	2016-05-10 08:33:24.378235
154	33	8	faxPageCount	integer	Fax only. Page count in fax message		f	2016-05-10 08:33:24.385626	2016-05-10 08:33:24.385626
155	33	9	faxResolution	string	Fax only. Resolution of fax message. ('High' for black and white image scanned at 200 dpi, 'Low' for black and white image scanned at 100 dpi)	'High' | 'Low'	f	2016-05-10 08:33:24.393015	2016-05-10 08:33:24.393015
156	33	10	from	MessageInfo.CallerInfo	Sender information		f	2016-05-10 08:33:24.399656	2016-05-10 14:06:43.425358
157	33	11	lastModifiedTime	string	The datetime when the message was modified on server in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-10 08:33:24.404442	2016-05-10 08:33:24.404442
158	33	12	messageStatus	string	Message status. Different message types may have different allowed status values.	'Queued' | 'Sent' | 'Delivered' | 'DeliveryFailed' | 'SendingFailed' | 'Received'	f	2016-05-10 08:33:24.412073	2016-05-10 08:33:24.412073
159	33	13	pgToDepartment	boolean	Pager only True if at least one of the message recipients is Department extension		f	2016-05-10 08:33:24.416616	2016-05-10 08:33:24.416616
160	33	14	priority	string	Message priority	'Normal' | 'High'	f	2016-05-10 08:33:24.420888	2016-05-10 08:33:24.420888
161	33	15	readStatus	string	Message read status	'Read' | 'Unread'	f	2016-05-10 08:33:24.429224	2016-05-10 08:33:24.429224
125	28	0	id	string	Internal identifier of the call recording		f	2016-05-10 05:54:24.886461	2016-12-01 08:33:36.545965
162	33	16	smsDeliveryTime	string	SMS only. The datetime when outbound SMS was delivered to recipient's handset in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. It is filled only if the carrier sends a delivery receipt to RingCentral	date-time	f	2016-05-10 08:33:24.434605	2016-05-10 08:33:24.434605
163	33	17	smsSendingAttemptsCount	integer	SMS only. Number of attempts made to send an outbound SMS to the gateway (if gateway is temporary unavailable)		f	2016-05-10 08:33:24.439046	2016-05-10 08:33:24.439046
164	33	18	subject	string	Message subject. For SMS and Pager messages it replicates message text which is also returned as an attachment		f	2016-05-10 08:33:24.446935	2016-05-10 08:33:24.446935
165	33	19	to	array	Recipient information	MessageInfo.CallerInfo	f	2016-05-10 08:33:24.453481	2016-05-11 01:38:02.785323
166	33	20	type	string	Message type	'Fax' | 'SMS' | 'VoiceMail' | 'Pager' | 'Text'	f	2016-05-10 08:33:24.459647	2016-05-10 08:33:24.459647
167	33	21	vmTranscriptionStatus	string	Voicemail only. Status of voicemail to text transcription. If VoicemailToText feature is not activated for account, the 'NotAvailable' value is returned	'NotAvailable' | 'InProgress' | 'TimedOut' | 'Completed' | 'CompletedPartially' | 'Failed'	f	2016-05-10 08:33:24.465542	2016-05-10 08:33:24.465542
168	34	0	id	string	Internal identifier of a message attachment		f	2016-05-10 08:34:00.062808	2016-05-10 08:34:00.062808
169	34	1	uri	string	Canonical URI of a message attachment		f	2016-05-10 08:34:00.070346	2016-05-10 08:34:00.070346
170	34	2	type	string	Type of message attachment	'AudioRecording' | 'AudioTranscription | 'Text' | 'SourceDocument' | 'RenderedDocument'	f	2016-05-10 08:34:00.080799	2016-05-10 08:34:00.080799
171	34	3	contentType	string	MIME type for a given attachment, for instance 'audio/wav'		f	2016-05-10 08:34:00.087381	2016-05-10 08:34:00.087381
172	34	4	vmDuration	integer	Voicemail only Duration of the voicemail in seconds		f	2016-05-10 08:34:00.092973	2016-05-10 08:34:00.092973
173	35	0	extensionNumber	string	Extension short number (usually 3 or 4 digits). This property is filled when parties communicate by means of short internal numbers, for example when calling to other extension or sending/receiving Company Pager message		f	2016-05-10 08:39:35.93487	2016-05-10 08:39:35.93487
174	35	1	location	string	Contains party location (city, state) if one can be determined from phoneNumber. This property is filled only when phoneNumber is not empty and server can calculate location information from it (for example, this information is unavailable for US toll-free numbers)		f	2016-05-10 08:39:35.94192	2016-05-10 08:39:35.94192
175	35	2	messageStatus	string	Status of a message. Returned for outbound fax messages only	'Queued' | 'Sent' | 'Delivered' | 'DeliveryFailed' | 'SendingFailed' | 'Received'	f	2016-05-10 08:39:35.948998	2016-05-10 08:39:35.948998
176	35	3	faxErrorCode	string	Fax only. Error code returned in case of fax sending failure. Returned if messageStatus value is 'SendingFailed'	'Undefined' | 'NoFaxSendPermission' | 'NoInternationalPermission' | 'NoFaxMachine' | 'OutgoingCallError' | 'RenderingFailed' | 'TooManyPages' | 'ReturnToDBQueue' | 'NoCallTime' | 'WrongNumber' | 'ProhibitedNumber' | 'InternalError' | 'FaxSendingProhibited' | 'ThePhoneIsBlacklisted' | 'UserNotFound' | 'ConvertError' | 'DBGeneralError' | 'SkypeBillingFailed' | 'AccountSuspended' | 'ProhibitedDestination' | 'InternationalDisabled'	f	2016-05-10 08:39:35.957059	2016-05-10 08:39:35.957059
177	35	4	name	string	Symbolic name associated with a party. If the phone does not belong to the known extension, only the location is returned, the name is not determined then		f	2016-05-10 08:39:35.965082	2016-05-10 08:39:35.965082
178	35	5	phoneNumber	string	Phone number of a party. Usually it is a plain number including country and area code like 18661234567. But sometimes it could be returned from database with some formatting applied, for example (866)123-4567. This property is filled in all cases where parties communicate by means of global phone numbers, for example when calling to direct numbers or sending/receiving SMS		f	2016-05-10 08:39:35.97353	2016-05-10 08:39:35.97353
179	36	0	id	string	Internal identifier of a forwarding/call flip phone number		f	2016-05-10 08:46:34.362182	2016-05-10 08:46:34.362182
180	36	1	uri	string	Canonical URI of a forwarding/call flip phone number		f	2016-05-10 08:46:34.367299	2016-05-10 08:46:34.367299
181	36	2	phoneNumber	string	Forwarding/Call flip phone number		f	2016-05-10 08:46:34.373863	2016-05-10 08:46:34.373863
182	36	3	label	string	Forwarding/Call flip number title		f	2016-05-10 08:46:34.381982	2016-05-10 08:46:34.381982
183	36	4	features	string	Type of option this phone number is used for. Multiple values are accepted	'CallFlip' | 'CallForwarding'	f	2016-05-10 08:46:34.389708	2016-05-10 08:46:34.389708
184	36	5	flipNumber	integer	Number assigned to the call flip phone number, corresponds to the shortcut dial number		f	2016-05-10 08:46:34.397526	2016-05-10 08:46:34.397526
186	37	1	country	CountryInfo	Brief information on a phone number country		f	2016-05-10 09:22:02.153658	2016-05-10 09:22:02.153658
187	37	2	extension	PhoneNumberInfo.ExtensionInfo	Information on the extension, to which the phone number is assigned. Returned only for the request of Account phone number list		f	2016-05-10 09:22:02.159056	2016-05-10 14:01:40.273687
188	37	3	features	array	Indicates if this phone number is enabled to appear as CallerId and/or to send outbound SMS from it. Returned only for the request of Extension phone number list	string	f	2016-05-10 09:22:02.167661	2016-05-10 09:23:20.804246
189	37	4	location	string	Location (City, State). Filled for local US numbers		f	2016-05-10 09:22:02.174051	2016-05-10 09:22:02.174051
190	37	5	paymentType	string	Payment type. 'External' is returned for forwarded numbers which are not terminated in the RingCentral phone system	'External' | 'TollFree' | 'Local'	f	2016-05-10 09:22:02.182138	2016-05-10 09:22:02.182138
191	37	6	phoneNumber	string	Phone number		f	2016-05-10 09:22:02.187736	2016-05-10 09:22:02.187736
192	37	7	status	string	Status of a phone number. If the value is 'Normal', the phone number is ready to be used. Otherwise it is an external number not yet ported to RingCentral		f	2016-05-10 09:22:02.197951	2016-05-10 09:22:02.197951
193	37	8	type	string	Phone number type	'VoiceFax' | 'FaxOnly' | 'VoiceOnly'	f	2016-05-10 09:22:02.206418	2016-05-10 09:22:02.206418
194	37	9	usageType	string	Usage type of the phone number	'MainCompanyNumber' | 'AdditionalCompanyNumber' | 'CompanyNumber' | 'DirectNumber' | 'CompanyFaxNumber' | 'ForwardedNumber'	f	2016-05-10 09:22:02.218884	2016-05-10 09:22:02.218884
195	38	0	id	string	Internal identifier of an extension		f	2016-05-10 09:24:23.56795	2016-05-10 09:24:23.56795
196	38	1	uri	string	Canonical URI of an extension		f	2016-05-10 09:24:23.57303	2016-05-10 09:24:23.57303
197	38	2	extensionNumber	string	Number of department extension		f	2016-05-10 09:24:23.577715	2016-05-10 09:24:23.577715
198	38	3	partnerId	string	For Partner Applications Internal identifier of an extension created by partner. The RingCentral supports the mapping of accounts and stores the corresponding account ID/extension ID for each partner ID of a client application. In request URIs partner IDs are accepted instead of regular RingCentral native IDs as path parameters using pid = XXX clause. Though in response URIs contain the corresponding account IDs and extension IDs. In all request and response bodies these values are reflected via partnerId attributes of account and extension		f	2016-05-10 09:24:23.587771	2016-05-10 09:24:23.587771
199	39	0	uri	string	Canonical URI of a presence info resource		f	2016-05-10 09:28:11.956418	2016-05-10 09:28:11.956418
200	39	1	allowSeeMyPresence	boolean	If 'True' enables other extensions to see the extension presence status		f	2016-05-10 09:28:11.962856	2016-05-10 09:28:11.962856
722	162	4	sequence	integer	Order number of a notification to state the chronology		f	2016-10-27 08:58:37.934706	2016-10-27 08:58:37.934706
201	39	2	dndStatus	string	Extended DnD (Do not Disturb) status. Cannot be set for Department/Announcement/Voicemail (Take Messages Only)/Fax User/Shared Lines Group/Paging Only Group/IVR Menu/Application Extension/Park Location extensions. The 'DoNotAcceptDepartmentCalls' and 'TakeDepartmentCallsOnly' values are applicable only for extensions - members of a Department; if these values are set for department outsiders, the 400 Bad Request error code is returned. The 'TakeDepartmentCallsOnly' status can be set through the old RingCentral user interface and is available for some migrated accounts only.	'TakeAllCalls' | 'DoNotAcceptAnyCalls' | 'DoNotAcceptDepartmentCalls' | 'TakeDepartmentCallsOnly'	f	2016-05-10 09:28:11.96761	2016-05-10 09:28:11.96761
202	39	3	extension	PresenceInfo.ExtensionInfo	Information on extension, for which this presence data is returned		f	2016-05-10 09:28:11.973451	2016-05-10 14:04:49.553601
203	39	4	message	string	Custom status message (as previously published by user)		f	2016-05-10 09:28:11.979873	2016-05-10 09:28:11.979873
204	39	5	pickUpCallsOnHold	boolean	If 'True' enables the extension user to pick up a monitored line on hold		f	2016-05-10 09:28:11.984439	2016-05-10 09:28:11.984439
205	39	6	presenceStatus	string	Aggregated presence status, calculated from a number of sources	'Offline' | 'Busy' | 'Available'	f	2016-05-10 09:28:11.990955	2016-05-10 09:28:11.990955
206	39	7	ringOnMonitoredCall	boolean	If 'True' enables to ring extension phone, if any user monitored by this extension is ringing		f	2016-05-10 09:28:11.996975	2016-05-10 09:28:11.996975
207	39	8	telephonyStatus	string	Telephony presence status	'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'	f	2016-05-10 09:28:12.001696	2016-05-10 09:28:12.001696
208	39	9	userStatus	string	User-defined presence status (as previously published by the user)	'Offline' | 'Busy' | 'Available'	f	2016-05-10 09:28:12.009849	2016-05-10 09:28:12.009849
209	40	0	id	string	Internal identifier of an extension		f	2016-05-10 09:29:17.459403	2016-05-10 09:29:17.459403
210	40	1	uri	string	Canonical URI of an extension		f	2016-05-10 09:29:17.466784	2016-05-10 09:29:17.466784
211	40	2	extensionNumber	string	Extension number (usually 3 or 4 digits)		f	2016-05-10 09:29:17.471751	2016-05-10 09:29:17.471751
212	41	0	id	string	Internal identifier of a RingOut call		f	2016-05-10 09:36:43.536046	2016-05-10 09:36:43.536046
213	41	1	status	RingOutStatusInfo	RingOut status information		f	2016-05-10 09:36:43.540591	2016-05-10 09:36:43.540591
214	42	0	callStatus	string	Status of a call	'Invalid' | 'Success' | 'InProgress' | 'Busy' | 'NoAnswer' | 'Rejected' | 'GenericError' | 'Finished' | 'InternationalDisabled' | 'DestinationBlocked' | 'NotEnoughFunds' | 'NoSuchUser'	f	2016-05-10 09:37:10.223664	2016-05-10 09:37:10.223664
215	42	1	callerStatus	string	Status of a calling party	'Invalid' | 'Success' | 'InProgress' | 'Busy' | 'NoAnswer' | 'Rejected' | 'GenericError' | 'Finished' | 'InternationalDisabled' | 'DestinationBlocked' | 'NotEnoughFunds' | 'NoSuchUser'	f	2016-05-10 09:37:10.231128	2016-05-10 09:37:10.231128
216	42	2	calleeStatus	string	Status of a called party	'Invalid' | 'Success' | 'InProgress' | 'Busy' | 'NoAnswer' | 'Rejected' | 'GenericError' | 'Finished' | 'InternationalDisabled' | 'DestinationBlocked' | 'NotEnoughFunds' | 'NoSuchUser'	f	2016-05-10 09:37:10.235781	2016-05-10 09:37:10.235781
217	43	0	id	string	Internal identifier of a country		f	2016-05-10 10:56:18.113382	2016-05-10 10:56:18.113382
218	43	1	uri	string	Canonical URI of a country		f	2016-05-10 10:56:18.119676	2016-05-10 10:56:18.119676
219	43	2	callingCode	string	Country calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes		f	2016-05-10 10:56:18.124673	2016-05-10 10:56:18.124673
220	43	3	emergencyCalling	boolean	Emergency calling feature availability/emergency address requirement indicator		f	2016-05-10 10:56:18.128936	2016-05-10 10:56:18.128936
221	43	4	isoCode	string	Country code according to the ISO standard, see ISO 3166		f	2016-05-10 10:56:18.13517	2016-05-10 10:56:18.13517
222	43	5	name	string	Official name of a country		f	2016-05-10 10:56:18.139405	2016-05-10 10:56:18.139405
223	43	6	numberSelling	boolean	Determines whether phone numbers are available for a country		f	2016-05-10 10:56:18.143583	2016-05-10 10:56:18.143583
224	43	7	loginAllowed	boolean	Specifies whether login with the phone numbers of this country is enabled or not		f	2016-05-10 10:56:18.148934	2016-05-10 10:56:18.148934
225	44	0	uri	string	Canonical URI of a location		f	2016-05-10 11:17:41.735225	2016-05-10 11:17:41.735225
226	44	1	areaCode	string	Area code of the location		f	2016-05-10 11:17:41.740194	2016-05-10 11:17:41.740194
227	44	2	city	string	Official name of the city, belonging to the certain state		f	2016-05-10 11:17:41.748458	2016-05-10 11:17:41.748458
228	44	3	npa	string	Area code of the location (3-digit usually), according to the NANP number format, that can be summarized as NPA-NXX-xxxx and covers Canada, the United States, parts of the Caribbean Sea, and some Atlantic and Pacific islands. See for details North American Numbering Plan		f	2016-05-10 11:17:41.753849	2016-05-10 11:17:41.753849
229	44	4	nxx	string	Central office code of the location, according to the NANP number format, that can be summarized as NPA-NXX-xxxx and covers Canada, the United States, parts of the Caribbean Sea, and some Atlantic and Pacific islands. See for details North American Numbering Plan		f	2016-05-10 11:17:41.761303	2016-05-10 11:17:41.761303
230	44	5	state	string	ID and URI of the state this location belongs to, see State Info		f	2016-05-10 11:17:41.769484	2016-05-10 11:17:41.769484
231	45	0	id	string	Internal identifier of a state		f	2016-05-10 11:25:10.565326	2016-05-10 11:25:10.565326
232	45	1	uri	string	Canonical URI of a state		f	2016-05-10 11:25:10.573064	2016-05-10 11:25:10.573064
233	45	2	country	StateInfo.CountryInfo	Information on a country the state belongs to		f	2016-05-10 11:25:10.577314	2016-05-10 14:03:49.51493
234	45	3	isoCode	string	Short code for a state (2-letter usually)		f	2016-05-10 11:25:10.586372	2016-05-10 11:25:10.586372
235	45	4	name	string	Official name of a state		f	2016-05-10 11:25:10.593549	2016-05-10 11:25:10.593549
236	46	0	id	string	Internal identifier of a state		f	2016-05-10 11:27:06.562571	2016-05-10 11:27:06.562571
237	46	1	uri	string	Canonical URI of a state		f	2016-05-10 11:27:06.5673	2016-05-10 11:27:06.5673
238	47	0	id	string	Internal identifier of a subscription		f	2016-05-10 11:41:32.612578	2016-05-10 11:41:32.612578
239	47	1	uri	string	Canonical URI of a subscription		f	2016-05-10 11:41:32.617862	2016-05-10 11:41:32.617862
240	47	2	eventFilters	array	Collection of URIs to API resources (message-store/presence/detailed presence)	string	f	2016-05-10 11:41:32.625666	2016-05-10 11:41:32.625666
241	47	3	expirationTime	string	Subscription expiration datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-10 11:41:32.634249	2016-05-10 11:41:32.634249
242	47	4	expiresIn	integer	Subscription lifetime in seconds. The default value is 900		f	2016-05-10 11:41:32.642076	2016-05-10 11:41:32.642076
243	47	5	status	string	Subscription status	'Active' | 'Suspended'	f	2016-05-10 11:41:32.654614	2016-05-10 11:41:32.654614
244	47	6	creationTime	string	Subscription creation datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-10 11:41:32.666408	2016-05-10 11:41:32.666408
245	47	7	deliveryMode	DeliveryMode	Delivery mode data		f	2016-05-10 11:41:32.679706	2016-05-10 11:41:32.679706
246	48	0	transportType	string	Notifications transportation provider name. 'APNS' (Apple Push Notifications Service)	'PubNub' | 'APNS' | 'PubNub/APNS/VoIP'	f	2016-05-10 11:42:34.617114	2016-05-10 11:42:34.617114
247	48	1	encryption	boolean	Optional parameter. Specifies if the message will be encrypted or not. For APNS transport type the value is always "false"		f	2016-05-10 11:42:34.622213	2016-05-10 11:42:34.622213
248	48	2	address	string	PubNub channel name. For APNS transport type - internal identifier of a device "device_token"		f	2016-05-10 11:42:34.631221	2016-05-10 11:42:34.631221
250	48	4	secretKey	string	PubNub subscriber credentials required to subscribe to the channel. Optional (for PubNub transport type only)		f	2016-05-10 11:42:34.650627	2016-05-10 11:42:34.650627
251	48	5	encryptionAlgorithm	string	Encryption algorithm 'AES' (for PubNub transport type only)		f	2016-05-10 11:42:34.658519	2016-05-10 11:42:34.658519
252	48	6	encryptionKey	string	Key for notification message decryption (for PubNub transport type only)		f	2016-05-10 11:42:34.67059	2016-05-10 11:42:34.67059
253	49	0	id	string	Internal identifier of a cal log record		f	2016-05-10 14:28:28.765717	2016-05-10 14:28:28.765717
254	49	1	uri	string	Canonical URI of a call log record		f	2016-05-10 14:28:28.771052	2016-05-10 14:28:28.771052
255	49	2	sessionId	string	Internal identifier of a call session		f	2016-05-10 14:28:28.774683	2016-05-10 14:28:28.774683
256	49	3	from	CallerInfo	Caller information		f	2016-05-10 14:28:28.778454	2016-05-10 14:28:28.778454
257	49	4	to	CallerInfo	Callee information		f	2016-05-10 14:28:28.78525	2016-05-10 14:28:28.78525
258	49	5	type	string	Call type	'Voice' | 'Fax'	f	2016-05-10 14:28:28.789035	2016-05-10 14:28:28.789035
259	49	6	direction	string	Call direction	'Inbound' | 'Outbound'	f	2016-05-10 14:28:28.792877	2016-05-10 14:28:28.792877
260	49	7	action	string	Action description of the call operation	'Unknown' | 'Phone Call' | 'Phone Login' | 'Incoming Fax' | 'Accept Call' | 'FindMe' | 'FollowMe' | 'Outgoing Fax' | 'Call Return' | 'Calling Card' | 'Ring Directly' | 'RingOut Web' | 'VoIP Call' | 'RingOut PC' | 'RingMe' | 'Transfer' | '411 Info' | 'Emergency' | 'E911 Update' | 'Support' | 'RingOut Mobile'	f	2016-05-10 14:28:28.797072	2016-05-10 14:28:28.797072
261	49	8	result	string	Status description of the call operation	'Unknown' | 'ResultInProgress' | 'Missed' | 'Call accepted' | 'Voicemail' | 'Rejected' | 'Reply' | 'Received' | 'Receive Error' | 'Fax on Demand' | 'Partial Receive' | 'Blocked' | 'Call connected' | 'No Answer' | 'International Disabled' | 'Busy' | 'Send Error' | 'Sent' | 'No fax machine' | 'ResultEmpty' | 'Account ' | 'Suspended' | 'Call Failed' | 'Call Failure' | 'Internal Error' | 'IP Phone offline' | 'Restricted Number' | 'Wrong Number' | 'Stopped' | 'Hang up' | 'Poor Line Quality' | 'Partially Sent' | 'International Restriction' | 'Abandoned' | 'Declined' | 'Fax Receipt Error' | 'Fax Send Error'	f	2016-05-10 14:28:28.803244	2016-05-11 08:39:36.333127
262	49	9	startTime	string	The call start datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-10 14:28:28.807229	2016-05-10 14:28:28.807229
263	49	10	duration	integer	Call duration in seconds		f	2016-05-10 14:28:28.810776	2016-05-10 14:28:28.810776
264	49	11	recording	RecordingInfo	Call recording data. Returned if the call is recorded		f	2016-05-10 14:28:28.814999	2016-05-10 14:28:28.814999
265	50	0	uri	string	Canonical URI of the API version		f	2016-05-10 14:36:17.538559	2016-05-10 14:36:17.538559
266	50	1	apiVersions	array	Full API version information: uri, number, release date	VersionInfo	f	2016-05-10 14:36:17.542373	2016-05-10 14:36:17.542373
267	50	2	serverVersion	string	Server version		f	2016-05-10 14:36:17.545895	2016-05-10 14:36:17.545895
268	50	3	serverRevision	string	Server revision		f	2016-05-10 14:36:17.550808	2016-05-10 14:36:17.550808
269	51	0	uri	string	Canonical URI of API versions		f	2016-05-10 14:36:39.421618	2016-05-10 14:36:39.421618
270	51	1	versionString	string	Version of the RingCentral REST API		f	2016-05-10 14:36:39.425358	2016-05-10 14:36:39.425358
271	51	2	releaseDate	string	Release date of this version		f	2016-05-10 14:36:39.428946	2016-05-10 14:36:39.428946
272	51	3	uriString	string	URI part determining the current version		f	2016-05-10 14:36:39.43534	2016-05-10 14:36:39.43534
273	52	0	id	string	Internal identifier of an account		f	2016-05-10 14:40:52.166656	2016-05-10 14:40:52.166656
274	52	1	uri	string	Canonical URI of an account		f	2016-05-10 14:40:52.170194	2016-05-10 14:40:52.170194
275	52	2	mainNumber	string	Main phone number of the current account		f	2016-05-10 14:40:52.173822	2016-05-10 14:40:52.173822
276	52	3	operator	ExtensionInfo	Operator's extension information. This extension will receive all calls and messages intended for the operator		f	2016-05-10 14:40:52.179694	2016-05-10 14:40:52.179694
277	52	4	partnerId	string	Additional account identifier, developed and applied by the client		f	2016-05-10 14:40:52.184988	2016-05-10 14:40:52.184988
278	52	5	serviceInfo	Account.ServiceInfo	Account service information, including brand, service plan and billing plan		f	2016-05-10 14:40:52.188532	2016-09-29 05:44:07.180896
279	52	6	setupWizardState	string	Specifies account configuration wizard state (web service setup). The default value is 'NotStarted'	'NotStarted' | 'Incomplete' | 'Completed'	f	2016-05-10 14:40:52.192367	2016-05-10 14:40:52.192367
280	52	7	status	string	Status of the current account	'Confirmed' | 'Disabled'	f	2016-05-10 14:40:52.199414	2016-05-10 14:40:52.199414
281	52	8	statusInfo	StatusInfo	Status information (reason, comment, lifetime). Returned for 'Disabled' status only		f	2016-05-10 14:40:52.203182	2016-05-10 14:40:52.203182
282	53	0	phoneNumber	string	Phone number in E.164 format		f	2016-05-12 02:42:42.07541	2016-05-12 02:42:42.07541
283	53	1	forwardingNumberId	string	Internal identifier of a forwarding number; returned in response in the id field. Can be specified instead of the phoneNumber attribute		f	2016-05-12 02:42:42.079298	2016-05-12 02:42:42.079298
284	54	0	phoneNumber	string	Phone number in E.164 format		f	2016-05-12 02:43:04.893749	2016-05-12 02:43:04.893749
285	55	0	id	string	Dialing plan country identifier		f	2016-05-12 02:44:01.960084	2016-05-12 02:44:01.960084
286	56	0	transportType	string	Notifications transportation provider name. 'APNS' (Apple Push Notifications Service)	'PubNub' | 'APNS' | 'PubNub/APNS/VoIP'	f	2016-05-12 03:00:34.349272	2016-05-12 03:00:34.349272
287	56	1	encryption	boolean	Optional parameter. Specifies if the message will be encrypted or not. If request contains any presence event filter the value by default is 'True' (even if specified as 'false'). If request contains only message event filters the value by default is 'False'		f	2016-05-12 03:00:34.353684	2016-05-12 03:00:34.353684
288	57	0	id	string	Internal identifier of an extension		f	2016-05-12 07:43:42.439121	2016-05-12 07:43:42.439121
289	57	1	uri	string	Canonical URI of an extension		f	2016-05-12 07:43:42.443889	2016-05-12 07:43:42.443889
290	57	2	extensionNumber	string	Number of department extension		f	2016-05-12 07:43:42.447701	2016-05-12 07:43:42.447701
291	57	3	partnerId	string	For Partner Applications Internal identifier of an extension created by partner. The RingCentral supports the mapping of accounts and stores the corresponding account ID/extension ID for each partner ID of a client application. In request URIs partner IDs are accepted instead of regular RingCentral native IDs as path parameters using pid = XXX clause. Though in response URIs contain the corresponding account IDs and extension IDs. In all request and response bodies these values are reflected via partnerId attributes of account and extension		f	2016-05-12 07:43:42.451459	2016-05-12 07:43:42.451459
292	58	0	id	string	Internal identifier of a device		f	2016-05-12 07:46:51.260868	2016-05-12 07:46:51.260868
293	58	1	uri	string	Canonical URI of a device		f	2016-05-12 07:46:51.265745	2016-05-12 07:46:51.265745
294	58	2	sku	string	Device identification number (stock keeping unit) in the format TP-ID [-AT-AC], where TP is device type (HP for RC HardPhone, DV for all other devices including softphone); ID - device model ID; AT -addon type ID; AC - addon count (if any). For example 'HP-56-2-2'		f	2016-05-12 07:46:51.269704	2016-05-12 07:46:51.269704
295	58	3	type	string	Device type. The default value is 'HardPhone'	'SoftPhone' | 'OtherPhone' | 'HardPhone'	f	2016-05-12 07:46:51.273252	2016-05-12 07:46:51.273252
296	58	4	name	string	Device name. Mandatory if ordering "SoftPhone" or "OtherPhone". Optional for "HardPhone". If not specified for HardPhone, then device "model" name is used as device "name"		f	2016-05-12 07:46:51.27988	2016-05-12 07:46:51.27988
297	58	5	serial	string	Serial number for HardPhone (is returned only when the phone is shipped and provisioned); endpoint_id for softphone and mobile applications		f	2016-05-12 07:46:51.283481	2016-05-12 07:46:51.283481
298	58	6	computerName	string	PC name for softphone		f	2016-05-12 07:46:51.287078	2016-05-12 07:46:51.287078
299	58	7	model	ModelInfo	HardPhone model information		f	2016-05-12 07:46:51.290536	2016-05-12 07:46:51.290536
300	58	8	extension	DeviceInfo.ExtensionInfo	This attribute can be omitted for unassigned devices		f	2016-05-12 07:46:51.297067	2016-05-12 07:59:33.675129
301	58	9	emergencyServiceAddress	EmergencyAddressInfo	Address for emergency cases. The same emergency address is assigned to all the numbers of one device		f	2016-05-12 07:46:51.300783	2016-05-12 07:46:51.300783
302	58	10	phoneLines	PhoneLinesInfo	Phone lines information		f	2016-05-12 07:46:51.304369	2016-05-12 07:46:51.304369
303	58	11	shipping	ShippingInfo	Shipping information, according to which devices (in case of "HardPhone") or e911 stickers (in case of "SoftPhone" and "OtherPhone") will be delivered to the customer		f	2016-05-12 07:46:51.307947	2016-05-12 07:46:51.307947
304	58	12	boxBillingId	integer	Box billing identifier of a device. Applicable only for HardPhones. It is an alternative way to identify the device to be ordered. Either "model" structure, or "boxBillingId" must be specified for HardPhone		f	2016-05-12 07:46:51.314049	2016-05-12 07:46:51.314049
305	59	0	id	string	Device model identifier. Mandatory when ordering a HardPhone if boxBillingId is not used for ordering		f	2016-05-12 07:50:53.878098	2016-05-12 07:50:53.878098
306	59	1	name	string	Device name		f	2016-05-12 07:50:53.882203	2016-05-12 07:50:53.882203
307	59	2	addons	array	Addons description	AddonInfo	f	2016-05-12 07:50:53.88732	2016-05-12 07:50:53.88732
308	60	0	id	string	Addon identifier. For HardPhones of certain types, which are compatible with this addon identifier		f	2016-05-12 07:51:09.876358	2016-05-12 07:51:09.876358
309	60	1	count	integer	Number of addons. For HardPhones of certain types, which are compatible with such addon identifier		f	2016-05-12 07:51:09.88024	2016-05-12 07:51:09.88024
310	61	0	id	string	Internal identifier of an extension		f	2016-05-12 07:53:35.185024	2016-05-12 07:53:35.185024
311	61	1	uri	string	Canonical URI of an extension		f	2016-05-12 07:53:35.189885	2016-05-12 07:53:35.189885
312	61	2	extensionNumber	string	Number of department extension		f	2016-05-12 07:53:35.194745	2016-05-12 07:53:35.194745
313	61	3	partnerId	string	For Partner Applications Internal identifier of an extension created by partner. The RingCentral supports the mapping of accounts and stores the corresponding account ID/extension ID for each partner ID of a client application. In request URIs partner IDs are accepted instead of regular RingCentral native IDs as path parameters using pid = XXX clause. Though in response URIs contain the corresponding account IDs and extension IDs. In all request and response bodies these values are reflected via partnerId attributes of account and extension		f	2016-05-12 07:53:35.198671	2016-05-12 07:53:35.198671
314	62	0	customerName	string	Name of a customer		f	2016-05-12 07:54:43.116013	2016-05-12 07:54:43.116013
315	62	1	street	string	Street address, line 1 - street address, P.O. box, company name, c/o		f	2016-05-12 07:54:43.119831	2016-05-12 07:54:43.119831
316	62	2	street2	string	Street address, line 2 - apartment, suite, unit, building, floor, etc.		f	2016-05-12 07:54:43.123314	2016-05-12 07:54:43.123314
317	62	3	city	string	City name		f	2016-05-12 07:54:43.129238	2016-05-12 07:54:43.129238
318	62	4	state	string	State/province name		f	2016-05-12 07:54:43.132798	2016-05-12 07:54:43.132798
319	62	5	zip	string	Zip code		f	2016-05-12 07:54:43.136583	2016-05-12 07:54:43.136583
320	62	6	country	string	Country name		f	2016-05-12 07:54:43.140276	2016-05-12 07:54:43.140276
321	63	0	lineType	string	Type of phone line	'Standalone' | 'StandaloneFree' | 'BlaPrimary' | 'BlaSecondary'	f	2016-05-12 07:57:28.44084	2016-05-12 07:57:28.44084
322	63	1	phoneInfo	PhoneLinesInfo.PhoneNumberInfo	Phone number information		f	2016-05-12 07:57:28.444598	2016-05-12 07:57:28.444598
324	64	1	country	CountryInfo	Brief information on a phone number country		f	2016-05-12 07:58:11.245131	2016-05-12 07:58:11.245131
325	64	2	location	string	Location (City, State). Filled for local US numbers		f	2016-05-12 07:58:11.249022	2016-05-12 07:58:11.249022
326	64	3	paymentType	string	Payment type. 'External' is returned for forwarded numbers which are not terminated in the RingCentral phone system	'External' | 'TollFree' | 'Local'	f	2016-05-12 07:58:11.255504	2016-05-12 07:58:11.255504
327	64	4	phoneNumber	string	Phone number		f	2016-05-12 07:58:11.259124	2016-05-12 07:58:11.259124
328	64	5	status	string	Status of a phone number. If the value is 'Normal', the phone number is ready to be used. Otherwise it is an external number not yet ported to RingCentral		f	2016-05-12 07:58:11.262648	2016-05-12 07:58:11.262648
329	64	6	type	string	Phone number type	'VoiceFax' | 'FaxOnly' | 'VoiceOnly'	f	2016-05-12 07:58:11.268599	2016-05-12 07:58:11.268599
330	64	7	usageType	string	Usage type of the phone number	'MainCompanyNumber' | 'AdditionalCompanyNumber' | 'CompanyNumber' | 'DirectNumber' | 'CompanyFaxNumber' | 'ForwardedNumber'	f	2016-05-12 07:58:11.273598	2016-05-12 07:58:11.273598
331	65	0	status	string	Shipping status of the order item. It is set to 'Initial' when the order is submitted. Then it is changed to 'Accepted' when a distributor starts processing the order. Finally it is changed to Shipped which means that distributor has shipped the device.	'Initial' | 'Accepted' | 'Shipped'	f	2016-05-12 08:01:35.733317	2016-05-12 08:01:35.733317
332	65	1	carrier	string	Shipping carrier name. Appears only if the device status is "Shipped"		f	2016-05-12 08:01:35.737084	2016-05-12 08:01:35.737084
333	65	2	trackingNumber	string	Carrier-specific tracking number. Appears only if the device status is "Shipped"		f	2016-05-12 08:01:35.741744	2016-05-12 08:01:35.741744
334	65	3	method	array	Shipping method information	ShippingMethod	f	2016-05-12 08:01:35.747185	2016-05-12 08:02:23.278653
337	65	4	address	array	Shipping address for the order. If it coincides with the Emergency Service Address, then can be omitted. By default the same value as the emergencyServiceAddress. Multiple addresses can be specified; in case an order contains several devices, they can be delivered to different addresses	ShippingAddress	f	2016-05-12 08:01:35.762062	2016-05-12 08:02:23.283204
345	66	0	id	string	Method identifier. The default value is "1" (Ground)	'1' | '2' | '3'	f	2016-05-12 08:02:54.868371	2016-05-12 08:02:54.868371
346	66	1	name	string	Method name, corresponding to the identifier	'Ground' | '2 Day' | 'Overnight'	f	2016-05-12 08:02:54.871955	2016-05-12 08:02:54.871955
347	67	0	customerName	string	Name of a receiver		f	2016-05-12 08:03:19.717396	2016-05-12 08:03:19.717396
348	67	1	street	string	Street address, line 1 - street address, P.O. box, company name, c/o		f	2016-05-12 08:03:19.721242	2016-05-12 08:03:19.721242
349	67	2	street2	string	Street address, line 2 - apartment, suite, unit, building, floor, etc.		f	2016-05-12 08:03:19.725495	2016-05-12 08:03:19.725495
350	67	3	city	string	City name		f	2016-05-12 08:03:19.731952	2016-05-12 08:03:19.731952
351	67	4	state	string	State/province name		f	2016-05-12 08:03:19.735858	2016-05-12 08:03:19.735858
352	67	5	zip	string	Zip code		f	2016-05-12 08:03:19.739572	2016-05-12 08:03:19.739572
353	67	6	country	string	Country name		f	2016-05-12 08:03:19.744362	2016-05-12 08:03:19.744362
354	68	0	status	string	Required extension status	'Disabled' | 'Enabled' | 'NotActivated'	f	2016-05-12 08:47:51.772529	2016-05-12 08:47:51.772529
355	68	1	statusInfo	StatusInfo	Extension status information, only for the 'Disabled' status		f	2016-05-12 08:47:51.77701	2016-05-12 08:47:51.77701
358	70	0	contact	ContactInfo	Contact information		f	2016-05-12 08:49:58.293769	2016-05-12 08:49:58.293769
477	99	2	hasGreeting	boolean	'True' if the greeting message is played on this number		f	2016-05-12 14:15:25.178226	2016-05-12 14:15:25.178226
359	70	1	regionalSettings	ExtensionInfo.Request.ContactInfo.RegionalSettings	Region data (timezone, home country, language)		f	2016-05-12 08:49:58.297766	2016-05-12 08:53:43.687973
360	70	2	setupWizardState	string	Specifies extension configuration wizard state (web service setup). The default value is 'NotStarted'	'NotStarted' | 'Incomplete' | 'Completed'	f	2016-05-12 08:49:58.301366	2016-05-12 08:49:58.301366
361	70	3	department	string	Extension user department		f	2016-05-12 08:49:58.30778	2016-05-12 08:49:58.30778
362	71	0	timezone	ExtensionInfo.Request.ContactInfo.RegionalSettings.Timezone	Timezone data		f	2016-05-12 08:55:57.890569	2016-05-12 08:55:57.890569
363	71	1	language	ExtensionInfo.Request.ContactInfo.RegionalSettings.Language	User interface language data		f	2016-05-12 08:55:57.894629	2016-05-12 08:55:57.894629
364	71	2	greetingLanguage	ExtensionInfo.Request.ContactInfo.RegionalSettings.GreetingLanguage	Information on language used for telephony greetings		f	2016-05-12 08:55:57.901678	2016-05-12 08:55:57.901678
365	71	3	formattingLocale	ExtensionInfo.Request.ContactInfo.RegionalSettings.FormattingLocale	Formatting language preferences for numbers, dates and currencies		f	2016-05-12 08:55:57.906157	2016-05-12 08:55:57.906157
366	72	0	id	string	Timezone identifier. The default value is "58" (US&Canada)		f	2016-05-12 08:56:32.144918	2016-05-12 08:56:32.144918
367	73	0	id	string	Language identifier. The default value is "1033" (English US)		f	2016-05-12 08:57:19.52897	2016-05-12 08:57:19.52897
368	74	0	id	string	Internal identifier of a greeting language		f	2016-05-12 08:58:07.279431	2016-05-12 08:58:07.279431
369	75	0	id	string	Internal identifier of a formatting language		f	2016-05-12 08:58:45.465663	2016-05-12 08:58:45.465663
370	76	0	password	string	Password for extension		f	2016-05-12 09:00:35.872487	2016-05-12 09:00:35.872487
371	76	1	ivrPin	string	IVR PIN		f	2016-05-12 09:00:35.878085	2016-05-12 09:00:35.878085
372	77	0	partnerId	string	Extension partner identifier		f	2016-05-12 09:04:16.973344	2016-05-12 09:04:16.973344
373	78	0	status	string	Mandatory. Resulting extension status	'NotActivated'	t	2016-05-12 09:06:34.726492	2016-05-12 09:08:03.350071
374	78	1	contact	ExtensionInfo.Request.Provision.ContactInfo	Mandatory. Extension user contact information		t	2016-05-12 09:06:34.730098	2016-05-12 09:08:03.356705
375	79	0	firstName	string	Mandatory. Extension user first name		t	2016-05-12 09:06:53.479204	2016-05-12 09:08:12.373492
376	79	1	lastName	string	Mandatory. Extension user last name		t	2016-05-12 09:06:53.483686	2016-05-12 09:08:12.37869
377	79	2	email	string	Mandatory. Extension user contact email		t	2016-05-12 09:06:53.489673	2016-05-12 09:08:12.382475
378	80	0	syncType	string	Type of synchronization	'FSync' | 'ISync'	f	2016-05-12 11:26:27.056184	2016-05-12 11:26:27.056184
379	80	1	syncToken	string	Synchronization token		f	2016-05-12 11:26:27.063368	2016-05-12 11:26:27.063368
380	80	2	syncTime	string	Last synchronization datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-12 11:26:27.068372	2016-05-12 11:26:27.068372
382	81	1	url	string	Canonical URI		f	2016-05-12 11:27:47.507331	2016-05-12 11:27:47.507331
383	81	2	availability	string	This property has a special meaning only on Address Book Sync (e.g. a contact can be 'Deleted'). For simple contact list reading it has always the default value - 'Alive'	'Alive' | 'Deleted' | 'Purged'	f	2016-05-12 11:27:47.512729	2016-05-12 11:27:47.512729
384	81	3	firstName	string	First name of a personal contact		f	2016-05-12 11:27:47.517462	2016-05-12 11:27:47.517462
385	81	4	lastName	string	Last name of a personal contact		f	2016-05-12 11:27:47.520869	2016-05-12 11:27:47.520869
386	81	5	middleName	string	Middle name of a personal contact		f	2016-05-12 11:27:47.525106	2016-05-12 11:27:47.525106
387	81	6	nickName	string	Nick name of a personal contact		f	2016-05-12 11:27:47.530609	2016-05-12 11:27:47.530609
388	81	7	company	string	Company name of a personal contact		f	2016-05-12 11:27:47.535387	2016-05-12 11:27:47.535387
389	81	8	jobTitle	string	Job title of a personal contact		f	2016-05-12 11:27:47.538908	2016-05-12 11:27:47.538908
390	81	9	homePhone	string	Home phone of a personal contact		f	2016-05-12 11:27:47.543518	2016-05-12 11:27:47.543518
391	81	10	homePhone2	string	The 2-d home phone of a personal contact		f	2016-05-12 11:27:47.548916	2016-05-12 11:27:47.548916
392	81	11	businessPhone	string	Business phone of a personal contact		f	2016-05-12 11:27:47.552804	2016-05-12 11:27:47.552804
393	81	12	businessPhone2	string	The 2-d business phone of a personal contact		f	2016-05-12 11:27:47.556355	2016-05-12 11:27:47.556355
394	81	13	mobilePhone	string	Mobile phone of a personal contact		f	2016-05-12 11:27:47.561394	2016-05-12 11:27:47.561394
395	81	14	businessFax	string	Business fax of a personal contact		f	2016-05-12 11:27:47.566473	2016-05-12 11:27:47.566473
396	81	15	companyPhone	string	Company phone of a personal contact		f	2016-05-12 11:27:47.569981	2016-05-12 11:27:47.569981
397	81	16	assistantPhone	string	Assistant phone of a personal contact		f	2016-05-12 11:27:47.573679	2016-05-12 11:27:47.573679
398	81	17	carPhone	string	Car phone of a personal contact		f	2016-05-12 11:27:47.578994	2016-05-12 11:27:47.578994
399	81	18	otherPhone	string	Other phone of a personal contact		f	2016-05-12 11:27:47.584565	2016-05-12 11:27:47.584565
400	81	19	otherFax	string	Other fax of a personal contact		f	2016-05-12 11:27:47.588269	2016-05-12 11:27:47.588269
401	81	20	callbackPhone	string	Callback phone of a personal contact		f	2016-05-12 11:27:47.592739	2016-05-12 11:27:47.592739
402	81	21	email	string	Email of a personal contact		f	2016-05-12 11:27:47.597926	2016-05-12 11:27:47.597926
403	81	22	email2	string	The 2-d email of a personal contact		f	2016-05-12 11:27:47.602622	2016-05-12 11:27:47.602622
404	81	23	email3	string	The 3-d email of a personal contact		f	2016-05-12 11:27:47.60619	2016-05-12 11:27:47.60619
405	81	24	homeAddress	ContactAddressInfo	Home address of a personal contact		f	2016-05-12 11:27:47.610894	2016-05-12 11:27:47.610894
406	81	25	businessAddress	ContactAddressInfo	Business address of a personal contact		f	2016-05-12 11:27:47.615509	2016-05-12 11:27:47.615509
407	81	26	otherAddress	ContactAddressInfo	Other address of a personal contact		f	2016-05-12 11:27:47.619193	2016-05-12 11:27:47.619193
408	81	27	birthday	string	Date of birth of a personal contact in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-05-12 11:27:47.622627	2016-05-12 11:27:47.622627
409	81	28	webPage	string	Web page of a personal contact		f	2016-05-12 11:27:47.62736	2016-05-12 11:27:47.62736
410	81	29	notes	string	Notes of a personal contact		f	2016-05-12 11:27:47.631958	2016-05-12 11:27:47.631958
411	82	0	id	string	Internal identifier of a group		f	2016-05-12 12:25:00.258891	2016-05-12 12:25:00.258891
412	82	1	uri	string	Canonical URI of a group		f	2016-05-12 12:25:00.26236	2016-05-12 12:25:00.26236
413	82	2	contactsCount	integer	Amount of contacts in a group		f	2016-05-12 12:25:00.266245	2016-05-12 12:25:00.266245
414	82	3	groupName	string	Name of a group		f	2016-05-12 12:25:00.271345	2016-05-12 12:25:00.271345
415	82	4	notes	string	Notes for a group		f	2016-05-12 12:25:00.275739	2016-05-12 12:25:00.275739
416	83	0	uri	string	Canonical URI to the answering rule resource		f	2016-05-12 13:34:03.380148	2016-05-12 13:34:03.380148
417	83	1	id	string	Internal identifier of an asnwering rule		f	2016-05-12 13:34:03.383698	2016-05-12 13:34:03.383698
418	83	2	type	string	Type of an answering rule	'BusinessHours' | 'AfterHours' | 'Custom'	f	2016-05-12 13:34:03.388789	2016-05-12 13:34:03.388789
419	83	3	name	string	Name of an answering rule specified by user		f	2016-05-12 13:34:03.392442	2016-05-12 13:34:03.392442
420	83	4	enabled	boolean	Specifies if an answering rule is active or inactive		f	2016-05-12 13:34:03.396524	2016-05-12 13:34:03.396524
421	83	5	schedule	ScheduleInfo	Schedule when an answering rule should be applied		f	2016-05-12 13:34:03.400029	2016-05-12 13:34:03.400029
422	83	6	calledNumbers	array	Answering rules are applied when calling to selected number(s)	AnsweringRuleInfo.CalleeInfo	f	2016-05-12 13:34:03.405021	2016-05-13 02:57:39.427982
423	83	7	callers	array	Answering rules are applied when calls are received from specified caller(s)	AnsweringRuleInfo.CallerInfo	f	2016-05-12 13:34:03.4095	2016-05-13 02:50:19.995739
424	83	8	callHandlingAction	string	Specifies how incoming calls are forwarded	'ForwardCalls' | 'TakeMessagesOnly' | 'PlayAnnouncementOnly' | 'UnconditionalForwarding'	f	2016-05-12 13:34:03.413403	2016-05-12 13:34:03.413403
425	83	9	forwarding	ForwardingInfo	Forwarding parameters. Returned if 'ForwardCalls' is specified in 'callHandlingAction'. These settings determine the forwarding numbers to which the call will be forwarded		f	2016-05-12 13:34:03.417026	2016-05-12 13:34:03.417026
426	83	10	unconditionalForwarding	UnconditionalForwardingInfo	Unconditional forwarding parameters. Returned if 'UnconditionalForwarding' is specified in 'callHandlingAction'		f	2016-05-12 13:34:03.422702	2016-05-12 13:34:03.422702
427	83	11	voicemail	VoicemailInfo	Specifies whether to take a voicemail and who should do it		f	2016-05-12 13:34:03.42669	2016-05-12 13:34:03.42669
428	84	0	weeklyRanges	WeeklyScheduleInfo	Weekly schedule		f	2016-05-12 13:34:40.737129	2016-05-12 13:34:40.737129
429	84	1	ranges	RangesInfo	Specific data ranges		f	2016-05-12 13:34:40.74297	2016-05-12 13:34:40.74297
430	84	2	ref	string	The user's schedule specified for business hours or after hours; it can also be set/retrieved calling the corresponding method	'BusinessHours' | 'AfterHours'	f	2016-05-12 13:34:40.74756	2016-05-12 13:34:40.74756
431	85	0	monday	array	Time intervals for a particular day	TimeInterval	f	2016-05-12 13:35:31.156381	2016-05-12 13:35:31.156381
432	85	1	tuesday	array	Time intervals for a particular day	TimeInterval	f	2016-05-12 13:35:31.160512	2016-05-12 13:35:31.160512
433	85	2	wednesday	array	Time intervals for a particular day	TimeInterval	f	2016-05-12 13:35:31.163983	2016-05-12 13:35:31.163983
434	85	3	thursday	array	Time intervals for a particular day	TimeInterval	f	2016-05-12 13:35:31.169335	2016-05-12 13:35:31.169335
435	85	4	friday	array	Time intervals for a particular day	TimeInterval	f	2016-05-12 13:35:31.174744	2016-05-12 13:35:31.174744
436	85	5	saturday	array	Time intervals for a particular day	TimeInterval	f	2016-05-12 13:35:31.1783	2016-05-12 13:35:31.1783
437	85	6	sunday	array	Time intervals for a particular day	TimeInterval	f	2016-05-12 13:35:31.181739	2016-05-12 13:35:31.181739
438	86	0	from	string	Date and time in format YYYY-MM-DD hh:mm	date-time	f	2016-05-12 13:35:59.616754	2016-05-12 13:35:59.616754
439	86	1	to	string	Date and time in format YYYY-MM-DD hh:mm	date-time	f	2016-05-12 13:35:59.620335	2016-05-12 13:35:59.620335
440	87	0	from	string	Time in format hh:mm	date-time	f	2016-05-12 13:36:46.309589	2016-05-12 13:36:46.309589
441	87	1	to	string	Time in format hh:mm	date-time	f	2016-05-12 13:36:46.31601	2016-05-12 13:36:46.31601
442	88	0	phoneNumber	string	Called phone number		f	2016-05-12 13:37:03.225148	2016-05-12 13:37:03.225148
443	89	0	callerId	string	Phone number of a caller		f	2016-05-12 13:37:21.309271	2016-05-12 13:37:21.309271
444	89	1	name	string	Contact name of a caller		f	2016-05-12 13:37:21.314259	2016-05-12 13:37:21.314259
445	90	0	notifyMySoftPhones	boolean	Specifies if the user's softphone(s) are notified before forwarding the incoming call to desk phones and forwarding numbers		f	2016-05-12 13:37:53.666151	2016-05-12 13:37:53.666151
446	90	1	notifyAdminSoftPhones	boolean	Specifies if the administrator's softphone is notified before forwarding the incoming call to desk phones and forwarding numbers. The default value is 'False'		f	2016-05-12 13:37:53.669939	2016-05-12 13:37:53.669939
447	90	2	softPhonesRingCount	integer	Number of rings before forwarding starts		f	2016-05-12 13:37:53.674155	2016-05-12 13:37:53.674155
448	90	4	rules	array	Information on a call forwarding rule	RuleInfo	f	2016-05-12 13:37:53.679417	2016-05-12 13:38:40.560111
449	90	3	ringingMode	string	Specifies the order in which forwarding numbers ring. 'Sequentially' means that forwarding numbers are ringing one at a time, in order of priority. 'Simultaneously' means that forwarding numbers are ring all at the same time	'Sequentially' | 'Simultaneously'	f	2016-05-12 13:38:40.555994	2016-05-12 13:38:40.555994
450	91	0	index	integer	Forwarding number (or group) ordinal		f	2016-05-12 13:39:10.986965	2016-05-12 13:39:10.986965
451	91	1	ringCount	integer	Number of rings for a forwarding number (or group)		f	2016-05-12 13:39:10.991067	2016-05-12 13:39:10.991067
452	91	2	forwardingNumbers	array	Forwarding number (or group) data	RuleInfo.ForwardingNumberInfo	f	2016-05-12 13:39:10.997149	2016-05-13 03:05:46.528282
453	92	0	uri	string	Link to a forwarding number resource		f	2016-05-12 13:40:23.165983	2016-05-12 13:40:23.165983
454	92	1	id	string	Internal identifier of a forwarding number		f	2016-05-12 13:40:23.17159	2016-05-12 13:40:23.17159
455	92	2	phoneNumber	string	Phone number to which the call is forwarded		f	2016-05-12 13:40:23.175655	2016-05-12 13:40:23.175655
456	92	3	label	string	Title of a forwarding number		f	2016-05-12 13:40:23.180027	2016-05-12 13:40:23.180027
457	93	0	phoneNumber	string	Phone number to which the call is forwarded		f	2016-05-12 13:40:44.975442	2016-05-12 13:40:44.975442
458	94	0	enabled	boolean	If 'True' then voicemails are allowed to be received		f	2016-05-12 13:41:04.011009	2016-05-12 13:41:04.011009
459	94	1	recipient	RecipientInfo	Recipient data		f	2016-05-12 13:41:04.01587	2016-05-12 13:41:04.01587
460	95	0	uri	string	Link to a recipient extension resource		f	2016-05-12 13:41:22.411034	2016-05-12 13:41:22.411034
461	95	1	id	string	Internal identifier of a recipient extension		f	2016-05-12 13:41:22.415021	2016-05-12 13:41:22.415021
462	96	0	id	string	Standard resource properties ID and canonical URI, see the section called “Resource Identification Properties”		f	2016-05-12 13:52:41.521301	2016-05-12 13:52:41.521301
463	96	1	uri	string	Canonical URI of a blocked number resource		f	2016-05-12 13:52:41.524626	2016-05-12 13:52:41.524626
464	96	2	name	string	Name assigned by a user to a blocked phone number		f	2016-05-12 13:52:41.529146	2016-05-12 13:52:41.529146
465	96	3	phoneNumber	string	Phone number to be blocked		f	2016-05-12 13:52:41.53436	2016-05-12 13:52:41.53436
466	97	0	weeklyRanges	WeeklyScheduleInfo	Weekly schedule		f	2016-05-12 14:00:29.924744	2016-05-12 14:00:29.924744
467	98	0	uri	string	Canonical URI of a conferencing		f	2016-05-12 14:13:56.265204	2016-05-12 14:13:56.265204
468	98	1	allowJoinBeforeHost	boolean	Determines if host user allows conference participants to join before the host		f	2016-05-12 14:13:56.268943	2016-05-12 14:13:56.268943
469	98	2	hostCode	string	Access code for a host user		f	2016-05-12 14:13:56.272512	2016-05-12 14:13:56.272512
470	98	3	mode	string	Internal parameter specifying conferencing engine		f	2016-05-12 14:13:56.277119	2016-05-12 14:13:56.277119
471	98	4	participantCode	string	Access code for any participant		f	2016-05-12 14:13:56.28237	2016-05-12 14:13:56.28237
472	98	5	phoneNumber	string	Primary conference phone number for user's home country returned in E.164 (11-digits) format		f	2016-05-12 14:13:56.285878	2016-05-12 14:13:56.285878
473	98	6	tapToJoinUri	string	Short URL leading to the service web page Tap to Join for audio conference bridge		f	2016-05-12 14:13:56.289503	2016-05-12 14:13:56.289503
474	98	7	phoneNumbers	array	List of multiple dial-in phone numbers to connect to audio conference service, relevant for user's brand. Each number is given with the country and location information, in order to let the user choose the less expensive way to connect to a conference. The first number in the list is the primary conference number, that is default and domestic	ConferencingInfo.PhoneNumberInfo	f	2016-05-12 14:13:56.295626	2016-05-12 14:15:42.97548
475	99	0	country	ConferencingInfo.PhoneNumberInfo.CountryInfo	Information on a home country of a conference phone number		f	2016-05-12 14:15:25.16723	2016-05-12 14:17:04.209623
476	99	1	default	boolean	'True' if the number is default for the conference. Default conference number is a domestic number that can be set by user (otherwise it is set by the system). Only one default number per country is allowed		f	2016-05-12 14:15:25.171436	2016-05-12 14:15:25.171436
478	99	3	location	string	Location (city, region, state) of a conference phone number		f	2016-05-12 14:15:25.183153	2016-05-12 14:15:25.183153
479	99	4	phoneNumber	string	Dial-in phone number to connect to a conference		f	2016-05-12 14:15:25.18713	2016-05-12 14:15:25.18713
480	100	0	id	string	Internal identifier of a country		f	2016-05-12 14:16:32.212075	2016-05-12 14:16:32.212075
481	100	1	uri	string	Canonical URI of a country		f	2016-05-12 14:16:32.215778	2016-05-12 14:16:32.215778
482	100	2	callingCode	string	Country calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes		f	2016-05-12 14:16:32.219909	2016-05-12 14:16:32.219909
483	100	3	emergencyCalling	boolean	Emergency calling feature availability/emergency address requirement indicator		f	2016-05-12 14:16:32.224992	2016-05-12 14:16:32.224992
484	100	4	isoCode	string	Country code according to the ISO standard, see ISO 3166		f	2016-05-12 14:16:32.229638	2016-05-12 14:16:32.229638
485	100	5	name	string	Official name of a country		f	2016-05-12 14:16:32.233181	2016-05-12 14:16:32.233181
486	101	0	phoneNumber	string	Dial-in phone number to connect to a conference		f	2016-05-12 14:21:06.525532	2016-05-12 14:21:06.525532
487	101	1	default	boolean	'True' if the number is default for the conference. Default conference number is a domestic number that can be set by user (otherwise it is set by the system). Only one default number per country is allowed		f	2016-05-12 14:21:06.529395	2016-05-12 14:21:06.529395
488	102	0	uri	string	Canonical URI of a grant		f	2016-05-12 14:41:35.149864	2016-05-12 14:41:35.149864
489	102	1	extension	GrantInfo.ExtensionInfo	Extension information		f	2016-05-12 14:41:35.153341	2016-05-12 14:42:09.91429
490	102	2	callPickup	boolean	Specifies if picking up of other extensions' calls is allowed for the extension. If 'Presence' feature is disabled for the given extension, the flag is not returned		f	2016-05-12 14:41:35.15855	2016-05-12 14:41:35.15855
491	102	3	callMonitoring	boolean	Specifies if monitoring of other extensions' calls is allowed for the extension. If 'CallMonitoring' feature is disabled for the given extension, the flag is not returned		f	2016-05-12 14:41:35.162532	2016-05-12 14:41:35.162532
492	103	0	id	string	Internal identifier of an extension		f	2016-05-12 14:42:41.605109	2016-05-12 14:42:41.605109
493	103	1	uri	string	Canonical URI of an extension		f	2016-05-12 14:42:41.611807	2016-05-12 14:42:41.611807
494	103	2	extensionNumber	string	Extension short number (usually 3 or 4 digits)		f	2016-05-12 14:42:41.615465	2016-05-12 14:42:41.615465
495	103	3	type	string	Extension type	'User' | 'Fax User' | 'VirtualUser' | 'DigitalUser' | 'Department' | 'Announcement' | 'Voicemail' | 'SharedLinesGroup' | 'PagingOnly' | 'IvrMenu' | 'ApplicationExtension' | 'Park Location'	f	2016-05-12 14:42:41.619192	2016-05-12 14:42:41.619192
496	104	0	featureName	string	Feature name, see all available values in Service Feature List		f	2016-05-12 15:42:54.29767	2016-05-12 15:42:54.29767
497	104	1	enabled	boolean	Feature status, shows feature availability for the extension		f	2016-05-12 15:42:54.302197	2016-05-12 15:42:54.302197
498	105	0	freeSoftPhoneLinesPerExtension	integer	The maximum number of free softphone digital lines per user extension		f	2016-05-12 15:44:37.792349	2016-05-12 15:44:37.792349
500	105	2	maxMonitoredExtensionsPerUser	integer	The maximum number of extensions which can be included in the list of users monitored for Presence		f	2016-05-12 15:44:37.802435	2016-05-12 15:44:37.802435
501	106	0	uri	string	Link to custom data attachment		f	2016-05-12 15:50:37.702105	2016-05-12 15:50:37.702105
502	106	1	contentType	string	Type of custom data attachment, see also MIME Types		f	2016-05-12 15:50:37.705938	2016-05-12 15:50:37.705938
503	107	0	id	string	Internal identifier of a country		f	2016-05-12 16:05:07.537934	2016-05-12 16:05:07.537934
504	107	1	uri	string	Canonical URI of a country		f	2016-05-12 16:05:07.544023	2016-05-12 16:05:07.544023
505	107	2	callingCode	string	Country calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes		f	2016-05-12 16:05:07.547686	2016-05-12 16:05:07.547686
506	107	3	emergencyCalling	boolean	Emergency calling feature availability/emergency address requirement indicator		f	2016-05-12 16:05:07.551406	2016-05-12 16:05:07.551406
507	107	4	isoCode	string	Country code according to the ISO standard, see ISO 3166		f	2016-05-12 16:05:07.556588	2016-05-12 16:05:07.556588
508	107	5	name	string	Official name of a country		f	2016-05-12 16:05:07.560886	2016-05-12 16:05:07.560886
509	108	0	areaCode	string	Area code of the location (3-digit usually), according to the NANP number format, that can be summarized as NPA-NXX-xxxx and covers Canada, the United States, parts of the Caribbean Sea, and some Atlantic and Pacific islands. See North American Numbering Plan for details		f	2016-05-12 16:05:53.220523	2016-05-12 16:05:53.220523
510	108	1	country	array	Information on a country the phone number belongs to	ParsePhoneNumber.CountryInfo	f	2016-05-12 16:05:53.224263	2016-05-12 16:05:53.224263
511	108	2	dialable	string	Dialing format of a phone number		f	2016-05-12 16:05:53.230692	2016-05-12 16:05:53.230692
512	108	3	e164	string	E.164 (11-digits) format of a phone number		f	2016-05-12 16:05:53.234414	2016-05-12 16:05:53.234414
513	108	4	formattedInternational	string	International format of a phone number		f	2016-05-12 16:05:53.238003	2016-05-12 16:05:53.238003
514	108	5	formattedNational	string	Domestic format of a phone number		f	2016-05-12 16:05:53.24247	2016-05-12 16:05:53.24247
515	108	6	originalString	string	One of the numbers to be parsed, passed as a string in response		f	2016-05-12 16:05:53.248337	2016-05-12 16:05:53.248337
516	108	7	special	boolean	"True" if the number is in a special format (for example N11 code)		f	2016-05-12 16:05:53.251875	2016-05-12 16:05:53.251875
517	108	8	normalized	string	E.164 (11-digits) format of a phone number without the plus sign ('+')		f	2016-05-12 16:05:53.25533	2016-05-12 16:05:53.25533
518	109	0	phoneNumber	string	Phone number in E.164 format without a '+'		f	2016-05-12 16:09:52.112822	2016-05-12 16:09:52.112822
519	109	1	formattedNumber	string	Phone number formatted according to current brand's default country		f	2016-05-12 16:09:52.119522	2016-05-12 16:09:52.119522
520	109	2	vanityPattern	string	Vanity pattern for this number. Returned only when vanity search option is requested. Vanity pattern corresponds to request parameters nxx plus line or numberPattern		f	2016-05-12 16:09:52.124226	2016-05-12 16:09:52.124226
521	109	3	rank	integer	The value is returned if the extendedSearch parameter is true. '10' is the closest match		f	2016-05-12 16:09:52.128283	2016-05-12 16:11:12.723271
522	110	0	phoneNumber	string	Phone number in E.164 format without a '+'		f	2016-05-12 16:14:40.941013	2016-05-12 16:14:40.941013
523	110	1	reservedTill	string	The datetime up to which the number is reserved in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. If it is omitted or explicitly set to 'null', the number will be un-reserved if it was reserved previously by the same session. 'Min' value is 30 seconds; 'Max' value is 30 days (for reservation by brand) and 20 minutes (for reservation by account/session)	date-time	f	2016-05-12 16:14:40.946874	2016-05-12 16:15:30.98622
525	111	0	phoneNumber	string	Phone number in E.164 format without a '+'		f	2016-05-12 16:21:28.348338	2016-05-12 16:21:28.348338
526	111	1	formattedNumber	string	Domestic format of a phone number		f	2016-05-12 16:21:28.354049	2016-05-12 16:21:28.354049
527	111	2	reservedTill	string	The datetime up to which the number is reserved in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. No value means that number is not reserved anymore	date-time	f	2016-05-12 16:21:28.3577	2016-05-12 16:21:28.3577
528	111	3	reservationId	string	Internal identifier of phone number reservation; encoded data including reservation type (by brand, by account, by session), particular brand/account/session data, and reservation date and time		f	2016-05-12 16:21:28.361915	2016-05-12 16:21:28.361915
529	111	4	status	string	Phone number status	'Enabled' | 'Pending' | 'Disabled'	f	2016-05-12 16:21:28.367564	2016-05-12 16:21:28.367564
530	111	5	error	string	The error code in case of reservation/un-reservation failure	'NumberIsAlreadyProvisioned' | 'NumberReserved' | 'NumberNotAvailable'	f	2016-05-12 16:21:28.372109	2016-05-12 16:21:28.372109
545	105	1	meetingSize	integer	The maximum number of participants in RingCentral Meeting hosted by this account's user		f	2016-06-17 04:43:52.874043	2016-06-17 04:43:52.874043
546	117	0	uri	string	Canonical URI of a meeting resource		f	2016-06-22 03:12:04.025105	2016-06-22 03:12:04.025105
547	117	1	id	string	Internal identifier of a meeting as retrieved from Zoom		f	2016-06-22 03:12:04.030972	2016-06-22 03:12:04.030972
548	117	2	topic	string	Topic of a meeting		f	2016-06-22 03:12:04.034486	2016-06-22 03:12:04.034486
549	117	3	meetingType	string	Type of a meeting	'Scheduled' | 'Instant' | 'Recurring'	f	2016-06-22 03:12:04.038174	2016-06-22 03:12:04.038174
550	117	4	password	string	Password required to join a meeting		f	2016-06-22 03:12:04.045086	2016-06-22 03:12:04.045086
551	117	5	status	string	Current status of a meeting	'NotStarted' | 'Started'	f	2016-06-22 03:12:04.050326	2016-06-22 03:12:04.050326
552	117	6	links	LinksInfo	Links to start/join the meeting		f	2016-06-22 03:12:04.054154	2016-06-22 03:12:04.054154
553	117	7	schedule	MeetingScheduleInfo	Schedule of a meeting		f	2016-06-22 03:12:04.058335	2016-06-22 03:12:04.058335
554	117	8	allowJoinBeforeHost	boolean	If 'True' then the meeting can be joined and started by any participant (not host only). Supported for the meetings of 'Scheduled' and 'Recurring' type.		f	2016-06-22 03:12:04.064512	2016-06-22 03:12:04.064512
555	117	9	startHostVideo	boolean	Enables starting video when host joins the meeting		f	2016-06-22 03:12:04.068143	2016-06-22 03:12:04.068143
556	117	10	startParticipantsVideo	boolean	Enables starting video when participants join the meeting		f	2016-06-22 03:12:04.071965	2016-06-22 03:12:04.071965
557	117	11	audioOptions	array	Meeting audio options. Possible values are 'Phone', 'ComputerAudio'	string	f	2016-06-22 03:12:04.077179	2016-06-22 03:14:33.642578
558	118	0	startUri	string	Link to start a meeting		f	2016-06-22 03:15:16.96506	2016-06-22 03:15:16.96506
559	118	1	joinUri	string	Link to join a meeting		f	2016-06-22 03:15:16.969611	2016-06-22 03:15:16.969611
560	119	0	startTime	string	Start time of a meeting in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-06-22 03:15:56.745693	2016-06-22 03:15:56.745693
561	119	1	durationInMinutes	integer	Duration of a meeting in minutes		f	2016-06-22 03:15:56.748819	2016-06-22 03:15:56.748819
562	119	2	timeZone	MeetingScheduleInfo.TimezoneInfo	Timezone of a meeting		f	2016-06-22 03:15:56.752208	2016-06-22 03:16:59.922753
563	120	0	id	string	Identifier of a timezone		f	2016-06-22 03:16:41.046344	2016-06-22 03:16:41.046344
570	126	0	accountId	string	User type of a meeting account		f	2016-07-15 07:58:08.262729	2016-07-15 07:58:08.262729
571	126	1	userId	string	Meeting account user identifier		f	2016-07-15 07:58:08.26677	2016-07-15 07:58:08.26677
572	126	2	userToken	string	Meeting account user token		f	2016-07-15 07:58:08.270132	2016-07-15 07:58:08.270132
573	126	3	userType	integer	Meeting account user type		f	2016-07-15 07:58:08.273398	2016-07-15 07:58:08.273398
574	127	0	phoneNumber	string	Phone number of the dial-in number for the meeting in e.164 format		f	2016-07-15 07:59:19.991097	2016-07-15 07:59:19.991097
575	127	1	formattedNumber	string	Phone number of the dial-in number formatted according to the extension home country		f	2016-07-15 07:59:19.994364	2016-07-15 07:59:19.994364
576	127	2	location	string	Optional field in case the dial-in number is associated with a particular location		f	2016-07-15 07:59:20.000053	2016-07-15 07:59:20.000053
577	127	3	country	DialInNumbers.CountryInfo	Country resource corresponding to the dial-in number		f	2016-07-15 07:59:20.003057	2016-07-15 08:01:10.902029
578	128	0	id	string	Internal identifier of a country		f	2016-07-15 08:18:50.808753	2016-07-15 08:18:50.808753
579	128	1	uri	string	Canonical URI of a country		f	2016-07-15 08:18:50.812356	2016-07-15 08:18:50.812356
580	128	2	callingCode	string	Country calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes		f	2016-07-15 08:18:50.815755	2016-07-15 08:18:50.815755
581	128	3	isoCode	string	Country code according to the ISO standard, see ISO 3166		f	2016-07-15 08:18:50.818856	2016-07-15 08:18:50.818856
582	128	4	name	string	Official name of a country		f	2016-07-15 08:18:50.822632	2016-07-15 08:18:50.822632
583	129	0	uri	string	Canonical URI for the page		f	2016-07-18 08:18:01.930265	2016-07-18 08:18:01.930265
584	130	0	id	string	Internal identifier of a country		f	2016-08-10 01:11:54.262142	2016-08-10 01:11:54.262142
585	130	1	uri	string	Canonical URI of a country		f	2016-08-10 01:11:54.265876	2016-08-10 01:11:54.265876
586	130	2	callingCode	string	Country calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes		f	2016-08-10 01:11:54.268975	2016-08-10 01:11:54.268975
587	130	3	isoCode	string	Country code according to the ISO standard, see ISO 3166		f	2016-08-10 01:11:54.272138	2016-08-10 01:11:54.272138
588	130	4	name	string	Official name of a country		f	2016-08-10 01:11:54.278133	2016-08-10 01:11:54.278133
589	131	0	uri	string	Link to an image.		f	2016-08-31 10:09:37.700167	2016-08-31 10:09:37.700167
590	132	0	permission	UserPermissionInfo	Information on a permission granted		f	2016-09-09 08:18:16.847329	2016-09-09 08:18:16.847329
591	132	1	scopes	array	List of active scopes for permission	string	f	2016-09-09 08:18:16.852279	2016-09-09 08:18:16.852279
592	133	0	id	string	Internal identifier of a permission		f	2016-09-09 08:19:17.524848	2016-09-09 08:19:17.524848
593	133	1	uri	string	Canonical URI of a permission resource		f	2016-09-09 08:19:17.527967	2016-09-09 08:19:17.527967
594	134	0	permission	UserPermissionInfo	Information on a permission checked		f	2016-09-09 08:31:54.331429	2016-09-09 08:31:54.331429
595	83	12	greetings	array	Predefined greetings applied for an answering rule	GreetingInfo	f	2016-09-23 08:16:25.792879	2016-09-23 08:16:25.792879
596	135	0	type	string	Type of a greeting, specifying the case when the greeting is played. See also Greeting Types	'Introductory' | 'Announcement' | 'ConnectingMessage' | 'ConnectingAudio' | 'Voicemail' | 'Unavailable'	f	2016-09-23 08:16:56.359477	2016-09-23 08:16:56.359477
597	135	1	preset	PresetInfo	Predefined greeting information		f	2016-09-23 08:16:56.365297	2016-09-23 08:16:56.365297
598	136	0	uri	string	Link to a greeting resource		f	2016-09-23 08:17:25.80798	2016-09-23 08:17:25.80798
599	136	1	id	string	Internal identifier of greeting		f	2016-09-23 08:17:25.811135	2016-09-23 08:17:25.811135
600	136	2	name	string	Name of a greeting		f	2016-09-23 08:17:25.816362	2016-09-23 08:17:25.816362
601	137	0	callerId	string	Phone number of a caller		f	2016-09-23 08:25:52.244173	2016-09-23 08:25:52.244173
602	137	1	name	string	Contact name of a caller		f	2016-09-23 08:25:52.247565	2016-09-23 08:25:52.247565
603	138	0	phoneNumber	string	Called phone number		f	2016-09-23 08:26:23.592955	2016-09-23 08:26:23.592955
604	139	0	weeklyRanges	WeeklyScheduleInfo	Weekly schedule. If specified, ranges cannot be specified		f	2016-09-23 08:29:20.11674	2016-09-23 08:29:20.11674
605	139	1	ranges	RangesInfo	Specific data ranges. If specified, weeklyRanges cannot be specified		f	2016-09-23 08:29:20.121522	2016-09-23 08:29:20.121522
606	140	0	uri	string	Link to an extension custom greeting		f	2016-09-23 09:41:27.773725	2016-09-23 09:41:27.773725
607	140	1	id	string	Internal identifier of an answering rule		f	2016-09-23 09:41:27.77914	2016-09-23 09:41:27.77914
608	140	2	type	string	Type of a greeting, specifying the case when the greeting is played. See also Greeting Types	'Introductory' | 'Announcement' | 'ConnectingMessage' | 'ConnectingAudio' | 'Voicemail' | 'Unavailable'	f	2016-09-23 09:41:27.782452	2016-09-23 09:41:27.782452
609	140	3	contentType	string	Content media type in WAV/MP3 format		f	2016-09-23 09:41:27.785994	2016-09-23 09:41:27.785994
610	140	4	contentUri	string	Link to a greeting content (audio file)		f	2016-09-23 09:41:27.790515	2016-09-23 09:41:27.790515
611	141	0	id	string	Internal identifier of an answering rule		f	2016-09-23 09:42:50.206081	2016-09-23 09:42:50.206081
612	142	0	uri	string	Canonical URI of a meeting service info resource		f	2016-09-29 05:27:42.334984	2016-09-29 05:27:42.334984
613	142	1	supportUri	string	URI to retrieve support information for meetings functionality		f	2016-09-29 05:27:42.3408	2016-09-29 05:27:42.3408
614	142	2	intlDialInNumbersUri	string	URI to retrieve international dial in numbers		f	2016-09-29 05:27:42.343866	2016-09-29 05:27:42.343866
615	142	3	externalUserInfo	ExternalUserInfo	External user data		f	2016-09-29 05:27:42.346846	2016-09-29 05:27:42.346846
616	142	4	dialInNumbers	DialInNumbers	Dial-in numbers data		f	2016-09-29 05:27:42.350041	2016-09-29 05:28:23.301228
617	143	0	uri	string	Canonical URI of the account Service Info resource		f	2016-09-29 05:46:00.727983	2016-09-29 05:46:00.727983
618	143	1	servicePlanName	string	Account Service Plan name		f	2016-09-29 05:46:00.733602	2016-09-29 05:46:00.733602
619	143	2	brand	BrandInfo	Information on account brand		f	2016-09-29 05:46:00.737101	2016-09-29 05:46:00.737101
620	143	3	servicePlan	ServicePlanInfo	Information on account service plan		f	2016-09-29 05:46:00.740125	2016-09-29 05:46:00.740125
621	143	4	billingPlan	BillingPlanInfo	Information on account billing plan		f	2016-09-29 05:46:00.743119	2016-09-29 05:46:00.743119
622	143	5	serviceFeatures	array	Service features information, see Service Feature List	ServiceFeatureInfo	f	2016-09-29 05:46:00.747162	2016-09-29 05:46:00.747162
624	144	0	data	string	Required. Binary data.	binary	t	2016-09-29 06:49:22.258186	2016-09-29 10:48:47.60104
625	145	0	uuid	string	Universally unique identifier of a notification		f	2016-10-27 08:27:34.375294	2016-10-27 08:27:34.375294
626	145	1	event	string	Event filter URI		f	2016-10-27 08:27:34.381676	2016-10-27 08:27:34.381676
627	145	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 08:27:34.384849	2016-10-27 08:27:34.384849
628	145	3	timestamp	string	Datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:27:34.387881	2016-10-27 08:27:34.387881
629	145	4	body	ExtensionListEvent	Notification payload body		f	2016-10-27 08:27:34.391353	2016-10-27 08:27:34.391353
630	146	0	extensionId	string	Internal identifier of an extension		f	2016-10-27 08:29:28.741593	2016-10-27 08:29:28.741593
631	146	1	eventType	string	Type of extension info change	'Create' | 'Update' | 'Delete'	f	2016-10-27 08:29:28.744928	2016-10-27 08:29:28.744928
632	147	0	uuid	string	Universally unique identifier of a notification		f	2016-10-27 08:30:23.475243	2016-10-27 08:30:23.475243
633	147	1	event	string	Event filter URI		f	2016-10-27 08:30:23.479557	2016-10-27 08:30:23.479557
634	147	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 08:30:23.485092	2016-10-27 08:30:23.485092
635	147	3	timestamp	string	Datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:30:23.48888	2016-10-27 08:30:23.48888
636	147	4	body	ExtensionInfoEvent	Notification payload body		f	2016-10-27 08:30:23.492568	2016-10-27 08:30:23.492568
637	148	0	extensionId	string	Internal identifier of an extension		f	2016-10-27 08:30:39.247241	2016-10-27 08:30:39.247241
638	148	1	eventType	string	Type of extension info change	'Update' | 'Delete'	f	2016-10-27 08:30:39.252713	2016-10-27 08:30:39.252713
639	149	0	uuid	string	Universally unique identifier of a notification		f	2016-10-27 08:32:05.868009	2016-10-27 08:32:05.868009
640	149	1	event	string	Event filter URI		f	2016-10-27 08:32:05.873912	2016-10-27 08:32:05.873912
641	149	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 08:32:05.877347	2016-10-27 08:32:05.877347
642	149	3	timestamp	string	Datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:32:05.880772	2016-10-27 08:32:05.880772
643	149	4	body	MessageEvent	Notification payload body		f	2016-10-27 08:32:05.884072	2016-10-27 08:32:05.884072
645	150	1	lastUpdated	string	The datetime when the message was last modified in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:32:18.667496	2016-10-27 08:32:18.667496
647	151	0	type	string	Message type	'Voicemail' | 'SMS' | 'Fax' | 'Pager'	f	2016-10-27 08:32:37.849312	2016-10-27 08:32:37.849312
648	151	1	newCount	integer	The number of new messages. Can be omitted if the value is zero		f	2016-10-27 08:32:37.853253	2016-10-27 08:32:37.853253
649	151	2	updatedCount	integer	The number of updated messages. Can be omitted if the value is zero		f	2016-10-27 08:32:37.857909	2016-10-27 08:32:37.857909
650	152	0	uuid	string	Universally unique identifier of a notification		f	2016-10-27 08:33:40.403083	2016-10-27 08:33:40.403083
651	152	1	event	string	Event filter URI		f	2016-10-27 08:33:40.408618	2016-10-27 08:33:40.408618
652	152	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 08:33:40.41337	2016-10-27 08:33:40.41337
653	152	3	timestamp	string	Datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:33:40.417095	2016-10-27 08:33:40.417095
654	152	4	body	InstantMessageEvent	Notification payload body		f	2016-10-27 08:33:40.420911	2016-10-27 08:33:40.420911
655	153	0	id	string	Internal identifier of a message		f	2016-10-27 08:34:12.523421	2016-10-27 08:34:12.523421
658	153	3	type	string	Type of a message. The default value is 'SMS'		f	2016-10-27 08:34:12.535057	2016-10-27 08:34:12.535057
659	153	4	creationTime	string	Message creation datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:34:12.538166	2016-10-27 08:34:12.538166
660	153	5	lastModifiedTime	string	The datetime when the message was modified in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:34:12.542948	2016-10-27 08:34:12.542948
661	153	6	readStatus	string	Status of a message. The default value is 'Unread'		f	2016-10-27 08:34:12.547147	2016-10-27 08:34:12.547147
662	153	7	priority	string	The default value is 'Normal'		f	2016-10-27 08:34:12.550156	2016-10-27 08:34:12.550156
663	153	8	attachments	array	Message attachment data	InstantMessageAttachmentInfo	f	2016-10-27 08:34:12.553224	2016-10-27 08:34:12.553224
664	153	9	direction	string	Message direction. The default value is 'Inbound'		f	2016-10-27 08:34:12.556414	2016-10-27 08:34:12.556414
665	153	10	availability	string	Message availability status. The default value is 'Alive'		f	2016-10-27 08:34:12.561752	2016-10-27 08:34:12.561752
666	153	11	subject	string	Message subject. It replicates message text which is also returned as an attachment		f	2016-10-27 08:34:12.565028	2016-10-27 08:34:12.565028
667	153	12	messageStatus	string	Status of a message. The default value is 'Received'		f	2016-10-27 08:34:12.569249	2016-10-27 08:34:12.569249
668	153	13	conversationId	string	Identifier of the conversation the message belongs to		f	2016-10-27 08:34:12.572443	2016-10-27 08:34:12.572443
656	153	1	to	array	Message receiver(s) information	InstantMessageEvent.CallerInfo	f	2016-10-27 08:34:12.52879	2016-10-27 08:35:56.237117
657	153	2	from	InstantMessageEvent.CallerInfo	Message sender information		f	2016-10-27 08:34:12.531999	2016-10-27 08:35:56.241367
669	154	0	phoneNumber	string	Phone number in E.164 (with '+' sign) format		f	2016-10-27 08:38:04.48431	2016-10-27 08:38:04.48431
670	154	1	extensionNumber	string	Extension number		f	2016-10-27 08:38:04.490315	2016-10-27 08:38:04.490315
671	154	2	location	string	Contains party location (city, state) if one can be determined from phoneNumber. This property is filled only when phoneNumber is not empty and server can calculate location information from it (for example, this information is unavailable for US toll-free numbers)		f	2016-10-27 08:38:04.493884	2016-10-27 08:38:04.493884
646	150	2	changes	array	Message changes	MessageChange	f	2016-10-27 08:32:18.672984	2016-10-28 07:57:24.949435
644	150	0	extensionId	integer	Internal identifier of an extension. Optional parameter		f	2016-10-27 08:32:18.664168	2016-10-28 08:27:29.476516
623	143	6	limits	AccountLimits	Limits which are effective for the account		f	2016-09-29 05:46:00.751714	2016-11-14 09:35:50.751592
723	162	5	presenceStatus	string	Aggregated presence status, calculated from a number of sources	'Offline' | 'Busy' | 'Available'	f	2016-10-27 08:58:37.938345	2016-10-27 08:58:37.938345
672	154	3	name	string	Symbolic name associated with a caller/callee. If the phone does not belong to the known extension, only the location is returned, the name is not determined then		f	2016-10-27 08:38:04.497357	2016-10-27 08:38:04.497357
673	155	0	id	string	Internal identifier of a message attachment		f	2016-10-27 08:38:31.11721	2016-10-27 08:38:31.11721
674	155	1	type	string	Type of a message attachment. The default value is 'Text'		f	2016-10-27 08:38:31.123092	2016-10-27 08:38:31.123092
675	155	2	contentType	string	Content type of an attachment, see also MIME Types. The default value is 'text/plain'		f	2016-10-27 08:38:31.126765	2016-10-27 08:38:31.126765
676	156	0	uuid	string	Universally unique identifier of a notification		f	2016-10-27 08:39:03.796493	2016-10-27 08:39:03.796493
677	156	1	event	string	Event filter URI		f	2016-10-27 08:39:03.800002	2016-10-27 08:39:03.800002
678	156	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 08:39:03.805269	2016-10-27 08:39:03.805269
679	156	3	timestamp	string	The datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:39:03.808801	2016-10-27 08:39:03.808801
680	156	4	body	PresenceEvent	Notification payload body		f	2016-10-27 08:39:03.812032	2016-10-27 08:39:03.812032
681	157	0	extensionId	string	Internal identifier of an extension. Optional parameter		f	2016-10-27 08:39:24.818916	2016-10-27 08:39:24.818916
682	157	1	telephonyStatus	string	Telephony presence status. Returned if telephony status is changed. See Telephony Status Values	'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'	f	2016-10-27 08:39:24.824662	2016-10-27 08:39:24.824662
683	157	2	terminationType	string	Type of call termination. Supported for calls in 'NoCall' status. If the returned termination type is 'Intermediate' it means the call is not actually ended, the connection is established on one of the devices	'Final' | 'Intermediate'	f	2016-10-27 08:39:24.827813	2016-10-27 08:39:24.827813
684	157	3	sequence	integer	Order number of a notification to state the chronology		f	2016-10-27 08:39:24.831044	2016-10-27 08:39:24.831044
685	157	4	presenceStatus	string	Aggregated presence status, calculated from a number of sources	'Offline' | 'Busy' | 'Available'	f	2016-10-27 08:39:24.834254	2016-10-27 08:39:24.834254
686	157	5	userStatus	string	User-defined presence status (as previously published by the user)	'Offline' | 'Busy' | 'Available'	f	2016-10-27 08:39:24.840108	2016-10-27 08:39:24.840108
687	157	6	dndStatus	string	Extended DnD (Do not Disturb) status	'TakeAllCalls' | 'DoNotAcceptAnyCalls' | 'DoNotAcceptDepartmentCalls' | 'TakeDepartmentCallsOnly'	f	2016-10-27 08:39:24.843481	2016-10-27 08:39:24.843481
688	157	7	allowSeeMyPresence	boolean	If 'True' enables other extensions to see the extension presence status		f	2016-10-27 08:39:24.846837	2016-10-27 08:39:24.846837
689	157	8	ringOnMonitoredCall	boolean	If 'True' enables to ring extension phone, if any user monitored by this extension is ringing		f	2016-10-27 08:39:24.849956	2016-10-27 08:39:24.849956
690	157	9	pickUpCallsOnHold	boolean	If 'True' enables the extension user to pick up a monitored line on hold		f	2016-10-27 08:39:24.85507	2016-10-27 08:39:24.85507
691	158	0	uuid	string	Universally unique identifier of a notification		f	2016-10-27 08:40:15.018327	2016-10-27 08:40:15.018327
692	158	1	event	string	Event filter URI		f	2016-10-27 08:40:15.022823	2016-10-27 08:40:15.022823
693	158	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 08:40:15.026795	2016-10-27 08:40:15.026795
694	158	3	timestamp	string	The datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:40:15.029965	2016-10-27 08:40:15.029965
695	158	4	body	DetailedPresenceEvent	Notification payload body		f	2016-10-27 08:40:15.033225	2016-10-27 08:40:15.033225
696	159	0	extensionId	string	Internal identifier of an extension. Optional parameter		f	2016-10-27 08:41:16.282301	2016-10-27 08:41:16.282301
697	159	1	telephonyStatus	string	Telephony presence status. Returned if telephony status is changed. See Telephony Status Values	'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'	f	2016-10-27 08:41:16.285545	2016-10-27 08:41:16.285545
699	159	4	sequence	integer	Order number of a notification to state the chronology		f	2016-10-27 08:41:16.293588	2016-10-27 08:42:29.573495
700	159	5	presenceStatus	string	Aggregated presence status, calculated from a number of sources	'Offline' | 'Busy' | 'Available'	f	2016-10-27 08:41:16.296887	2016-10-27 08:42:29.579068
701	159	6	userStatus	string	User-defined presence status (as previously published by the user)	'Offline' | 'Busy' | 'Available'	f	2016-10-27 08:41:16.300093	2016-10-27 08:42:29.585183
702	159	7	dndStatus	string	Extended DnD (Do not Disturb) status	'TakeAllCalls' | 'DoNotAcceptAnyCalls' | 'DoNotAcceptDepartmentCalls' | 'TakeDepartmentCallsOnly'	f	2016-10-27 08:41:16.303455	2016-10-27 08:42:29.588895
703	159	8	allowSeeMyPresence	boolean	If 'True' enables other extensions to see the extension presence status		f	2016-10-27 08:41:16.306756	2016-10-27 08:42:29.593135
704	159	9	ringOnMonitoredCall	boolean	If 'True' enables to ring extension phone, if any user monitored by this extension is ringing		f	2016-10-27 08:41:16.312391	2016-10-27 08:42:29.599067
705	159	10	pickUpCallsOnHold	boolean	If 'True' enables the extension user to pick up a monitored line on hold		f	2016-10-27 08:41:16.315602	2016-10-27 08:42:29.60343
707	160	0	id	string	Internal identifier of a call		f	2016-10-27 08:43:10.995198	2016-10-27 08:43:10.995198
708	160	1	direction	string	Call direction	'Inbound' | 'Outbound'	f	2016-10-27 08:43:10.999947	2016-10-27 08:43:10.999947
709	160	2	from	string	Phone number or extension number of a caller		f	2016-10-27 08:43:11.003381	2016-10-27 08:43:11.003381
710	160	3	to	string	Phone number or extension number of a callee		f	2016-10-27 08:43:11.006734	2016-10-27 08:43:11.006734
711	160	4	telephonyStatus	string	Telephony call status. See Telephony Status Values for detailed status description	'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'	f	2016-10-27 08:43:11.010281	2016-10-27 08:43:11.010281
712	160	5	sessionId	string	Internal identifier of a call session		f	2016-10-27 08:43:11.015963	2016-10-27 08:43:11.015963
706	159	3	activeCalls	array	Collection of Active Call Info	DetailedPresenceEvent.ActiveCallInfo	f	2016-10-27 08:42:29.569988	2016-10-27 08:45:15.529018
713	161	0	uuid	string	Universally unique identifier of a notification		f	2016-10-27 08:47:03.627668	2016-10-27 08:47:03.627668
714	161	1	event	string	Event filter URI		f	2016-10-27 08:47:03.63087	2016-10-27 08:47:03.63087
715	161	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 08:47:03.634319	2016-10-27 08:47:03.634319
716	161	3	timestamp	string	The datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 08:47:03.63814	2016-10-27 08:47:03.63814
717	161	4	body	DetailedPresencewithSIPEvent	Notification payload body		f	2016-10-27 08:47:03.642492	2016-10-27 08:47:03.642492
718	162	0	extensionId	string	Internal identifier of an extension. Optional parameter		f	2016-10-27 08:58:37.919127	2016-10-27 08:58:37.919127
719	162	1	telephonyStatus	string	Telephony presence status. Returned if telephony status is changed. See Telephony Status Values	'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'	f	2016-10-27 08:58:37.92238	2016-10-27 08:58:37.92238
720	162	2	terminationType	string	Type of call termination. Supported for calls in 'NoCall' status. If the returned termination type is 'Intermediate' it means the call is not actually ended, the connection is established on one of the devices	'Final' | 'Intermediate'	f	2016-10-27 08:58:37.925787	2016-10-27 08:58:37.925787
724	162	6	userStatus	string	User-defined presence status (as previously published by the user)	'Offline' | 'Busy' | 'Available'	f	2016-10-27 08:58:37.941814	2016-10-27 08:58:37.941814
725	162	7	dndStatus	string	Extended DnD (Do not Disturb) status	'TakeAllCalls' | 'DoNotAcceptAnyCalls' | 'DoNotAcceptDepartmentCalls' | 'TakeDepartmentCallsOnly'	f	2016-10-27 08:58:37.94502	2016-10-27 08:58:37.94502
726	162	8	allowSeeMyPresence	boolean	If 'True' enables other extensions to see the extension presence status		f	2016-10-27 08:58:37.949883	2016-10-27 08:58:37.949883
727	162	9	ringOnMonitoredCall	boolean	If 'True' enables to ring extension phone, if any user monitored by this extension is ringing		f	2016-10-27 08:58:37.953474	2016-10-27 08:58:37.953474
728	162	10	pickUpCallsOnHold	boolean	If 'True' enables the extension user to pick up a monitored line on hold		f	2016-10-27 08:58:37.957067	2016-10-27 08:58:37.957067
721	162	3	activeCalls	array	Information on active calls	DetailedPresencewithSIPEvent.ActiveCallInfo	f	2016-10-27 08:58:37.929036	2016-10-27 09:00:05.871134
729	163	0	id	string	Internal identifier of a call		f	2016-10-27 09:00:30.645292	2016-10-27 09:00:30.645292
730	163	1	direction	string	Call direction	'Inbound' | 'Outbound'	f	2016-10-27 09:00:30.648648	2016-10-27 09:00:30.648648
731	163	2	from	string	Phone number or extension number of a caller		f	2016-10-27 09:00:30.65327	2016-10-27 09:00:30.65327
732	163	3	to	string	Phone number or extension number of a callee		f	2016-10-27 09:00:30.657365	2016-10-27 09:00:30.657365
733	163	4	telephonyStatus	string	Telephony call status. See Telephony Status Values for detailed status description	'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'	f	2016-10-27 09:00:30.660481	2016-10-27 09:00:30.660481
734	163	5	sessionId	string	Internal identifier of a call session		f	2016-10-27 09:00:30.663732	2016-10-27 09:00:30.663732
735	163	6	sipData	SIPData	SIP connection settings		f	2016-10-27 09:00:30.666993	2016-10-27 09:00:30.666993
736	164	0	toTag	string	Recipient data		f	2016-10-27 09:00:47.602799	2016-10-27 09:00:47.602799
737	164	1	fromTag	string	Sender data		f	2016-10-27 09:00:47.608706	2016-10-27 09:00:47.608706
738	164	2	remoteUri	string	Remote address URL		f	2016-10-27 09:00:47.612066	2016-10-27 09:00:47.612066
739	164	3	localUri	string	Local address URL		f	2016-10-27 09:00:47.615175	2016-10-27 09:00:47.615175
740	165	0	uuid	string	Universally unique identifier of a notification		f	2016-10-27 09:01:30.535911	2016-10-27 09:01:30.535911
741	165	1	event	string	Event filter URI		f	2016-10-27 09:01:30.541615	2016-10-27 09:01:30.541615
742	165	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 09:01:30.545415	2016-10-27 09:01:30.545415
743	165	3	timestamp	string	The datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 09:01:30.548759	2016-10-27 09:01:30.548759
744	165	4	body	PresenceLineEvent	Notification payload body		f	2016-10-27 09:01:30.552132	2016-10-27 09:01:30.552132
746	166	1	sequence	integer	Order number of a notification to state the chronology		f	2016-10-27 09:01:45.344572	2016-10-27 09:01:45.344572
745	166	0	extension	PresenceLineEvent.ExtensionInfo	Extension information		f	2016-10-27 09:01:45.339461	2016-10-27 09:01:59.795424
747	167	0	id	string	Internal identifier of the extension		f	2016-10-27 09:02:12.599259	2016-10-27 09:08:09.111694
748	168	0	event	string	Event filter URI		f	2016-10-27 09:08:47.604338	2016-10-27 09:08:47.604338
749	168	1	uuid	string	Universally unique identifier of a notification		f	2016-10-27 09:08:47.609225	2016-10-27 09:08:47.609225
750	168	2	subscriptionId	string	Internal identifier of a subscription		f	2016-10-27 09:08:47.612855	2016-10-27 09:08:47.612855
751	168	3	timestamp	string	The datetime of a call action in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	date-time	f	2016-10-27 09:08:47.615932	2016-10-27 09:08:47.615932
752	168	4	extensionId	string	Internal identifier of an extension		f	2016-10-27 09:08:47.619019	2016-10-27 09:08:47.619019
753	168	5	action	string	Calling action, for example 'StartRing'		f	2016-10-27 09:08:47.624905	2016-10-27 09:08:47.624905
754	168	6	sessionId	string	Identifier of a call session		f	2016-10-27 09:08:47.628213	2016-10-27 09:08:47.628213
755	168	7	serverId	string	Identifier of a server		f	2016-10-27 09:08:47.631531	2016-10-27 09:08:47.631531
756	168	8	from	string	Phone number of a caller		f	2016-10-27 09:08:47.634787	2016-10-27 09:08:47.634787
757	168	9	fromName	string	Caller name		f	2016-10-27 09:08:47.639546	2016-10-27 09:08:47.639546
758	168	10	to	string	Phone number of a callee		f	2016-10-27 09:08:47.643397	2016-10-27 09:08:47.643397
759	168	11	toName	string	Callee name		f	2016-10-27 09:08:47.64755	2016-10-27 09:08:47.64755
760	168	12	sid	string	Unique identifier of a session		f	2016-10-27 09:08:47.650864	2016-10-27 09:08:47.650864
761	168	13	toUrl	string	SIP proxy registration name		f	2016-10-27 09:08:47.655156	2016-10-27 09:08:47.655156
762	168	14	srvLvl	string	User data		f	2016-10-27 09:08:47.65969	2016-10-27 09:08:47.65969
763	168	15	srvLvlExt	string	User data		f	2016-10-27 09:08:47.66275	2016-10-27 09:08:47.66275
764	168	16	recUrl	string	File containing recorded caller name		f	2016-10-27 09:08:47.6658	2016-10-27 09:08:47.6658
765	160	6	terminationType	string	Type of call termination. Supported for calls in 'NoCall' status. If the returned termination type is 'Intermediate' it means the call is not actually ended, the connection is established on one of the devices	'Final' | 'Intermediate'	f	2016-10-28 01:22:28.276397	2016-10-28 01:22:28.276397
766	169	0	access_token	string	Access token to pass to subsequent API requests		f	2016-11-04 09:13:53.617152	2016-11-04 09:13:53.617152
767	169	1	expires_in	integer	Issued access token TTL (time to live), in seconds		f	2016-11-04 09:13:53.622946	2016-11-04 09:13:53.622946
768	169	2	refresh_token	string	Refresh token to get a new access token, when the issued one expires		f	2016-11-04 09:13:53.627086	2016-11-04 09:13:53.627086
769	169	3	refresh_token_expires_in	integer	Issued refresh token TTL (time to live), in seconds		f	2016-11-04 09:13:53.630351	2016-11-04 09:13:53.630351
770	169	4	scope	string	List of permissions allowed with this access token, white-space separated		f	2016-11-04 09:13:53.634799	2016-11-04 09:13:53.634799
771	169	5	token_type	string	Type of token. Use this parameter in Authorization header of requests		f	2016-11-04 09:13:53.639361	2016-11-04 09:13:53.639361
772	169	6	owner_id	string	Extension identifier		f	2016-11-04 09:13:53.642543	2016-11-04 09:13:53.642543
773	169	7	endpoint_id	string	Unique identifier of a client application passed by the client, or auto-generated by server if not specified in request		f	2016-11-04 09:13:53.646509	2016-11-04 09:13:53.646509
698	159	2	terminationType	string	Type of call termination. Supported for calls in 'NoCall' status. If the returned termination type is 'Intermediate' it means the call is not actually ended, the connection is established on one of the devices	'final' | 'intermediate'	f	2016-10-27 08:41:16.288636	2016-11-29 09:39:15.999678
129	29	0	id	string	Internal identifier of an extension		f	2016-05-10 05:56:14.8877	2016-12-01 08:29:58.01567
381	81	0	id	string	Standard resource properties ID		f	2016-05-12 11:27:47.503509	2016-12-01 08:30:35.362327
323	64	0	id	string	Internal identifier of a phone number		f	2016-05-12 07:58:11.241533	2016-12-01 08:32:25.355238
185	37	0	id	string	Internal identifier of a phone number		f	2016-05-10 09:22:02.146774	2016-12-01 08:33:02.277063
\.


--
-- Name: model_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('model_properties_id_seq', 773, true);


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY models (id, specification_id, name, properties_text, created_at, updated_at) FROM stdin;
4	1	ExtensionInfo	id\tstring\tInternal identifier of an extension\r\nuri\tstring\tCanonical URI of an extension\r\ncontact\tContact Info\tContact detailed information\r\ndepartments\tCollection of Department Info\tInformation on department extension(s), to which the requested extension belongs. Returned only for user extensions, members of department, requested by single extensionId\r\nextensionNumber\tstring\tNumber of department extension\r\nname\tstring\tExtension user name\r\npartnerId\tstring\tFor Partner Applications Internal identifier of an extension created by partner. The RingCentral supports the mapping of accounts and stores the corresponding account ID/extension ID for each partner ID of a client application. In request URIs partner IDs are accepted instead of regular RingCentral native IDs as path parameters using pid = XXX clause. Though in response URIs contain the corresponding account IDs and extension IDs. In all request and response bodies these values are reflected via partnerId attributes of account and extension\r\npermissions\tExtension Permissions\tExtension permissions, corresponding to the Service Web permissions 'Admin' and 'InternationalCalling'\r\nprofileImage\tProfile Image Info\tInformation on profile image\r\nreferences\tCollection of Reference Info\tList of non-RC internal identifiers assigned to an extension\r\nregionalSettings\tRegional Settings\tExtension region data (timezone, home country, language)\r\nserviceFeatures\tCollection of Extension Service Feature Info\tExtension service features returned in response only when the logged-in user requests his/her own extension info, see also Extension Service Features\r\nsetupWizardState\t'NotStarted' | 'Incomplete' | 'Completed'\tSpecifies extension configuration wizard state (web service setup). The default value is 'NotStarted'\r\nstatus\t'Enabled' | 'Disabled' | 'NotActivated' | 'Unassigned'\tExtension current state. If the status is 'Unassigned'. Returned for all extensions\r\nstatusInfo\tStatus Info\tStatus information (reason, comment). Returned for 'Disabled' status only\r\ntype\t'User' | 'FaxUser' | 'VirtualUser' | 'DigitalUser' | 'Department' | 'Announcement' | 'Voicemail' | 'SharedLinesGroup' | 'PagingOnlyGroup' | 'IvrMenu' | 'ApplicationExtension' | 'ParkLocation'\tExtension type	2016-05-09 15:58:03.514421	2016-09-01 12:07:13.977733
5	1	ContactInfo	firstName\tstring\tFor User extension type only. Extension user first name\nlastName\tstring\tFor User extension type only. Extension user last name\ncompany\tstring\tExtension user company name\nemail\tstring\tEmail of extension user\nbusinessPhone\tstring\tExtension user contact phone number\nbusinessAddress\tContact Address Info\tBusiness address of extension user company	2016-05-09 15:58:58.965109	2016-05-09 15:58:58.965109
6	1	ContactAddressInfo	country\tstring\tCountry name of extension user company. Not returned for Address Book\nstate\tstring\tState/province name of extension user company\ncity\tstring\tCity name of extension user company\nstreet\tstring\tStreet address of extension user company\nzip\tstring\tZip code of extension user company	2016-05-09 15:59:20.93927	2016-05-09 15:59:20.93927
7	1	DepartmentInfo	id\tstring\tInternal identifier of a department extension\nuri\tstring\tCanonical URI of a department extension\nextensionNumber\tstring\tNumber of a department extension	2016-05-09 16:00:06.134994	2016-05-09 16:00:06.134994
8	1	ExtensionPermissions	admin\tPermission Info\tAdmin permission\ninternationalCalling\tPermission Info\tInternational Calling permission	2016-05-09 16:00:43.385208	2016-05-09 16:00:43.385208
9	1	PermissionInfo	enabled\tboolean\tSpecifies if a permission is enabled or not	2016-05-09 16:01:01.967978	2016-05-09 16:01:01.967978
10	1	ProfileImageInfo	uri\tstring\tLink to a profile image. If an image is not uploaded for an extension, only uri is returned\r\netag\tstring\tIdentifier of an image\r\nlastModified\tdatetime\tThe datetime when an image was last updated in ISO 8601 format, for example 2016-03-10T18:07:52.534Z\r\ncontentType\tstring\tThe type of an image\r\nscales\tCollection of ImageUri\tList of URIs to profile images in different dimensions	2016-05-09 16:01:25.915955	2016-08-31 10:06:32.640596
11	1	ReferenceInfo	ref\tstring\tNon-RC identifier of an extension\ntype\t'PartnerId' | 'CustomerDirectoryId'\tType of external identifier	2016-05-09 16:02:22.765833	2016-05-09 16:02:22.765833
12	1	RegionalSettings	homeCountry\tCountry Info\tExtension country information\ntimezone\tTimezone Info\tExtension timezone information\nlanguage\tLanguage Info\tUser interface language data\ngreetingLanguage\tGreeting Language Info\tInformation on language used for telephony greetings\nformattingLocale\tFormatting Locale Info\tFormatting language preferences for numbers, dates and currencies	2016-05-09 16:02:46.249346	2016-05-09 16:02:46.249346
13	1	TimezoneInfo	id\tstring\tInternal identifier of a timezone\nuri\tstring\tCanonical URI of a timezone\nname\tstring\tShort name of a timezone\ndescription\tstring\tMeaningful description of the timezone	2016-05-09 16:03:03.582422	2016-05-09 16:03:03.582422
14	1	LanguageInfo	id\tstring\tInternal identifier of a language\nuri\tstring\tCanonical URI of a language\ngreeting\tboolean\tIndicates whether a language is available as greeting language\nformattingLocale\tboolean\tIndicates whether a language is available as formatting locale\nlocaleCode\tstring\tLocalization code of a language\nname\tstring\tOfficial name of a language\nui\tboolean\tIndicates whether a language is available as UI language	2016-05-09 16:03:22.902218	2016-05-09 16:03:22.902218
15	1	GreetingLanguageInfo	id\tstring\tInternal identifier of a greeting language\nlocaleCode\tstring\tLocalization code of a greeting language\nname\tstring\tOfficial name of a greeting language	2016-05-09 16:03:46.505444	2016-05-09 16:03:46.505444
16	1	FormattingLocaleInfo	id\tstring\tInternal identifier of a formatting language\nlocaleCode\tstring\tLocalization code of a formatting language\nname\tstring\tOfficial name of a formatting language	2016-05-09 16:04:05.775051	2016-05-09 16:04:05.775051
17	1	ExtensionServiceFeatureInfo	enabled\tboolean\tFeature status; shows feature availability for an extension\nfeatureName\tstring\tFeature name, see all available values in Service Feature List\nreason\tstring\tReason of limitation for a particular service feature. Returned only if the enabled parameter value is 'False', see Service Feature Limitations and Reasons. When retrieving service features for an extension, the reasons for the limitations, if any, are returned in response	2016-05-09 16:04:36.453086	2016-05-09 16:04:36.453086
18	1	StatusInfo	comment\tstring\tA free-form user comment, describing the status change reason\nreason\t'Voluntarily' | 'Involuntarily'\tType of suspension	2016-05-09 16:05:10.924616	2016-05-09 16:05:10.924616
19	1	Account.ServiceInfo	uri\tstring\tCanonical URI of a service info resource\r\nbillingPlan\tBilling Plan Info\tInformation on account billing plan\r\nbrand\tBrand Info\tInformation on account brand\r\nservicePlan\tService Plan Info\tInformation on account service plan\r\ntargetServicePlan\tTarget Service Plan Info\tInformation on account target service plan	2016-05-10 03:26:09.436504	2016-09-29 05:43:55.320807
20	1	BillingPlanInfo	id\tstring\tInternal identifier of a billing plan\nname\tstring\tBilling plan name\ndurationUnit\t'Month' | 'Day'\tDuration period\nduration\tstring\tNumber of duration units\ntype\t'Initial' | 'Regular' | 'Suspended' | 'Trial' | 'TrialNoCC' | 'Free'\tBilling plan type	2016-05-10 03:26:58.197877	2016-05-10 03:30:07.599179
21	1	BrandInfo	id\tstring\tInternal identifier of a brand\nname\tstring\tBrand name, for example "RingCentral UK", "ClearFax"\nhomeCountry\tCountry Info\tHome country information	2016-05-10 03:30:53.21695	2016-05-10 03:30:53.21695
22	1	CountryInfo	id\tstring\tInternal identifier of a home country\nuri\tstring\tCanonical URI of a home country\nname\tstring\tOfficial name of a home country	2016-05-10 03:31:35.69777	2016-05-10 03:31:35.69777
23	1	ServicePlanInfo	id\tstring\tInternal identifier of a service plan\nname\tstring\tName of a service plan\nedition\tstring\tEdition of a service plan	2016-05-10 05:08:27.616862	2016-05-10 05:08:27.616862
24	1	TargetServicePlanInfo	id\tstring\tInternal identifier of a target service plan\nname\tstring\tName of a target service plan	2016-05-10 05:08:53.021798	2016-05-10 05:08:53.021798
40	1	PresenceInfo.ExtensionInfo	id\tstring\tInternal identifier of an extension\nuri\tstring\tCanonical URI of an extension\nextensionNumber\tstring\tExtension number (usually 3 or 4 digits)	2016-05-10 09:29:17.45044	2016-05-10 09:29:17.45044
41	1	RingOutInfo	id\tstring\tInternal identifier of a RingOut call\nstatus\tRingOut Status Info\tRingOut status information	2016-05-10 09:36:43.529207	2016-05-10 09:36:43.529207
78	1	ExtensionInfo.Request.Provision	status\t'NotActivated'\tMandatory. Resulting extension status\ncontact\tExtensionInfo.Request.Provision.ContactInfo\tMandatory. Extension user contact information	2016-05-12 09:06:34.721102	2016-05-12 09:06:34.721102
25	1	CallLogRecord	id\tstring\tInternal identifier of a cal log record\nuri\tstring\tCanonical URI of a call log record\nsessionId\tstring\tInternal identifier of a call session\nfrom\tCaller Info\tCaller information\nto\tCaller Info\tCallee information\ntype\t'Voice' | 'Fax'\tCall type\ndirection\t'Inbound' | 'Outbound'\tCall direction\naction\t'Unknown' | 'Phone Call' | 'Phone Login' | 'Incoming Fax' | 'Accept Call' | 'FindMe' | 'FollowMe' | 'Outgoing Fax' | 'Call Return' | 'Calling Card' | 'Ring Directly' | 'RingOut Web' | 'VoIP Call' | 'RingOut PC' | 'RingMe' | 'Transfer' | '411 Info' | 'Emergency' | 'E911 Update' | 'Support' | 'RingOut Mobile'\tAction description of the call operation\nresult\t'Unknown' | 'ResultInProgress' | 'Missed' | 'Call accepted' | 'Voicemail' | 'Rejected' | 'Reply' | 'Received' | 'Receive Error' | 'Fax on Demand' | 'Partial Receive' | 'Blocked' | 'Call connected' | 'No Answer' | 'International Disabled' | 'Busy' | 'Send Error' | 'Sent' | 'No fax machine' | 'ResultEmpty' | 'Account ' | 'Suspended' | 'Call Failed' | 'Call Failure' | 'Internal Error' | 'IP Phone offline' | 'Restricted Number' | 'Wrong Number' | 'Stopped' | 'Hang up' | 'Poor Line Quality' | 'Partially Sent' | 'International Restriction' | 'Abandoned' | 'Declined' | 'Fax Receipt Error' | 'Fax Send Error'\tStatus description of the call operation\nstartTime\tdatetime\tThe call start datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\nduration\tinteger\tCall duration in seconds\nrecording\tRecording Info\tCall recording data. Returned if the call is recorded, the withRecording parameter is set to 'True' in this case\nlastModifiedTime\tdatetime\tFor 'Detailed' view only. The datetime when the call log record was modified in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\ntransport\t'PSTN' | 'VoIP'\tFor 'Detailed' view only. Call transport\nlegs\tCollection of Leg Info\tFor 'Detailed' view only. Leg description	2016-05-10 05:50:30.769975	2016-05-11 08:37:38.777497
26	1	CallerInfo	phoneNumber\tstring\tPhone number of a party. Usually it is a plain number including country and area code like 18661234567. But sometimes it could be returned from database with some formatting applied, for example (866)123-4567. This property is filled in all cases where parties communicate by means of global phone numbers, for example when calling to direct numbers or sending/receiving SMS\nextensionNumber\tstring\tExtension short number (usually 3 or 4 digits). This property is filled when parties communicate by means of short internal numbers, for example when calling to other extension or sending/receiving Company Pager message\nlocation\tstring\tContains party location (city, state) if one can be determined from phoneNumber. This property is filled only when phoneNumber is not empty and server can calculate location information from it (for example, this information is unavailable for US toll-free numbers)\nname\tstring\tSymbolic name associated with a party. If the phone does not belong to the known extension, only the location is returned, the name is not determined then	2016-05-10 05:51:31.536375	2016-05-10 05:51:31.536375
27	1	LegInfo	action\t'Unknown' | 'Phone Call' | 'Phone Login' | 'Incoming Fax' | 'Accept Call' | 'FindMe' | 'FollowMe' | 'Outgoing Fax' | 'Call Return' | 'Calling Card' | 'Ring Directly' | 'RingOut Web' | 'VoIP Call' | 'RingOut PC' | 'RingMe' | 'Transfer' | '411 Info' | 'Emergency' | 'E911 Update' | 'Support' | 'RingOut Mobile'\tAction description of the call operation\ndirection\t'Inbound' | 'Outbound'\tCall direction\nduration\tinteger\tCall duration in seconds\nextension\tLegInfo.ExtensionInfo\tInformation on extension\nlegType\tstring\tLeg type\nstartTime\tdatetime\tThe call start datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\ntype\t'Voice' | 'Fax'\tCall type\nresult\t'Unknown' | 'ResultInProgress' | 'Missed' | 'Call accepted' | 'Voicemail' | 'Rejected' | 'Reply' | 'Received' | 'Receive Error' | 'Fax on Demand' | 'Partial Receive' | 'Blocked' | 'Call connected' | 'No Answer' | 'International Disabled' | 'Busy' | 'Send Error' | 'Sent' | 'No fax machine' | 'ResultEmpty' | 'Account ' | 'Suspended' | 'Call Failed' | 'Call Failure' | 'Internal Error' | 'IP Phone offline' | 'Restricted Number' | 'Wrong Number' | 'Stopped' | 'Hang up' | 'Poor Line Quality' | 'Partially Sent' | 'International Restriction' | 'Abandoned' | 'Declined' | 'Fax Receipt Error' | 'Fax Send Error'\tStatus description of the call operation\nfrom\tCaller Info\tCaller information\nto\tCaller Info\tCallee information\ntransport\t'PSTN' | 'VoIP'\tCall transport\nrecording\tRecording Info\tCall recording data. Returned if the call is recorded	2016-05-10 05:52:16.607196	2016-05-11 08:35:15.215411
30	1	NavigationInfo	firstPage\tPage\tFirst page of the list\r\nnextPage\tPage\tNext page of the list\r\npreviousPage\tPage\tPrevious page of the list\r\nlastPage\tPage\tLast page of the list	2016-05-10 06:00:31.261086	2016-07-18 08:18:42.687456
31	1	PagingInfo	page\tinteger\tThe current page number. 1-indexed, so the first page is 1 by default. May be omitted if result is empty (because non-existent page was specified or perPage=0 was requested)\nperPage\tinteger\tCurrent page size, describes how many items are in each page. Default value is 100. Maximum value is 1000. If perPage value in the request is greater than 1000, the maximum value (1000) is applied\npageStart\tinteger\tThe zero-based number of the first element on the current page. Omitted if the page is omitted or result is empty\npageEnd\tinteger\tThe zero-based index of the last element on the current page. Omitted if the page is omitted or result is empty\ntotalPages\tinteger\tThe total number of pages in a dataset. May be omitted for some resources due to performance reasons\ntotalElements\tinteger\tThe total number of elements in a dataset. May be omitted for some resource due to performance reasons	2016-05-10 06:01:03.02534	2016-05-10 06:01:03.02534
32	1	BusinessAddressInfo	country\tstring\tName of a country\nstate\tstring\tName of a state/province\ncity\tstring\tName of a city\nstreet\tstring\tStreet address\nzip\tstring\tZip code	2016-05-10 06:06:28.217517	2016-05-10 06:06:28.217517
42	1	RingOutStatusInfo	callStatus\t'Invalid' | 'Success' | 'InProgress' | 'Busy' | 'NoAnswer' | 'Rejected' | 'GenericError' | 'Finished' | 'InternationalDisabled' | 'DestinationBlocked' | 'NotEnoughFunds' | 'NoSuchUser'\tStatus of a call\ncallerStatus\t'Invalid' | 'Success' | 'InProgress' | 'Busy' | 'NoAnswer' | 'Rejected' | 'GenericError' | 'Finished' | 'InternationalDisabled' | 'DestinationBlocked' | 'NotEnoughFunds' | 'NoSuchUser'\tStatus of a calling party\ncalleeStatus\t'Invalid' | 'Success' | 'InProgress' | 'Busy' | 'NoAnswer' | 'Rejected' | 'GenericError' | 'Finished' | 'InternationalDisabled' | 'DestinationBlocked' | 'NotEnoughFunds' | 'NoSuchUser'\tStatus of a called party	2016-05-10 09:37:10.217254	2016-05-10 09:37:10.217254
43	1	FullCountryInfo	id\tstring\tInternal identifier of a country\nuri\tstring\tCanonical URI of a country\ncallingCode\tstring\tCountry calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes\nemergencyCalling\tboolean\tEmergency calling feature availability/emergency address requirement indicator\nisoCode\tstring\tCountry code according to the ISO standard, see ISO 3166\nname\tstring\tOfficial name of a country\nnumberSelling\tboolean\tDetermines whether phone numbers are available for a country\nloginAllowed\tboolean\tSpecifies whether login with the phone numbers of this country is enabled or not	2016-05-10 10:56:18.105482	2016-05-10 10:56:18.105482
33	1	MessageInfo	id\tstring\tInternal identifier of a message\nuri\tstring\tCanonical URI of a message\nattachments\tCollection of Message Attachment Info\tThe list of message attachments\navailability\t'Alive' | 'Deleted' | 'Purged'\tMessage availability status. Message in 'Deleted' state is still preserved with all its attachments and can be restored. 'Purged' means that all attachments are already deleted and the message itself is about to be physically deleted shortly\nconversationId\tinteger\tSMS and Pager only. Identifier of the conversation the message belongs to\ncreationTime\tdatetime\tMessage creation datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\ndeliveryErrorCode\tstring\tSMS only. Delivery error code returned by gateway\ndirection\t'Inbound' | 'Outbound'\tMessage direction. Note that for some message types not all directions are allowed. For example voicemail messages can be only inbound\nfaxPageCount\tinteger\tFax only. Page count in fax message\nfaxResolution\t'High' | 'Low'\tFax only. Resolution of fax message. ('High' for black and white image scanned at 200 dpi, 'Low' for black and white image scanned at 100 dpi)\nfrom\tMessageInfo.CallerInfo\tSender information\nlastModifiedTime\tdatetime\tThe datetime when the message was modified on server in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\nmessageStatus\t'Queued' | 'Sent' | 'Delivered' | 'DeliveryFailed' | 'SendingFailed' | 'Received'\tMessage status. Different message types may have different allowed status values.\nFor outbound faxes the aggregated message status is returned:\nIf status for at least one recipient is 'Queued', then 'Queued' value is returned\n\nIf status for at least one recipient is 'SendingFailed', then 'SendingFailed' value is returned\n\nIn other cases Sent status is returned\n\npgToDepartment\tboolean\tPager only True if at least one of the message recipients is Department extension\npriority\t'Normal' | 'High'\tMessage priority\nreadStatus\t'Read' | 'Unread'\tMessage read status\nsmsDeliveryTime\tdatetime\tSMS only. The datetime when outbound SMS was delivered to recipient's handset in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. It is filled only if the carrier sends a delivery receipt to RingCentral\nsmsSendingAttemptsCount\tinteger\tSMS only. Number of attempts made to send an outbound SMS to the gateway (if gateway is temporary unavailable)\nsubject\tstring\tMessage subject. For SMS and Pager messages it replicates message text which is also returned as an attachment\nto\tCollection of MessageInfo.CallerInfo\tRecipient information\ntype\t'Fax' | 'SMS' | 'VoiceMail' | 'Pager' | 'Text'\tMessage type\nvmTranscriptionStatus\t'NotAvailable' | 'InProgress' | 'TimedOut' | 'Completed' | 'CompletedPartially' | 'Failed'\tVoicemail only. Status of voicemail to text transcription. If VoicemailToText feature is not activated for account, the 'NotAvailable' value is returned	2016-05-10 08:33:24.305465	2016-05-11 01:38:02.719534
34	1	MessageAttachmentInfo	id\tstring\tInternal identifier of a message attachment\nuri\tstring\tCanonical URI of a message attachment\ntype\t'AudioRecording' | 'AudioTranscription | 'Text' | 'SourceDocument' | 'RenderedDocument'\tType of message attachment\ncontentType\tstring\tMIME type for a given attachment, for instance 'audio/wav'\nvmDuration\tinteger\tVoicemail only Duration of the voicemail in seconds	2016-05-10 08:34:00.052908	2016-05-10 08:34:00.052908
35	1	MessageInfo.CallerInfo	extensionNumber\tstring\tExtension short number (usually 3 or 4 digits). This property is filled when parties communicate by means of short internal numbers, for example when calling to other extension or sending/receiving Company Pager message\nlocation\tstring\tContains party location (city, state) if one can be determined from phoneNumber. This property is filled only when phoneNumber is not empty and server can calculate location information from it (for example, this information is unavailable for US toll-free numbers)\nmessageStatus\t'Queued' | 'Sent' | 'Delivered' | 'DeliveryFailed' | 'SendingFailed' | 'Received'\tStatus of a message. Returned for outbound fax messages only\nfaxErrorCode\t'Undefined' | 'NoFaxSendPermission' | 'NoInternationalPermission' | 'NoFaxMachine' | 'OutgoingCallError' | 'RenderingFailed' | 'TooManyPages' | 'ReturnToDBQueue' | 'NoCallTime' | 'WrongNumber' | 'ProhibitedNumber' | 'InternalError' | 'FaxSendingProhibited' | 'ThePhoneIsBlacklisted' | 'UserNotFound' | 'ConvertError' | 'DBGeneralError' | 'SkypeBillingFailed' | 'AccountSuspended' | 'ProhibitedDestination' | 'InternationalDisabled'\tFax only. Error code returned in case of fax sending failure. Returned if messageStatus value is 'SendingFailed'\nname\tstring\tSymbolic name associated with a party. If the phone does not belong to the known extension, only the location is returned, the name is not determined then\nphoneNumber\tstring\tPhone number of a party. Usually it is a plain number including country and area code like 18661234567. But sometimes it could be returned from database with some formatting applied, for example (866)123-4567. This property is filled in all cases where parties communicate by means of global phone numbers, for example when calling to direct numbers or sending/receiving SMS	2016-05-10 08:39:35.920104	2016-05-10 08:39:35.920104
36	1	ForwardingNumberInfo	id\tstring\tInternal identifier of a forwarding/call flip phone number\nuri\tstring\tCanonical URI of a forwarding/call flip phone number\nphoneNumber\tstring\tForwarding/Call flip phone number\nlabel\tstring\tForwarding/Call flip number title\nfeatures\t'CallFlip' | 'CallForwarding'\tType of option this phone number is used for. Multiple values are accepted\nflipNumber\tinteger\tNumber assigned to the call flip phone number, corresponds to the shortcut dial number	2016-05-10 08:46:34.350488	2016-05-10 08:46:34.350488
38	1	PhoneNumberInfo.ExtensionInfo	id\tstring\tInternal identifier of an extension\nuri\tstring\tCanonical URI of an extension\nextensionNumber\tstring\tNumber of department extension\npartnerId\tstring\tFor Partner Applications Internal identifier of an extension created by partner. The RingCentral supports the mapping of accounts and stores the corresponding account ID/extension ID for each partner ID of a client application. In request URIs partner IDs are accepted instead of regular RingCentral native IDs as path parameters using pid = XXX clause. Though in response URIs contain the corresponding account IDs and extension IDs. In all request and response bodies these values are reflected via partnerId attributes of account and extension	2016-05-10 09:24:23.557847	2016-05-10 09:24:23.557847
39	1	PresenceInfo	uri\tstring\tCanonical URI of a presence info resource\nallowSeeMyPresence\tboolean\tIf 'True' enables other extensions to see the extension presence status\ndndStatus\t'TakeAllCalls' | 'DoNotAcceptAnyCalls' | 'DoNotAcceptDepartmentCalls' | 'TakeDepartmentCallsOnly'\tExtended DnD (Do not Disturb) status. Cannot be set for Department/Announcement/Voicemail (Take Messages Only)/Fax User/Shared Lines Group/Paging Only Group/IVR Menu/Application Extension/Park Location extensions. The 'DoNotAcceptDepartmentCalls' and 'TakeDepartmentCallsOnly' values are applicable only for extensions - members of a Department; if these values are set for department outsiders, the 400 Bad Request error code is returned. The 'TakeDepartmentCallsOnly' status can be set through the old RingCentral user interface and is available for some migrated accounts only.\nextension\tPresenceInfo.ExtensionInfo\tInformation on extension, for which this presence data is returned\nmessage\tstring\tCustom status message (as previously published by user)\npickUpCallsOnHold\tboolean\tIf 'True' enables the extension user to pick up a monitored line on hold\npresenceStatus\t'Offline' | 'Busy' | 'Available'\tAggregated presence status, calculated from a number of sources\nringOnMonitoredCall\tboolean\tIf 'True' enables to ring extension phone, if any user monitored by this extension is ringing\ntelephonyStatus\t'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'\tTelephony presence status\nuserStatus\t'Offline' | 'Busy' | 'Available'\tUser-defined presence status (as previously published by the user)	2016-05-10 09:28:11.947042	2016-05-10 14:04:49.53818
44	1	LocationInfo	uri\tstring\tCanonical URI of a location\nareaCode\tstring\tArea code of the location\ncity\tstring\tOfficial name of the city, belonging to the certain state\nnpa\tstring\tArea code of the location (3-digit usually), according to the NANP number format, that can be summarized as NPA-NXX-xxxx and covers Canada, the United States, parts of the Caribbean Sea, and some Atlantic and Pacific islands. See for details North American Numbering Plan\nnxx\tstring\tCentral office code of the location, according to the NANP number format, that can be summarized as NPA-NXX-xxxx and covers Canada, the United States, parts of the Caribbean Sea, and some Atlantic and Pacific islands. See for details North American Numbering Plan\nstate\tstring\tID and URI of the state this location belongs to, see State Info	2016-05-10 11:17:41.721777	2016-05-10 11:17:41.721777
45	1	StateInfo	id\tstring\tInternal identifier of a state\nuri\tstring\tCanonical URI of a state\ncountry\tStateInfo.CountryInfo\tInformation on a country the state belongs to\nisoCode\tstring\tShort code for a state (2-letter usually)\nname\tstring\tOfficial name of a state	2016-05-10 11:25:10.556956	2016-05-10 14:03:49.500649
46	1	StateInfo.CountryInfo	id\tstring\tInternal identifier of a state\nuri\tstring\tCanonical URI of a state	2016-05-10 11:27:06.556225	2016-05-10 11:27:06.556225
47	1	SubscriptionInfo	id\tstring\tInternal identifier of a subscription\nuri\tstring\tCanonical URI of a subscription\neventFilters\tCollection of string\tCollection of URIs to API resources (message-store/presence/detailed presence)\nexpirationTime\tdatetime\tSubscription expiration datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\nexpiresIn\tinteger\tSubscription lifetime in seconds. The default value is 900\nstatus\t'Active' | 'Suspended'\tSubscription status\ncreationTime\tdatetime\tSubscription creation datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\ndeliveryMode\tDelivery Mode\tDelivery mode data	2016-05-10 11:41:32.598861	2016-05-10 11:41:32.598861
48	1	DeliveryMode	transportType\t'PubNub' | 'APNS' | 'PubNub/APNS/VoIP'\tNotifications transportation provider name. 'APNS' (Apple Push Notifications Service)\nencryption\tboolean\tOptional parameter. Specifies if the message will be encrypted or not. For APNS transport type the value is always "false"\naddress\tstring\tPubNub channel name. For APNS transport type - internal identifier of a device "device_token"\nsubscriberKey\tstring\tPubNub subscriber credentials required to subscribe to the channel\nsecretKey\tstring\tPubNub subscriber credentials required to subscribe to the channel. Optional (for PubNub transport type only)\nencryptionAlgorithm\tstring\tEncryption algorithm 'AES' (for PubNub transport type only)\nencryptionKey\tstring\tKey for notification message decryption (for PubNub transport type only)	2016-05-10 11:42:34.607175	2016-05-10 11:42:34.607175
49	1	CallLogInfo	id\tstring\tInternal identifier of a cal log record\nuri\tstring\tCanonical URI of a call log record\nsessionId\tstring\tInternal identifier of a call session\nfrom\tCaller Info\tCaller information\nto\tCaller Info\tCallee information\ntype\t'Voice' | 'Fax'\tCall type\ndirection\t'Inbound' | 'Outbound'\tCall direction\naction\t'Unknown' | 'Phone Call' | 'Phone Login' | 'Incoming Fax' | 'Accept Call' | 'FindMe' | 'FollowMe' | 'Outgoing Fax' | 'Call Return' | 'Calling Card' | 'Ring Directly' | 'RingOut Web' | 'VoIP Call' | 'RingOut PC' | 'RingMe' | 'Transfer' | '411 Info' | 'Emergency' | 'E911 Update' | 'Support' | 'RingOut Mobile'\tAction description of the call operation\nresult\t'Unknown' | 'ResultInProgress' | 'Missed' | 'Call accepted' | 'Voicemail' | 'Rejected' | 'Reply' | 'Received' | 'Receive Error' | 'Fax on Demand' | 'Partial Receive' | 'Blocked' | 'Call connected' | 'No Answer' | 'International Disabled' | 'Busy' | 'Send Error' | 'Sent' | 'No fax machine' | 'ResultEmpty' | 'Account ' | 'Suspended' | 'Call Failed' | 'Call Failure' | 'Internal Error' | 'IP Phone offline' | 'Restricted Number' | 'Wrong Number' | 'Stopped' | 'Hang up' | 'Poor Line Quality' | 'Partially Sent' | 'International Restriction' | 'Abandoned' | 'Declined' | 'Fax Receipt Error' | 'Fax Send Error'\tStatus description of the call operation\nstartTime\tdatetime\tThe call start datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\nduration\tinteger\tCall duration in seconds\nrecording\tRecording Info\tCall recording data. Returned if the call is recorded	2016-05-10 14:28:28.756277	2016-05-11 08:39:36.298148
50	1	ServerInfo	uri\tstring\tCanonical URI of the API version\napiVersions\tCollection of Version Info\tFull API version information: uri, number, release date\nserverVersion\tstring\tServer version\nserverRevision\tstring\tServer revision	2016-05-10 14:36:17.53077	2016-05-10 14:36:17.53077
51	1	VersionInfo	uri\tstring\tCanonical URI of API versions\nversionString\tstring\tVersion of the RingCentral REST API\nreleaseDate\tstring\tRelease date of this version\nuriString\tstring\tURI part determining the current version	2016-05-10 14:36:39.410415	2016-05-10 14:36:39.410415
52	1	AccountInfo	id\tstring\tInternal identifier of an account\r\nuri\tstring\tCanonical URI of an account\r\nmainNumber\tstring\tMain phone number of the current account\r\noperator\tExtension Info\tOperator's extension information. This extension will receive all calls and messages intended for the operator\r\npartnerId\tstring\tAdditional account identifier, developed and applied by the client\r\nserviceInfo\tAccount.ServiceInfo\tAccount service information, including brand, service plan and billing plan\r\nsetupWizardState\t'NotStarted' | 'Incomplete' | 'Completed'\tSpecifies account configuration wizard state (web service setup). The default value is 'NotStarted'\r\nstatus\t'Confirmed' | 'Disabled'\tStatus of the current account\r\nstatusInfo\tStatus Info\tStatus information (reason, comment, lifetime). Returned for 'Disabled' status only	2016-05-10 14:40:52.156192	2016-09-29 05:44:07.155485
53	1	RingOut.Request.From	phoneNumber\tstring\tPhone number in E.164 format\nforwardingNumberId\tstring\tInternal identifier of a forwarding number; returned in response in the id field. Can be specified instead of the phoneNumber attribute	2016-05-12 02:42:42.065277	2016-05-12 03:01:03.60921
54	1	RingOut.Request.To	phoneNumber\tstring\tPhone number in E.164 format	2016-05-12 02:43:04.887706	2016-05-12 03:01:17.315226
55	1	RingOut.Request.CountryInfo	id\tstring\tDialing plan country identifier	2016-05-12 02:44:01.953985	2016-05-12 03:01:33.925551
56	1	Subscription.Request.DeliveryMode	transportType\t'PubNub' | 'APNS' | 'PubNub/APNS/VoIP'\tNotifications transportation provider name. 'APNS' (Apple Push Notifications Service)\nencryption\tboolean\tOptional parameter. Specifies if the message will be encrypted or not. If request contains any presence event filter the value by default is 'True' (even if specified as 'false'). If request contains only message event filters the value by default is 'False'	2016-05-12 03:00:34.344297	2016-05-12 03:00:34.344297
57	1	Department.Response.ExtensionInfo	id\tstring\tInternal identifier of an extension\nuri\tstring\tCanonical URI of an extension\nextensionNumber\tstring\tNumber of department extension\npartnerId\tstring\tFor Partner Applications Internal identifier of an extension created by partner. The RingCentral supports the mapping of accounts and stores the corresponding account ID/extension ID for each partner ID of a client application. In request URIs partner IDs are accepted instead of regular RingCentral native IDs as path parameters using pid = XXX clause. Though in response URIs contain the corresponding account IDs and extension IDs. In all request and response bodies these values are reflected via partnerId attributes of account and extension	2016-05-12 07:43:42.429048	2016-05-12 07:43:42.429048
76	1	ExtensionInfo.Request.PasswordPIN	password\tstring\tPassword for extension\nivrPin\tstring\tIVR PIN	2016-05-12 09:00:35.865927	2016-05-12 09:00:35.865927
77	1	ExtensionInfo.Request.PartnerId	partnerId\tstring\tExtension partner identifier	2016-05-12 09:04:16.967115	2016-05-12 09:04:16.967115
58	1	DeviceInfo	id\tstring\tInternal identifier of a device\nuri\tstring\tCanonical URI of a device\nsku\tstring\tDevice identification number (stock keeping unit) in the format TP-ID [-AT-AC], where TP is device type (HP for RC HardPhone, DV for all other devices including softphone); ID - device model ID; AT -addon type ID; AC - addon count (if any). For example 'HP-56-2-2'\ntype\t'SoftPhone' | 'OtherPhone' | 'HardPhone'\tDevice type. The default value is 'HardPhone'\nname\tstring\tDevice name. Mandatory if ordering "SoftPhone" or "OtherPhone". Optional for "HardPhone". If not specified for HardPhone, then device "model" name is used as device "name"\nserial\tstring\tSerial number for HardPhone (is returned only when the phone is shipped and provisioned); endpoint_id for softphone and mobile applications\ncomputerName\tstring\tPC name for softphone\nmodel\tModel Info\tHardPhone model information\nextension\tDeviceInfo.ExtensionInfo\tThis attribute can be omitted for unassigned devices\nemergencyServiceAddress\tEmergency Address Info\tAddress for emergency cases. The same emergency address is assigned to all the numbers of one device\nphoneLines\tPhone Lines Info\tPhone lines information\nshipping\tShipping Info\tShipping information, according to which devices (in case of "HardPhone") or e911 stickers (in case of "SoftPhone" and "OtherPhone") will be delivered to the customer\nboxBillingId\tinteger\tBox billing identifier of a device. Applicable only for HardPhones. It is an alternative way to identify the device to be ordered. Either "model" structure, or "boxBillingId" must be specified for HardPhone	2016-05-12 07:46:51.250423	2016-05-12 07:59:33.642674
59	1	ModelInfo	id\tstring\tDevice model identifier. Mandatory when ordering a HardPhone if boxBillingId is not used for ordering\nname\tstring\tDevice name\naddons\tCollection of Addon Info\tAddons description	2016-05-12 07:50:53.87196	2016-05-12 07:50:53.87196
60	1	AddonInfo	id\tstring\tAddon identifier. For HardPhones of certain types, which are compatible with this addon identifier\ncount\tinteger\tNumber of addons. For HardPhones of certain types, which are compatible with such addon identifier	2016-05-12 07:51:09.868426	2016-05-12 07:51:09.868426
61	1	DeviceInfo.ExtensionInfo	id\tstring\tInternal identifier of an extension\nuri\tstring\tCanonical URI of an extension\nextensionNumber\tstring\tNumber of department extension\npartnerId\tstring\tFor Partner Applications Internal identifier of an extension created by partner. The RingCentral supports the mapping of accounts and stores the corresponding account ID/extension ID for each partner ID of a client application. In request URIs partner IDs are accepted instead of regular RingCentral native IDs as path parameters using pid = XXX clause. Though in response URIs contain the corresponding account IDs and extension IDs. In all request and response bodies these values are reflected via partnerId attributes of account and extension	2016-05-12 07:53:35.178726	2016-05-12 07:59:21.435636
62	1	EmergencyAddressInfo	customerName\tstring\tName of a customer\nstreet\tstring\tStreet address, line 1 - street address, P.O. box, company name, c/o\nstreet2\tstring\tStreet address, line 2 - apartment, suite, unit, building, floor, etc.\ncity\tstring\tCity name\nstate\tstring\tState/province name\nzip\tstring\tZip code\ncountry\tstring\tCountry name	2016-05-12 07:54:43.10609	2016-05-12 07:54:43.10609
63	1	PhoneLinesInfo	lineType\t'Standalone' | 'StandaloneFree' | 'BlaPrimary' | 'BlaSecondary'\tType of phone line\nphoneInfo\tPhoneLinesInfo.PhoneNumberInfo\tPhone number information	2016-05-12 07:57:28.434808	2016-05-12 07:57:28.434808
65	1	ShippingInfo	status\t'Initial' | 'Accepted' | 'Shipped'\tShipping status of the order item. It is set to 'Initial' when the order is submitted. Then it is changed to 'Accepted' when a distributor starts processing the order. Finally it is changed to Shipped which means that distributor has shipped the device.\ncarrier\tstring\tShipping carrier name. Appears only if the device status is "Shipped"\ntrackingNumber\tstring\tCarrier-specific tracking number. Appears only if the device status is "Shipped"\nmethod\tCollection of Shipping Method\tShipping method information\naddress\tCollection of Shipping Address\tShipping address for the order. If it coincides with the Emergency Service Address, then can be omitted. By default the same value as the emergencyServiceAddress. Multiple addresses can be specified; in case an order contains several devices, they can be delivered to different addresses	2016-05-12 08:01:35.721845	2016-05-12 08:02:23.238332
66	1	ShippingMethod	id\t'1' | '2' | '3'\tMethod identifier. The default value is "1" (Ground)\nname\t'Ground' | '2 Day' | 'Overnight'\tMethod name, corresponding to the identifier	2016-05-12 08:02:54.861994	2016-05-12 08:02:54.861994
67	1	ShippingAddress	customerName\tstring\tName of a receiver\nstreet\tstring\tStreet address, line 1 - street address, P.O. box, company name, c/o\nstreet2\tstring\tStreet address, line 2 - apartment, suite, unit, building, floor, etc.\ncity\tstring\tCity name\nstate\tstring\tState/province name\nzip\tstring\tZip code\ncountry\tstring\tCountry name	2016-05-12 08:03:19.709267	2016-05-12 08:03:19.709267
68	1	ExtensionInfo.Request.StatusInfo	status\t'Disabled' | 'Enabled' | 'NotActivated'\tRequired extension status\nstatusInfo\tStatusInfo\tExtension status information, only for the 'Disabled' status	2016-05-12 08:47:51.760472	2016-05-12 08:47:51.760472
70	1	ExtensionInfo.Request.ContactInfo	contact\tContact Info\tContact information\nregionalSettings\tExtensionInfo.Request.ContactInfo.RegionalSettings\tRegion data (timezone, home country, language)\nsetupWizardState\t'NotStarted' | 'Incomplete' | 'Completed'\tSpecifies extension configuration wizard state (web service setup). The default value is 'NotStarted'\ndepartment\tstring\tExtension user department	2016-05-12 08:49:58.283044	2016-05-12 08:53:43.674846
71	1	ExtensionInfo.Request.ContactInfo.RegionalSettings	timezone\tExtensionInfo.Request.ContactInfo.RegionalSettings.Timezone\tTimezone data\nlanguage\tExtensionInfo.Request.ContactInfo.RegionalSettings.Language\tUser interface language data\ngreetingLanguage\tExtensionInfo.Request.ContactInfo.RegionalSettings.GreetingLanguage\tInformation on language used for telephony greetings\nformattingLocale\tExtensionInfo.Request.ContactInfo.RegionalSettings.FormattingLocale\tFormatting language preferences for numbers, dates and currencies	2016-05-12 08:55:57.882184	2016-05-12 08:55:57.882184
72	1	ExtensionInfo.Request.ContactInfo.RegionalSettings.Timezone	id\tstring\tTimezone identifier. The default value is "58" (US&Canada)	2016-05-12 08:56:32.138543	2016-05-12 08:56:32.138543
73	1	ExtensionInfo.Request.ContactInfo.RegionalSettings.Language	id\tstring\tLanguage identifier. The default value is "1033" (English US)	2016-05-12 08:57:19.523418	2016-05-12 08:57:19.523418
74	1	ExtensionInfo.Request.ContactInfo.RegionalSettings.GreetingLanguage	id\tstring\tInternal identifier of a greeting language	2016-05-12 08:58:07.273884	2016-05-12 08:58:07.273884
75	1	ExtensionInfo.Request.ContactInfo.RegionalSettings.FormattingLocale	id\tstring\tInternal identifier of a formatting language	2016-05-12 08:58:45.460216	2016-05-12 08:58:45.460216
79	1	ExtensionInfo.Request.Provision.ContactInfo	firstName\tstring\tMandatory. Extension user first name\nlastName\tstring\tMandatory. Extension user last name\nemail\tstring\tMandatory. Extension user contact email	2016-05-12 09:06:53.473808	2016-05-12 09:06:53.473808
80	1	SyncInfo	syncType\t'FSync' | 'ISync'\tType of synchronization\nsyncToken\tstring\tSynchronization token\nsyncTime\tdatetime\tLast synchronization datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z	2016-05-12 11:26:27.047918	2016-05-12 11:26:27.047918
82	1	GroupInfo	id\tstring\tInternal identifier of a group\nuri\tstring\tCanonical URI of a group\ncontactsCount\tinteger\tAmount of contacts in a group\ngroupName\tstring\tName of a group\nnotes\tstring\tNotes for a group	2016-05-12 12:25:00.250429	2016-05-12 12:25:00.250429
83	1	AnsweringRuleInfo	uri\tstring\tCanonical URI to the answering rule resource\r\nid\tstring\tInternal identifier of an asnwering rule\r\ntype\t'BusinessHours' | 'AfterHours' | 'Custom'\tType of an answering rule\r\nname\tstring\tName of an answering rule specified by user\r\nenabled\tboolean\tSpecifies if an answering rule is active or inactive\r\nschedule\tSchedule Info\tSchedule when an answering rule should be applied\r\ncalledNumbers\tCollection of AnsweringRuleInfo.CalleeInfo\tAnswering rules are applied when calling to selected number(s)\r\ncallers\tCollection of AnsweringRuleInfo.CallerInfo\tAnswering rules are applied when calls are received from specified caller(s)\r\ncallHandlingAction\t'ForwardCalls' | 'TakeMessagesOnly' | 'PlayAnnouncementOnly' | 'UnconditionalForwarding'\tSpecifies how incoming calls are forwarded\r\nforwarding\tForwarding Info\tForwarding parameters. Returned if 'ForwardCalls' is specified in 'callHandlingAction'. These settings determine the forwarding numbers to which the call will be forwarded\r\nunconditionalForwarding\tUnconditional Forwarding Info\tUnconditional forwarding parameters. Returned if 'UnconditionalForwarding' is specified in 'callHandlingAction'\r\nvoicemail\tVoicemail Info\tSpecifies whether to take a voicemail and who should do it\r\ngreetings\tCollection of Greeting Info\tPredefined greetings applied for an answering rule	2016-05-12 13:34:03.37133	2016-09-23 08:16:25.750828
84	1	ScheduleInfo	weeklyRanges\tWeekly Schedule Info\tWeekly schedule\nranges\tRanges Info\tSpecific data ranges\nref\t'BusinessHours' | 'AfterHours'\tThe user's schedule specified for business hours or after hours; it can also be set/retrieved calling the corresponding method	2016-05-12 13:34:40.730949	2016-05-12 13:34:40.730949
85	1	WeeklyScheduleInfo	monday\tCollection of Time Interval\tTime intervals for a particular day\ntuesday\tCollection of Time Interval\tTime intervals for a particular day\nwednesday\tCollection of Time Interval\tTime intervals for a particular day\nthursday\tCollection of Time Interval\tTime intervals for a particular day\nfriday\tCollection of Time Interval\tTime intervals for a particular day\nsaturday\tCollection of Time Interval\tTime intervals for a particular day\nsunday\tCollection of Time Interval\tTime intervals for a particular day	2016-05-12 13:35:31.147654	2016-05-12 13:35:31.147654
86	1	RangesInfo	from\tdatetime\tDate and time in format YYYY-MM-DD hh:mm\nto\tdatetime\tDate and time in format YYYY-MM-DD hh:mm	2016-05-12 13:35:59.608646	2016-05-12 13:35:59.608646
87	1	TimeInterval	from\tdatetime\tTime in format hh:mm\nto\tdatetime\tTime in format hh:mm	2016-05-12 13:36:46.303704	2016-05-12 13:36:46.303704
88	1	AnsweringRuleInfo.CalleeInfo	phoneNumber\tstring\tCalled phone number	2016-05-12 13:37:03.216559	2016-05-13 02:57:13.025916
89	1	AnsweringRuleInfo.CallerInfo	callerId\tstring\tPhone number of a caller\nname\tstring\tContact name of a caller	2016-05-12 13:37:21.303683	2016-05-13 02:50:02.259888
90	1	ForwardingInfo	notifyMySoftPhones\tboolean\tSpecifies if the user's softphone(s) are notified before forwarding the incoming call to desk phones and forwarding numbers\nnotifyAdminSoftPhones\tboolean\tSpecifies if the administrator's softphone is notified before forwarding the incoming call to desk phones and forwarding numbers. The default value is 'False'\nsoftPhonesRingCount\tinteger\tNumber of rings before forwarding starts\nringingMode\t'Sequentially' | 'Simultaneously'\tSpecifies the order in which forwarding numbers ring. 'Sequentially' means that forwarding numbers are ringing one at a time, in order of priority. 'Simultaneously' means that forwarding numbers are ring all at the same time\nrules\tCollection of Rule Info\tInformation on a call forwarding rule	2016-05-12 13:37:53.658445	2016-05-12 13:38:40.540316
91	1	RuleInfo	index\tinteger\tForwarding number (or group) ordinal\nringCount\tinteger\tNumber of rings for a forwarding number (or group)\nforwardingNumbers\tCollection of RuleInfo.ForwardingNumberInfo\tForwarding number (or group) data	2016-05-12 13:39:10.976393	2016-05-13 03:05:46.51327
92	1	RuleInfo.ForwardingNumberInfo	uri\tstring\tLink to a forwarding number resource\nid\tstring\tInternal identifier of a forwarding number\nphoneNumber\tstring\tPhone number to which the call is forwarded\nlabel\tstring\tTitle of a forwarding number	2016-05-12 13:40:23.158568	2016-05-12 13:40:23.158568
93	1	UnconditionalForwardingInfo	phoneNumber\tstring\tPhone number to which the call is forwarded	2016-05-12 13:40:44.970156	2016-05-12 13:40:44.970156
94	1	VoicemailInfo	enabled\tboolean\tIf 'True' then voicemails are allowed to be received\nrecipient\tRecipient Info\tRecipient data	2016-05-12 13:41:04.003247	2016-05-12 13:41:04.003247
95	1	RecipientInfo	uri\tstring\tLink to a recipient extension resource\nid\tstring\tInternal identifier of a recipient extension	2016-05-12 13:41:22.403491	2016-05-12 13:41:22.403491
96	1	BlockedNumberInfo	id\tstring\tStandard resource properties ID and canonical URI, see the section called “Resource Identification Properties”\nuri\tstring\tCanonical URI of a blocked number resource\nname\tstring\tName assigned by a user to a blocked phone number\nphoneNumber\tstring\tPhone number to be blocked	2016-05-12 13:52:41.514497	2016-05-12 13:52:41.514497
97	1	BusinessHour.ScheduleInfo	weeklyRanges\tWeekly Schedule Info\tWeekly schedule	2016-05-12 14:00:29.919026	2016-05-12 14:00:29.919026
98	1	ConferencingInfo	uri\tstring\tCanonical URI of a conferencing\nallowJoinBeforeHost\tboolean\tDetermines if host user allows conference participants to join before the host\nhostCode\tstring\tAccess code for a host user\nmode\tstring\tInternal parameter specifying conferencing engine\nparticipantCode\tstring\tAccess code for any participant\nphoneNumber\tstring\tPrimary conference phone number for user's home country returned in E.164 (11-digits) format\ntapToJoinUri\tstring\tShort URL leading to the service web page Tap to Join for audio conference bridge\nphoneNumbers\tCollection of ConferencingInfo.PhoneNumberInfo\tList of multiple dial-in phone numbers to connect to audio conference service, relevant for user's brand. Each number is given with the country and location information, in order to let the user choose the less expensive way to connect to a conference. The first number in the list is the primary conference number, that is default and domestic	2016-05-12 14:13:56.255195	2016-05-12 14:15:42.947801
99	1	ConferencingInfo.PhoneNumberInfo	country\tConferencingInfo.PhoneNumberInfo.CountryInfo\tInformation on a home country of a conference phone number\ndefault\tboolean\t'True' if the number is default for the conference. Default conference number is a domestic number that can be set by user (otherwise it is set by the system). Only one default number per country is allowed\nhasGreeting\tboolean\t'True' if the greeting message is played on this number\nlocation\tstring\tLocation (city, region, state) of a conference phone number\nphoneNumber\tstring\tDial-in phone number to connect to a conference	2016-05-12 14:15:25.159563	2016-05-12 14:17:04.197235
100	1	ConferencingInfo.PhoneNumberInfo.CountryInfo	id\tstring\tInternal identifier of a country\nuri\tstring\tCanonical URI of a country\ncallingCode\tstring\tCountry calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes\nemergencyCalling\tboolean\tEmergency calling feature availability/emergency address requirement indicator\nisoCode\tstring\tCountry code according to the ISO standard, see ISO 3166\nname\tstring\tOfficial name of a country	2016-05-12 14:16:32.204223	2016-05-12 14:16:32.204223
101	1	Conferencing.Request.PhoneNumber	phoneNumber\tstring\tDial-in phone number to connect to a conference\ndefault\tboolean\t'True' if the number is default for the conference. Default conference number is a domestic number that can be set by user (otherwise it is set by the system). Only one default number per country is allowed	2016-05-12 14:21:06.520103	2016-05-12 14:21:06.520103
102	1	GrantInfo	uri\tstring\tCanonical URI of a grant\nextension\tGrantInfo.ExtensionInfo\tExtension information\ncallPickup\tboolean\tSpecifies if picking up of other extensions' calls is allowed for the extension. If 'Presence' feature is disabled for the given extension, the flag is not returned\ncallMonitoring\tboolean\tSpecifies if monitoring of other extensions' calls is allowed for the extension. If 'CallMonitoring' feature is disabled for the given extension, the flag is not returned	2016-05-12 14:41:35.14278	2016-05-12 14:42:09.901971
103	1	GrantInfo.ExtensionInfo	id\tstring\tInternal identifier of an extension\nuri\tstring\tCanonical URI of an extension\nextensionNumber\tstring\tExtension short number (usually 3 or 4 digits)\ntype\t'User' | 'Fax User' | 'VirtualUser' | 'DigitalUser' | 'Department' | 'Announcement' | 'Voicemail' | 'SharedLinesGroup' | 'PagingOnly' | 'IvrMenu' | 'ApplicationExtension' | 'Park Location'\tExtension type	2016-05-12 14:42:41.599434	2016-05-12 14:42:41.599434
104	1	ServiceFeatureInfo	featureName\tstring\tFeature name, see all available values in Service Feature List\nenabled\tTrue | False\tFeature status, shows feature availability for the extension	2016-05-12 15:42:54.288545	2016-05-12 15:42:54.288545
105	1	AccountLimits	freeSoftPhoneLinesPerExtension\tinteger\tThe maximum number of free softphone digital lines per user extension\nmeetingSize\tinteger\tThe maximum number of participants in RingCentral Meeting hosted by this account's user\nmaxMonitoredExtensionsPerUser\tinteger\tThe maximum number of extensions which can be included in the list of users monitored for Presence	2016-05-12 15:44:37.78668	2016-06-23 01:46:00.874723
106	1	AttachmentInfo	uri\tstring\tLink to custom data attachment\ncontentType\tstring\tType of custom data attachment, see also MIME Types	2016-05-12 15:50:37.694712	2016-05-12 15:50:37.694712
107	1	ParsePhoneNumber.CountryInfo	id\tstring\tInternal identifier of a country\nuri\tstring\tCanonical URI of a country\ncallingCode\tstring\tCountry calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes\nemergencyCalling\tboolean\tEmergency calling feature availability/emergency address requirement indicator\nisoCode\tstring\tCountry code according to the ISO standard, see ISO 3166\nname\tstring\tOfficial name of a country	2016-05-12 16:05:07.530863	2016-05-12 16:05:07.530863
108	1	ParsePhoneNumber.PhoneNumberInfo	areaCode\tstring\tArea code of the location (3-digit usually), according to the NANP number format, that can be summarized as NPA-NXX-xxxx and covers Canada, the United States, parts of the Caribbean Sea, and some Atlantic and Pacific islands. See North American Numbering Plan for details\ncountry\tCollection of ParsePhoneNumber.CountryInfo\tInformation on a country the phone number belongs to\ndialable\tstring\tDialing format of a phone number\ne164\tstring\tE.164 (11-digits) format of a phone number\nformattedInternational\tstring\tInternational format of a phone number\nformattedNational\tstring\tDomestic format of a phone number\noriginalString\tstring\tOne of the numbers to be parsed, passed as a string in response\nspecial\tboolean\t"True" if the number is in a special format (for example N11 code)\nnormalized\tstring\tE.164 (11-digits) format of a phone number without the plus sign ('+')	2016-05-12 16:05:53.211464	2016-05-12 16:05:53.211464
109	1	LookUpPhoneNumber.PhoneNumberInfo	phoneNumber\tstring\tPhone number in E.164 format without a '+'\nformattedNumber\tstring\tPhone number formatted according to current brand's default country\nvanityPattern\tstring\tVanity pattern for this number. Returned only when vanity search option is requested. Vanity pattern corresponds to request parameters nxx plus line or numberPattern\nrank\tinteger\tThe value is returned if the extendedSearch parameter is true. '10' is the closest match	2016-05-12 16:09:52.106281	2016-05-12 16:11:12.707194
110	1	ReservePhoneNumber.Request.ReserveRecord	phoneNumber\tstring\tPhone number in E.164 format without a '+'\nreservedTill\tdatetime\tThe datetime up to which the number is reserved in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. If it is omitted or explicitly set to 'null', the number will be un-reserved if it was reserved previously by the same session. 'Min' value is 30 seconds; 'Max' value is 30 days (for reservation by brand) and 20 minutes (for reservation by account/session)	2016-05-12 16:14:40.934469	2016-05-12 16:20:48.211009
111	1	ReservePhoneNumber.Response.ReserveRecord	phoneNumber\tstring\tPhone number in E.164 format without a '+'\nformattedNumber\tstring\tDomestic format of a phone number\nreservedTill\tdatetime\tThe datetime up to which the number is reserved in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. No value means that number is not reserved anymore\nreservationId\tstring\tInternal identifier of phone number reservation; encoded data including reservation type (by brand, by account, by session), particular brand/account/session data, and reservation date and time\nstatus\t'Enabled' | 'Pending' | 'Disabled'\tPhone number status\nerror\t'NumberIsAlreadyProvisioned' | 'NumberReserved' | 'NumberNotAvailable'\tThe error code in case of reservation/un-reservation failure	2016-05-12 16:21:28.34052	2016-05-12 16:21:28.34052
117	1	MeetingInfo	uri\tstring\tCanonical URI of a meeting resource\nid\tstring\tInternal identifier of a meeting as retrieved from Zoom\ntopic\tstring\tTopic of a meeting\nmeetingType\t'Scheduled' | 'Instant' | 'Recurring'\tType of a meeting\npassword\tstring\tPassword required to join a meeting\nstatus\t'NotStarted' | 'Started'\tCurrent status of a meeting\nlinks\tLinks Info\tLinks to start/join the meeting\nschedule\tMeeting Schedule Info\tSchedule of a meeting\nallowJoinBeforeHost\tboolean\tIf 'True' then the meeting can be joined and started by any participant (not host only). Supported for the meetings of 'Scheduled' and 'Recurring' type.\nstartHostVideo\tboolean\tEnables starting video when host joins the meeting\nstartParticipantsVideo\tboolean\tEnables starting video when participants join the meeting\naudioOptions\tCollection of strings\tMeeting audio options. Possible values are 'Phone', 'ComputerAudio'	2016-06-22 03:12:03.99888	2016-06-22 03:12:03.99888
118	1	LinksInfo	startUri\tstring\tLink to start a meeting\njoinUri\tstring\tLink to join a meeting	2016-06-22 03:15:16.959521	2016-06-22 03:15:16.959521
119	1	MeetingScheduleInfo	startTime\tdatetime\tStart time of a meeting in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\ndurationInMinutes\tinteger\tDuration of a meeting in minutes\ntimeZone\tMeetingScheduleInfo.TimezoneInfo\tTimezone of a meeting	2016-06-22 03:15:56.737699	2016-06-22 03:16:59.911532
120	1	MeetingScheduleInfo.TimezoneInfo	id\tstring\tIdentifier of a timezone	2016-06-22 03:16:41.038962	2016-06-22 03:16:41.038962
126	1	ExternalUserInfo	accountId\tstring\tUser type of a meeting account\r\nuserId\tstring\tMeeting account user identifier\r\nuserToken\tstring\tMeeting account user token\r\nuserType\tinteger\tMeeting account user type	2016-07-15 07:58:08.253283	2016-07-15 07:58:08.253283
127	1	DialInNumbers	phoneNumber\tstring\tPhone number of the dial-in number for the meeting in e.164 format\r\nformattedNumber\tstring\tPhone number of the dial-in number formatted according to the extension home country\r\nlocation\tstring\tOptional field in case the dial-in number is associated with a particular location\r\ncountry\tDialInNumbers.CountryInfo\tCountry resource corresponding to the dial-in number	2016-07-15 07:59:19.985513	2016-07-15 08:01:10.887597
128	1	DialInNumbers.CountryInfo	id\tstring\tInternal identifier of a country\r\nuri\tstring\tCanonical URI of a country\r\ncallingCode\tstring\tCountry calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes\r\nisoCode\tstring\tCountry code according to the ISO standard, see ISO 3166\r\nname\tstring\tOfficial name of a country	2016-07-15 08:18:50.801081	2016-07-15 08:18:50.801081
129	1	Page	uri\tstring\tCanonical URI for the page	2016-07-18 08:18:01.921744	2016-07-18 08:18:01.921744
130	1	DialingPlanCountryInfo	id\tstring\tInternal identifier of a country\r\nuri\tstring\tCanonical URI of a country\r\ncallingCode\tstring\tCountry calling code defined by ITU-T recommendations E.123 and E.164, see Calling Codes\r\nisoCode\tstring\tCountry code according to the ISO standard, see ISO 3166\r\nname\tstring\tOfficial name of a country	2016-08-10 01:11:54.247926	2016-08-10 01:11:54.247926
131	1	ImageUri	uri\tstring\tLink to an image.	2016-08-31 10:09:37.693984	2016-08-31 10:09:37.693984
132	1	UserPermission	permission\tUser Permission Info\tInformation on a permission granted\r\nscopes\tCollection of string\tList of active scopes for permission	2016-09-09 08:18:16.834277	2016-09-09 08:18:16.834277
133	1	UserPermissionInfo	id\tstring\tInternal identifier of a permission\r\nuri\tstring\tCanonical URI of a permission resource	2016-09-09 08:19:17.51839	2016-09-09 08:19:17.51839
134	1	PermissionDetailsInfo	permission\tUser Permission Info\tInformation on a permission checked	2016-09-09 08:31:54.326576	2016-09-09 08:31:54.326576
135	1	GreetingInfo	type\t'Introductory' | 'Announcement' | 'ConnectingMessage' | 'ConnectingAudio' | 'Voicemail' | 'Unavailable'\tType of a greeting, specifying the case when the greeting is played. See also Greeting Types\r\npreset\tPreset Info\tPredefined greeting information	2016-09-23 08:16:56.354184	2016-09-23 08:16:56.354184
136	1	PresetInfo	uri\tstring\tLink to a greeting resource\r\nid\tstring\tInternal identifier of greeting\r\nname\tstring\tName of a greeting	2016-09-23 08:17:25.802296	2016-09-23 08:17:25.802296
137	1	CallersInfo	callerId\tstring\tPhone number of a caller\r\nname\tstring\tContact name of a caller	2016-09-23 08:25:52.235673	2016-09-23 08:25:52.235673
138	1	CalledNumberInfo	phoneNumber\tstring\tCalled phone number	2016-09-23 08:26:23.585754	2016-09-23 08:26:23.585754
139	1	AnsweringRule.ScheduleInfo	weeklyRanges\tWeekly Schedule Info\tWeekly schedule. If specified, ranges cannot be specified\r\nranges\tRanges Info\tSpecific data ranges. If specified, weeklyRanges cannot be specified	2016-09-23 08:29:20.111728	2016-09-23 08:29:20.111728
140	1	CustomGreetingInfo	uri\tstring\tLink to an extension custom greeting\r\nid\tstring\tInternal identifier of an answering rule\r\ntype\t'Introductory' | 'Announcement' | 'ConnectingMessage' | 'ConnectingAudio' | 'Voicemail' | 'Unavailable'\tType of a greeting, specifying the case when the greeting is played. See also Greeting Types\r\ncontentType\tstring\tContent media type in WAV/MP3 format\r\ncontentUri\tstring\tLink to a greeting content (audio file)	2016-09-23 09:41:27.76728	2016-09-23 09:41:27.76728
141	1	CustomGreetingInfo.AnsweringRuleInfo	id\tstring\tInternal identifier of an answering rule	2016-09-23 09:42:50.201208	2016-09-23 09:42:50.201208
142	1	MeetingServiceInfo	uri\tstring\tCanonical URI of a meeting service info resource\r\nsupportUri\tstring\tURI to retrieve support information for meetings functionality\r\nintlDialInNumbersUri\tstring\tURI to retrieve international dial in numbers\r\nexternalUserInfo\tExternal User Info\tExternal user data\r\ndialInNumbers\tDial In Numbers\tDial-in numbers data	2016-09-29 05:27:42.327068	2016-09-29 05:28:23.283012
144	1	Binary	data\tbinary\tRequired. Binary data.	2016-09-29 06:49:22.249828	2016-09-29 10:48:47.592729
146	1	ExtensionListEvent	extensionId\tstring\tInternal identifier of an extension\r\neventType\t'Create' | 'Update' | 'Delete'\tType of extension info change	2016-10-27 08:29:28.735977	2016-10-27 08:29:28.735977
148	1	ExtensionInfoEvent	extensionId\tstring\tInternal identifier of an extension\r\neventType\t'Update' | 'Delete'\tType of extension info change	2016-10-27 08:30:39.241661	2016-10-27 08:30:39.241661
147	1	ExtensionInfoNotification	uuid\tstring\tUniversally unique identifier of a notification\r\nevent\tstring\tEvent filter URI\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tDatetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nbody\tExtension Info Event\tNotification payload body	2016-10-27 08:30:23.467976	2016-10-28 01:26:55.028785
149	1	MessageNotification	uuid\tstring\tUniversally unique identifier of a notification\r\nevent\tstring\tEvent filter URI\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tDatetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nbody\tMessage Event\tNotification payload body	2016-10-27 08:32:05.8608	2016-10-28 01:27:57.567512
153	1	InstantMessageEvent	id\tstring\tInternal identifier of a message\r\nto\tCollection of InstantMessageEvent.CallerInfo\tMessage receiver(s) information\r\nfrom\tInstantMessageEvent.CallerInfo\tMessage sender information\r\ntype\tstring\tType of a message. The default value is 'SMS'\r\ncreationTime\tdatetime\tMessage creation datetime in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nlastModifiedTime\tdatetime\tThe datetime when the message was modified in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nreadStatus\tstring\tStatus of a message. The default value is 'Unread'\r\npriority\tstring\tThe default value is 'Normal'\r\nattachments\tCollection of Instant Message Attachment Info\tMessage attachment data\r\ndirection\tstring\tMessage direction. The default value is 'Inbound'\r\navailability\tstring\tMessage availability status. The default value is 'Alive'\r\nsubject\tstring\tMessage subject. It replicates message text which is also returned as an attachment\r\nmessageStatus\tstring\tStatus of a message. The default value is 'Received'\r\nconversationId\tstring\tIdentifier of the conversation the message belongs to	2016-10-27 08:34:12.515561	2016-10-27 08:35:56.221976
154	1	InstantMessageEvent.CallerInfo	phoneNumber\tstring\tPhone number in E.164 (with '+' sign) format\r\nextensionNumber\tstring\tExtension number\r\nlocation\tstring\tContains party location (city, state) if one can be determined from phoneNumber. This property is filled only when phoneNumber is not empty and server can calculate location information from it (for example, this information is unavailable for US toll-free numbers)\r\nname\tstring\tSymbolic name associated with a caller/callee. If the phone does not belong to the known extension, only the location is returned, the name is not determined then	2016-10-27 08:38:04.477118	2016-10-27 08:38:04.477118
155	1	InstantMessageAttachmentInfo	id\tstring\tInternal identifier of a message attachment\r\ntype\tstring\tType of a message attachment. The default value is 'Text'\r\ncontentType\tstring\tContent type of an attachment, see also MIME Types. The default value is 'text/plain'	2016-10-27 08:38:31.11057	2016-10-27 08:38:31.11057
157	1	PresenceEvent	extensionId\tstring\tInternal identifier of an extension. Optional parameter\r\ntelephonyStatus\t'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'\tTelephony presence status. Returned if telephony status is changed. See Telephony Status Values\r\nterminationType\t'Final' | 'Intermediate'\tType of call termination. Supported for calls in 'NoCall' status. If the returned termination type is 'Intermediate' it means the call is not actually ended, the connection is established on one of the devices\r\nsequence\tinteger\tOrder number of a notification to state the chronology\r\npresenceStatus\t'Offline' | 'Busy' | 'Available'\tAggregated presence status, calculated from a number of sources\r\nuserStatus\t'Offline' | 'Busy' | 'Available'\tUser-defined presence status (as previously published by the user)\r\ndndStatus\t'TakeAllCalls' | 'DoNotAcceptAnyCalls' | 'DoNotAcceptDepartmentCalls' | 'TakeDepartmentCallsOnly'\tExtended DnD (Do not Disturb) status\r\nallowSeeMyPresence\tboolean\tIf 'True' enables other extensions to see the extension presence status\r\nringOnMonitoredCall\tboolean\tIf 'True' enables to ring extension phone, if any user monitored by this extension is ringing\r\npickUpCallsOnHold\tboolean\tIf 'True' enables the extension user to pick up a monitored line on hold	2016-10-27 08:39:24.811789	2016-10-27 08:39:24.811789
158	1	DetailedPresenceNotification	uuid\tstring\tUniversally unique identifier of a notification\r\nevent\tstring\tEvent filter URI\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tThe datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nbody\tDetailed Presence Event\tNotification payload body	2016-10-27 08:40:15.012587	2016-10-28 01:26:16.165156
152	1	InstantMessageNotification	uuid\tstring\tUniversally unique identifier of a notification\r\nevent\tstring\tEvent filter URI\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tDatetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nbody\tInstant Message Event\tNotification payload body	2016-10-27 08:33:40.396793	2016-10-28 01:27:32.535908
156	1	PresenceNotification	uuid\tstring\tUniversally unique identifier of a notification\r\nevent\tstring\tEvent filter URI\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tThe datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nbody\tPresence Event\tNotification payload body	2016-10-27 08:39:03.790269	2016-10-28 01:28:20.881948
151	1	MessageChange	type\t'Voicemail' | 'SMS' | 'Fax' | 'Pager'\tMessage type\r\nnewCount\tinteger\tThe number of new messages. Can be omitted if the value is zero\r\nupdatedCount\tinteger\tThe number of updated messages. Can be omitted if the value is zero	2016-10-27 08:32:37.843542	2016-10-28 07:57:07.306275
150	1	MessageEvent	extensionId\tinteger\tInternal identifier of an extension. Optional parameter\r\nlastUpdated\tdatetime\tThe datetime when the message was last modified in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nchanges\tCollection of Message Change\tMessage changes	2016-10-27 08:32:18.658239	2016-10-28 08:27:29.466404
143	1	AccountServiceInfo	uri\tstring\tCanonical URI of the account Service Info resource\r\nservicePlanName\tstring\tAccount Service Plan name\r\nbrand\tBrand Info\tInformation on account brand\r\nservicePlan\tService Plan Info\tInformation on account service plan\r\nbillingPlan\tBilling Plan Info\tInformation on account billing plan\r\nserviceFeatures\tCollection of Service Feature Info\tService features information, see Service Feature List\r\nlimits\tAccount Limits\tLimits which are effective for the account	2016-09-29 05:46:00.721328	2016-11-14 09:35:50.715023
162	1	DetailedPresencewithSIPEvent	extensionId\tstring\tInternal identifier of an extension. Optional parameter\r\ntelephonyStatus\t'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'\tTelephony presence status. Returned if telephony status is changed. See Telephony Status Values\r\nterminationType\t'Final' | 'Intermediate'\tType of call termination. Supported for calls in 'NoCall' status. If the returned termination type is 'Intermediate' it means the call is not actually ended, the connection is established on one of the devices\r\nactiveCalls\tCollection of DetailedPresencewithSIPEvent.ActiveCallInfo\tInformation on active calls\r\nsequence\tinteger\tOrder number of a notification to state the chronology\r\npresenceStatus\t'Offline' | 'Busy' | 'Available'\tAggregated presence status, calculated from a number of sources\r\nuserStatus\t'Offline' | 'Busy' | 'Available'\tUser-defined presence status (as previously published by the user)\r\ndndStatus\t'TakeAllCalls' | 'DoNotAcceptAnyCalls' | 'DoNotAcceptDepartmentCalls' | 'TakeDepartmentCallsOnly'\tExtended DnD (Do not Disturb) status\r\nallowSeeMyPresence\tboolean\tIf 'True' enables other extensions to see the extension presence status\r\nringOnMonitoredCall\tboolean\tIf 'True' enables to ring extension phone, if any user monitored by this extension is ringing\r\npickUpCallsOnHold\tboolean\tIf 'True' enables the extension user to pick up a monitored line on hold\r\n	2016-10-27 08:58:37.908599	2016-10-27 09:00:05.852036
163	1	DetailedPresencewithSIPEvent.ActiveCallInfo	id\tstring\tInternal identifier of a call\r\ndirection\t'Inbound' | 'Outbound'\tCall direction\r\nfrom\tstring\tPhone number or extension number of a caller\r\nto\tstring\tPhone number or extension number of a callee\r\ntelephonyStatus\t'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'\tTelephony call status. See Telephony Status Values for detailed status description\r\nsessionId\tstring\tInternal identifier of a call session\r\nsipData\tSIP Data\tSIP connection settings	2016-10-27 09:00:30.6363	2016-10-27 09:00:30.6363
164	1	SIPData	toTag\tstring\tRecipient data\r\nfromTag\tstring\tSender data\r\nremoteUri\tstring\tRemote address URL\r\nlocalUri\tstring\tLocal address URL	2016-10-27 09:00:47.596549	2016-10-27 09:00:47.596549
166	1	PresenceLineEvent	extension\tPresenceLineEvent.ExtensionInfo\tExtension information\r\nsequence\tinteger\tOrder number of a notification to state the chronology	2016-10-27 09:01:45.3329	2016-10-27 09:01:59.785708
167	1	PresenceLineEvent.ExtensionInfo	id\tstring\tInternal identifier of the extension	2016-10-27 09:02:12.593786	2016-10-27 09:08:09.104335
160	1	DetailedPresenceEvent.ActiveCallInfo	id\tstring\tInternal identifier of a call\r\ndirection\t'Inbound' | 'Outbound'\tCall direction\r\nfrom\tstring\tPhone number or extension number of a caller\r\nto\tstring\tPhone number or extension number of a callee\r\ntelephonyStatus\t'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'\tTelephony call status. See Telephony Status Values for detailed status description\r\nsessionId\tstring\tInternal identifier of a call session\r\nterminationType\t'Final' | 'Intermediate'\tType of call termination. Supported for calls in 'NoCall' status. If the returned termination type is 'Intermediate' it means the call is not actually ended, the connection is established on one of the devices	2016-10-27 08:43:10.987989	2016-10-28 01:22:28.248204
145	1	ExtensionListNotification	uuid\tstring\tUniversally unique identifier of a notification\r\nevent\tstring\tEvent filter URI\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tDatetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nbody\tExtension List Event\tNotification payload body	2016-10-27 08:27:34.358858	2016-10-28 01:25:55.171835
161	1	DetailedPresenceWithSIPNotification	uuid\tstring\tUniversally unique identifier of a notification\r\nevent\tstring\tEvent filter URI\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tThe datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nbody\tDetailed Presence with SIP Event\tNotification payload body	2016-10-27 08:47:03.620306	2016-10-28 01:26:36.747185
168	1	IncomingCallNotification	event\tstring\tEvent filter URI\r\nuuid\tstring\tUniversally unique identifier of a notification\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tThe datetime of a call action in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nextensionId\tstring\tInternal identifier of an extension\r\naction\tstring\tCalling action, for example 'StartRing'\r\nsessionId\tstring\tIdentifier of a call session\r\nserverId\tstring\tIdentifier of a server\r\nfrom\tstring\tPhone number of a caller\r\nfromName\tstring\tCaller name\r\nto\tstring\tPhone number of a callee\r\ntoName\tstring\tCallee name\r\nsid\tstring\tUnique identifier of a session\r\ntoUrl\tstring\tSIP proxy registration name\r\nsrvLvl\tstring\tUser data\r\nsrvLvlExt\tstring\tUser data\r\nrecUrl\tstring\tFile containing recorded caller name	2016-10-27 09:08:47.595416	2016-10-28 01:27:14.62941
165	1	PresenceLineNotification	uuid\tstring\tUniversally unique identifier of a notification\r\nevent\tstring\tEvent filter URI\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimestamp\tdatetime\tThe datetime of sending a notification in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nbody\tPresence Line Event\tNotification payload body	2016-10-27 09:01:30.529663	2016-10-28 01:28:41.018738
169	1	TokenInfo	access_token\tstring\tAccess token to pass to subsequent API requests\r\nexpires_in\tinteger\tIssued access token TTL (time to live), in seconds\r\nrefresh_token\tstring\tRefresh token to get a new access token, when the issued one expires\r\nrefresh_token_expires_in\tinteger\tIssued refresh token TTL (time to live), in seconds\r\nscope\tstring\tList of permissions allowed with this access token, white-space separated\r\ntoken_type\tstring\tType of token. Use this parameter in Authorization header of requests\r\nowner_id\tstring\tExtension identifier\r\nendpoint_id\tstring\tUnique identifier of a client application passed by the client, or auto-generated by server if not specified in request	2016-11-04 09:13:53.599839	2016-11-04 09:13:53.599839
159	1	DetailedPresenceEvent	extensionId\tstring\tInternal identifier of an extension. Optional parameter\r\ntelephonyStatus\t'NoCall' | 'CallConnected' | 'Ringing' | 'OnHold' | 'ParkedCall'\tTelephony presence status. Returned if telephony status is changed. See Telephony Status Values\r\nterminationType\t'final' | 'intermediate'\tType of call termination. Supported for calls in 'NoCall' status. If the returned termination type is 'Intermediate' it means the call is not actually ended, the connection is established on one of the devices\r\nactiveCalls\tCollection of DetailedPresenceEvent.ActiveCallInfo\tCollection of Active Call Info\r\nsequence\tinteger\tOrder number of a notification to state the chronology\r\npresenceStatus\t'Offline' | 'Busy' | 'Available'\tAggregated presence status, calculated from a number of sources\r\nuserStatus\t'Offline' | 'Busy' | 'Available'\tUser-defined presence status (as previously published by the user)\r\ndndStatus\t'TakeAllCalls' | 'DoNotAcceptAnyCalls' | 'DoNotAcceptDepartmentCalls' | 'TakeDepartmentCallsOnly'\tExtended DnD (Do not Disturb) status\r\nallowSeeMyPresence\tboolean\tIf 'True' enables other extensions to see the extension presence status\r\nringOnMonitoredCall\tboolean\tIf 'True' enables to ring extension phone, if any user monitored by this extension is ringing\r\npickUpCallsOnHold\tboolean\tIf 'True' enables the extension user to pick up a monitored line on hold	2016-10-27 08:41:16.273353	2016-11-29 09:39:15.985215
29	1	LegInfo.ExtensionInfo	id\tstring\tInternal identifier of an extension\r\nuri\tstring\tCanonical URI of an extension	2016-05-10 05:56:14.880678	2016-12-01 08:29:58.006346
81	1	PersonalContactInfo	id\tstring\tStandard resource properties ID\r\nurl\tstring\tCanonical URI\r\navailability\t'Alive' | 'Deleted' | 'Purged'\tThis property has a special meaning only on Address Book Sync (e.g. a contact can be 'Deleted'). For simple contact list reading it has always the default value - 'Alive'\r\nfirstName\tstring\tFirst name of a personal contact\r\nlastName\tstring\tLast name of a personal contact\r\nmiddleName\tstring\tMiddle name of a personal contact\r\nnickName\tstring\tNick name of a personal contact\r\ncompany\tstring\tCompany name of a personal contact\r\njobTitle\tstring\tJob title of a personal contact\r\nhomePhone\tstring\tHome phone of a personal contact\r\nhomePhone2\tstring\tThe 2-d home phone of a personal contact\r\nbusinessPhone\tstring\tBusiness phone of a personal contact\r\nbusinessPhone2\tstring\tThe 2-d business phone of a personal contact\r\nmobilePhone\tstring\tMobile phone of a personal contact\r\nbusinessFax\tstring\tBusiness fax of a personal contact\r\ncompanyPhone\tstring\tCompany phone of a personal contact\r\nassistantPhone\tstring\tAssistant phone of a personal contact\r\ncarPhone\tstring\tCar phone of a personal contact\r\notherPhone\tstring\tOther phone of a personal contact\r\notherFax\tstring\tOther fax of a personal contact\r\ncallbackPhone\tstring\tCallback phone of a personal contact\r\nemail\tstring\tEmail of a personal contact\r\nemail2\tstring\tThe 2-d email of a personal contact\r\nemail3\tstring\tThe 3-d email of a personal contact\r\nhomeAddress\tContact Address Info\tHome address of a personal contact\r\nbusinessAddress\tContact Address Info\tBusiness address of a personal contact\r\notherAddress\tContact Address Info\tOther address of a personal contact\r\nbirthday\tdatetime\tDate of birth of a personal contact in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z\r\nwebPage\tstring\tWeb page of a personal contact\r\nnotes\tstring\tNotes of a personal contact	2016-05-12 11:27:47.487794	2016-12-01 08:30:35.349979
64	1	PhoneLinesInfo.PhoneNumberInfo	id\tstring\tInternal identifier of a phone number\r\ncountry\tCountry Info\tBrief information on a phone number country\r\nlocation\tstring\tLocation (City, State). Filled for local US numbers\r\npaymentType\t'External' | 'TollFree' | 'Local'\tPayment type. 'External' is returned for forwarded numbers which are not terminated in the RingCentral phone system\r\nphoneNumber\tstring\tPhone number\r\nstatus\tstring\tStatus of a phone number. If the value is 'Normal', the phone number is ready to be used. Otherwise it is an external number not yet ported to RingCentral\r\ntype\t'VoiceFax' | 'FaxOnly' | 'VoiceOnly'\tPhone number type\r\nusageType\t'MainCompanyNumber' | 'AdditionalCompanyNumber' | 'CompanyNumber' | 'DirectNumber' | 'CompanyFaxNumber' | 'ForwardedNumber'\tUsage type of the phone number	2016-05-12 07:58:11.231934	2016-12-01 08:32:25.348387
37	1	PhoneNumberInfo	id\tstring\tInternal identifier of a phone number\r\ncountry\tCountry Info\tBrief information on a phone number country\r\nextension\tPhoneNumberInfo.ExtensionInfo\tInformation on the extension, to which the phone number is assigned. Returned only for the request of Account phone number list\r\nfeatures\tCollection of string\tIndicates if this phone number is enabled to appear as CallerId and/or to send outbound SMS from it. Returned only for the request of Extension phone number list\r\nlocation\tstring\tLocation (City, State). Filled for local US numbers\r\npaymentType\t'External' | 'TollFree' | 'Local'\tPayment type. 'External' is returned for forwarded numbers which are not terminated in the RingCentral phone system\r\nphoneNumber\tstring\tPhone number\r\nstatus\tstring\tStatus of a phone number. If the value is 'Normal', the phone number is ready to be used. Otherwise it is an external number not yet ported to RingCentral\r\ntype\t'VoiceFax' | 'FaxOnly' | 'VoiceOnly'\tPhone number type\r\nusageType\t'MainCompanyNumber' | 'AdditionalCompanyNumber' | 'CompanyNumber' | 'DirectNumber' | 'CompanyFaxNumber' | 'ForwardedNumber'\tUsage type of the phone number	2016-05-10 09:22:02.135473	2016-12-01 08:33:02.269201
28	1	RecordingInfo	id\tstring\tInternal identifier of the call recording\r\nuri\tstring\tLink to the call recording metadata resource\r\ntype\t'Automatic' | 'OnDemand'\tIndicates recording mode used\r\ncontentUri\tstring\tLink to the call recording binary content	2016-05-10 05:54:24.880078	2016-12-01 08:33:36.540144
\.


--
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('models_id_seq', 169, true);


--
-- Data for Name: path_parameters; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY path_parameters (id, specification_id, name, data_type, description, created_at, updated_at, format, required, "position") FROM stdin;
1	1	accountId	string	Internal identifier of a RingCentral account or tilde (~) to indicate the account logged-in within the current session	2016-05-09 16:07:49.46257	2016-05-09 16:07:49.46257		t	0
2	1	extensionId	string	Internal identifier of an extension or tilde (~) to indicate the extension assigned to the account logged-in within the current session	2016-05-09 16:07:49.46639	2016-06-22 07:04:05.136688		t	12
3	1	callLogId	string	Internal identifier of a call log record	2016-05-10 06:15:08.640639	2016-06-22 07:04:05.100656		t	5
4	1	messageId	string	Internal identifier of a message	2016-05-10 08:54:10.424475	2016-09-23 10:38:42.267987		t	19
5	1	attachmentId	string	Internal identifier of a message attachment	2016-05-10 09:03:09.588275	2016-06-22 07:04:05.086065		t	2
6	1	ringoutId	string	Internal identifier of a RingOut call	2016-05-10 09:47:35.363075	2016-09-23 10:38:42.285659		t	23
7	1	phoneNumberId	string	Internal identifier of a phone number	2016-05-10 09:55:57.372534	2016-09-23 10:38:42.276192		t	21
8	1	recordingId	string	Internal identifier of recording (returned in Call Log)	2016-05-10 10:25:54.969061	2016-09-23 10:38:42.281778		t	22
9	1	countryId	string	Internal identifier of a country	2016-05-10 10:58:14.452259	2016-06-22 07:04:05.113349		t	8
10	1	languageId	string	Internal identifier of a language	2016-05-10 11:02:39.802504	2016-09-23 10:38:42.254162		t	16
11	1	stateId	string	Internal identifier of a state	2016-05-10 11:28:12.177475	2016-09-23 10:38:42.306743		t	28
13	1	subscriptionId	string	Internal identifier of a subscription	2016-05-10 11:44:13.485858	2016-09-23 10:38:42.311459		t	29
14	1	departmentId	string	Internal identifier of a Department extension (same as extensionId but only the ID of a department extension is valid)	2016-05-12 07:13:14.768481	2016-06-22 07:04:05.124761		t	10
15	1	deviceId	string	Internal identifier of a device	2016-05-12 08:22:46.969278	2016-06-22 07:04:05.128715		t	11
16	1	contactId	string	Internal identifier of a contact record in the RingCentral database	2016-05-12 12:18:56.455747	2016-06-22 07:04:05.108797		t	7
17	1	answeringRuleId	string	Internal identifier of an answering rule. The value can be standard digital ID or specific ID - either business-hours-rule or after-hours-rule	2016-05-12 13:31:06.4606	2016-05-13 09:18:12.18457		t	1
18	1	blockedNumberId	string	Internal identifier of a blocked number list entry	2016-05-12 13:55:12.190281	2016-06-22 07:04:05.0897		t	3
19	1	orderId	string	Internal identifier of an order	2016-05-12 15:34:40.171191	2016-09-23 10:38:42.272095		t	20
20	1	customDataKey	string	Custom data access key. The number of unique custom data keys is limited to 100 keys per extension, summarized for all the applications. For example, if you have created 50 custom data keys under the Android mobile client application for the particular extension, then logged in the iOS application and created another 50 keys, the web client application won't be allowed to create any custom data key for that extension	2016-05-12 15:47:17.399672	2016-06-22 07:04:05.121331		t	9
21	1	scaleSize	string	Dimensions of a profile image which will be returned in response.	2016-05-13 01:45:26.037723	2016-09-23 10:38:42.289355	'90x90' | '195x195' | '584x584'	t	24
25	1	timezoneId	string	Internal identifier of a timezone	2016-06-17 03:40:22.014994	2016-09-23 10:38:42.316197		t	30
26	1	groupId	string	Internal identifier of a group in an address book	2016-06-22 06:51:12.244672	2016-09-23 10:38:42.250411		t	15
27	1	companyPagerId	string	Internal identifier of a pager message	2016-06-22 06:54:38.350054	2016-06-22 07:04:05.104742		t	6
28	1	faxId	string	Internal identifier of a fax message	2016-06-22 06:55:47.623931	2016-06-22 07:04:05.140666		t	13
29	1	lineId	string	Internal identifier of a line	2016-06-22 06:58:35.719224	2016-09-23 10:38:42.258193		t	17
30	1	smsId	string	Internal identifier of an SMS message	2016-06-22 06:59:27.380302	2016-09-23 10:38:42.302694		t	27
31	1	userGroupId	string	Internal identifier of an user group	2016-06-22 07:00:23.641906	2016-09-23 10:38:42.32022		t	31
32	1	brandId	string	Internal identifier of a brand	2016-06-22 07:04:05.093126	2016-06-22 07:04:05.093126		t	4
33	1	secretQuestionId	string	Internal identifier of a secret question	2016-06-22 07:04:05.190494	2016-09-23 10:38:42.293629		t	25
34	1	servicePlanId	string	Internal identifier of a service plan	2016-06-22 07:04:05.195089	2016-09-23 10:38:42.298958		t	26
35	1	verificationCallId	string	Internal identifier of a verification call	2016-06-22 07:05:09.376153	2016-09-23 10:38:42.323807		t	32
36	1	meetingId	string	Internal identifier of a meeting	2016-07-15 07:31:36.037324	2016-09-23 10:38:42.263965		t	18
37	1	greetingId	string	Internal identifier of a greeting	2016-09-23 10:38:42.244387	2016-09-23 10:38:42.244387		t	14
\.


--
-- Name: path_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('path_parameters_id_seq', 38, false);


--
-- Data for Name: paths; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY paths (id, specification_id, uri, created_at, updated_at) FROM stdin;
1	1	/restapi	2016-05-09 15:50:09.534696	2016-05-09 15:50:09.534696
2	1	/restapi/v1.0	2016-05-09 15:50:09.574227	2016-05-09 15:50:09.574227
3	1	/restapi/v1.0/account	2016-05-09 15:50:09.584615	2016-05-09 15:50:09.584615
4	1	/restapi/v1.0/account/{accountId}	2016-05-09 15:50:09.597729	2016-05-09 15:50:09.597729
5	1	/restapi/v1.0/account/{accountId}/service-info	2016-05-09 15:50:09.625287	2016-05-09 15:50:09.625287
6	1	/restapi/v1.0/account/{accountId}/active-calls	2016-05-09 15:50:09.639908	2016-05-09 15:50:09.639908
7	1	/restapi/v1.0/account/{accountId}/business-address	2016-05-09 15:50:09.650837	2016-05-09 15:50:09.650837
8	1	/restapi/v1.0/account/{accountId}/call-log	2016-05-09 15:50:09.667925	2016-05-09 15:50:09.667925
9	1	/restapi/v1.0/account/{accountId}/call-log/{callLogId}	2016-05-09 15:50:09.695812	2016-05-09 15:50:09.695812
10	1	/restapi/v1.0/account/{accountId}/department/{departmentId}/members	2016-05-09 15:50:09.718007	2016-05-09 15:50:09.718007
11	1	/restapi/v1.0/account/{accountId}/device	2016-05-09 15:50:09.731662	2016-05-09 15:50:09.731662
12	1	/restapi/v1.0/account/{accountId}/device/{deviceId}	2016-05-09 15:50:09.744464	2016-05-09 15:50:09.744464
13	1	/restapi/v1.0/account/{accountId}/device/sip-info	2016-05-09 15:50:09.766188	2016-05-09 15:50:09.766188
14	1	/restapi/v1.0/account/{accountId}/dialing-plan	2016-05-09 15:50:09.780936	2016-05-09 15:50:09.780936
15	1	/restapi/v1.0/account/{accountId}/extension	2016-05-09 15:50:09.794318	2016-05-09 15:50:09.794318
16	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}	2016-05-09 15:50:09.817716	2016-05-09 15:50:09.817716
17	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/permissions	2016-05-09 15:50:09.849599	2016-05-09 15:50:09.849599
18	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/active-calls	2016-05-09 15:50:09.86266	2016-05-09 15:50:09.86266
19	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/address-book-sync	2016-05-09 15:50:09.874233	2016-05-09 15:50:09.874233
20	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/address-book/contact	2016-05-09 15:50:09.886812	2016-05-09 15:50:09.886812
21	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/address-book/contact/{contactId}	2016-05-09 15:50:09.904255	2016-05-09 15:50:09.904255
22	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/address-book/group	2016-05-09 15:50:09.928948	2016-05-09 15:50:09.928948
23	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/address-book/group/{groupId}	2016-05-09 15:50:09.947616	2016-05-09 15:50:09.947616
24	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/answering-rule/{answeringRuleId}	2016-05-09 15:50:09.973507	2016-05-09 15:50:09.973507
25	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/answering-rule/after-hours-rule	2016-05-09 15:50:09.985499	2016-05-09 15:50:09.985499
26	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/answering-rule/business-hours-rule	2016-05-09 15:50:09.997191	2016-05-09 15:50:09.997191
27	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/assigned-role	2016-05-09 15:50:10.011569	2016-05-09 15:50:10.011569
28	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/authz-profile	2016-05-09 15:50:10.027335	2016-05-09 15:50:10.027335
29	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/authz-profile/check	2016-05-09 15:50:10.039572	2016-05-09 15:50:10.039572
30	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/blocked-number	2016-05-09 15:50:10.053961	2016-05-09 15:50:10.053961
31	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/blocked-number/{blockedNumberId}	2016-05-09 15:50:10.075922	2016-05-09 15:50:10.075922
32	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/business-hours	2016-05-09 15:50:10.107257	2016-05-09 15:50:10.107257
33	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/call-log	2016-05-09 15:50:10.120942	2016-05-09 15:50:10.120942
34	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/call-log-sync	2016-05-09 15:50:10.142154	2016-05-09 15:50:10.142154
35	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/call-log/{callLogId}	2016-05-09 15:50:10.152003	2016-05-09 15:50:10.152003
36	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/company-pager	2016-05-09 15:50:10.171827	2016-05-09 15:50:10.171827
37	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/company-pager/{companyPagerId}	2016-05-09 15:50:10.198176	2016-05-09 15:50:10.198176
38	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/conferencing	2016-05-09 15:50:10.20966	2016-05-09 15:50:10.20966
39	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/device	2016-05-09 15:50:10.232364	2016-05-09 15:50:10.232364
40	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/fax	2016-05-09 15:50:10.24459	2016-05-09 15:50:10.24459
41	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/fax/{faxId}	2016-05-09 15:50:10.263961	2016-05-09 15:50:10.263961
42	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/forwarding-number	2016-05-09 15:50:10.274066	2016-05-09 15:50:10.274066
43	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/grant	2016-05-09 15:50:10.290894	2016-05-09 15:50:10.290894
44	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/message-store	2016-05-09 15:50:10.302414	2016-05-09 15:50:10.302414
45	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/message-store/{messageId}	2016-05-09 15:50:10.314059	2016-05-10 08:53:32.729308
46	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/message-store/{messageId}/content/{attachmentId}	2016-05-09 15:50:10.338175	2016-05-10 09:01:46.253129
47	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/message-sync	2016-05-09 15:50:10.350724	2016-05-09 15:50:10.350724
48	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/phone-number	2016-05-09 15:50:10.364678	2016-05-09 15:50:10.364678
49	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/presence	2016-05-09 15:50:10.377211	2016-05-09 15:50:10.377211
50	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/presence/line	2016-05-09 15:50:10.394817	2016-05-09 15:50:10.394817
51	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/presence/line/{lineId}	2016-05-09 15:50:10.414635	2016-05-09 15:50:10.414635
52	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/presence/permission	2016-05-09 15:50:10.426526	2016-05-09 15:50:10.426526
53	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/profile-image	2016-05-09 15:50:10.439126	2016-05-09 15:50:10.439126
57	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/reporting/settings	2016-05-09 15:50:10.497977	2016-05-09 15:50:10.497977
58	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/ringout	2016-05-09 15:50:10.518816	2016-05-09 15:50:10.518816
59	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/ringout/{ringoutId}	2016-05-09 15:50:10.529896	2016-05-09 15:50:10.529896
60	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/ringout/direct	2016-05-09 15:50:10.553792	2016-05-09 15:50:10.553792
61	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/sms	2016-05-09 15:50:10.566926	2016-05-09 15:50:10.566926
62	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/sms/{smsId}	2016-05-09 15:50:10.582909	2016-05-09 15:50:10.582909
63	1	/restapi/v1.0/account/{accountId}/extension/bulk-assign	2016-05-09 15:50:10.596209	2016-05-09 15:50:10.596209
64	1	/restapi/v1.0/account/{accountId}/extension/validate	2016-05-09 15:50:10.611368	2016-05-09 15:50:10.611368
65	1	/restapi/v1.0/account/{accountId}/order	2016-05-09 15:50:10.622744	2016-05-09 15:50:10.622744
66	1	/restapi/v1.0/account/{accountId}/order/{orderId}	2016-05-09 15:50:10.633853	2016-05-09 15:50:10.633853
67	1	/restapi/v1.0/account/{accountId}/payment-info	2016-05-09 15:50:10.644376	2016-05-09 15:50:10.644376
68	1	/restapi/v1.0/account/{accountId}/phone-number	2016-05-09 15:50:10.664441	2016-05-09 15:50:10.664441
69	1	/restapi/v1.0/account/{accountId}/phone-number/{phoneNumberId}	2016-05-09 15:50:10.682347	2016-05-09 15:50:10.682347
70	1	/restapi/v1.0/account/{accountId}/presence	2016-05-09 15:50:10.707685	2016-05-09 15:50:10.707685
71	1	/restapi/v1.0/account/{accountId}/recording/{recordingId}	2016-05-09 15:50:10.7225	2016-05-09 15:50:10.7225
72	1	/restapi/v1.0/account/{accountId}/recording/{recordingId}/content	2016-05-09 15:50:10.736884	2016-05-09 15:50:10.736884
73	1	/restapi/v1.0/account/{accountId}/user-group	2016-05-09 15:50:10.747061	2016-05-09 15:50:10.747061
74	1	/restapi/v1.0/account/{accountId}/user-group/{userGroupId}	2016-05-09 15:50:10.765968	2016-05-09 15:50:10.765968
75	1	/restapi/v1.0/account/{accountId}/user-group/{userGroupId}/members	2016-05-09 15:50:10.79405	2016-05-09 15:50:10.79405
76	1	/restapi/v1.0/account/{accountId}/user-group/bulk-assign	2016-05-09 15:50:10.808963	2016-05-09 15:50:10.808963
77	1	/restapi/v1.0/account/{accountId}/user-role	2016-05-09 15:50:10.818982	2016-05-09 15:50:10.818982
78	1	/restapi/v1.0/account/{accountId}/verification-call	2016-05-09 15:50:10.834296	2016-05-09 15:50:10.834296
79	1	/restapi/v1.0/account/{accountId}/verification-call/{verificationCallId}	2016-05-09 15:50:10.849965	2016-05-09 15:50:10.849965
80	1	/restapi/v1.0/account/validate	2016-05-09 15:50:10.884075	2016-05-09 15:50:10.884075
81	1	/restapi/v1.0/client-info	2016-05-09 15:50:10.902228	2016-05-09 15:50:10.902228
82	1	/restapi/v1.0/client-info/custom-data/{customDataKey}	2016-05-09 15:50:10.916476	2016-05-09 15:50:10.916476
83	1	/restapi/v1.0/client-info/sip-provision	2016-05-09 15:50:10.934094	2016-05-09 15:50:10.934094
84	1	/restapi/v1.0/client-info/special-number-rule	2016-05-09 15:50:10.944748	2016-05-09 15:50:10.944748
85	1	/restapi/v1.0/dictionary/brand/{brandId}	2016-05-09 15:50:10.957288	2016-05-09 15:50:10.957288
86	1	/restapi/v1.0/dictionary/country	2016-05-09 15:50:10.968338	2016-05-09 15:50:10.968338
87	1	/restapi/v1.0/dictionary/country/{countryId}	2016-05-09 15:50:10.979305	2016-05-09 15:50:10.979305
88	1	/restapi/v1.0/dictionary/device	2016-05-09 15:50:10.991979	2016-05-09 15:50:10.991979
89	1	/restapi/v1.0/dictionary/forms/address	2016-05-09 15:50:11.006126	2016-05-09 15:50:11.006126
90	1	/restapi/v1.0/dictionary/language	2016-05-09 15:50:11.01689	2016-05-09 15:50:11.01689
91	1	/restapi/v1.0/dictionary/language/{languageId}	2016-05-09 15:50:11.026822	2016-05-09 15:50:11.026822
92	1	/restapi/v1.0/dictionary/location	2016-05-09 15:50:11.03811	2016-05-09 15:50:11.03811
93	1	/restapi/v1.0/dictionary/permission	2016-05-09 15:50:11.051518	2016-05-09 15:50:11.051518
94	1	/restapi/v1.0/dictionary/permission-category	2016-05-09 15:50:11.06489	2016-05-09 15:50:11.06489
95	1	/restapi/v1.0/dictionary/secret-question	2016-05-09 15:50:11.078823	2016-05-09 15:50:11.078823
96	1	/restapi/v1.0/dictionary/secret-question/{secretQuestionId}	2016-05-09 15:50:11.088761	2016-05-09 15:50:11.088761
97	1	/restapi/v1.0/dictionary/service-plan/{servicePlanId}	2016-05-09 15:50:11.106062	2016-05-09 15:50:11.106062
98	1	/restapi/v1.0/dictionary/shipping-options	2016-05-09 15:50:11.119329	2016-05-09 15:50:11.119329
99	1	/restapi/v1.0/dictionary/state	2016-05-09 15:50:11.13141	2016-05-09 15:50:11.13141
100	1	/restapi/v1.0/dictionary/state/{stateId}	2016-05-09 15:50:11.145362	2016-05-09 15:50:11.145362
101	1	/restapi/v1.0/dictionary/timezone	2016-05-09 15:50:11.155499	2016-05-09 15:50:11.155499
102	1	/restapi/v1.0/dictionary/timezone/{timezoneId}	2016-05-09 15:50:11.168791	2016-05-09 15:50:11.168791
103	1	/restapi/v1.0/dictionary/user-role	2016-05-09 15:50:11.183756	2016-05-09 15:50:11.183756
104	1	/restapi/v1.0/internal/address-book	2016-05-09 15:50:11.197541	2016-05-09 15:50:11.197541
105	1	/restapi/v1.0/internal/device-order/update	2016-05-09 15:50:11.210709	2016-05-09 15:50:11.210709
106	1	/restapi/v1.0/internal/message-notification/transcription-result	2016-05-09 15:50:11.22147	2016-05-09 15:50:11.22147
107	1	/restapi/v1.0/internal/number-porting/update-order	2016-05-09 15:50:11.23311	2016-05-09 15:50:11.23311
108	1	/restapi/v1.0/internal/oauth/app-info	2016-05-09 15:50:11.246091	2016-05-09 15:50:11.246091
109	1	/restapi/v1.0/internal/oauth/app-session	2016-05-09 15:50:11.26061	2016-05-09 15:50:11.26061
110	1	/restapi/v1.0/internal/oauth/generate-code	2016-05-09 15:50:11.270836	2016-05-09 15:50:11.270836
111	1	/restapi/v1.0/internal/presence	2016-05-09 15:50:11.283619	2016-05-09 15:50:11.283619
112	1	/restapi/v1.0/internal/rendering-queue/poll	2016-05-09 15:50:11.301255	2016-05-09 15:50:11.301255
113	1	/restapi/v1.0/internal/rendering-queue/save	2016-05-09 15:50:11.316468	2016-05-09 15:50:11.316468
114	1	/restapi/v1.0/internal/rendering-queue/touch	2016-05-09 15:50:11.332673	2016-05-09 15:50:11.332673
115	1	/restapi/v1.0/internal/send-email	2016-05-09 15:50:11.344946	2016-05-09 15:50:11.344946
116	1	/restapi/v1.0/internal/send-sms	2016-05-09 15:50:11.359995	2016-05-09 15:50:11.359995
117	1	/restapi/v1.0/internal/service-parameter	2016-05-09 15:50:11.378862	2016-05-09 15:50:11.378862
118	1	/restapi/v1.0/interop/generate-code	2016-05-09 15:50:11.400881	2016-05-09 15:50:11.400881
119	1	/restapi/v1.0/number-parser/parse	2016-05-09 15:50:11.414585	2016-05-09 15:50:11.414585
120	1	/restapi/v1.0/number-parser/phonedata.xml	2016-05-09 15:50:11.430454	2016-05-09 15:50:11.430454
121	1	/restapi/v1.0/number-pool/lookup	2016-05-09 15:50:11.445697	2016-05-09 15:50:11.445697
122	1	/restapi/v1.0/number-pool/reserve	2016-05-09 15:50:11.460096	2016-05-09 15:50:11.460096
123	1	/restapi/v1.0/subscription	2016-05-09 15:50:11.471442	2016-05-09 15:50:11.471442
124	1	/restapi/v1.0/subscription/{subscriptionId}	2016-05-09 15:50:11.484691	2016-05-09 15:50:11.484691
125	1	/restapi/auth	2016-05-09 15:50:11.517553	2016-05-09 15:50:11.517553
126	1	/restapi/oauth/authorize	2016-05-09 15:50:11.527555	2016-05-09 15:50:11.527555
127	1	/restapi/oauth/revoke	2016-05-09 15:50:11.540395	2016-05-09 15:50:11.540395
128	1	/restapi/oauth/token	2016-05-09 15:50:11.551531	2016-05-09 15:50:11.551531
129	1	/sms-inbound/message	2016-05-09 15:50:11.563631	2016-05-09 15:50:11.563631
130	1	/sms-inbound/receipt	2016-05-09 15:50:11.577332	2016-05-09 15:50:11.577332
131	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/profile-image/{scaleSize}	2016-05-13 01:41:50.754522	2016-05-13 01:41:50.754522
133	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/meeting	2016-06-22 02:47:16.062799	2016-06-22 02:47:16.062799
136	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/meeting/{meetingId}	2016-07-15 07:30:57.229838	2016-07-15 07:30:57.229838
137	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/meeting/{meetingId}/end	2016-07-15 07:51:52.090121	2016-07-15 08:29:02.968473
138	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/meeting/service-info	2016-07-15 07:54:52.127838	2016-07-15 07:54:52.127838
139	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/answering-rule	2016-09-23 08:12:35.569758	2016-09-23 08:12:35.569758
140	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/greeting	2016-09-23 09:33:22.345217	2016-09-23 09:33:22.345217
141	1	/restapi/v1.0/account/{accountId}/extension/{extensionId}/greeting/{greetingId}	2016-09-23 09:46:30.513026	2016-09-23 09:46:30.513026
\.


--
-- Name: paths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('paths_id_seq', 142, false);


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY permissions (id, specification_id, name, description, created_at, updated_at) FROM stdin;
1	1	ReadAccounts	Viewing user account info (including name, business name, address and phone number/account number)	2016-06-21 08:36:47.42202	2016-06-21 08:36:47.42202
2	1	InternalMessages	Sending and receiving intra-company text messages	2016-06-21 08:37:57.256951	2016-06-21 08:37:57.256951
3	1	ReadMessages	Viewing user messages	2016-06-21 08:37:57.260753	2016-06-21 08:37:57.260753
4	1	EditAccounts	Viewing and updating user account info (including name, business name, address and phone number/account number)	2016-06-21 08:47:00.966015	2016-06-21 08:47:00.966015
5	1	EditCustomData	Viewing and updating client custom data (key-value)	2016-06-21 08:47:00.972641	2016-06-21 08:47:00.972641
6	1	EditMessages	Viewing and updating user messages	2016-06-21 08:47:00.977888	2016-06-21 08:47:00.977888
7	1	NumberLookup	Looking-up and reserving available phone number	2016-06-21 08:47:00.989492	2016-06-21 08:47:00.989492
8	1	ReadClientInfo	Viewing of client application registered attributes and additional helper information (external URLs, hints, etc.)	2016-06-21 08:47:01.001013	2016-06-21 08:47:01.001013
9	1	RingOut	Performing two-legged ring-out phone calls	2016-06-21 08:47:01.011173	2016-06-21 08:47:01.011173
10	1	ReadPresence	Getting user presence information	2016-06-21 08:47:01.015358	2016-06-21 08:47:01.015358
11	1	Faxes	Sending and receiving faxes	2016-06-21 08:49:01.399358	2016-06-21 08:49:01.399358
12	1	Meetings	Creating, viewing, editing and deleting meetings	2016-06-21 08:49:01.408882	2016-06-21 08:49:01.408882
13	1	SMS	Sending and receiving SMS (text) messages	2016-06-21 08:49:01.436046	2016-06-21 08:49:01.436046
14	1	Contacts	Creating, viewing, editing and deleting user personal contacts	2016-06-21 08:54:28.589445	2016-06-21 08:54:28.589445
15	1	EditCallLog	Viewing and updating user call logs	2016-06-21 08:54:28.597676	2016-06-21 08:54:28.597676
16	1	EditExtensions	Viewing and updating user extension info (includes extension name, number, email and phone number, assigned phone numbers, devices and other extension settings)	2016-06-21 08:54:28.607768	2016-06-21 08:54:28.607768
17	1	ReadCallLog	Viewing user call logs	2016-06-21 08:54:28.638096	2016-06-21 08:54:28.638096
18	1	ReadCallRecording	Downloading call recording content	2016-06-21 08:54:28.652343	2016-06-21 08:54:28.652343
19	1	ReadContacts	Viewing user personal contacts	2016-06-21 08:54:28.665083	2016-06-21 08:54:28.665083
20	1	Accounts	Managing accounts: creating new accounts, viewing and updating account information, deleting existing accounts	2016-06-22 02:36:56.794371	2016-06-22 02:36:56.794371
\.


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('permissions_id_seq', 21, false);


--
-- Data for Name: query_parameters; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY query_parameters (id, verb_id, name, data_type, format, required, description, "position", created_at, updated_at) FROM stdin;
1	8	direction	string	'Inbound' | 'Outbound'	f	The direction for the result records. It is allowed to specify more than one direction. If not specified, both inbound and outbound records are returned. Multiple values are accepted	0	2016-05-10 05:48:16.565656	2016-05-10 05:48:16.565656
2	8	type	string	'Voice' | 'Fax'	f	Call type of a record. It is allowed to specify more than one type. If not specified, all call types are returned. Multiple values are accepted	1	2016-05-10 05:48:16.569884	2016-05-10 05:48:16.569884
3	8	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'.	2	2016-05-10 05:48:16.573641	2016-05-10 05:48:16.573641
4	8	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default.	3	2016-05-10 05:48:16.579992	2016-05-10 05:48:16.579992
6	12	phoneNumber	string		f	Phone number of a caller/call recipient. If specified, returns all calls (both incoming and outcoming) with the mentioned phone number. Cannot be specified together with the extensionNumber filter	1	2016-05-10 06:11:54.198365	2016-05-10 06:11:54.198365
7	12	direction	string	'Inbound' | 'Outbound'	f	The direction for the result records. It is allowed to specify more than one direction. If not specified, both inbound and outbound records are returned. Multiple values are accepted	2	2016-05-10 06:11:54.203561	2016-05-10 06:11:54.203561
8	12	type	string	'Voice' | 'Fax'	f	Call type of a record. It is allowed to specify more than one type. If not specified, all call types are returned. Multiple values are accepted	3	2016-05-10 06:11:54.208682	2016-05-10 06:11:54.208682
9	12	view	string	'Simple' | 'Detailed'	f	The default value is 'Simple' for both account and extension call log	4	2016-05-10 06:11:54.212262	2016-05-10 06:11:54.212262
10	12	withRecording	boolean		f	'True' if only recorded calls have to be returned	5	2016-05-10 06:11:54.21586	2016-05-10 06:11:54.21586
11	12	dateFrom	string	date-time	f	The start datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is dateTo minus 24 hours	6	2016-05-10 06:11:54.22315	2016-05-10 06:11:54.22315
12	12	dateTo	string	date-time	f	The end datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time	7	2016-05-10 06:11:54.22728	2016-05-10 06:11:54.22728
13	12	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. The default value is '1'	8	2016-05-10 06:11:54.230879	2016-05-10 06:11:54.230879
15	21	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	0	2016-05-10 07:42:38.785516	2016-05-10 07:42:38.785516
16	21	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default.	1	2016-05-10 07:42:38.790969	2016-05-10 07:42:38.790969
17	21	status	string	'Enabled' | 'Disabled' | 'NotActivated' | 'Unassigned'	f	Extension current state. Multiple values are supported. If 'Unassigned' is specified, then extensions without extensionNumber are returned. If not specified, then all extensions are returned	2	2016-05-10 07:42:38.794753	2016-05-10 07:42:38.794753
18	21	type	string	'User' | 'FaxUser' | 'VirtualUser' | 'DigitalUser' | 'Department' | 'Announcement' | 'Voicemail' | 'SharedLinesGroup' | 'PagingOnlyGroup' | 'IvrMenu' | 'ApplicationExtension' | 'ParkLocation'	f	Extension type. Multiple values are supported	3	2016-05-10 07:42:38.80074	2016-05-10 07:42:38.80074
19	27	direction	string	'Inbound' | 'Outbound'	f	The direction for the result records. It is allowed to specify more than one direction. If not specified, both inbound and outbound records are returned. Multiple values are accepted	0	2016-05-10 07:59:49.884777	2016-05-10 07:59:49.884777
20	27	type	string	'Voice' | 'Fax'	f	Call type of a record. It is allowed to specify more than one type. If not specified, all call types are returned. Multiple values are accepted	1	2016-05-10 07:59:49.889813	2016-05-10 07:59:49.889813
21	27	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	2	2016-05-10 07:59:49.893781	2016-05-10 07:59:49.893781
22	27	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	3	2016-05-10 07:59:49.900525	2016-05-10 07:59:49.900525
23	53	extensionNumber	string		f	Extension number of a user. If specified, returns call log for a particular extension only. Cannot be specified together with the phoneNumber filter	0	2016-05-10 08:04:45.600953	2016-05-10 08:04:45.600953
24	53	phoneNumber	string		f	Phone number of a caller/call recipient. If specified, returns all calls (both incoming and outcoming) with the mentioned phone number. Cannot be specified together with the extensionNumber filter	1	2016-05-10 08:04:45.605889	2016-05-10 08:04:45.605889
25	53	direction	string	'Inbound' | 'Outbound'	f	The direction for the result records. It is allowed to specify more than one direction. If not specified, both inbound and outbound records are returned. Multiple values are accepted	2	2016-05-10 08:04:45.610825	2016-05-10 08:04:45.610825
26	53	type	string	'Voice' | 'Fax'	f	Call type of a record. It is allowed to specify more than one type. If not specified, all call types are returned. Multiple values are accepted	3	2016-05-10 08:04:45.615162	2016-05-10 08:04:45.615162
27	53	view	string	'Simple' | 'Detailed'	f	The default value is 'Simple' for both account and extension call log	4	2016-05-10 08:04:45.618893	2016-05-10 08:04:45.618893
28	53	withRecording	boolean		f	'True' if only recorded calls have to be returned	5	2016-05-10 08:04:45.622716	2016-05-10 08:04:45.622716
29	53	dateTo	string	date-time	f	The end datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time	6	2016-05-10 08:04:45.629479	2016-05-10 08:04:45.629479
30	53	dateFrom	string	date-time	f	The start datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is dateTo minus 24 hours	7	2016-05-10 08:04:45.63365	2016-05-10 08:04:45.63365
31	53	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	8	2016-05-10 08:04:45.637789	2016-05-10 08:04:45.637789
32	53	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	9	2016-05-10 08:04:45.645017	2016-05-10 08:04:45.645017
33	66	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	0	2016-05-10 08:45:44.225946	2016-05-10 08:45:44.225946
34	66	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	1	2016-05-10 08:45:44.230958	2016-05-10 08:45:44.230958
35	69	availability	string	'Alive' | 'Deleted' | 'Purged'	f	Specifies the availability status for the resulting messages. Default value is 'Alive'. Multiple values are accepted	0	2016-05-10 08:48:26.140495	2016-05-10 08:48:26.140495
36	69	conversationId	integer	int64	f	Specifies the conversation identifier for the resulting messages	1	2016-05-10 08:48:26.147639	2016-05-10 08:48:26.147639
37	69	dateFrom	string	date-time	f	The start datetime for resulting messages in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is dateTo minus 24 hours	2	2016-05-10 08:48:26.153932	2016-05-10 08:48:26.153932
38	69	dateTo	string	date-time	f	The end datetime for resulting messages in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time	3	2016-05-10 08:48:26.158508	2016-05-10 08:48:26.158508
39	69	direction	string	'Inbound' | 'Outbound'	f	The direction for the resulting messages. If not specified, both inbound and outbound messages are returned. Multiple values are accepted	4	2016-05-10 08:48:26.166539	2016-05-10 08:48:26.166539
40	69	distinctConversations	boolean		f	If 'True', then the latest messages per every conversation ID are returned	5	2016-05-10 08:48:26.173774	2016-05-10 08:48:26.173774
41	69	messageType	string	'Fax' | 'SMS' | 'VoiceMail' | 'Pager' | 'Text'	f	The type of the resulting messages. If not specified, all messages without message type filtering are returned. Multiple values are accepted	6	2016-05-10 08:48:26.182397	2016-05-10 08:48:26.182397
42	69	readStatus	string	'Read' | 'Unread'	f	The read status for the resulting messages. Multiple values are accepted	7	2016-05-10 08:48:26.189231	2016-05-10 08:48:26.189231
43	69	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	8	2016-05-10 08:48:26.195036	2016-05-10 08:48:26.195036
44	69	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	9	2016-05-10 08:48:26.212458	2016-05-10 08:48:26.212458
45	69	phoneNumber	string		f	The phone number. If specified, messages are returned for this particular phone number only	10	2016-05-10 08:48:26.219546	2016-05-10 08:48:26.219546
46	70	purge	boolean		f	If the value is 'True', then the message is purged immediately with all the attachments. The default value is 'False'	0	2016-05-10 08:54:45.072334	2016-05-10 08:54:45.072334
47	70	conversationId	integer	int64	f	Internal identifier of a message thread	1	2016-05-10 08:54:45.082057	2016-05-10 08:54:45.082057
48	75	usageType	string	'MainCompanyNumber' | 'AdditionalCompanyNumber' | 'CompanyNumber' | 'DirectNumber' | 'CompanyFaxNumber' | 'ForwardedNumber'	f	Usage type of the phone number	0	2016-05-10 09:19:00.092963	2016-05-10 09:19:00.092963
49	75	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	1	2016-05-10 09:19:00.098753	2016-05-10 09:19:00.098753
50	75	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	2	2016-05-10 09:19:00.104468	2016-05-10 09:19:00.104468
51	103	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	0	2016-05-10 09:53:12.941306	2016-05-10 09:53:12.941306
52	103	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	1	2016-05-10 09:53:12.947968	2016-05-10 09:53:12.947968
53	103	usageType	string	'MainCompanyNumber' | 'AdditionalCompanyNumber' | 'CompanyNumber' | 'DirectNumber' | 'CompanyFaxNumber' | 'ForwardedNumber'	f	Usage type of the phone number	2	2016-05-10 09:53:23.370523	2016-05-10 09:53:23.370523
54	130	loginAllowed	boolean		f	Specifies whether login with the phone numbers of this country is enabled or not	0	2016-05-10 10:30:39.232725	2016-05-10 10:30:39.232725
55	130	numberSelling	boolean		f	Specifies if RingCentral sells phone numbers of this country	1	2016-05-10 10:30:39.240123	2016-05-10 10:30:39.240123
56	130	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	2	2016-05-10 10:30:39.247253	2016-05-10 10:30:39.247253
57	130	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	3	2016-05-10 10:30:39.255253	2016-05-10 10:30:39.255253
58	136	orderBy	string	'Npa' | 'City'	f	Sorts results by the specified property. The default value is 'City'	0	2016-05-10 11:07:41.458198	2016-05-10 11:07:41.458198
59	136	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'.	1	2016-05-10 11:07:41.466955	2016-05-10 11:07:41.466955
60	136	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default.	2	2016-05-10 11:07:41.473199	2016-05-10 11:07:41.473199
61	136	stateId	string		f	Internal identifier of a state	3	2016-05-10 11:07:41.481249	2016-05-10 11:07:41.481249
62	136	withNxx	boolean		f	Specifies if nxx codes are returned	4	2016-05-10 11:07:41.489021	2016-05-10 11:07:41.489021
63	143	countryId	integer		f	Internal identifier of a country	0	2016-05-10 11:23:40.253732	2016-05-10 11:23:40.253732
64	143	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'.	1	2016-05-10 11:23:40.258833	2016-05-10 11:23:40.258833
65	143	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	2	2016-05-10 11:23:40.265507	2016-05-10 11:23:40.265507
66	143	withPhoneNumbers	boolean		f	If 'True', the list of states with phone numbers available for buying is returned. The default value is 'False'	3	2016-05-10 11:23:40.270139	2016-05-10 11:23:40.270139
67	145	page	string		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	0	2016-05-10 11:29:44.700894	2016-05-10 11:29:44.700894
68	145	perPage	string		f	Indicates the page size (number of items). If not specified, the value is '100' by default	1	2016-05-10 11:29:44.704951	2016-05-10 11:29:44.704951
71	15	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	0	2016-05-12 07:34:34.191944	2016-05-12 07:34:34.191944
72	15	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	1	2016-05-12 07:34:34.198875	2016-05-12 07:34:34.198875
73	28	syncType	string	'FSync' | 'ISync'	f	Type of synchronization. The default value is 'FSync'	0	2016-05-12 11:25:35.298678	2016-05-12 11:25:35.298678
74	28	syncToken	string		f	Value of syncToken property of the last sync request response	1	2016-05-12 11:25:35.30627	2016-05-12 11:25:35.30627
75	28	perPage	integer		f	Number of records per page to be returned. The max number of records is 250, which is also the default. For FSync — if the number of records exceeds the parameter value (either specified or default), all of the pages can be retrieved in several requests. For ISync — if the number of records exceeds the page size, the number of incoming changes to this number is limited	2	2016-05-12 11:25:35.310321	2016-05-12 11:25:35.310321
76	28	pageId	integer		f	Internal identifier of a page. It can be obtained from the 'nextPageId' parameter passed in response body	3	2016-05-12 11:25:35.314234	2016-05-12 11:25:35.314234
77	29	startsWith	string		f	If specified, only contacts whose First name or Last name start with the mentioned substring are returned. Case-insensitive	1	2016-05-12 12:14:14.641537	2016-07-18 08:48:38.243609
78	29	sortBy	string	'FirstName' | 'LastName' | 'Company'	f	Sorts results by the specified property. The default is 'First Name'	2	2016-05-12 12:14:14.648522	2016-07-18 08:48:38.247101
79	29	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	3	2016-05-12 12:14:14.652299	2016-07-18 08:48:38.251749
80	29	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	4	2016-05-12 12:14:14.655726	2016-07-18 08:48:38.256466
81	52	dateTo	string	date-time	f	The end datetime for records deletion in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time	0	2016-05-12 14:03:01.883899	2016-05-12 14:03:01.883899
82	54	syncType	string	'FSync' | 'ISync'	f	Type of synchronization. 'FSync' is a default value	0	2016-05-12 14:04:33.381483	2016-05-12 14:04:33.381483
83	54	syncToken	string		f	Value of syncToken property of last sync request response	1	2016-05-12 14:04:33.384941	2016-05-12 14:04:33.384941
84	54	dateFrom	string	date-time	f	The start datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is the current moment	2	2016-05-12 14:04:33.38981	2016-05-12 14:04:33.38981
85	54	recordCount	integer		f	For FSync the parameter is mandatory, it limits the number of records to be returned in response. For ISync it specifies with how many records to extend sync Frame to the past, the maximum number of records is 250	3	2016-05-12 14:04:33.394083	2016-05-12 14:04:33.394083
86	54	statusGroup	string	'Missed' | 'All'	f	Type of calls to be returned. The default value is 'All'	4	2016-05-12 14:04:33.397499	2016-05-12 14:04:33.397499
87	60	countryId	string		f	Internal identifier of a country. If not specified, the response is returned for the brand country	0	2016-05-12 14:12:57.77762	2016-05-12 14:12:57.77762
88	68	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	0	2016-05-12 14:40:50.794792	2016-05-12 14:40:50.794792
89	68	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	1	2016-05-12 14:40:50.799592	2016-05-12 14:40:50.799592
90	74	conversationId	integer	int64	f	Conversation identifier for the resulting messages. Meaningful for SMS and Pager messages only.	0	2016-05-12 14:44:13.698299	2016-05-12 14:44:13.698299
91	74	dateFrom	string	date-time	f	The start datetime for resulting messages in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is dateTo minus 24 hours	1	2016-05-12 14:44:13.70187	2016-05-12 14:44:13.70187
92	74	dateTo	string	date-time	f	The end datetime for resulting messages in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time	2	2016-05-12 14:44:13.705704	2016-05-12 14:44:13.705704
93	74	direction	string	'Inbound' | 'Outbound'	f	Direction for the resulting messages. If not specified, both inbound and outbound messages are returned. Multiple values are accepted	3	2016-05-12 14:44:13.70912	2016-05-12 14:44:13.70912
94	74	distinctConversations	boolean		f	If 'True', then the latest messages per every conversation ID are returned	4	2016-05-12 14:44:13.716194	2016-05-12 14:44:13.716194
95	74	messageType	string	'Fax' | 'SMS' | 'VoiceMail' | 'Pager' | 'Text'	f	Type for the resulting messages. If not specified, all types of messages are returned. Multiple values are accepted	5	2016-05-12 14:44:13.720061	2016-05-12 14:44:13.720061
96	74	recordCount	integer		f	Limits the number of records to be returned (works in combination with dateFrom and dateTo if specified)	6	2016-05-12 14:44:13.724066	2016-05-12 14:44:13.724066
97	74	syncToken	string		f	Value of syncToken property of last sync request response	7	2016-05-12 14:44:13.730503	2016-05-12 14:44:13.730503
98	74	syncType	string	'FSync' | 'ISync'	f	Type of message synchronization	8	2016-05-12 14:44:13.734864	2016-05-12 14:44:13.734864
99	165	homeCountry	string		f	Internal identifier of a home country. The default value is ISO code (ISO 3166) of the user's home country or brand country, if the user is undefined	0	2016-05-12 16:00:05.802038	2016-05-12 16:00:05.802038
100	165	nationalAsPriority	boolean		f	The default value is "False". If "True", the numbers that are closer to the home country are given higher priority	1	2016-05-12 16:00:05.806651	2016-05-12 16:00:05.806651
101	167	areaCode	integer		f	Area code of the location	0	2016-05-12 16:07:50.974306	2016-05-12 16:07:50.974306
102	167	countryCode	string		f	Two-letter country code, complying with the ISO standard	1	2016-05-12 16:07:50.978796	2016-05-12 16:07:50.978796
103	167	countryId	string		f	Internal identifier of a country; '1'- the US; '39' - Canada; '224' - the UK. The default value is '1'	2	2016-05-12 16:07:50.982546	2016-05-12 16:07:50.982546
104	167	exclude	string		f	A string of digits (one and more) that should not appear among the last four digits (line part) of the phone numbers that will be returned. It is possible to specify several exclude parameters. If specified, it is taken into account in all returned phone numbers both in the phone numbers satisfying to parameters of lookup and in alternative phone numbers (in case when extendedSearch is specified)	3	2016-05-12 16:07:50.988416	2016-05-12 16:07:50.988416
105	167	extendedSearch	boolean		f	If the value is 'False', then the returned numbers exactly correspond to the specified NXX, NPA and LINE or countryCode, areaCode and numberPattern parameters. If the value is 'True', then the resulting numbers are ranked and returned with the rank attribute values (1-10). The default value is 'False'	4	2016-05-12 16:07:50.992139	2016-05-12 16:07:50.992139
106	167	line	string		f	LINE pattern for vanity or wildcard search. Digits, Latin characters and asterisks are allowed (usually 4 characters)	5	2016-05-12 16:07:50.995735	2016-05-12 16:07:50.995735
107	167	numberPattern	string		f	Phone number pattern (for wildcard or vanity search). For NANP countries (US, Canada) is concatenation of nxx (the first three digits) and line. If the first three characters are specified as not digits (e.g. 5** or CAT) then parameter extendedSearch will be ignored.	6	2016-05-12 16:07:51.000005	2016-05-12 16:07:51.000005
108	167	nxx	string		f	NXX pattern for vanity or wildcard search. Digits, Latin characters and asterisks are allowed (usually 3 characters)	7	2016-05-12 16:07:51.005638	2016-05-12 16:07:51.005638
109	167	npa	string		f	Area code (mandatory). For example, 800, 844, 855, 866, 877, 888 for North America; and 647 for Canada	8	2016-05-12 16:07:51.009247	2016-05-12 16:07:51.009247
110	167	paymentType	string	'TollFree' | 'Local'	f	Payment type. Default is 'Local' (it should correlate with the npa provided)	9	2016-05-12 16:07:51.012706	2016-05-12 16:07:51.012706
111	167	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '10' by default	10	2016-05-12 16:07:51.01658	2016-05-12 16:07:51.01658
112	167	smsEnabled	boolean		f	Specifies if SMS activation is available for the number. If specified, it is taken into account in all returned phone numbers both in the phone numbers satisfying to parameters of lookup and in alternative phone numbers (in case when extendedSearch is specified). If not specified, the value is null.	11	2016-05-12 16:07:51.023295	2016-05-12 16:07:51.023295
116	12	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default.	9	2016-06-17 03:43:50.435756	2016-06-17 03:43:50.435756
117	29	phoneNumber	string		f	Phone number in E.164 (11-digits) format with or without plus '+'. Multiple values are supported	0	2016-07-18 08:48:38.229274	2016-07-18 08:48:38.229274
118	20	page	integer		f	Indicates the page number to retrieve. Only positive number values are allowed. Default value is '1'	0	2016-08-10 01:09:54.940857	2016-08-10 01:09:54.940857
119	20	perPage	integer		f	Indicates the page size (number of items). If not specified, the value is '100' by default	1	2016-08-10 01:09:54.945289	2016-08-10 01:09:54.945289
120	45	permissionId	string		f	Permission to check	0	2016-09-09 08:29:17.129309	2016-09-09 08:29:17.129309
121	45	targetExtensionId	string		f	Optional. Internal identifier of an extension for which user permissions are to be checked. The default value is the currently logged-in extension	1	2016-09-09 08:29:17.133975	2016-09-09 08:29:17.133975
5	12	extensionNumber	string		f	Extension number of a user. If specified, returns call log for a particular extension only. Cannot be specified together with the phoneNumber filter	0	2016-05-10 06:11:54.193743	2016-12-29 09:04:07.269261
\.


--
-- Name: query_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('query_parameters_id_seq', 122, false);


--
-- Data for Name: request_body_properties; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY request_body_properties (id, verb_id, "position", name, data_type, description, format, required, created_at, updated_at) FROM stdin;
1	3	0	mainNumber	string	Main account VoIP phone number, either Local or Toll-Free. Cannot be Fax Only. Obtained via lookup/reserve API		f	2016-05-09 15:55:30.593829	2016-05-09 15:55:30.593829
2	3	1	operator	ExtensionInfo	Operator's extension information. This extension will receive all calls and messages intended for the operator		f	2016-05-09 15:55:30.598623	2016-05-09 15:55:30.598623
3	3	2	partnerId	string	Partner identifier for this account		f	2016-05-09 15:55:30.603465	2016-05-09 15:55:30.603465
4	3	3	promotionCode	string	Promotion code to calculate a discount		f	2016-05-09 15:55:30.607086	2016-05-09 15:55:30.607086
5	3	4	reservationId	string	Internal identifier of phone number reservation; encoded data including reservation type (by brand, by account, by session), particular brand/account/session data, and reservation date and time		f	2016-05-09 15:55:30.610725	2016-05-09 15:55:30.610725
6	3	5	serviceInfo	Account.ServiceInfo	Account service information, brand identifier and service plan		f	2016-05-09 15:55:30.615744	2016-09-29 05:44:19.163153
7	3	6	status	string	The status with which an account is created. The default value is 'Initial'	'Initial' | 'Unconfirmed' | 'Confirmed'	f	2016-05-09 15:55:30.620399	2016-05-09 15:55:30.620399
16	174	0	response_type	string	Must be set to code		f	2016-05-09 16:10:29.756231	2016-05-09 16:10:29.756231
17	174	1	client_id	string	Required. Enter your application key (Production or Sandbox) here		t	2016-05-09 16:10:29.760251	2016-05-09 16:10:29.760251
18	174	2	redirect_uri	string	Required. This is a callback URI which determines where the response will be sent to. The value of this parameter must exactly match one of the URIs you have provided for your app upon registration. This URI can be HTTP/HTTPS address for web applications or custom scheme URI for mobile or desktop applications.		t	2016-05-09 16:10:29.766052	2016-05-09 16:11:20.825367
19	174	3	state	string	Optional, recommended. An opaque value used by the client to maintain state between the request and callback. The authorization server includes this value when redirecting the user-agent back to the client. The parameter should be used for preventing cross-site request forgery		f	2016-05-09 16:10:57.134823	2016-05-09 16:10:57.134823
20	176	0	grant_type	string	Must hold password value for Resource Owner Credentials flow. If client application is not authorized by the specified grant_type, response does not contain refresh_token and refresh_token_ttl attributes		f	2016-05-09 16:14:48.157899	2016-05-09 16:14:48.157899
21	176	1	access_token_ttl	integer	Optional. Access token lifetime in seconds; the possible values are from 600 sec (10 min) to 3600 sec (1 hour). The default value is 3600 sec. If the value specified exceeds the default one, the default value is set. If the value specified is less than 600 seconds, the minimum value (600 sec) is set		f	2016-05-09 16:14:48.161624	2016-05-09 16:14:48.161624
22	176	2	refresh_token_ttl	integer	Optional. Refresh token lifetime in seconds. The default value depends on the client application, but as usual it equals to 7 days. If the value specified exceeds the default one, the default value is applied. If client specifies refresh_token_ttl<=0, refresh token is not returned even if the corresponding grant type is supported		f	2016-05-09 16:14:48.165924	2016-05-09 16:14:48.165924
23	176	3	username	string	Phone number linked to account or extension in account in E.164 format with or without leading "+" sign		f	2016-05-09 16:14:48.171965	2016-05-09 16:14:48.171965
24	176	4	extension	string	Optional. Extension short number. If company number is specified as a username, and extension is not specified, the server will attempt to authenticate client as main company administrator		f	2016-05-09 16:14:48.176039	2016-05-09 16:14:48.176039
25	176	5	password	string	User's password		f	2016-05-09 16:14:48.179631	2016-05-09 16:14:48.179631
26	176	6	scope	string	Optional. List of API permissions to be used with access token (see Application Permissions). Can be omitted when requesting all permissions defined during the application registration phase		f	2016-05-09 16:14:48.185397	2016-05-09 16:14:48.185397
27	176	7	endpoint_id	string	Optional. Unique identifier of a client application. You can pass it in request according to pattern [a-zA-Z0-9_\\-]{1,64}. Otherwise it is auto-generated by server. The value will be returned in response in both cases		f	2016-05-09 16:14:48.189871	2016-05-09 16:14:48.189871
28	175	0	token	string	Active access or refresh token to be revoked		f	2016-05-09 16:16:13.408464	2016-05-09 16:16:13.408464
29	58	0	from	CallerInfo	Sender of a pager message. The extensionNumber property must be filled		f	2016-05-10 08:21:32.801561	2016-05-10 08:21:32.801561
30	58	1	replyOn	integer	Internal identifier of a message this message replies to		f	2016-05-10 08:21:32.806682	2016-05-10 08:21:32.806682
31	58	2	text	string	Text of a pager message. Max length is 1024 symbols (2-byte UTF-16 encoded). If a character is encoded in 4 bytes in UTF-16 it is treated as 2 characters, thus restricting the maximum message length to 512 symbols		f	2016-05-10 08:21:32.810583	2016-05-10 08:21:32.810583
32	58	3	to	array	Optional if replyOn parameter is specified. Receiver of a pager message. The extensionNumber property must be filled	CallerInfo	f	2016-05-10 08:21:32.816708	2016-05-10 08:21:32.816708
33	64	0	to	array	Recipient information. Phone number property is mandatory. Optional for resend fax request	CallerInfo	f	2016-05-10 08:41:26.888808	2016-05-10 08:41:26.888808
35	64	2	sendTime	string	The datetime to send fax at, in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. If time is not specified, the fax will be send immediately	date-time	f	2016-05-10 08:41:26.90036	2016-05-10 08:41:26.90036
36	64	3	coverIndex	integer	Optional. Cover page index. If not specified, the default cover page which is configured in "Outbound Fax Settings" is attached. See also 'Available Cover Pages' table below		f	2016-05-10 08:41:26.906274	2016-05-10 08:42:08.766651
37	64	4	coverPageText	string	Optional. Cover page text, entered by the fax sender and printed on the cover page. Maximum length is limited to 1024 symbols		f	2016-05-10 08:41:26.916148	2016-05-10 08:41:26.916148
38	64	5	originalMessageId	string	Internal identifier of the original fax message which needs to be resent. Mandatory for resend fax request		f	2016-05-10 08:41:26.923809	2016-05-10 08:41:26.923809
39	72	0	readStatus	string	Read status of a message to be changed. Multiple values are accepted	'Read' | 'Unread'	f	2016-05-10 08:57:25.568454	2016-05-10 08:57:25.568454
40	90	0	from	RingOut.Request.From	Phone number of the caller. This number corresponds to the 1st leg of the RingOut call. This number can be one of user's configured forwarding numbers or arbitrary number		f	2016-05-10 09:31:33.956941	2016-05-12 03:02:59.311769
41	90	1	to	RingOut.Request.To	Phone number of the called party. This number corresponds to the 2nd leg of the RingOut call		f	2016-05-10 09:31:33.96673	2016-05-12 03:02:59.316279
42	90	2	callerId	RingOut.Request.To	The number which will be displayed to the called party		f	2016-05-10 09:31:33.971466	2016-05-12 03:02:59.321835
43	90	3	playPrompt	boolean	The audio prompt that the calling party hears when the call is connected		f	2016-05-10 09:31:33.976365	2016-05-10 09:31:33.976365
44	90	4	country	RingOut.Request.CountryInfo	Optional. Dialing plan country data. If not specified, then extension home country is applied by default		f	2016-05-10 09:31:33.981916	2016-05-12 03:02:59.328121
45	95	0	from	CallerInfo	Sender of an SMS message. The phoneNumber property must be filled to correspond to one of the account phone numbers which is allowed to send SMS		f	2016-05-10 09:50:13.314021	2016-05-10 09:50:13.314021
46	95	1	to	array	Receiver of an SMS message. The phoneNumber property must be filled	CallerInfo	f	2016-05-10 09:50:13.319118	2016-05-10 09:50:13.319118
47	95	2	text	string	Text of a message. Max length is 1000 symbols (2-byte UTF-16 encoded). If a character is encoded in 4 bytes in UTF-16 it is treated as 2 characters, thus restricting the maximum message length to 500 symbols		f	2016-05-10 09:50:13.326666	2016-05-10 09:50:13.326666
48	169	0	eventFilters	array	Mandatory. Collection of URIs to API resources (see Event Types for details). For APNS transport type only message event filter is available	string	f	2016-05-10 11:38:15.314807	2016-05-10 11:38:15.314807
49	169	1	deliveryMode	Subscription.Request.DeliveryMode	Notification delivery settings		f	2016-05-10 11:38:15.320877	2016-05-12 03:01:55.011236
50	172	0	eventFilters	array	Collection of URIs to API resources (see Event Types). Mandatory field	string	f	2016-05-10 11:46:36.280505	2016-05-10 11:46:36.280505
51	10	0	company	string	Company business name		f	2016-05-12 06:36:13.332567	2016-05-12 06:36:13.332567
52	10	1	email	string	Company business email address		f	2016-05-12 06:36:13.337875	2016-05-12 06:36:13.337875
53	10	2	businessAddress	BusinessAddressInfo	Company business address		f	2016-05-12 06:36:13.341575	2016-05-12 06:36:13.341575
54	61	0	phoneNumbers	array	Multiple dial-in phone numbers to connect to audio conference service, relevant for user's brand. Each number is given with the country and location information, in order to let the user choose the less expensive way to connect to a conference. The first number in the list is the primary conference number, that is default and domestic	Conferencing.Request.PhoneNumber	f	2016-05-12 14:19:34.169265	2016-05-12 14:21:26.097498
55	61	1	allowJoinBeforeHost	boolean	Determines if host user allows conference participants to join before the host		f	2016-05-12 14:19:34.174402	2016-05-12 14:19:34.174402
56	67	0	phoneNumber	string	Forwarding/Call flip phone number		f	2016-05-12 14:38:06.084304	2016-05-12 14:38:06.084304
57	67	1	label	string	Forwarding/Call flip number title		f	2016-05-12 14:38:06.088485	2016-05-12 14:38:06.088485
58	99	0	devices	array	List of devices to order	DeviceInfo	f	2016-05-12 15:26:34.441343	2016-05-12 15:26:34.441343
59	126	0	id	string	Custom data access key. Optional. If specified, must match the custom key in the URL		f	2016-05-12 15:49:13.94937	2016-05-12 15:49:13.94937
60	126	1	value	string	Description of custom data. Mandatory for create, if there is no attachment specified. Maximum length is limited to 256 symbols		f	2016-05-12 15:49:13.954309	2016-05-12 15:49:13.954309
61	165	0	originalStrings	array	Phone numbers passed in a string. The maximum value of phone numbers is limited to 64. The maximum number of symbols in each phone number in a string is 64	string	f	2016-05-12 16:00:49.062779	2016-05-12 16:00:49.062779
62	168	0	records	array	Phone numbers to be reserved/un-reserved	ReservePhoneNumber.Request.ReserveRecord	f	2016-05-12 16:17:12.117802	2016-05-12 16:19:23.670507
63	182	0	topic	string	Topic of a meeting		f	2016-06-22 03:29:10.143193	2016-06-22 03:29:10.143193
64	182	1	meetingType	string	Type of a meeting. 'Instant' - meeting that is instantly started as soon as the host creates it; 'Scheduled' - common scheduled meeting; 'Recurring' - a recurring meeting. If the specified meeting type is 'Scheduled' then schedule property is mandatory for request	'Scheduled' | 'Instant' | 'Recurring'	f	2016-06-22 03:29:10.147469	2016-06-22 03:29:10.147469
65	182	2	password	string	Password required to join a meeting. Max number of characters is 10		f	2016-06-22 03:29:10.150645	2016-06-22 03:29:10.150645
66	182	3	schedule	MeetingScheduleInfo	Schedule of a meeting		f	2016-06-22 03:29:10.154812	2016-06-22 03:29:10.154812
67	182	4	allowJoinBeforeHost	boolean	If 'True' then the meeting can be joined and started by any participant (not host only). Supported for the meetings of 'Scheduled' and 'Recurring' type.		f	2016-06-22 03:29:10.161142	2016-06-22 03:29:10.161142
68	182	5	startHostVideo	boolean	Enables starting video when host joins the meeting		f	2016-06-22 03:29:10.165225	2016-06-22 03:29:10.165225
69	182	6	startParticipantsVideo	boolean	Enables starting video when participants join the meeting		f	2016-06-22 03:29:10.168797	2016-06-22 03:29:10.168797
70	182	7	audioOptions	array	Meeting audio options. Possible values are 'Phone', 'ComputerAudio'	string	f	2016-06-22 03:29:10.174738	2016-06-22 03:29:10.174738
71	184	0	topic	string	Topic of a meeting		f	2016-07-15 07:37:59.921639	2016-07-15 07:37:59.921639
72	184	1	meetingType	string	Type of a meeting. 'Instant' - meeting that is instantly started as soon as the host creates it; 'Scheduled' - common scheduled meeting; 'Recurring' - a recurring meeting. If the specified meeting type is 'Scheduled' then schedule property is mandatory for request	'Scheduled' | 'Instant' | 'Recurring'	f	2016-07-15 07:37:59.926253	2016-07-15 07:37:59.926253
73	184	2	password	string	Password required to join a meeting. Max number of characters is 10		f	2016-07-15 07:37:59.932107	2016-07-15 07:37:59.932107
74	184	3	schedule	MeetingScheduleInfo	Schedule of a meeting		f	2016-07-15 07:37:59.935895	2016-07-15 07:37:59.935895
75	184	4	allowJoinBeforeHost	boolean	If 'True' then the meeting can be joined and started by any participant (not host only). Supported for the meetings of 'Scheduled' and 'Recurring' type.		f	2016-07-15 07:37:59.939123	2016-07-15 07:37:59.939123
76	184	5	startHostVideo	boolean	Enables starting video when host joins the meeting		f	2016-07-15 07:37:59.942959	2016-07-15 07:37:59.942959
77	184	6	startParticipantsVideo	boolean	Enables starting video when participants join the meeting		f	2016-07-15 07:37:59.949288	2016-07-15 07:37:59.949288
78	184	7	audioOptions	array	Meeting audio options. Possible values are 'Phone', 'ComputerAudio'	string	f	2016-07-15 07:37:59.953114	2016-07-15 07:37:59.953114
79	64	1	faxResolution	string	Fax resolution	'High' | 'Low'	f	2016-07-28 08:24:02.879554	2016-07-28 08:24:02.879554
80	189	0	enabled	boolean	Specifies if the rule is active or inactive. The default value is 'True'		f	2016-09-23 08:25:10.041166	2016-09-23 08:25:10.041166
81	189	1	type	string	Type of an answering rule, the supported value is 'Custom'		f	2016-09-23 08:25:10.045739	2016-09-23 08:25:10.045739
82	189	2	name	string	Name of an answering rule specified by user. Max number of symbols is 30		f	2016-09-23 08:25:10.048618	2016-09-23 08:25:10.048618
83	189	3	callers	array	Answering rule will be applied when calls are received from the specified caller(s)	CallersInfo	f	2016-09-23 08:25:10.051344	2016-09-23 08:25:10.051344
84	189	4	calledNumbers	array	Answering rule will be applied when calling the specified number(s)	CalledNumberInfo	f	2016-09-23 08:25:10.054298	2016-09-23 08:25:10.054298
85	189	5	schedule	AnsweringRule.ScheduleInfo	Schedule when an answering rule should be applied		f	2016-09-23 08:25:10.058682	2016-09-23 08:32:19.534852
86	189	6	callHandlingAction	string	Specifies how incoming calls should be forwarded. The default value is 'ForwardCalls'	'ForwardCalls' | 'UnconditionalForwarding'	f	2016-09-23 08:25:10.062165	2016-09-23 08:25:10.062165
87	189	7	forwarding	ForwardingInfo	Forwarding parameters. If the 'callHandlingAction' parameter value is set to 'ForwardCalls' - should be specified . The settings determine the forwarding numbers to which the call should be forwarded. If not specified in request, then the business-hours forwarding rules are set by default		f	2016-09-23 08:25:10.065018	2016-09-23 08:25:10.065018
88	189	8	unconditionalForwarding	UnconditionalForwardingInfo	Unconditional forwarding parameters. If the 'callHandlingAction' parameter value is set to 'UnconditionalForwarding' - should be specified		f	2016-09-23 08:25:10.067896	2016-09-23 08:25:10.067896
89	189	9	voiceMail	VoicemailInfo	Specifies whether to take a voicemail and who should do it		f	2016-09-23 08:25:10.070733	2016-09-23 08:25:10.070733
90	190	0	enabled	boolean	Specifies if the answering rule is active or not		f	2016-09-23 09:14:12.268135	2016-09-23 09:14:12.268135
91	190	1	name	string	Custom name of an answering rule. The maximum number of characters is 64		f	2016-09-23 09:14:12.273367	2016-09-23 09:14:12.273367
92	190	2	forwarding	ForwardingInfo	Forwarding parameters. Returned if 'ForwardCalls' is specified in 'callHandlingAction'. These settings determine the forwarding numbers to which the call will be forwarded		f	2016-09-23 09:14:12.277552	2016-09-23 09:14:12.277552
93	190	3	greetings	array	Predefined greetings applied for an answering rule	GreetingInfo	f	2016-09-23 09:14:12.280578	2016-09-23 09:14:12.280578
94	192	0	type	string	Type of a greeting, specifying the case when the greeting is played. See also Greeting Types	'Introductory' | 'Announcement' | 'ConnectingMessage' | 'ConnectingAudio' | 'Voicemail' | 'Unavailable'	f	2016-09-23 09:36:00.436769	2016-09-23 09:36:00.436769
95	192	1	answeringRule	CustomGreetingInfo.AnsweringRuleInfo	Information on an answering rule that the greeting is applied to		f	2016-09-23 09:36:00.441215	2016-09-23 09:42:13.97365
\.


--
-- Name: request_body_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('request_body_properties_id_seq', 96, false);


--
-- Data for Name: response_body_properties; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY response_body_properties (id, verb_id, "position", name, data_type, description, format, required, created_at, updated_at) FROM stdin;
26	174	0	code	string	The authorization code returned for your application		f	2016-05-09 16:11:53.036971	2016-05-09 16:11:53.036971
27	174	1	expires_in	integer	The remaining lifetime of the authorization code		f	2016-05-09 16:11:53.041763	2016-05-09 16:11:53.041763
28	174	2	state	string	This parameter will be included in response if it was specified in the client authorization request. The value will be copied from the one received from the client		f	2016-05-09 16:11:53.045298	2016-05-09 16:11:53.045298
46	8	0	records	array	List of call log records	CallLogRecord	f	2016-05-10 05:48:38.408642	2016-05-10 05:48:38.408642
47	8	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 05:48:38.414493	2016-05-10 05:48:38.414493
48	8	2	paging	PagingInfo	Information on paging		f	2016-05-10 05:48:38.418442	2016-05-10 05:48:38.418442
49	9	0	uri	string	Canonical URI of the business address resource		f	2016-05-10 06:05:32.303148	2016-05-10 06:05:32.303148
50	9	1	company	string	Company business name		f	2016-05-10 06:05:32.308914	2016-05-10 06:05:32.308914
51	9	2	email	string	Company business email address		f	2016-05-10 06:05:32.312762	2016-05-10 06:05:32.312762
52	9	3	businessAddress	BusinessAddressInfo	Company business address		f	2016-05-10 06:05:32.316733	2016-05-10 06:05:32.316733
68	21	0	records	array	List of extensions with extension information	ExtensionInfo	f	2016-05-10 07:42:56.039727	2016-05-10 07:42:56.039727
69	21	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 07:42:56.044473	2016-05-10 07:42:56.044473
70	21	2	paging	PagingInfo	Information on paging		f	2016-05-10 07:42:56.049775	2016-05-10 07:42:56.049775
87	27	0	records	array	List of call log records	CallLogRecord	f	2016-05-10 08:00:44.263656	2016-05-10 08:00:44.263656
88	27	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 08:00:44.269123	2016-05-10 08:00:44.269123
89	27	2	paging	PagingInfo	Information on paging		f	2016-05-10 08:00:44.272914	2016-05-10 08:00:44.272914
105	66	0	records	array	List of forwarding phone numbers	ForwardingNumberInfo	f	2016-05-10 08:46:00.661135	2016-05-10 08:46:00.661135
106	66	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 08:46:00.666503	2016-05-10 08:46:00.666503
107	66	2	paging	PagingInfo	Information on paging		f	2016-05-10 08:46:00.672668	2016-05-10 08:46:00.672668
108	69	0	records	array	List of records with message information	MessageInfo	f	2016-05-10 08:48:56.935266	2016-05-10 08:48:56.935266
109	69	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 08:48:56.939705	2016-05-10 08:48:56.939705
111	75	0	records	array	List of phone numbers	PhoneNumberInfo	f	2016-05-10 09:19:24.666408	2016-05-10 09:19:24.666408
112	75	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 09:19:24.673656	2016-05-10 09:19:24.673656
113	75	2	paging	PagingInfo	Information on paging		f	2016-05-10 09:19:24.680153	2016-05-10 09:19:24.680153
114	103	0	records	array	List of account phone numbers	PhoneNumberInfo	f	2016-05-10 09:54:02.926371	2016-05-10 09:54:02.926371
115	103	1	paging	PagingInfo	Information on paging		f	2016-05-10 09:54:02.933599	2016-05-10 09:54:02.933599
116	103	2	navigation	NavigationInfo	Information on navigation		f	2016-05-10 09:54:02.938014	2016-05-10 09:54:02.938014
118	109	1	contentUri	string	Link to the call recording binary content		f	2016-05-10 10:26:56.530292	2016-05-10 10:26:56.530292
119	109	2	contentType	string	Call recording file format. Supported format is audio/x-wav		f	2016-05-10 10:26:56.536292	2016-05-10 10:26:56.536292
120	109	3	duration	integer	Recorded call duration		f	2016-05-10 10:26:56.541051	2016-05-10 10:26:56.541051
121	130	0	records	array	List of countries with the country data	FullCountryInfo	f	2016-05-10 10:31:28.427418	2016-05-10 10:57:10.42644
122	130	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 10:31:28.432446	2016-05-10 10:31:28.432446
123	130	2	paging	PagingInfo	Information on paging		f	2016-05-10 10:31:28.43921	2016-05-10 10:31:28.43921
124	134	0	records	array	Language data	LanguageInfo	f	2016-05-10 11:00:17.547888	2016-05-10 11:00:17.547888
125	134	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 11:00:17.552776	2016-05-10 11:00:17.552776
126	134	2	paging	PagingInfo	Information on paging		f	2016-05-10 11:00:17.557562	2016-05-10 11:00:17.557562
127	136	0	records	array	List of locations	LocationInfo	f	2016-05-10 11:13:35.491232	2016-05-10 11:13:35.491232
128	136	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 11:13:35.496314	2016-05-10 11:13:35.496314
129	136	2	paging	PagingInfo	Information on paging		f	2016-05-10 11:13:35.504154	2016-05-10 11:13:35.504154
130	143	0	records	array	List of states	StateInfo	f	2016-05-10 11:24:28.875009	2016-05-10 11:24:28.875009
131	143	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 11:24:28.881994	2016-05-10 11:24:28.881994
132	143	2	paging	PagingInfo	Information on paging		f	2016-05-10 11:24:28.886926	2016-05-10 11:24:28.886926
133	145	0	records	array	List of timezones	TimezoneInfo	f	2016-05-10 11:30:04.273356	2016-05-10 11:30:04.273356
134	145	1	navigation	NavigationInfo	Information on navigation		f	2016-05-10 11:30:04.279912	2016-05-10 11:30:04.279912
135	145	2	paging	PagingInfo	Information on paging		f	2016-05-10 11:30:04.284161	2016-05-10 11:30:04.284161
136	10	0	uri	string	Canonical URI of the business address resource		f	2016-05-12 07:08:10.057501	2016-05-12 07:08:10.057501
137	10	1	company	string	Company business name		f	2016-05-12 07:08:10.063003	2016-05-12 07:08:10.063003
138	10	2	email	string	Company business email address		f	2016-05-12 07:08:10.068693	2016-05-12 07:08:10.068693
139	10	3	businessAddress	BusinessAddressInfo	Company business address		f	2016-05-12 07:08:10.072532	2016-05-12 07:08:10.072532
140	15	0	records	array	List of extensions belonging to a given department	Department.Response.ExtensionInfo	f	2016-05-12 07:41:48.607987	2016-05-12 07:43:02.347142
141	15	1	navigation	NavigationInfo	Information on navigation		f	2016-05-12 07:41:48.612668	2016-05-12 07:41:48.612668
142	15	2	paging	PagingInfo	Information on paging		f	2016-05-12 07:41:48.617062	2016-05-12 07:41:48.617062
143	16	0	records	array	List of extension records	DeviceInfo	f	2016-05-12 07:45:02.877196	2016-05-12 07:45:02.877196
144	16	1	navigation	NavigationInfo	Information on navigation		f	2016-05-12 07:45:02.881432	2016-05-12 07:45:02.881432
91	53	2	navigation	NavigationInfo	Information on navigation		f	2016-05-10 08:10:26.076548	2016-11-03 01:21:53.08398
92	53	3	paging	PagingInfo	Information on paging		f	2016-05-10 08:10:26.080434	2016-11-03 01:21:53.090425
53	12	1	records	array	List of call log records	CallLogRecord	f	2016-05-10 06:12:41.029242	2016-11-03 01:24:29.139954
54	12	2	navigation	NavigationInfo	Information on navigation		f	2016-05-10 06:12:41.034087	2016-11-03 01:24:29.145325
145	16	2	paging	PagingInfo	Information on paging		f	2016-05-12 07:45:02.885395	2016-05-12 07:45:02.885395
146	28	0	records	array	List of contacts with synchronization information	PersonalContactInfo	f	2016-05-12 11:25:58.725526	2016-05-12 11:25:58.725526
147	28	1	syncInfo	SyncInfo	Sync type, token and time		f	2016-05-12 11:25:58.730548	2016-05-12 11:25:58.730548
148	28	2	nextPageId	integer	Internal identifier of the next page, if any		f	2016-05-12 11:25:58.735699	2016-05-12 11:25:58.735699
149	28	3	nextPageUri	string	URL of the next page, if any		f	2016-05-12 11:25:58.739843	2016-05-12 11:25:58.739843
150	29	0	records	array	List of personal contacts from the extension address book	PersonalContactInfo	f	2016-05-12 12:14:33.997071	2016-05-12 12:14:42.446288
151	29	1	navigation	NavigationInfo	Information on navigation		f	2016-05-12 12:14:34.000612	2016-05-12 12:14:34.000612
152	29	2	paging	PagingInfo	Information on paging		f	2016-05-12 12:14:34.004241	2016-05-12 12:14:34.004241
153	34	0	records	array	List of groups	GroupInfo	f	2016-05-12 12:24:38.66041	2016-05-12 12:24:38.66041
154	34	1	navigation	NavigationInfo	Information on navigation		f	2016-05-12 12:24:38.664794	2016-05-12 12:24:38.664794
155	34	2	paging	PagingInfo	Information on paging		f	2016-05-12 12:24:38.668918	2016-05-12 12:24:38.668918
156	46	0	records	array	List of blocked phone numbers	BlockedNumberInfo	f	2016-05-12 13:53:48.113401	2016-05-12 13:53:48.113401
157	46	1	navigation	NavigationInfo	Information on navigation		f	2016-05-12 13:53:48.122224	2016-05-12 13:53:48.122224
158	46	2	paging	PagingInfo	Information on paging		f	2016-05-12 13:53:48.129002	2016-05-12 13:53:48.129002
159	51	0	uri	string	Canonical URI of a business-hours resource		f	2016-05-12 13:58:06.825782	2016-05-12 13:58:06.825782
160	51	1	schedule	BusinessHour.ScheduleInfo	Schedule when an answering rule is applied		f	2016-05-12 13:58:06.829658	2016-05-12 13:59:47.70992
161	54	0	records	array	List of call log records with synchronization information. For ISync the total number of returned records is limited to 250; this includes both new records and the old ones, specified by the recordCount parameter	CallLogRecord	f	2016-05-12 14:04:55.780355	2016-05-12 14:04:55.780355
162	54	1	syncInfo	SyncInfo	Sync type, token and time		f	2016-05-12 14:04:55.784723	2016-05-12 14:04:55.784723
163	62	0	records	array	List of extension devices	DeviceInfo	f	2016-05-12 14:22:29.567951	2016-05-12 14:22:29.567951
164	62	1	navigation	NavigationInfo	Information on navigation		f	2016-05-12 14:22:29.574351	2016-05-12 14:22:29.574351
165	62	2	paging	PagingInfo	Information on paging		f	2016-05-12 14:22:29.577925	2016-05-12 14:22:29.577925
166	68	0	records	array	List of extension grants with the data	GrantInfo	f	2016-05-12 14:41:06.005545	2016-05-12 14:41:06.005545
167	68	1	navigation	NavigationInfo	Information on navigation		f	2016-05-12 14:41:06.010234	2016-05-12 14:41:06.010234
168	68	2	paging	PagingInfo	Information on paging		f	2016-05-12 14:41:06.014879	2016-05-12 14:41:06.014879
169	74	0	records	array	List of message records with synchronization information	MessageInfo	f	2016-05-12 14:45:18.927956	2016-05-12 14:45:18.927956
170	74	1	syncInfo	SyncInfo	Sync type, token and time		f	2016-05-12 14:45:18.938715	2016-05-12 14:45:18.938715
171	99	0	devices	array	List of the ordered devices	DeviceInfo	f	2016-05-12 15:26:45.542411	2016-05-12 15:26:45.542411
172	100	0	id	string	Identifier of a device		f	2016-05-12 15:36:09.21187	2016-05-12 15:36:09.21187
173	100	1	uri	string	Canonical URI of an order resource		f	2016-05-12 15:36:09.216423	2016-05-12 15:36:09.216423
174	100	2	devices	array	List of the ordered devices	DeviceInfo	f	2016-05-12 15:36:09.220285	2016-05-12 15:36:09.220285
179	126	0	id	string	Custom data access key		f	2016-05-12 15:49:57.135108	2016-05-12 15:49:57.135108
180	126	1	uri	string	Link to the custom data		f	2016-05-12 15:49:57.142339	2016-05-12 15:49:57.142339
181	126	2	value	string	Description of custom data		f	2016-05-12 15:49:57.148534	2016-05-12 15:49:57.148534
182	126	3	lastModifiedTime	string	Time of the last change in custom data		f	2016-05-12 15:49:57.152352	2016-05-12 15:49:57.152352
183	126	4	attachment	AttachmentInfo	Attachment data: link and type		f	2016-05-12 15:49:57.158249	2016-05-12 15:51:10.851881
184	165	0	uri	string	Canonical URI of a resource		f	2016-05-12 16:01:47.053708	2016-05-12 16:01:47.053708
185	165	1	homeCountry	array	Information on a user home country	ParsePhoneNumber.CountryInfo	f	2016-05-12 16:01:47.058792	2016-05-12 16:04:47.409738
186	165	2	phoneNumbers	array	Parsed phone numbers data	ParsePhoneNumber.PhoneNumberInfo	f	2016-05-12 16:01:47.064097	2016-05-12 16:04:47.415211
187	165	3	originalString	string	One of the numbers to be parsed, passed as a string in response		f	2016-05-12 16:01:47.068168	2016-05-12 16:01:47.068168
188	165	4	areaCode	string	Area code of the location (3-digit usually), according to the NANP number format, that can be summarized as NPA-NXX-xxxx and covers Canada, the United States, parts of the Caribbean Sea, and some Atlantic and Pacific islands. See North American Numbering Plan for details		f	2016-05-12 16:01:47.072033	2016-05-12 16:01:47.072033
189	165	5	formattedNational	string	Domestic format of a phone number		f	2016-05-12 16:01:47.077001	2016-05-12 16:01:47.077001
190	165	6	formattedInternational	string	International format of a phone number		f	2016-05-12 16:01:47.082384	2016-05-12 16:01:47.082384
191	165	7	dialable	string	Dialing format of a phone number		f	2016-05-12 16:01:47.086262	2016-05-12 16:01:47.086262
192	165	8	e164	string	E.164 (11-digits) format of a phone number		f	2016-05-12 16:01:47.090182	2016-05-12 16:01:47.090182
193	165	9	special	boolean	"True" if the number is in a special format (for example N11 code)		f	2016-05-12 16:01:47.094951	2016-05-12 16:01:47.094951
194	165	10	normalized	string	E.164 (11-digits) format of a phone number without the plus sign ('+')		f	2016-05-12 16:01:47.098823	2016-05-12 16:01:47.098823
195	165	11	country	array	Information on a country the phone number belongs to	ParsePhoneNumber.CountryInfo	f	2016-05-12 16:01:47.10273	2016-05-12 16:04:47.437943
196	167	0	uri	string	Canonical URI of the phone numbers resource		f	2016-05-12 16:08:17.557426	2016-05-12 16:08:17.557426
197	167	1	records	array	List of phone numbers filtered by the specified criteria	LookUpPhoneNumber.PhoneNumberInfo	f	2016-05-12 16:08:17.564676	2016-05-12 16:09:11.130406
198	168	0	records	array	Phone numbers to be reserved/un-reserved	ReservePhoneNumber.Response.ReserveRecord	f	2016-05-12 16:19:57.386195	2016-05-12 16:19:57.386195
200	69	2	paging	PagingInfo	Information on paging		f	2016-06-17 02:49:42.6773	2016-06-17 02:49:42.6773
203	181	0	uri	string	Canonical URI of meetings resource		f	2016-06-22 03:10:28.993638	2016-06-22 03:10:28.993638
204	181	1	records	array	List of extension meetings	MeetingInfo	f	2016-06-22 03:10:28.997945	2016-06-22 03:10:28.997945
205	181	2	paging	PagingInfo	Information on paging		f	2016-06-22 03:10:29.00111	2016-06-22 03:10:29.00111
206	181	3	navigation	NavigationInfo	Information on navigation		f	2016-06-22 03:10:29.006428	2016-06-22 03:10:29.006428
212	20	0	records	array	List of countries which can be selected for a dialing plan	DialingPlanCountryInfo	f	2016-08-10 01:10:09.308102	2016-08-10 01:10:09.308102
213	20	1	paging	PagingInfo	Information on paging		f	2016-08-10 01:10:09.312622	2016-08-10 01:10:09.312622
214	20	2	navigation	NavigationInfo	Information on navigation		f	2016-08-10 01:10:09.31547	2016-08-10 01:10:09.31547
215	44	0	uri	string	Canonical URI of an authorization profile resource		f	2016-09-09 08:10:14.972824	2016-09-09 08:10:14.972824
216	44	1	permissions	array	List of user permissions granted	UserPermission	f	2016-09-09 08:10:14.977646	2016-09-09 08:17:54.39621
217	45	0	uri	string	Canonical URI of a permission resource		f	2016-09-09 08:30:22.372819	2016-09-09 08:30:22.372819
218	45	1	successful	boolean	Specifies if check result is successful or not		f	2016-09-09 08:30:22.376939	2016-09-09 08:30:22.376939
219	45	2	details	PermissionDetailsInfo	Information on a permission checked. Returned if successful is 'True'		f	2016-09-09 08:30:22.380716	2016-09-09 08:30:22.380716
220	45	3	scopes	array	List of active scopes for permission. Returned if successful is 'True'	string	f	2016-09-09 08:30:22.385414	2016-09-09 08:30:22.385414
221	188	0	uri	string	Canonical URI of an answering rule resource		f	2016-09-23 08:14:35.466244	2016-09-23 08:14:35.466244
222	188	1	records	array	List of answering rules	AnsweringRuleInfo	f	2016-09-23 08:14:35.471261	2016-09-23 08:14:35.471261
223	188	2	paging	PagingInfo	Information on paging		f	2016-09-23 08:14:35.474756	2016-09-23 08:14:35.474756
224	188	3	navigation	NavigationInfo	Information on navigation		f	2016-09-23 08:14:35.480003	2016-09-23 08:14:35.480003
225	53	0	uri	string	Canonical URI		f	2016-11-03 01:21:53.069526	2016-11-03 01:21:53.069526
90	53	1	records	array	List of call log records	CallLogRecord	f	2016-05-10 08:10:26.070462	2016-11-03 01:21:53.078651
226	12	0	uri	string	Canonical URI		f	2016-11-03 01:24:29.135228	2016-11-03 01:24:29.135228
202	12	3	paging	PagingInfo	Information on paging		f	2016-06-17 03:44:04.526152	2016-11-03 01:24:29.150103
117	109	0	id	string	Internal identifier of the call recording		f	2016-05-10 10:26:56.522079	2016-12-01 08:35:15.807218
227	194	0	uri	string	Canonical URI of a subscription resource		f	2016-12-23 07:00:06.119962	2016-12-23 07:00:06.119962
228	194	1	records	array	List of subscriptions for the current user and application	SubscriptionInfo	f	2016-12-23 07:00:06.126887	2016-12-23 07:00:06.126887
\.


--
-- Name: response_body_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('response_body_properties_id_seq', 228, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY schema_migrations (version) FROM stdin;
20160420065250
20160420093038
20160420095546
20160424095355
20160503071748
20160504053415
20160505021123
20160506101357
20160507010916
20160507034653
20160508011938
20160508091609
20160508143847
20160508143903
20160508143911
20160509133340
20160509133352
20160513085927
20160613092445
20160613094240
20160614030805
20160616072158
20160616092621
20160620012524
20160620105425
20160621081634
20160621091438
20161206085951
\.


--
-- Data for Name: specifications; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY specifications (id, version, title, description, "termsOfService", host, "basePath", schemes, produces, consumes, created_at, updated_at, path_parameters_text, permissions_text) FROM stdin;
1	v1.0	RingCentral API	RingCentral Connect Platform API	http://www.ringcentral.com/legal/eulatos.html	platform.devtest.ringcentral.com	/	https	application/json	application/json	2016-04-21 11:28:34.771705	2016-09-23 10:38:42.191206	accountId\tstring\tInternal identifier of a RingCentral account or tilde (~) to indicate the account logged-in within the current session\r\nansweringRuleId\tstring\tInternal identifier of an answering rule. The value can be standard digital ID or specific ID - either business-hours-rule or after-hours-rule\r\nattachmentId\tstring\tInternal identifier of a message attachment\r\nblockedNumberId\tstring\tInternal identifier of a blocked number list entry\r\nbrandId\tstring\tInternal identifier of a brand\r\ncallLogId\tstring\tInternal identifier of a call log record\r\ncompanyPagerId\tstring\tInternal identifier of a pager message\r\ncontactId\tstring\tInternal identifier of a contact record in the RingCentral database\r\ncountryId\tstring\tInternal identifier of a country\r\ncustomDataKey\tstring\tCustom data access key. The number of unique custom data keys is limited to 100 keys per extension, summarized for all the applications. For example, if you have created 50 custom data keys under the Android mobile client application for the particular extension, then logged in the iOS application and created another 50 keys, the web client application won't be allowed to create any custom data key for that extension\r\ndepartmentId\tstring\tInternal identifier of a Department extension (same as extensionId but only the ID of a department extension is valid)\r\ndeviceId\tstring\tInternal identifier of a device\r\nextensionId\tstring\tInternal identifier of an extension or tilde (~) to indicate the extension assigned to the account logged-in within the current session\r\nfaxId\tstring\tInternal identifier of a fax message\r\ngreetingId\tstring\tInternal identifier of a greeting\r\ngroupId\tstring\tInternal identifier of a group in an address book\r\nlanguageId\tstring\tInternal identifier of a language\r\nlineId\tstring\tInternal identifier of a line\r\nmeetingId\tstring\tInternal identifier of a meeting\r\nmessageId\tstring\tInternal identifier of a message\r\norderId\tstring\tInternal identifier of an order\r\nphoneNumberId\tstring\tInternal identifier of a phone number\r\nrecordingId\tstring\tInternal identifier of recording (returned in Call Log)\r\nringoutId\tstring\tInternal identifier of a RingOut call\r\nscaleSize\t'90x90' | '195x195' | '584x584'\tDimensions of a profile image which will be returned in response.\r\nsecretQuestionId\tstring\tInternal identifier of a secret question\r\nservicePlanId\tstring\tInternal identifier of a service plan\r\nsmsId\tstring\tInternal identifier of an SMS message\r\nstateId\tstring\tInternal identifier of a state\r\nsubscriptionId\tstring\tInternal identifier of a subscription\r\ntimezoneId\tstring\tInternal identifier of a timezone\r\nuserGroupId\tstring\tInternal identifier of an user group\r\nverificationCallId\tstring\tInternal identifier of a verification call	Accounts\tManaging accounts: creating new accounts, viewing and updating account information, deleting existing accounts\nContacts\tCreating, viewing, editing and deleting user personal contacts\nEditAccounts\tViewing and updating user account info (including name, business name, address and phone number/account number)\nEditCallLog\tViewing and updating user call logs\nEditCustomData\tViewing and updating client custom data (key-value)\nEditExtensions\tViewing and updating user extension info (includes extension name, number, email and phone number, assigned phone numbers, devices and other extension settings)\nEditMessages\tViewing and updating user messages\nFaxes\tSending and receiving faxes\nInternalMessages\tSending and receiving intra-company text messages\nMeetings\tCreating, viewing, editing and deleting meetings\nNumberLookup\tLooking-up and reserving available phone number\nReadAccounts\tViewing user account info (including name, business name, address and phone number/account number)\nReadCallLog\tViewing user call logs\nReadCallRecording\tDownloading call recording content\nReadClientInfo\tViewing of client application registered attributes and additional helper information (external URLs, hints, etc.)\nReadContacts\tViewing user personal contacts\nReadMessages\tViewing user messages\nRingOut\tPerforming two-legged ring-out phone calls\nReadPresence\tGetting user presence information\nSMS\tSending and receiving SMS (text) messages
\.


--
-- Name: specifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('specifications_id_seq', 2, false);


--
-- Data for Name: verbs; Type: TABLE DATA; Schema: public; Owner: tyler.liu
--

COPY verbs (id, path_id, method, name, batch, visibility, status, created_at, updated_at, query_parameters_text, request_body_text, response_body_text, since, description, api_group, permissions, tags) FROM stdin;
2	2	GET	Get API Version Info	f	Public Basic	Normal	2016-05-09 15:50:09.579355	2016-12-06 09:15:58.702921			VersionInfo			Light		API Versions
4	4	DELETE	Delete Account by ID	f	Public Internal	Normal	2016-05-09 15:50:09.602811	2016-12-06 09:30:01.177325						Light		Account
5	4	GET	Get Account Info by ID	f	Public Basic	Normal	2016-05-09 15:50:09.611138	2016-12-06 09:30:16.433214			AccountInfo			Light	ReadAccounts	Account
6	4	PUT	Update Account by ID	f	Public Internal	Normal	2016-05-09 15:50:09.619071	2016-12-06 09:30:24.682188						Light		Account
8	6	GET	Get Account Active (Recent) Calls	f	Public Basic	Normal	2016-05-09 15:50:09.644929	2016-12-06 09:46:30.655645	direction\t'Inbound' | 'Outbound'\tThe direction for the result records. It is allowed to specify more than one direction. If not specified, both inbound and outbound records are returned. Multiple values are accepted\ntype\t'Voice' | 'Fax'\tCall type of a record. It is allowed to specify more than one type. If not specified, all call types are returned. Multiple values are accepted\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'.\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default.		records\tCollection of Call Log Record\tList of call log records\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Call Log
9	7	GET	Get Company Business Address	f	Public Basic	Normal	2016-05-09 15:50:09.655979	2016-12-06 09:48:02.638338			uri\tstring\tCanonical URI of the business address resource\ncompany\tstring\tCompany business name\nemail\tstring\tCompany business email address\nbusinessAddress\tBusiness Address Info\tCompany business address			Light		Account
10	7	PUT	Update Company Business Address	f	Public Advanced	Normal	2016-05-09 15:50:09.66225	2016-12-06 09:48:10.916882		company\tstring\tCompany business name\nemail\tstring\tCompany business email address\nbusinessAddress\tBusiness Address Info\tCompany business address	uri\tstring\tCanonical URI of the business address resource\ncompany\tstring\tCompany business name\nemail\tstring\tCompany business email address\nbusinessAddress\tBusiness Address Info\tCompany business address			Light		Account
11	8	DELETE	Delete Account Call Log	f	Public Advanced	Disabled	2016-05-09 15:50:09.6788	2016-12-06 09:48:39.040278						Light		Call Log
13	9	DELETE	Delete Account Call Log Record by ID	t	Public Advanced	Disabled	2016-05-09 15:50:09.702271	2016-12-06 09:49:01.305852						Light		Call Log
14	9	GET	Get Account Call Log Record by ID	t	Public Basic	Normal	2016-05-09 15:50:09.711713	2016-12-06 09:49:09.523796			CallLogInfo			Light		Call Log
15	10	GET	Get Department Members	f	Public Advanced	Normal	2016-05-09 15:50:09.724187	2016-12-06 09:49:51.777038	page\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Department.Response.ExtensionInfo\tList of extensions belonging to a given department\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Extension
16	11	GET	Get Account Device List	f	Public Advanced	Normal	2016-05-09 15:50:09.7378	2016-12-06 09:50:22.506337			records\tCollection of Device Info\tList of extension records\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Devices
19	13	GET	Get sip provisioning info for manual provisioning	f	Public Advanced	NoDoc	2016-05-09 15:50:09.774826	2016-12-06 09:50:36.942633						Light		Devices
17	12	GET	Get Device by ID	f	Public Advanced	Normal	2016-05-09 15:50:09.751129	2016-12-06 09:50:55.453831			DeviceInfo			Light		Devices
18	12	PUT	Update  Device by ID	f	Public Advanced	NoDoc	2016-05-09 15:50:09.759602	2016-12-06 09:51:03.078856						Light		Devices
20	14	GET	Get IBO Dialing Plans	f	Public Basic	Normal	2016-05-09 15:50:09.787017	2016-12-06 09:51:37.543874	page\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\r\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Dialing Plan Country Info\tList of countries which can be selected for a dialing plan\r\npaging\tPaging Info\tInformation on paging\r\nnavigation\tNavigation Info\tInformation on navigation	1.0.19 (Release 7.3)	Returns list of countries which can be selected for a dialing plan (to call short numbers and special services).	Heavy	ReadAccounts	Account
22	15	POST	Create New Extension	f	Public Internal	Normal	2016-05-09 15:50:09.809538	2016-12-06 09:52:13.455496						Light		Extension
23	16	DELETE	Delete Extension by ID	f	Public Internal	Normal	2016-05-09 15:50:09.825928	2016-12-06 09:53:59.647728						Light		Extension
24	16	GET	Get Extension Info by ID	f	Public Basic	Normal	2016-05-09 15:50:09.832888	2016-12-06 09:54:06.664106			ExtensionInfo			Light		Extension
50	31	PUT	Update Blocked Number Label	f	Public Advanced	Normal	2016-05-09 15:50:10.097983	2016-12-06 10:03:34.326346		BlockedNumberInfo	BlockedNumberInfo			Light		Blocked Numbers
51	32	GET	Get User Hours Setting	f	Public Advanced	Normal	2016-05-09 15:50:10.114449	2016-12-06 10:04:14.181898			uri\tstring\tCanonical URI of a business-hours resource\nschedule\tBusinessHour.ScheduleInfo\tSchedule when an answering rule is applied			Light		Answering Rules
78	50	GET	Get List of Monitored Lines	f	Public Internal	Normal	2016-05-09 15:50:10.400531	2016-12-06 11:45:52.367897						Light		Presence
79	50	PUT	Update List of Monitored Lines	f	Public Internal	Normal	2016-05-09 15:50:10.408109	2016-12-06 11:46:01.106193						Light		Presence
80	51	GET	Get Monitored Line	f	Public Internal	Normal	2016-05-09 15:50:10.420502	2016-12-06 11:46:32.516618						Light		Presence
81	52	GET	Get List of Extensions Allowed to Pick-up Calls	f	Public Internal	Normal	2016-05-09 15:50:10.431834	2016-12-06 12:41:30.959782						Light		Presence
7	5	GET	Get Account Service Info	f	Public Advanced	Normal	2016-05-09 15:50:09.632114	2016-12-06 12:51:49.423248			AccountServiceInfo	1.0.0	Returns the information about service plan, available features and limitations for a particular RingCentral customer account.	Light	ReadAccounts	Account
28	19	GET	Contacts Synchronization	f	Public Advanced	Normal	2016-05-09 15:50:09.881075	2016-12-06 09:55:24.010718	syncType\t'FSync' | 'ISync'\tType of synchronization. The default value is 'FSync'\nsyncToken\tstring\tValue of syncToken property of the last sync request response\nperPage\tinteger\tNumber of records per page to be returned. The max number of records is 250, which is also the default. For FSync — if the number of records exceeds the parameter value (either specified or default), all of the pages can be retrieved in several requests. For ISync — if the number of records exceeds the page size, the number of incoming changes to this number is limited\npageId\tinteger\tInternal identifier of a page. It can be obtained from the 'nextPageId' parameter passed in response body		records\tCollection of Personal Contact Info\tList of contacts with synchronization information\nsyncInfo\tSync Info\tSync type, token and time\nnextPageId\tinteger\tInternal identifier of the next page, if any\nnextPageUri\tstring\tURL of the next page, if any			Light		Address Book
30	20	POST	Create New Contact	f	Public Advanced	Normal	2016-05-09 15:50:09.899077	2016-12-06 09:55:55.696122		PersonalContactInfo	PersonalContactInfo			Light	Contacts, ReadContacts	Address Book
29	20	GET	Get Contact List	f	Public Advanced	Normal	2016-05-09 15:50:09.893424	2016-12-06 09:56:02.835267	phoneNumber\tstring\tPhone number in E.164 (11-digits) format with or without plus '+'. Multiple values are supported\r\nstartsWith\tstring\tIf specified, only contacts whose First name or Last name start with the mentioned substring are returned. Case-insensitive\r\nsortBy\t'FirstName' | 'LastName' | 'Company'\tSorts results by the specified property. The default is 'First Name'\r\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\r\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Personal Contact Info\tList of personal contacts from the extension address book\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging	1.0.4 (Release 5.13)	Returns the extension address book.	Heavy	ReadContacts	Address Book
31	21	DELETE	Delete Contact by ID	f	Public Advanced	Normal	2016-05-09 15:50:09.909305	2016-12-06 09:56:16.158564						Light		Address Book
32	21	GET	Get Contact by ID	f	Public Advanced	Normal	2016-05-09 15:50:09.915291	2016-12-06 09:56:24.175567			PersonalContactInfo			Light		Address Book
33	21	PUT	Update Contact by ID	f	Public Advanced	Normal	2016-05-09 15:50:09.922507	2016-12-06 09:56:31.012029		PersonalContactInfo	PersonalContactInfo			Light		Address Book
35	22	POST	Create New Contact Group	f	Public Advanced	NoDoc	2016-05-09 15:50:09.942268	2016-12-06 09:56:48.952311						Light		Address Book
34	22	GET	Get Contact Group List	f	Public Advanced	Normal	2016-05-09 15:50:09.934911	2016-12-06 09:56:57.88733			records\tCollection of Group Info\tList of groups\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Address Book
36	23	DELETE	Delete Contact Group by ID	f	Public Advanced	NoDoc	2016-05-09 15:50:09.952414	2016-12-06 09:57:32.618048						Light		Address Book
37	23	GET	Get Contact Group by ID	f	Public Advanced	Deprecated	2016-05-09 15:50:09.960977	2016-12-06 09:57:41.214152			GroupInfo		Returns a group or several groups description, including the user-defined group name, number of contacts in the group, and optional note. Batch request is supported.	Light		Address Book
38	23	PUT	Update Contact Group by ID	f	Public Advanced	NoDoc	2016-05-09 15:50:09.967055	2016-12-06 09:57:48.946405						Light		Address Book
40	25	GET	Get After Hours Answering Rule	f	Public Advanced	NoDoc	2016-05-09 15:50:09.991616	2016-12-06 09:58:57.93569						Light		Answering Rules
41	26	GET	Get User Hours Answering Rule	f	Public Advanced	NoDoc	2016-05-09 15:50:10.005057	2016-12-06 09:59:18.901102						Light		Answering Rules
39	24	GET	Get Custom Answering Rule by ID	f	Public Advanced	Normal	2016-05-09 15:50:09.979283	2016-12-06 09:59:41.144146			AnsweringRuleInfo	1.0.15 (Release 7.0)	Returns an answering rule by ID.	Light	ReadAccounts	Answering Rules
42	27	GET	Get Extension Assigned Roles	f	Public Advanced	NoDoc	2016-05-09 15:50:10.016477	2016-12-06 10:01:09.597443						Light		Extension
43	27	PUT	Update Extension Assigned Roles	f	Public Internal	Normal	2016-05-09 15:50:10.022171	2016-12-06 10:01:16.918553						Light		Extension
44	28	GET	Get User Permissions	f	Public Advanced	Normal	2016-05-09 15:50:10.032257	2016-12-06 10:02:01.666717			uri\tstring\tCanonical URI of an authorization profile resource\r\npermissions\tCollection of User Permission\tList of user permissions granted	1.0.22 (Release 7.5)	Returns a list of user permissions granted at authorization procedure.	Medium		Authorization Profile
45	29	GET	Check User Permissions	f	Public Advanced	Normal	2016-05-09 15:50:10.046055	2016-12-06 10:02:19.419784	permissionId\tstring\tPermission to check\r\ntargetExtensionId\tstring\tOptional. Internal identifier of an extension for which user permissions are to be checked. The default value is the currently logged-in extension		uri\tstring\tCanonical URI of a permission resource\r\nsuccessful\tboolean\tSpecifies if check result is successful or not\r\ndetails\tPermission Details Info\tInformation on a permission checked. Returned if successful is 'True'\r\nscopes\tCollection of string\tList of active scopes for permission. Returned if successful is 'True'	1.0.22 (Release 7.5)	Checks if a certain user permission is activated for the particular extension.	Light		Authorization Profile
47	30	POST	Add New Blocked Number	f	Public Advanced	Normal	2016-05-09 15:50:10.067639	2016-12-06 10:02:58.417379		BlockedNumberInfo	BlockedNumberInfo			Light		Blocked Numbers
46	30	GET	Get Blocked Number List	f	Public Advanced	Normal	2016-05-09 15:50:10.061528	2016-12-06 10:03:05.035577			records\tCollection of Blocked Number Info\tList of blocked phone numbers\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Blocked Numbers
48	31	DELETE	Delete Blocked Number by ID	f	Public Advanced	Normal	2016-05-09 15:50:10.081281	2016-12-06 10:03:19.945626						Light		Blocked Numbers
49	31	GET	Get Blocked Number by ID	f	Public Advanced	Normal	2016-05-09 15:50:10.089619	2016-12-06 10:03:26.388582			BlockedNumberInfo			Light		Blocked Numbers
26	17	GET	Get Extension Permissions	f	Public Advanced	NoDoc	2016-05-09 15:50:09.855738	2016-12-06 10:50:30.879173						Light		Extension
84	53	GET	Get Profile Image	f	Public Advanced	Normal	2016-05-09 15:50:10.458195	2016-12-06 12:42:00.100566			Binary			Light		Extension
82	53	PUT	Update Profile Image	f	Public Advanced	Normal	2016-05-09 15:50:10.445653	2016-12-06 12:42:05.513069		Binary				Light		Extension
83	53	POST	Update Profile Image (same as PUT)	f	Public Advanced	Normal	2016-05-09 15:50:10.451629	2016-12-06 12:42:12.657416		Binary				Light		Extension
88	57	GET	Get Customer Facing Analytics Settings	f	Public Internal	Normal	2016-05-09 15:50:10.508218	2016-12-06 12:42:47.159635						Light		Reporting
89	57	PUT	Update Customer Facing Analytics Settings	f	Public Internal	Normal	2016-05-09 15:50:10.513696	2016-12-06 12:42:54.064027						Light		Reporting
55	35	DELETE	Delete Extension Call Log Record by ID	t	Public Advanced	Disabled	2016-05-09 15:50:10.157606	2016-12-06 10:05:21.147665						Light		Call Log
56	35	GET	Get Extension Call Log Record by ID	t	Public Basic	Normal	2016-05-09 15:50:10.164479	2016-12-06 10:05:27.649338			CallLogInfo			Light		Call Log
58	36	POST	Create and Send Pager Message	f	Public Basic	Normal	2016-05-09 15:50:10.193239	2016-12-06 10:05:59.100972		from\tCaller Info\tSender of a pager message. The extensionNumber property must be filled\nreplyOn\tinteger\tInternal identifier of a message this message replies to\ntext\tstring\tText of a pager message. Max length is 1024 symbols (2-byte UTF-16 encoded). If a character is encoded in 4 bytes in UTF-16 it is treated as 2 characters, thus restricting the maximum message length to 512 symbols\nto\tCollection of Caller Info\tOptional if replyOn parameter is specified. Receiver of a pager message. The extensionNumber property must be filled	MessageInfo			Light	InternalMessages, ReadMessages	Messages
57	36	GET	Get Pager Message List	f	Public Advanced	NoDoc	2016-05-09 15:50:10.179065	2016-12-06 10:06:05.705111						Light		Messages
59	37	GET	Get Pager Message by ID	t	Public Advanced	NoDoc	2016-05-09 15:50:10.204375	2016-12-06 10:06:17.703836						Light		Messages
60	38	GET	Get Conferencing info	f	Public Advanced	Normal	2016-05-09 15:50:10.214677	2016-12-06 10:06:52.161522	countryId\tstring\tInternal identifier of a country. If not specified, the response is returned for the brand country		ConferencingInfo			Light		Conferencing
61	38	PUT	Update Conferencing info	f	Public Advanced	Normal	2016-05-09 15:50:10.221785	2016-12-06 10:06:58.705799		phoneNumbers\tCollection of Conferencing.Request.PhoneNumber\tMultiple dial-in phone numbers to connect to audio conference service, relevant for user's brand. Each number is given with the country and location information, in order to let the user choose the less expensive way to connect to a conference. The first number in the list is the primary conference number, that is default and domestic\nallowJoinBeforeHost\tboolean\tDetermines if host user allows conference participants to join before the host	ConferencingInfo			Light		Conferencing
62	39	GET	Get Extension Device List	f	Public Advanced	Normal	2016-05-09 15:50:10.23754	2016-12-06 10:07:30.207498			records\tCollection of Device Info\tList of extension devices\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Devices
64	40	POST	Create and Send Fax Message	f	Public Basic	Normal	2016-05-09 15:50:10.258684	2016-12-06 10:07:57.55774		to\tCollection of Caller Info\tRecipient information. Phone number property is mandatory. Optional for resend fax request\r\nfaxResolution\t'High' | 'Low'\tFax resolution\r\nsendTime\tdatetime\tThe datetime to send fax at, in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. If time is not specified, the fax will be send immediately\r\ncoverIndex\tinteger\tOptional. Cover page index. If not specified, the default cover page which is configured in "Outbound Fax Settings" is attached. See also 'Available Cover Pages' table below\r\ncoverPageText\tstring\tOptional. Cover page text, entered by the fax sender and printed on the cover page. Maximum length is limited to 1024 symbols\r\noriginalMessageId\tstring\tInternal identifier of the original fax message which needs to be resent. Mandatory for resend fax request	MessageInfo			Light	Faxes, ReadMessages	Messages
63	40	GET	Get Fax Message List	f	Public Advanced	NoDoc	2016-05-09 15:50:10.249577	2016-12-06 10:08:04.296284						Light		Messages
65	41	GET	Get Fax Message by ID	t	Public Advanced	NoDoc	2016-05-09 15:50:10.268823	2016-12-06 10:08:14.871959						Light		Messages
67	42	POST	Add New Forwarding Number	f	Public Advanced	Normal	2016-05-09 15:50:10.285357	2016-12-06 10:43:28.962493		phoneNumber\tstring\tForwarding/Call flip phone number\nlabel\tstring\tForwarding/Call flip number title	ForwardingNumberInfo			Light		Forwarding Numbers
66	42	GET	Get Forwarding Numbers	f	Public Basic	Normal	2016-05-09 15:50:10.279283	2016-12-06 10:43:35.532306	page\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Forwarding Number Info\tList of forwarding phone numbers\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Forwarding Numbers
68	43	GET	Get Extension Grants	f	Public Advanced	Normal	2016-05-09 15:50:10.296774	2016-12-06 10:44:09.598657	page\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Grant Info\tList of extension grants with the data\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Extension
99	65	POST	Create New Order	f	Public Advanced	Normal	2016-05-09 15:50:10.629051	2016-12-06 12:47:16.307644		devices\tCollection of Device Info\tList of devices to order	devices\tCollection of Device Info\tList of the ordered devices			Light		Ordering
100	66	GET	Get Order by ID	f	Public Advanced	Normal	2016-05-09 15:50:10.639081	2016-12-06 12:47:29.852319			id\tstring\tIdentifier of a device\nuri\tstring\tCanonical URI of an order resource\ndevices\tCollection of Device Info\tList of the ordered devices			Light		Ordering
101	67	GET	Get Payment Method Info	f	Public Advanced	NoDoc	2016-05-09 15:50:10.650495	2016-12-06 12:48:24.971094						Light		Ordering
102	67	PUT	Update Payment Method Info	f	Public Advanced	NoDoc	2016-05-09 15:50:10.659585	2016-12-06 12:48:34.055693						Light		Ordering
130	86	GET	Get Country List	f	Public Basic	Normal	2016-05-09 15:50:10.973665	2016-12-06 12:58:17.19731	loginAllowed\tboolean\tSpecifies whether login with the phone numbers of this country is enabled or not\nnumberSelling\tboolean\tSpecifies if RingCentral sells phone numbers of this country\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Full Country Info\tList of countries with the country data\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Dictionary
148	104	GET	Corporate directory for hardphones	f	Internal	Normal	2016-05-09 15:50:11.202718	2016-12-06 13:07:52.74511						Light		Internal
149	105	POST	Update Device Order	f	Internal	Normal	2016-05-09 15:50:11.216143	2016-12-06 13:08:07.328965						Light		Internal
150	106	POST	VMT Transcription Callback	f	Integration	Normal	2016-05-09 15:50:11.226945	2016-12-06 13:08:23.029674						Light		Internal
151	107	POST	Update LNP Order	f	Internal	Normal	2016-05-09 15:50:11.239185	2016-12-06 13:08:33.654855						Light		Internal
70	45	DELETE	Delete Message by ID	t	Public Basic	Normal	2016-05-09 15:50:10.318929	2016-12-06 10:48:38.800521	purge\tboolean\tIf the value is 'True', then the message is purged immediately with all the attachments. The default value is 'False'\nconversationId\tinteger\tInternal identifier of a message thread					Light		Messages
71	45	GET	Get Message by ID	t	Public Basic	Normal	2016-05-09 15:50:10.327343	2016-12-06 10:48:45.33362			MessageInfo			Light		Messages
72	45	PUT	Update Message by ID	t	Public Basic	Normal	2016-05-09 15:50:10.332991	2016-12-06 10:48:51.977857		readStatus\t'Read' | 'Unread'\tRead status of a message to be changed. Multiple values are accepted	MessageInfo			Light	EditMessages, ReadMessages	Messages
73	46	GET	Get Message Attachment	f	Public Basic	Normal	2016-05-09 15:50:10.343863	2016-12-06 10:49:04.628012			Binary			Light		Messages
75	48	GET	Get Extension Phone Numbers	f	Public Basic	Normal	2016-05-09 15:50:10.369828	2016-12-06 11:40:43.359561	usageType\t'MainCompanyNumber' | 'AdditionalCompanyNumber' | 'CompanyNumber' | 'DirectNumber' | 'CompanyFaxNumber' | 'ForwardedNumber'\tUsage type of the phone number\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Phone Number Info\tList of phone numbers\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Extension
76	49	GET	Get Extension Presence	t	Public Basic	Normal	2016-05-09 15:50:10.382756	2016-12-06 11:41:19.253862			PresenceInfo	1.0.2	Returns presence status of an extension or several extensions by their ID(s).\r\n\r\nThe presenceStatus is returned as Offline (the parameters telephonyStatus, message, userStatus and dndStatus are not returned at all) for the following extension types: Department/Announcement Only/Take Messages Only (Voicemail)/Fax User/Paging Only Group/Shared Lines Group/IVR Menu/Application Extension/Park Location.\r\n\r\nIf the user requests his/her own presence status, the response contains actual presence status even if the status publication is turned off.\r\n\r\nBatch request is supported. For batch requests the number of extensions in one request is limited to 30. If more extensions are included in the request, the error code 400 Bad Request is returned with the logical error code InvalidMultipartRequest and the corresponding message 'Extension Presence Info multipart request is limited to 30 extensions'.	Light	ReadPresence	Presence
77	49	PUT	Update Extension Presence	f	Public Advanced	NoDoc	2016-05-09 15:50:10.389612	2016-12-06 11:41:25.731607						Light		Presence
90	58	POST	Initiate RingOut Call	f	Public Basic	Normal	2016-05-09 15:50:10.524212	2016-12-06 12:43:59.960309		from\tRingOut.Request.From\tPhone number of the caller. This number corresponds to the 1st leg of the RingOut call. This number can be one of user's configured forwarding numbers or arbitrary number\nto\tRingOut.Request.To\tPhone number of the called party. This number corresponds to the 2nd leg of the RingOut call\ncallerId\tRingOut.Request.To\tThe number which will be displayed to the called party\nplayPrompt\tboolean\tThe audio prompt that the calling party hears when the call is connected\ncountry\tRingOut.Request.Country Info\tOptional. Dialing plan country data. If not specified, then extension home country is applied by default	RingOutInfo	1.0.7 (Release 5.16)	Makes a 2-leg RingOut call.	Heavy	RingOut	RingOut
93	60	POST	Initiate Direct RingOut Call	f	Public Internal	Normal	2016-05-09 15:50:10.561612	2016-12-06 12:44:19.355803						Light		RingOut
95	61	POST	Create and Send SMS Message	f	Public Basic	Normal	2016-05-09 15:50:10.577664	2016-12-06 12:44:53.365068		from\tCaller Info\tSender of an SMS message. The phoneNumber property must be filled to correspond to one of the account phone numbers which is allowed to send SMS\nto\tCollection of Caller Info\tReceiver of an SMS message. The phoneNumber property must be filled\ntext\tstring\tText of a message. Max length is 1000 symbols (2-byte UTF-16 encoded). If a character is encoded in 4 bytes in UTF-16 it is treated as 2 characters, thus restricting the maximum message length to 500 symbols	MessageInfo	1.0.2	Creates and sends new SMS message. Sending SMS messages simultaneously to different recipients is limited up to 50 requests per minute; relevant for all client applications.	Medium	SMS, ReadMessages	Messages
94	61	GET	Get SMS Message List	f	Public Advanced	NoDoc	2016-05-09 15:50:10.571906	2016-12-06 12:45:04.11067						Light		Messages
96	62	GET	Get SMS Message by ID	t	Public Advanced	NoDoc	2016-05-09 15:50:10.589404	2016-12-06 12:46:06.107067						Light		Messages
91	59	DELETE	Cancel RingOut Call	f	Public Basic	Normal	2016-05-09 15:50:10.536615	2016-12-06 12:46:28.389876						Light		RingOut
92	59	GET	Get RingOut Call Status	f	Public Basic	Normal	2016-05-09 15:50:10.547261	2016-12-06 12:46:43.513702			RingOutInfo			Light		RingOut
104	68	POST	Create New Phone Number	f	Public Internal	Normal	2016-05-09 15:50:10.677392	2016-12-06 12:49:04.122177						Light		Account
105	69	DELETE	Delete  Phone Number by ID	f	Public Internal	Normal	2016-05-09 15:50:10.688952	2016-12-06 12:49:38.302587						Light		Account
106	69	GET	Get Phone Number by ID	f	Public Basic	Normal	2016-05-09 15:50:10.696518	2016-12-06 12:49:45.054572			PhoneNumberInfo			Light		Account
107	69	PUT	Update Phone Number by ID	f	Public Internal	Normal	2016-05-09 15:50:10.702291	2016-12-06 12:49:54.037658						Light		Account
108	70	GET	Get Account Presence	f	Public Internal	Deprecated	2016-05-09 15:50:10.715124	2016-12-06 12:50:23.307879						Light		Presence
110	72	GET	Get Call Recording Content	f	Public Basic	Normal	2016-05-09 15:50:10.742079	2016-12-06 12:51:23.489919			Binary			Light		Call Log
112	73	POST	Create User Group	f	Public Internal	Normal	2016-05-09 15:50:10.761019	2016-12-06 12:52:40.631076						Light		Account
111	73	GET	Get User Group List	f	Public Internal	Normal	2016-05-09 15:50:10.752192	2016-12-06 12:52:46.151171						Light		Account
117	76	POST	Bulk Assignment of User Group Members	f	Public Internal	Normal	2016-05-09 15:50:10.814282	2016-12-06 12:53:36.841845						Light		Account
114	74	DELETE	Delete User Group by ID	f	Public Internal	Normal	2016-05-09 15:50:10.780658	2016-12-06 12:53:51.442238						Light		Account
113	74	GET	Get User Group by ID	f	Public Internal	Normal	2016-05-09 15:50:10.771927	2016-12-06 12:53:57.286709						Light		Account
115	74	PUT	Update User Group by ID	f	Public Internal	Normal	2016-05-09 15:50:10.787644	2016-12-06 12:54:04.199656						Light		Account
116	75	GET	Get User Group Members	f	Public Internal	Normal	2016-05-09 15:50:10.800106	2016-12-06 12:54:20.647261						Light		Account
118	77	GET	Get Account User Roles	f	Public Internal	Normal	2016-05-09 15:50:10.82844	2016-12-06 12:54:51.438755						Light		Account
119	78	POST	Initiate Verification Call	f	Public Internal	Normal	2016-05-09 15:50:10.84332	2016-12-06 12:55:18.925982						Light		Account
120	79	DELETE	Cancel Verification Call	f	Public Internal	Normal	2016-05-09 15:50:10.856657	2016-12-06 12:55:34.064859						Light		Account
121	79	GET	Get Verification Call Status	f	Public Internal	Normal	2016-05-09 15:50:10.86885	2016-12-06 12:55:41.143851						Light		Account
122	79	PUT	Validate Verification Code	f	Public Internal	Normal	2016-05-09 15:50:10.877701	2016-12-06 12:55:46.379153						Light		Account
124	81	GET	Get Client Info	f	Public Internal	Normal	2016-05-09 15:50:10.910046	2016-12-06 12:56:23.434192				1.0.11 (Release 6.3)	Returns client application data: general info, specific provisioning parameters, hints, etc.	Light	ReadClientInfo	Client Application
125	82	GET	Get Custom Data by Key	f	Public Advanced	NoDoc	2016-05-09 15:50:10.922054	2016-12-06 12:56:52.199078						Light		Client Application
127	83	POST	Provision SIP Client	f	Public Internal	Normal	2016-05-09 15:50:10.93901	2016-12-06 12:57:31.680529						Light		Client Application
128	84	GET	Get Special Number Rules	f	Public Internal	Normal	2016-05-09 15:50:10.949935	2016-12-06 12:57:45.109455						Light		Client Application
129	85	GET	Get Brand by ID	f	Public Advanced	NoDoc	2016-05-09 15:50:10.963353	2016-12-06 12:58:05.694						Light		Dictionary
131	87	GET	Get Country by ID	f	Public Basic	Normal	2016-05-09 15:50:10.984937	2016-12-06 13:00:51.594273			FullCountryInfo			Light		Dictionary
132	88	GET	Get Devices Dictionary	f	Public Internal	Normal	2016-05-09 15:50:10.998019	2016-12-06 13:01:17.334954						Light		Dictionary
133	89	GET	Get Emergency Address Form Parameters	f	Public Internal	Normal	2016-05-09 15:50:11.012294	2016-12-06 13:01:31.570107						Light		Dictionary
134	90	GET	Get Supported Language List	f	Public Basic	Normal	2016-05-09 15:50:11.021895	2016-12-06 13:01:44.753985			records\tCollection of Language Info\tLanguage data\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Dictionary
135	91	GET	Get Language by ID	f	Public Basic	Normal	2016-05-09 15:50:11.032048	2016-12-06 13:02:11.035081			LanguageInfo			Light		Dictionary
136	92	GET	Get Location List	f	Public Basic	Normal	2016-05-09 15:50:11.044925	2016-12-06 13:02:27.341195	orderBy\t'Npa' | 'City'\tSorts results by the specified property. The default value is 'City'\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'.\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default.\nstateId\tstring\tInternal identifier of a state\nwithNxx\tboolean\tSpecifies if nxx codes are returned		records\tCollection of Location Info\tList of locations\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Dictionary
137	93	GET	Get Permission List	f	Public Internal	Normal	2016-05-09 15:50:11.058418	2016-12-06 13:02:47.281519						Light		Dictionary
138	94	GET	Get Permission Category List	f	Public Internal	Normal	2016-05-09 15:50:11.072256	2016-12-06 13:03:49.385993						Light		Dictionary
139	95	GET	Get Secret Question List	f	Public Internal	Normal	2016-05-09 15:50:11.083602	2016-12-06 13:04:06.823656						Light		Dictionary
140	96	GET	Get Secret Question by ID	f	Public Internal	Normal	2016-05-09 15:50:11.094047	2016-12-06 13:04:22.224498						Light		Dictionary
141	97	GET	Get Service Plan by ID	f	Public Advanced	NoDoc	2016-05-09 15:50:11.113139	2016-12-06 13:05:12.742099						Light		Dictionary
142	98	GET	Get Shipping Options	f	Public Internal	Normal	2016-05-09 15:50:11.125469	2016-12-06 13:05:31.782754						Light		Dictionary
144	100	GET	Get State/Province by ID	f	Public Basic	Normal	2016-05-09 15:50:11.150127	2016-12-06 13:05:57.485127			StateInfo			Light		Dictionary
145	101	GET	Get Time Zone List	f	Public Basic	Normal	2016-05-09 15:50:11.163355	2016-12-06 13:06:09.315644	page\tstring\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tstring\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Timezone Info\tList of timezones\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Dictionary
146	102	GET	Get Time Zone by ID	f	Public Basic	Normal	2016-05-09 15:50:11.176173	2016-12-06 13:06:20.697714			TimezoneInfo			Light		Dictionary
147	103	GET	Get Role List	f	Public Internal	Normal	2016-05-09 15:50:11.190882	2016-12-06 13:06:56.094702						Light		Dictionary
152	108	GET	Get Application Info	f	Internal	Normal	2016-05-09 15:50:11.254538	2016-12-06 13:08:44.485181						Light		Internal
153	109	GET	Get Application Sessions	f	Internal	Normal	2016-05-09 15:50:11.265789	2016-12-06 13:08:54.457981						Light		Internal
154	110	POST	Generate Authorization Code	f	Internal	Normal	2016-05-09 15:50:11.278407	2016-12-06 13:09:04.611765						Light		Internal
155	111	GET	Get Internal Presence	f	Internal	Normal	2016-05-09 15:50:11.28959	2016-12-06 13:09:15.331649						Light		Internal
173	125	POST	LoginHash Authorization	f	Public Internal	Deprecated	2016-05-09 15:50:11.522637	2016-12-06 09:24:15.873732						Light		Authorization
183	136	GET	Get Meeting	f	Public Advanced	Normal	2016-07-15 07:33:28.837384	2016-12-06 10:46:20.041279			MeetingInfo	1.0.25 (Release 8.1)	Returns a particular meetings details.	Light	Meetings	Meetings
156	111	PUT	Update Internal Presence	f	Internal	Normal	2016-05-09 15:50:11.295882	2016-12-06 13:09:20.559635						Light		Internal
157	112	POST	Poll Rendering Queue	f	Internal	Normal	2016-05-09 15:50:11.308074	2016-12-06 13:09:34.978418						Light		Internal
158	113	POST	Save Rendering Result	f	Internal	Normal	2016-05-09 15:50:11.326227	2016-12-06 13:09:44.679624						Light		Internal
159	114	POST	Touch Rendering Queue (Keep-Alive)	f	Internal	Normal	2016-05-09 15:50:11.338982	2016-12-06 13:09:56.139125						Light		Internal
160	115	POST	Internal Email Sending	f	Internal	Normal	2016-05-09 15:50:11.351819	2016-12-06 13:10:06.792971						Light		Internal
161	116	POST	Send internal SMS	f	Internal	Normal	2016-05-09 15:50:11.368388	2016-12-06 13:10:16.439818						Light		Internal
162	117	GET	Get Service Parameter Value	f	Internal	Normal	2016-05-09 15:50:11.384414	2016-12-06 13:10:28.034646						Light		Internal
163	117	PUT	Update Service Parameter Value	f	Internal	Normal	2016-05-09 15:50:11.394161	2016-12-06 13:10:35.73051						Light		Internal
164	118	POST	Generate Authorization Code	f	Public Internal	Normal	2016-05-09 15:50:11.407365	2016-12-06 13:13:39.978778						Light		Interop
166	120	GET	Get Number Parser Configuration	f	Public Internal	Normal	2016-05-09 15:50:11.43925	2016-12-06 13:14:13.228561						Light		Phone Number Parser
167	121	POST	Look up Phone Number	f	Public Advanced	Normal	2016-05-09 15:50:11.451182	2016-12-06 13:14:35.984276	areaCode\tinteger\tArea code of the location\ncountryCode\tstring\tTwo-letter country code, complying with the ISO standard\ncountryId\tstring\tInternal identifier of a country; '1'- the US; '39' - Canada; '224' - the UK. The default value is '1'\nexclude\tstring\tA string of digits (one and more) that should not appear among the last four digits (line part) of the phone numbers that will be returned. It is possible to specify several exclude parameters. If specified, it is taken into account in all returned phone numbers both in the phone numbers satisfying to parameters of lookup and in alternative phone numbers (in case when extendedSearch is specified)\nextendedSearch\tboolean\tIf the value is 'False', then the returned numbers exactly correspond to the specified NXX, NPA and LINE or countryCode, areaCode and numberPattern parameters. If the value is 'True', then the resulting numbers are ranked and returned with the rank attribute values (1-10). The default value is 'False'\nline\tstring\tLINE pattern for vanity or wildcard search. Digits, Latin characters and asterisks are allowed (usually 4 characters)\nnumberPattern\tstring\tPhone number pattern (for wildcard or vanity search). For NANP countries (US, Canada) is concatenation of nxx (the first three digits) and line. If the first three characters are specified as not digits (e.g. 5** or CAT) then parameter extendedSearch will be ignored.\nnxx\tstring\tNXX pattern for vanity or wildcard search. Digits, Latin characters and asterisks are allowed (usually 3 characters)\nnpa\tstring\tArea code (mandatory). For example, 800, 844, 855, 866, 877, 888 for North America; and 647 for Canada\npaymentType\t'TollFree' | 'Local'\tPayment type. Default is 'Local' (it should correlate with the npa provided)\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '10' by default\nsmsEnabled\tboolean\tSpecifies if SMS activation is available for the number. If specified, it is taken into account in all returned phone numbers both in the phone numbers satisfying to parameters of lookup and in alternative phone numbers (in case when extendedSearch is specified). If not specified, the value is null.		uri\tstring\tCanonical URI of the phone numbers resource\nrecords\tCollection of LookUpPhoneNumber.PhoneNumberInfo\tList of phone numbers filtered by the specified criteria	1.0.10 (Release 6.2)	Returns the required numbers filtered by criteria.	Medium	NumberLookup	Phone Number Pool
168	122	POST	Reserve Phone Number	f	Public Advanced	Normal	2016-05-09 15:50:11.465948	2016-12-06 13:14:48.016683		records\tCollection of ReservePhoneNumber.Request.ReserveRecord\tPhone numbers to be reserved/un-reserved	records\tCollection of ReservePhoneNumber.Response.ReserveRecord\tPhone numbers to be reserved/un-reserved			Light		Phone Number Pool
169	123	POST	Create New Subscription	f	Public Basic	Normal	2016-05-09 15:50:11.478334	2016-12-06 13:15:11.401404		eventFilters\tCollection of string\tMandatory. Collection of URIs to API resources (see Event Types for details). For APNS transport type only message event filter is available\ndeliveryMode\tSubscription.Request.DeliveryMode\tNotification delivery settings	SubscriptionInfo			Light		Push Notifications
170	124	DELETE	Cancel Subscription by ID	f	Public Basic	Normal	2016-05-09 15:50:11.490184	2016-12-06 13:15:20.80256						Light		Push Notifications
171	124	GET	Get Subscription by ID	f	Public Basic	Normal	2016-05-09 15:50:11.504789	2016-12-06 13:15:26.756797			SubscriptionInfo			Light		Push Notifications
172	124	PUT	Update/Renew Subscription by ID	f	Public Basic	Normal	2016-05-09 15:50:11.512405	2016-12-06 13:15:32.974499		eventFilters\tCollection of string\tCollection of URIs to API resources (see Event Types). Mandatory field	SubscriptionInfo			Light		Push Notifications
175	127	POST	OAuth2 Revoke Token	f	Public Basic	Normal	2016-05-09 15:50:11.545514	2016-12-06 09:24:57.51547		token\tstring\tActive access or refresh token to be revoked				Light		Authorization
188	139	GET	Get Answering Rules List	f	Public Advanced	Normal	2016-09-23 08:14:01.692671	2016-12-06 09:58:35.193268			uri\tstring\tCanonical URI of an answering rule resource\r\nrecords\tCollection of Answering Rule Info\tList of answering rules\r\npaging\tPaging Info\tInformation on paging\r\nnavigation\tNavigation Info\tInformation on navigation	1.0.15 (Release 7.0)	Returns the extension answering rules.	Light	ReadAccounts	Answering Rules
191	24	DELETE	Delete Answering Rule by ID	f	Public Advanced	Normal	2016-09-23 09:20:51.133608	2016-12-06 09:59:34.586902				1.0.25 (Release 8.1)	Deletes a custom answering rule by a particular ID.	Medium	EditExtensions	Answering Rules
190	24	PUT	Update Answering Rule by ID	f	Public Advanced	Normal	2016-09-23 09:13:19.343634	2016-12-06 09:59:49.203786		enabled\tboolean\tSpecifies if the answering rule is active or not\r\nname\tstring\tCustom name of an answering rule. The maximum number of characters is 64\r\nforwarding\tForwarding Info\tForwarding parameters. Returned if 'ForwardCalls' is specified in 'callHandlingAction'. These settings determine the forwarding numbers to which the call will be forwarded\r\ngreetings\tCollection of Greeting Info\tPredefined greetings applied for an answering rule	AnsweringRuleInfo	1.0.24 (Release 8.0)	Updates a custom answering rule for a particular caller ID.	Medium	EditExtensions	Answering Rules
192	140	POST	Create Custom Greeting	f	Public Advanced	Normal	2016-09-23 09:35:53.37811	2016-12-06 10:44:50.505979		type\t'Introductory' | 'Announcement' | 'ConnectingMessage' | 'ConnectingAudio' | 'Voicemail' | 'Unavailable'\tType of a greeting, specifying the case when the greeting is played. See also Greeting Types\r\nansweringRule\tCustomGreetingInfo.AnsweringRuleInfo\tInformation on an answering rule that the greeting is applied to	CustomGreetingInfo	1.0.26 (Release 8.2)	Creates extension user custom greeting.	Heavy	EditExtensions	Answering Rules
193	141	GET	Get Custom Greeting by ID	f	Public Advanced	Normal	2016-09-23 10:40:10.119247	2016-12-06 10:45:08.314222			CustomGreetingInfo	1.0.26 (Release 8.2)	Returns a custom greeting by ID.	Medium		Answering Rules
182	133	POST	Create Meeting	f	Public Advanced	Normal	2016-06-22 03:22:18.034211	2016-12-06 10:45:37.305402		topic\tstring\tTopic of a meeting\nmeetingType\t'Scheduled' | 'Instant' | 'Recurring'\tType of a meeting. 'Instant' - meeting that is instantly started as soon as the host creates it; 'Scheduled' - common scheduled meeting; 'Recurring' - a recurring meeting. If the specified meeting type is 'Scheduled' then schedule property is mandatory for request\npassword\tstring\tPassword required to join a meeting. Max number of characters is 10\nschedule\tMeeting Schedule Info\tSchedule of a meeting\nallowJoinBeforeHost\tboolean\tIf 'True' then the meeting can be joined and started by any participant (not host only). Supported for the meetings of 'Scheduled' and 'Recurring' type.\nstartHostVideo\tboolean\tEnables starting video when host joins the meeting\nstartParticipantsVideo\tboolean\tEnables starting video when participants join the meeting\naudioOptions\tCollection of strings\tMeeting audio options. Possible values are 'Phone', 'ComputerAudio'	MeetingInfo	1.0.25 (Release 8.1)	Creates a new meeting.	Medium	Meetings	Meetings
181	133	GET	Get Meetings List	f	Public Advanced	Normal	2016-06-22 03:05:29.049938	2016-12-06 10:45:43.355813			uri\tstring\tCanonical URI of meetings resource\nrecords\tCollection of Meeting Info\tList of extension meetings\npaging\tPaging Info\tInformation on paging\nnavigation\tNavigation Info\tInformation on navigation	1.0.25 (Release 8.1)	Returns a list of meetings for a particular extension.\r\n\r\n::: info\r\nThe list of meetings does not include messages of 'Instant' type.\r\n:::	Light	Meetings	Meetings
187	138	GET	Get Meeting Service Info	f	Public Advanced	Normal	2016-07-15 07:56:17.586513	2016-12-06 10:45:58.109317			MeetingServiceInfo	1.0.25 (Release 8.1)	Returns information that includes dial-in numbers for Zoom meetings, support and international dial in numbers URIs as well as meeting account information.	Light	Meetings	Meetings
185	136	DELETE	Delete Meeting	f	Public Advanced	Normal	2016-07-15 07:43:05.55845	2016-12-06 10:46:13.438486				1.0.25 (Release 8.1)	Deletes a scheduled meeting.	Medium	Meetings	Meetings
186	137	POST	End Current Meeting	f	Public Advanced	Normal	2016-07-15 07:53:03.677125	2016-12-06 10:46:42.020385				1.0.25 (Release 8.1)	Ends a meetings which is in progress.	Medium	Meetings	Meetings
179	131	GET	Get Scaled Profile Image	f	Public Advanced	Normal	2016-05-13 01:47:54.194329	2016-12-06 12:42:25.370646			Binary			Light		Extension
177	129	GET	Inbound SMS Notification	f	Integration	NoDoc	2016-05-09 15:50:11.569586	2016-12-06 13:16:12.109991						Light		Webhook
178	130	GET	SMS Delivery Receipt	f	Integration	NoDoc	2016-05-09 15:50:11.582226	2016-12-06 13:16:22.528215						Light		Webhook
1	1	GET	Get Server Info	f	Public Basic	Normal	2016-05-09 15:50:09.566651	2016-12-06 09:15:11.658363			ServerInfo	1.0.0	Returns current API version(s) and server info.	Light		API Versions
174	126	POST	OAuth2 Authorize	f	Public Basic	Normal	2016-05-09 15:50:11.533737	2016-12-06 09:24:41.933371		response_type\tstring\tMust be set to code\nclient_id\tstring\tRequired. Enter your application key (Production or Sandbox) here\nredirect_uri\tstring\tRequired. This is a callback URI which determines where the response will be sent to. The value of this parameter must exactly match one of the URIs you have provided for your app upon registration. This URI can be HTTP/HTTPS address for web applications or custom scheme URI for mobile or desktop applications.\nstate\tstring\tOptional, recommended. An opaque value used by the client to maintain state between the request and callback. The authorization server includes this value when redirecting the user-agent back to the client. The parameter should be used for preventing cross-site request forgery	code\tstring\tThe authorization code returned for your application\nexpires_in\tinteger\tThe remaining lifetime of the authorization code\nstate\tstring\tThis parameter will be included in response if it was specified in the client authorization request. The value will be copied from the one received from the client			Light		Authorization
109	71	GET	Get Call Recording Metadata	f	Public Basic	Normal	2016-05-09 15:50:10.729354	2016-12-06 12:51:07.412204			id\tstring\tInternal identifier of the call recording\r\ncontentUri\tstring\tLink to the call recording binary content\r\ncontentType\tstring\tCall recording file format. Supported format is audio/x-wav\r\nduration\tinteger\tRecorded call duration	1.0.18	Returns call recording metadata.	Heavy	ReadCallRecording, ReadCallLog	Call Log
126	82	PUT	Update Custom Data by Key	f	Public Advanced	Normal	2016-05-09 15:50:10.928913	2016-12-06 12:56:59.094012		id\tstring\tCustom data access key. Optional. If specified, must match the custom key in the URL\nvalue\tstring\tDescription of custom data. Mandatory for create, if there is no attachment specified. Maximum length is limited to 256 symbols	id\tstring\tCustom data access key\nuri\tstring\tLink to the custom data\nvalue\tstring\tDescription of custom data\nlastModifiedTime\tstring\tTime of the last change in custom data\nattachment\tAttachment Info\tAttachment data: link and type			Light	EditCustomData	Client Application
143	99	GET	Get State/Province List	f	Public Basic	Normal	2016-05-09 15:50:11.137853	2016-12-06 13:05:42.403194	countryId\tinteger\tInternal identifier of a country\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'.\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default\nwithPhoneNumbers\tboolean\tIf 'True', the list of states with phone numbers available for buying is returned. The default value is 'False'		records\tCollection of State Info\tList of states\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Dictionary
165	119	POST	Parse Phone Number	f	Public Advanced	Normal	2016-05-09 15:50:11.421575	2016-12-06 13:14:02.628028	homeCountry\tstring\tInternal identifier of a home country. The default value is ISO code (ISO 3166) of the user's home country or brand country, if the user is undefined\nnationalAsPriority\tboolean\tThe default value is "False". If "True", the numbers that are closer to the home country are given higher priority	originalStrings\tCollection of string\tPhone numbers passed in a string. The maximum value of phone numbers is limited to 64. The maximum number of symbols in each phone number in a string is 64	uri\tstring\tCanonical URI of a resource\nhomeCountry\tCollection of ParsePhoneNumber.CountryInfo\tInformation on a user home country\nphoneNumbers\tCollection of ParsePhoneNumber.PhoneNumberInfo\tParsed phone numbers data\noriginalString\tstring\tOne of the numbers to be parsed, passed as a string in response\nareaCode\tstring\tArea code of the location (3-digit usually), according to the NANP number format, that can be summarized as NPA-NXX-xxxx and covers Canada, the United States, parts of the Caribbean Sea, and some Atlantic and Pacific islands. See North American Numbering Plan for details\nformattedNational\tstring\tDomestic format of a phone number\nformattedInternational\tstring\tInternational format of a phone number\ndialable\tstring\tDialing format of a phone number\ne164\tstring\tE.164 (11-digits) format of a phone number\nspecial\tboolean\t"True" if the number is in a special format (for example N11 code)\nnormalized\tstring\tE.164 (11-digits) format of a phone number without the plus sign ('+')\ncountry\tCollection of ParsePhoneNumber.CountryInfo\tInformation on a country the phone number belongs to			Light		Phone Number Parser
194	123	GET	Get Subscription List	f	Public Basic	Normal	2016-12-23 06:57:54.724238	2016-12-23 07:00:06.129661			uri\tstring\tCanonical URI of a subscription resource\r\nrecords\tCollection of Subscription Info\tList of subscriptions for the current user and application	1.0.24 (Release 8.0)	Returns a list of subscriptions created by a particular user on a particular client app.	Light		Push Notifications
176	128	POST	OAuth2 Get Token	f	Public Basic	Normal	2016-05-09 15:50:11.55854	2016-12-06 09:28:17.556515		grant_type\tstring\tMust hold password value for Resource Owner Credentials flow. If client application is not authorized by the specified grant_type, response does not contain refresh_token and refresh_token_ttl attributes\naccess_token_ttl\tinteger\tOptional. Access token lifetime in seconds; the possible values are from 600 sec (10 min) to 3600 sec (1 hour). The default value is 3600 sec. If the value specified exceeds the default one, the default value is set. If the value specified is less than 600 seconds, the minimum value (600 sec) is set\nrefresh_token_ttl\tinteger\tOptional. Refresh token lifetime in seconds. The default value depends on the client application, but as usual it equals to 7 days. If the value specified exceeds the default one, the default value is applied. If client specifies refresh_token_ttl<=0, refresh token is not returned even if the corresponding grant type is supported\nusername\tstring\tPhone number linked to account or extension in account in E.164 format with or without leading "+" sign\nextension\tstring\tOptional. Extension short number. If company number is specified as a username, and extension is not specified, the server will attempt to authenticate client as main company administrator\npassword\tstring\tUser's password\nscope\tstring\tOptional. List of API permissions to be used with access token (see Application Permissions). Can be omitted when requesting all permissions defined during the application registration phase\nendpoint_id\tstring\tOptional. Unique identifier of a client application. You can pass it in request according to pattern [a-zA-Z0-9_\\-]{1,64}. Otherwise it is auto-generated by server. The value will be returned in response in both cases	TokenInfo			Light		Authorization
3	3	POST	Create Account	f	Public Internal	Normal	2016-05-09 15:50:09.592148	2016-12-06 09:28:53.600792		mainNumber\tstring\tMain account VoIP phone number, either Local or Toll-Free. Cannot be Fax Only. Obtained via lookup/reserve API\r\noperator\tExtension Info\tOperator's extension information. This extension will receive all calls and messages intended for the operator\r\npartnerId\tstring\tPartner identifier for this account\r\npromotionCode\tstring\tPromotion code to calculate a discount\r\nreservationId\tstring\tInternal identifier of phone number reservation; encoded data including reservation type (by brand, by account, by session), particular brand/account/session data, and reservation date and time\r\nserviceInfo\tAccount.ServiceInfo\tAccount service information, brand identifier and service plan\r\nstatus\t'Initial' | 'Unconfirmed' | 'Confirmed'\tThe status with which an account is created. The default value is 'Initial'	AccountInfo	1.0.10 (Release 6.2)	Creates the account in Initial state.	Medium	Accounts, EditAccounts, ReadAccounts, EditExtensions	Account
123	80	POST	Validate Account Creation Request	f	Public Internal	Normal	2016-05-09 15:50:10.890034	2016-12-06 09:29:35.19975						Light		Account
21	15	GET	Get Extension List	f	Public Basic	Normal	2016-05-09 15:50:09.800917	2016-12-06 09:52:18.985943	page\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default.\nstatus\t'Enabled' | 'Disabled' | 'NotActivated' | 'Unassigned'\tExtension current state. Multiple values are supported. If 'Unassigned' is specified, then extensions without extensionNumber are returned. If not specified, then all extensions are returned\ntype\t'User' | 'FaxUser' | 'VirtualUser' | 'DigitalUser' | 'Department' | 'Announcement' | 'Voicemail' | 'SharedLinesGroup' | 'PagingOnlyGroup' | 'IvrMenu' | 'ApplicationExtension' | 'ParkLocation'\tExtension type. Multiple values are supported		records\tCollection of Extension Info\tList of extensions with extension information\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Extension
52	33	DELETE	Delete Extension Call Log	f	Public Advanced	Normal	2016-05-09 15:50:10.128106	2016-12-06 10:04:45.473313	dateTo\tdatetime\tThe end datetime for records deletion in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time					Light	EditCallLog, ReadCallLog	Call Log
97	63	POST	Provision unassigned users	f	Public Internal	Normal	2016-05-09 15:50:10.601055	2016-12-06 09:53:27.059334						Light		Extension
98	64	POST	Validate Extension Creation Request	f	Public Internal	Normal	2016-05-09 15:50:10.616382	2016-12-06 09:53:44.776519						Light		Extension
25	16	PUT	Update Extension by ID	f	Public Advanced	Normal	2016-05-09 15:50:09.840228	2016-12-06 09:54:14.651185		ExtensionInfo.Request.StatusInfo\nExtensionInfo.Request.ContactInfo\nExtensionInfo.Request.PasswordPIN\nExtensionInfo.Request.PartnerId\nExtensionInfo.Request.Provision	ExtensionInfo	1.0.10 (Release 6.2)	Modifies extension(s) by extension ID(s).\r\n\r\n1. Updates the extension data:\r\n\r\n    - status info\r\n    - contact info\r\n    - password/PIN\r\n    - partnerId\r\n\r\n2. Provisions unassigned extensions	Medium	EditExtensions	Extension
27	18	GET	Get Extension Active (Recent) Calls	f	Public Basic	Normal	2016-05-09 15:50:09.868913	2016-12-06 09:54:49.439382	direction\t'Inbound' | 'Outbound'\tThe direction for the result records. It is allowed to specify more than one direction. If not specified, both inbound and outbound records are returned. Multiple values are accepted\ntype\t'Voice' | 'Fax'\tCall type of a record. It is allowed to specify more than one type. If not specified, all call types are returned. Multiple values are accepted\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		records\tCollection of Call Log Record\tList of call log records\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Call Log
189	139	POST	Create Custom Answering Rule	f	Public Advanced	Normal	2016-09-23 08:23:58.785449	2016-12-06 09:58:26.320356		enabled\tboolean\tSpecifies if the rule is active or inactive. The default value is 'True'\r\ntype\tstring\tType of an answering rule, the supported value is 'Custom'\r\nname\tstring\tName of an answering rule specified by user. Max number of symbols is 30\r\ncallers\tCollection of Callers Info\tAnswering rule will be applied when calls are received from the specified caller(s)\r\ncalledNumbers\tCollection of Called Number Info\tAnswering rule will be applied when calling the specified number(s)\r\nschedule\tAnsweringRule.ScheduleInfo\tSchedule when an answering rule should be applied\r\ncallHandlingAction\t'ForwardCalls' | 'UnconditionalForwarding'\tSpecifies how incoming calls should be forwarded. The default value is 'ForwardCalls'\r\nforwarding\tForwarding Info\tForwarding parameters. If the 'callHandlingAction' parameter value is set to 'ForwardCalls' - should be specified . The settings determine the forwarding numbers to which the call should be forwarded. If not specified in request, then the business-hours forwarding rules are set by default\r\nunconditionalForwarding\tUnconditional Forwarding Info\tUnconditional forwarding parameters. If the 'callHandlingAction' parameter value is set to 'UnconditionalForwarding' - should be specified\r\nvoiceMail\tVoicemail Info\tSpecifies whether to take a voicemail and who should do it	AnsweringRuleInfo	1.0.24 (Release 8.0)	Creates a custom answering rule for a particular caller ID.	Medium	EditExtensions	Answering Rules
53	33	GET	Get Extension Call Log	f	Public Basic	Normal	2016-05-09 15:50:10.134086	2016-12-06 10:04:51.795055	extensionNumber\tstring\tExtension number of a user. If specified, returns call log for a particular extension only. Cannot be specified together with the phoneNumber filter\nphoneNumber\tstring\tPhone number of a caller/call recipient. If specified, returns all calls (both incoming and outcoming) with the mentioned phone number. Cannot be specified together with the extensionNumber filter\ndirection\t'Inbound' | 'Outbound'\tThe direction for the result records. It is allowed to specify more than one direction. If not specified, both inbound and outbound records are returned. Multiple values are accepted\ntype\t'Voice' | 'Fax'\tCall type of a record. It is allowed to specify more than one type. If not specified, all call types are returned. Multiple values are accepted\nview\t'Simple' | 'Detailed'\tThe default value is 'Simple' for both account and extension call log\nwithRecording\tboolean\t'True' if only recorded calls have to be returned\ndateTo\tdatetime\tThe end datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time\ndateFrom\tdatetime\tThe start datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is dateTo minus 24 hours\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default		uri\tstring\tCanonical URI\r\nrecords\tCollection of Call Log Record\tList of call log records\r\nnavigation\tNavigation Info\tInformation on navigation\r\npaging\tPaging Info\tInformation on paging			Light		Call Log
54	34	GET	Call Log Synchronization	f	Public Advanced	Normal	2016-05-09 15:50:10.146981	2016-12-06 10:05:05.734082	syncType\t'FSync' | 'ISync'\tType of synchronization. 'FSync' is a default value\nsyncToken\tstring\tValue of syncToken property of last sync request response\ndateFrom\tdatetime\tThe start datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is the current moment\nrecordCount\tinteger\tFor FSync the parameter is mandatory, it limits the number of records to be returned in response. For ISync it specifies with how many records to extend sync Frame to the past, the maximum number of records is 250\nstatusGroup\t'Missed' | 'All'\tType of calls to be returned. The default value is 'All'		records\tCollection of Call Log Record\tList of call log records with synchronization information. For ISync the total number of returned records is limited to 250; this includes both new records and the old ones, specified by the recordCount parameter\nsyncInfo\tSync Info\tSync type, token and time			Light		Call Log
184	136	PUT	Update Meeting	f	Public Advanced	Normal	2016-07-15 07:37:38.455479	2016-12-06 10:46:26.716583		topic\tstring\tTopic of a meeting\r\nmeetingType\t'Scheduled' | 'Instant' | 'Recurring'\tType of a meeting. 'Instant' - meeting that is instantly started as soon as the host creates it; 'Scheduled' - common scheduled meeting; 'Recurring' - a recurring meeting. If the specified meeting type is 'Scheduled' then schedule property is mandatory for request\r\npassword\tstring\tPassword required to join a meeting. Max number of characters is 10\r\nschedule\tMeeting Schedule Info\tSchedule of a meeting\r\nallowJoinBeforeHost\tboolean\tIf 'True' then the meeting can be joined and started by any participant (not host only). Supported for the meetings of 'Scheduled' and 'Recurring' type.\r\nstartHostVideo\tboolean\tEnables starting video when host joins the meeting\r\nstartParticipantsVideo\tboolean\tEnables starting video when participants join the meeting\r\naudioOptions\tCollection of strings\tMeeting audio options. Possible values are 'Phone', 'ComputerAudio'	MeetingInfo	1.0.25 (Release 8.1)	Modifies a particular meetings.	Medium	Meetings	Meetings
69	44	GET	Get Message List	f	Public Basic	Normal	2016-05-09 15:50:10.308899	2016-12-06 10:47:20.552185	availability\t'Alive' | 'Deleted' | 'Purged'\tSpecifies the availability status for the resulting messages. Default value is 'Alive'. Multiple values are accepted\nconversationId\tinteger\tSpecifies the conversation identifier for the resulting messages\ndateFrom\tdatetime\tThe start datetime for resulting messages in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is dateTo minus 24 hours\ndateTo\tdatetime\tThe end datetime for resulting messages in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time\ndirection\t'Inbound' | 'Outbound'\tThe direction for the resulting messages. If not specified, both inbound and outbound messages are returned. Multiple values are accepted\ndistinctConversations\tboolean\tIf 'True', then the latest messages per every conversation ID are returned\nmessageType\t'Fax' | 'SMS' | 'VoiceMail' | 'Pager' | 'Text'\tThe type of the resulting messages. If not specified, all messages without message type filtering are returned. Multiple values are accepted\nreadStatus\t'Read' | 'Unread'\tThe read status for the resulting messages. Multiple values are accepted\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default\nphoneNumber\tstring\tThe phone number. If specified, messages are returned for this particular phone number only		records\tCollection of Message Info\tList of records with message information\nnavigation\tNavigation Info\tInformation on navigation\npaging\tPaging Info\tInformation on paging			Light		Messages
74	47	GET	Message Synchronization	f	Public Advanced	Normal	2016-05-09 15:50:10.356911	2016-12-06 10:49:41.273791	conversationId\tinteger\tConversation identifier for the resulting messages. Meaningful for SMS and Pager messages only.\ndateFrom\tdatetime\tThe start datetime for resulting messages in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is dateTo minus 24 hours\ndateTo\tdatetime\tThe end datetime for resulting messages in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time\ndirection\t'Inbound' | 'Outbound'\tDirection for the resulting messages. If not specified, both inbound and outbound messages are returned. Multiple values are accepted\ndistinctConversations\tboolean\tIf 'True', then the latest messages per every conversation ID are returned\nmessageType\t'Fax' | 'SMS' | 'VoiceMail' | 'Pager' | 'Text'\tType for the resulting messages. If not specified, all types of messages are returned. Multiple values are accepted\nrecordCount\tinteger\tLimits the number of records to be returned (works in combination with dateFrom and dateTo if specified)\nsyncToken\tstring\tValue of syncToken property of last sync request response\nsyncType\t'FSync' | 'ISync'\tType of message synchronization		records\tCollection of Message Info\tList of message records with synchronization information\nsyncInfo\tSync Info\tSync type, token and time			Light		Messages
103	68	GET	Get Account Phone Numbers	f	Public Basic	Normal	2016-05-09 15:50:10.670319	2016-12-06 12:49:11.453407	page\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. Default value is '1'\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default\nusageType\t'MainCompanyNumber' | 'AdditionalCompanyNumber' | 'CompanyNumber' | 'DirectNumber' | 'CompanyFaxNumber' | 'ForwardedNumber'\tUsage type of the phone number		records\tCollection of Phone Number Info\tList of account phone numbers\npaging\tPaging Info\tInformation on paging\nnavigation\tNavigation Info\tInformation on navigation			Light		Account
12	8	GET	Get Account Call Log	f	Public Basic	Normal	2016-05-09 15:50:09.688339	2016-12-29 09:04:07.296993	extensionNumber\tstring\tExtension number of a user. If specified, returns call log for a particular extension only. Cannot be specified together with the phoneNumber filter\r\nphoneNumber\tstring\tPhone number of a caller/call recipient. If specified, returns all calls (both incoming and outcoming) with the mentioned phone number. Cannot be specified together with the extensionNumber filter\r\ndirection\t'Inbound' | 'Outbound'\tThe direction for the result records. It is allowed to specify more than one direction. If not specified, both inbound and outbound records are returned. Multiple values are accepted\r\ntype\t'Voice' | 'Fax'\tCall type of a record. It is allowed to specify more than one type. If not specified, all call types are returned. Multiple values are accepted\r\nview\t'Simple' | 'Detailed'\tThe default value is 'Simple' for both account and extension call log\r\nwithRecording\tboolean\t'True' if only recorded calls have to be returned\r\ndateFrom\tdatetime\tThe start datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is dateTo minus 24 hours\r\ndateTo\tdatetime\tThe end datetime for resulting records in ISO 8601 format including timezone, for example 2016-03-10T18:07:52.534Z. The default value is current time\r\npage\tinteger\tIndicates the page number to retrieve. Only positive number values are allowed. The default value is '1'\r\nperPage\tinteger\tIndicates the page size (number of items). If not specified, the value is '100' by default.		uri\tstring\tCanonical URI\r\nrecords\tCollection of Call Log Record\tList of call log records\r\nnavigation\tNavigation Info\tInformation on navigation\r\npaging\tPaging Info\tInformation on paging		Get Account Call Log Records by Filter	Light		Call Log
\.


--
-- Name: verbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler.liu
--

SELECT pg_catalog.setval('verbs_id_seq', 194, true);


--
-- Name: examples examples_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY examples
    ADD CONSTRAINT examples_pkey PRIMARY KEY (id);


--
-- Name: model_properties model_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY model_properties
    ADD CONSTRAINT model_properties_pkey PRIMARY KEY (id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: path_parameters path_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY path_parameters
    ADD CONSTRAINT path_parameters_pkey PRIMARY KEY (id);


--
-- Name: paths paths_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY paths
    ADD CONSTRAINT paths_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: query_parameters query_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY query_parameters
    ADD CONSTRAINT query_parameters_pkey PRIMARY KEY (id);


--
-- Name: request_body_properties request_body_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY request_body_properties
    ADD CONSTRAINT request_body_properties_pkey PRIMARY KEY (id);


--
-- Name: response_body_properties response_body_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY response_body_properties
    ADD CONSTRAINT response_body_properties_pkey PRIMARY KEY (id);


--
-- Name: specifications specifications_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY specifications
    ADD CONSTRAINT specifications_pkey PRIMARY KEY (id);


--
-- Name: verbs verbs_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler.liu
--

ALTER TABLE ONLY verbs
    ADD CONSTRAINT verbs_pkey PRIMARY KEY (id);


--
-- Name: index_examples_on_verb_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_examples_on_verb_id_and_name ON examples USING btree (verb_id, name);


--
-- Name: index_model_properties_on_model_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_model_properties_on_model_id_and_name ON model_properties USING btree (model_id, name);


--
-- Name: index_models_on_specification_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_models_on_specification_id_and_name ON models USING btree (specification_id, name);


--
-- Name: index_path_parameters_on_specification_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_path_parameters_on_specification_id_and_name ON path_parameters USING btree (specification_id, name);


--
-- Name: index_paths_on_specification_id_and_uri; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_paths_on_specification_id_and_uri ON paths USING btree (specification_id, uri);


--
-- Name: index_permissions_on_specification_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_permissions_on_specification_id_and_name ON permissions USING btree (specification_id, name);


--
-- Name: index_query_parameters_on_verb_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_query_parameters_on_verb_id_and_name ON query_parameters USING btree (verb_id, name);


--
-- Name: index_request_body_properties_on_verb_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_request_body_properties_on_verb_id_and_name ON request_body_properties USING btree (verb_id, name);


--
-- Name: index_response_body_properties_on_verb_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_response_body_properties_on_verb_id_and_name ON response_body_properties USING btree (verb_id, name);


--
-- Name: index_specifications_on_version_and_title; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_specifications_on_version_and_title ON specifications USING btree (version, title);


--
-- Name: index_verbs_on_path_id_and_name; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX index_verbs_on_path_id_and_name ON verbs USING btree (path_id, name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: tyler.liu
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

