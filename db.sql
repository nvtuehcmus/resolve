--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
DROP DATABASE IF EXISTS pm;
--
-- Name: pm; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pm WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE pm OWNER TO postgres;

\connect pm

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
-- Name: enginer_wiki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enginer_wiki (
    id integer NOT NULL,
    project integer,
    docs text,
    infrastructure text,
    guide text,
    code_base text
);


ALTER TABLE public.enginer_wiki OWNER TO postgres;

--
-- Name: enginer_wiki_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enginer_wiki_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enginer_wiki_id_seq OWNER TO postgres;

--
-- Name: enginer_wiki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enginer_wiki_id_seq OWNED BY public.enginer_wiki.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    id integer NOT NULL,
    name character varying(50),
    description text
);


ALTER TABLE public.project OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: sprint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprint (
    id integer NOT NULL,
    project integer,
    start date,
    "end" date,
    status integer,
    name character varying(30),
    description text,
    complete integer DEFAULT 0
);


ALTER TABLE public.sprint OWNER TO postgres;

--
-- Name: sprint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sprint_id_seq OWNER TO postgres;

--
-- Name: sprint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprint_id_seq OWNED BY public.sprint.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    id integer NOT NULL,
    name character varying(50),
    description text,
    status integer,
    assign integer,
    project integer,
    sprint integer,
    story_point integer,
    done integer NOT NULL
);


ALTER TABLE public.task OWNER TO postgres;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO postgres;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    project integer,
    member integer,
    role character varying(20)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(50),
    email character varying(50) NOT NULL,
    password text,
    "position" character varying(50),
    department character varying(50),
    address character varying(100),
    day_of_birth date,
    token character varying(20)
);


ALTER TABLE public."user" OWNER TO postgres;

--
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
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: enginer_wiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enginer_wiki ALTER COLUMN id SET DEFAULT nextval('public.enginer_wiki_id_seq'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: sprint id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint ALTER COLUMN id SET DEFAULT nextval('public.sprint_id_seq'::regclass);


--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: enginer_wiki; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.enginer_wiki VALUES (8, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.enginer_wiki VALUES (7, 1, '<h2><strong>GraphQL Performance Optimisations</strong></h2><p><a href="#c59bdbf7-500e-4bf5-8442-06db2663bbb7">GraphQL N+1 problem</a></p><p><a href="#de9697e8-2244-45a7-933d-d33b07e928b5">Problematic code</a></p><p><a href="#215645f3-9459-471a-81f3-378e12953f2a">Solution</a></p><p><a href="#ec8f25e5-c22c-4a1b-a52f-4b88e015418c">Gotchas</a></p><h2><strong>GraphQL N+1 problem</strong></h2><p>Our current stack is also succumb to the problem of N+1. Documentations online describe Prisma as being void of the N+1 problem. However, Prisma is void of the N+1 problem only if you connect directly to the management API. To solve the N+1 problem, we utillise <a href="https://github.com/graphql/dataloader">Facebook''s dataloader package</a>, which is the recommended way to solve the problem. Read Dataloader docs for the specifics behind the technical aspects.</p><p>Let us describe one sample query that is highly succumb to the N+1 problem we face. Consider the following GraphQL query that is initiated from the client side.</p><pre><code class="language-plaintext">query {
	registrations {
		id
		user {
			id
			profile {
				id
			}
		}
		class {
			id
			location {
				id
				locationCode
			}
			course {
				id
				courseCode
				courseCode
			}
		}
	}
}</code></pre><p>The query above would result in the retrieval of multiple child nodes. Each child node results in the issuance of 1 additional call to DB. This becomes an exponential problem when you have many records, and require for multi-nested data like the example above.</p><h2><strong>Problematic code</strong></h2><p>Here, we show sample code that would result in such a problem.</p><pre><code class="language-plaintext">// Root Query object with all parent resolvers
const Query = {
	async registrations(_parent: any, args: any, ctx: Context, _info: any) {
    return ctx.prisma.registrations({ ...args });
  },
}</code></pre><pre><code class="language-plaintext">// Nested resolver for children
// In Hackwagon, we term these as reducers
const User = {
	async users(_parent: any, args: any, ctx: Context, _info: any) {
    return ctx.prisma.users({ ...args });
  },
}</code></pre><p>With these 2 snippets of code, we observe a relationship where the parent will call the reducer to retrieve the child node. If the <code>Registration</code> record was created by the same <code>User</code> we end up issuing additional calls to the DB to retrieve the same user records. This is fine for <code>User</code> records since each user is going to make less than 10 registrations. This is a bigger problem for <code>Class</code> records since each <code>Registration</code> is likely to be signed up for the same <code>Class</code>, and each of that same <code>Class</code> is sure to have the same <code>Course</code>. This describes a problem where needless DB calls are issued to our DB, and which is why, Dataloader is utilised to solve this problem.</p><h2><strong>Solution</strong></h2><p>To solve the problem, we use DataLoader package in the following manner. The following snippet creates a DataLoader, which can be thought of as a simple memory cache.</p><pre><code class="language-plaintext">export function getMapFromArray(array: object[]) {
  const map: { [key: string]: object } = {};
  array.forEach((item: any) =&gt; {
    map[item.id] = item;
  });
  return map;
}

async function registrationUserBatchFunction(keys: readonly string[]) {
  const results = await prisma.$graphql(`
    query {
      registrations(where: {id_in: [${keys.map(key =&gt; `"${key}"`).join(",")}]}) {
        id
        user {
          id
          email
          password
          emailVerified
          username
          nric
          createdAt
          updatedAt
        }
      }
    }
  `);

  const map = getMapFromArray(results.registrations);
  return keys.map(key =&gt; {
    const item: any = map[key];
    return item ? item.user : new Error(`No result for ${key}`);
  });
}

export const registrationUserLoader = new DataLoader(registrationUserBatchFunction);</code></pre><p>Then, we utilise the DataLoader in our reducers.</p><pre><code class="language-plaintext">export const Registration = {
  user: ({ id }: any, _args: any, _ctx: Context) =&gt; {
    return registrationUserLoader.load(id);
  }
};</code></pre><p>From here, all calls that require the retrieval of <code>Registration.user</code> is now optimised through the DataLoader cache.</p><h2><strong>Gotchas</strong></h2><p>The above method of creating dataloaders will result in data being stored in the cache. In our architecture where we use lambdas. This cache will remain constant until the lambda dies. The problem with this is that, if an item has been <strong>Updated</strong>, or <strong>Deleted</strong>, the cache will return a copy of the data that has not been updated or deleted before. In situations as these, we will need to invalidate the cache for items that have been updated or deleted before. This means, for all mutations, we should get the dataloader to remove items. See example below:</p><h2><strong>Prisma Migration V1 to V2</strong></h2><p><a href="#b5766010-b196-4043-8814-38e3afc15122">Why migrate?</a></p><p><a href="#d7afea1a-81fb-4888-bee1-32806156bd11">How it works?</a></p><p><a href="#ba4a551c-9874-4531-8c42-97da4d6a5753">Migration process</a></p><p><a href="#da80f0e2-8a59-445b-94b5-85dca93668d5">Conventions</a></p><p><a href="#9b8bc85c-4dd0-449b-ae30-527478682269">Take Note</a></p><p><a href="#f617f8dd-736b-4dc2-8467-9656b7c6f653">Getting Started</a></p><p><a href="#f5daeba8-06bd-4629-9f9c-c87869d0240e">MISC</a></p><h2><strong>Why migrate?</strong></h2><p>From an architectural standpoint, migrating allows us to prune our architecture, making it simpler, potentially faster too. Prisma v1 utilises a query proxy before querying Postgres DB. Prisma v2 directly connects to Postgres DB reducing network latency.</p><p>Beyond architectural concerns, v2 allows us to make use of filters that is currently not possible with v1.</p><h2><strong>How it works?</strong></h2><p>We will be doing a migration on a rolling basis. To do so, we will have the following workflow, so that eventually the entire code base is migrated to v2.</p><h2><strong>Migration process</strong></h2><h2><strong>Conventions</strong></h2><ul style="list-style-type:none;"><li><strong>Default resolver naming from P1 to P2</strong></li></ul><p>registration ⇒ findOneRegistration</p><p>registrations ⇒ findManyRegistration</p><p>createRegistration ⇒ createOneRegistration</p><p>deleteRegistration ⇒ deleteOneRegistration</p><p>deleteRegistrations ⇒ deleteManyRegistration</p><p>updateRegistrations ⇒ updateManyRegistration</p><ul style="list-style-type:none;"><li><strong>Query Argument</strong></li></ul><p>Prisma 1</p><pre><code class="language-plaintext">
query ClassesForRegistrations {
  classes(
    where: {
      openForRegistration:  true
      cohort_not: "2019-01"
      isPrivateClass: false
    }
  ) {
			id
		}</code></pre><p>Prisma 2</p><pre><code class="language-plaintext">
query ClassesForRegistrations {
  classes: findManyClass( #classes is an alias
    where: {
      openForRegistration: { equals: true }
      cohort: { not: { equals: "2019-01" } }
      isPrivateClass: { equals: false }
    }
  ) {
			id
		}</code></pre><ul style="list-style-type:none;"><li><strong>Mutation: Update Argument</strong></li></ul><p>In order to reduce the front end changes we have to make for the migration, we have massaged the typings of Update Statements using regex for P2.</p><p>Hence, <strong>you don''t have to update the arguments</strong> for update statements. This is purely for reference.</p><p>&nbsp;</p><p>Update Statements now require a "set" to any variables that you want to update</p><p>Prisma 1</p><pre><code class="language-plaintext">await updateClassMutation({
      variables: {
        where: {
          id: class?.id,
        },
        data: {
          openForRegistration: true
        },
      },
    });</code></pre><p>Prisma 2</p><pre><code class="language-plaintext">await updateClassMutation({
      variables: {
        where: {
          id: class?.id,
        },
        data: {
          openForRegistration: { set: true }
        },
      },
    });</code></pre><p>&nbsp;</p><p>Do note that with these manipulated typings,</p><p>it is no longer possible to pass arguments which allows of increment, decrement, multiply or divide</p><p>Cannot be done in the front end</p><pre><code class="language-plaintext">await updatePracticeQuestionScoreMutation({
      variables: {
        where: {
          id: practiceQuestion?.id,
        },
        data: {
          score: { increment: 20 }
        },
      },
    });
</code></pre><p>&nbsp;</p><p>💡</p><p>In graphql, we are only able to choose to either pass in a string or an object, hence we chose to stick with passing in a string to reduce the amount of arguments we have to change in the front end to mitigate breakage</p><p>&nbsp;</p><h2><strong>Take Note</strong></h2><ul style="list-style-type:none;"><li><strong>We updated our GQL schema to cater to the migration.</strong></li></ul><p><strong>Problem:</strong></p><p>Our gql typings used to depend on a schema created by merging of Prisma1 and Prisma2 types. However, we realised that the types created will cause massive breakage if we remove prisma1 in the future.</p><p>Old Schema:</p><pre><code class="language-plaintext">classes(
    where: ClassWhereInput
  ): [Class!]

findManyClass(
    where: ClassWhereInput
  ): [Class!]</code></pre><p>As above, <code>classes</code> and <code>findManyClass</code> relies on <code>ClassWhereInput</code> which is derived from the Prisma1 Schema (When there is a type clash during merging, the merging will prioritise Prisma1 types)</p><p>&nbsp;</p><p>As mentioned in the <strong>Select Statement Convention</strong>, <code>ClassWhereInput</code> from P2 is very different from P1''s. Hence, upon removing prisma1 typings, most of our queries will break.</p><p>&nbsp;</p><p><strong>Solution:</strong></p><p>We have removed the Prisma2 types and introduced "Manually Imported Prisma2 Types" into <code>schema_migration.graphql</code></p><p>This file contains all the Prisma 2 typings<strong> except for Query and Mutation Types</strong> and has been modified as shown below:</p><pre><code class="language-plaintext">ClassWhereInput =&gt; V2ClassWhereInput
Class =&gt; V2Class</code></pre><p>In this case, our Prisma1 and Prisma2 types can coexist in <code>schema_prep.graphql</code> without conflict.</p><ul style="list-style-type:none;"><li><strong>We created reducers to translate the current Prisma 2 scalarList implementation</strong></li></ul><p><strong>Problem:</strong></p><p>In our Prisma2 Implementation, scalarList is implemented on a separate table.</p><pre><code class="language-plaintext">model Class {
	...
  classDates                           ClassDates[]
	...
}

model ClassDates {
  nodeId   String
  position Int
  value    DateTime
  class    Class    @relation(fields: [nodeId], references: [id])

  @@id([nodeId, position])
  @@map("Class_classDates")
}</code></pre><p>This meant that classDates will return as such:</p><pre><code class="language-plaintext">[{nodeId: "classId1", position: 1000, value: "2020-10-15T03:36:43.507Z"},
{nodeId: "classId1", position: 1000, value: "2020-10-16T03:36:43.507Z"},
{nodeId: "classId1", position: 1000, value: "2020-10-17T03:36:43.507Z" }]</code></pre><p>However, in Prisma1, classDates are purely returned as an array of DateTime:</p><pre><code class="language-plaintext">["2020-10-15T03:36:43.507Z",
"2020-10-16T03:36:43.507Z",
"2020-10-17T03:36:43.507Z"]</code></pre><p>This meant that we need to modify all our front end values to reflect <code>classDates[0].value</code> instead of <code>classDates[0]</code>. We <strong>do not want</strong> to do that as it will introduce breakages.</p><p>&nbsp;</p><p><strong>Solution:</strong></p><p><strong>You need to create</strong> reducers that were meant for our "Manually Inputted Prisma 2 typings" and they are all stored in <code>V2Migration.ts</code></p><p>For instance, when we query for <code>classDates</code>, prisma will return us with the nested object of classDates and our reducer named <code>V2Class</code> will be able to capture it and modify it to an DateTime Array.</p><figure class="image"><img src="Prisma%20Migration%20V1%20to%20V2%2024738de8dcf64eaeab0c4b18c68ee530/Untitled.png"></figure><p>&nbsp;</p><p>This will aid us in converting our relation of <code>classDates:[ClassDates!]!</code> to <code>classDates: [DateTime!]!</code> after we have ditched Prisma 1.</p><p><a href="https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-postgres#scalar-lists-arrays-are-maintained-with-extra-table">https://www.prisma.io/docs/guides/upgrade-guides/upgrade-from-prisma-1/schema-incompatibilities-postgres#scalar-lists-arrays-are-maintained-with-extra-table</a></p><p>&nbsp;</p><h2><strong>Getting Started</strong></h2><ol><li>Head to <code>schema_migration.gql</code> to create typings for <code>findManyClass</code><ul><li><strong>Example</strong></li></ul></li></ol><p>You <strong>only need</strong> to create the Type for <code>findManyClass</code> the Mutation or Query.</p><p>You can retrieve findManyClass typing from <code>src/typedefs/class</code> and <strong>prepend </strong><code><strong>V2</strong></code><strong> </strong>to each of the Input (Except for primitive types: Int, String, Boolean)</p><figure class="image"><img src="Prisma%20Migration%20V1%20to%20V2%2024738de8dcf64eaeab0c4b18c68ee530/Untitled%201.png"></figure><ol><li>Go to your console, Run <code>cd gql &amp;&amp; yarn prisma generate &amp;&amp; yarn prisma:merge</code> and restart your server</li><li>Head to <code>stuffYouWantToMigrate.gql</code> . For instance, I want to migrate <code>classes</code> to <code>findManyClass</code> in <code>class.gql</code><ul style="list-style-type:none;"><li><strong>Edit the query to match the Prisma 2 argument convention</strong></li><li><strong>If your query takes in </strong><code><strong>$where</strong></code><strong> argument, be sure to adhere to the Prisma 2 Argument Convention for your front end code</strong></li></ul></li></ol><p><strong>Example</strong></p><p>Original</p><pre><code class="language-plaintext">query ClassById($where: ClassWhereInput!) {</code></pre><pre><code class="language-plaintext">const { data, loading, refetch } = useClassByIdQuery({
    variables: {
      where: {
        id:  classId ,
      },
    },
    notifyOnNetworkStatusChange: true,
  });</code></pre><p>New</p><pre><code class="language-plaintext">query ClassById($where: V2ClassWhereInput!) {</code></pre><pre><code class="language-plaintext">const { data, loading, refetch } = useClassByIdQuery({
    variables: {
      where: {
        id: { equals: classId },
      },
    },
    notifyOnNetworkStatusChange: true,
  });</code></pre><p>Original</p><pre><code class="language-plaintext">query ClassesForRegistrations {
  classes(
    where: {
      openForRegistration:  true
      cohort_not: "2019-01"
      isPrivateClass: false
    }
  ) {
			id
		}</code></pre><p>New</p><pre><code class="language-plaintext">query ClassesForRegistrations {
  classes: findManyClass( #classes is an alias
    where: {
      openForRegistration: { equals: true }
      cohort: { not: { equals: "2019-01" } }
      isPrivateClass: { equals: false }
    }
  ) {
			id
		}</code></pre><p>&nbsp;</p><p>Observe that <code>findManyClass</code> has alias to <code>classes</code>. This is to eliminate the modification of front end code from</p><p><code>const retrievedData = classData?.classes</code> to</p><p><code>const retrievedData = classData?.findManyClass</code></p><p>&nbsp;</p><ol><li>Head to <code>permissions/index.tsx</code> to rename the permission name<ul><li><strong>Rename</strong></li></ul></li></ol><p>Original</p><pre><code class="language-plaintext">classes: allow,</code></pre><p>New</p><pre><code class="language-plaintext">findManyClass: allow,</code></pre><ol><li>Head to the resolver, in my case, <code>resolvers/Query/index.ts</code><ul><li><strong>Update it to Prisma2 with PalJs''s Prisma Select</strong></li></ul></li></ol><p>Original</p><pre><code class="language-plaintext">async classes(_parent: any, args: any, ctx: Context) {
		const res = await ctx.prisma.classes({ ...args });
	  return res;
	},</code></pre><p>New</p><pre><code class="language-plaintext">async findManyClass(_parent: any, args: ClassArgs, ctx: Context, info: any) {
    try {
      const select = new PrismaSelect(info).value;
      return await ctx.prisma2.class.findMany({
        ...args,
        ...select,
      });
    } catch (e) {
      console.log(e);
			throw new Error(e);
	    }
	  },</code></pre><ol><li>If your query/mutation requires a return value with scalarList, ceate a reducer in <code>V2Migration.ts</code> as shown in <strong>Take Note No. 2 </strong>and modify the typing in <code>schema_migration.ts</code><ul style="list-style-type:none;"><li><strong>Create Reducer</strong></li><li><strong>Modify </strong><code><strong>schema_migration.gql</strong></code></li></ul></li></ol><p>Go to <code>schema_migration.gql</code> and edit <code>V2StudentAttendance</code> type to take in an array of password string instead of AttendancePasswords Object</p><p>Original</p><pre><code class="language-plaintext">type V2Class {
...
classDates(
    where: V2ClassDatesWhereInput
    orderBy: V2ClassDatesOrderByInput
    cursor: V2ClassDatesWhereUniqueInput
    take: Int
    skip: Int
    distinct: V2ClassDatesDistinctFieldEnum
  ): [V2ClassDates!]!
...
}</code></pre><p>New</p><pre><code class="language-plaintext">
type V2Class {
...
classDates: [DateTime!]!
...
}
</code></pre><p>&nbsp;</p><p><strong>*** Please Repeat Step 3</strong></p><p>&nbsp;</p><p>createOneStudentAttendance requires a return of scalarList <code>passwords</code></p><figure class="image"><img src="Prisma%20Migration%20V1%20to%20V2%2024738de8dcf64eaeab0c4b18c68ee530/Untitled%202.png"></figure><p>We create a reducer for <code>V2StudentAttendance</code> in <code>V2Migration.ts</code></p><figure class="image"><img src="Prisma%20Migration%20V1%20to%20V2%2024738de8dcf64eaeab0c4b18c68ee530/Untitled%203.png"></figure><p>Our resolver will return an array of AttendancePasswords Object and our reducers will be able to converted it to an array of password string.</p><p>&nbsp;</p><ol><li>Duplicate the subfield rules<ul><li><strong>Copy Paste</strong></li></ul></li></ol><p>For instance, when your resolvers are utilising V2Registraiton, remember to duplicate a copy if it does not exist yet.</p><p>@Pakata Goh has already duplicated the most rules</p><figure class="image"><img src="Prisma%20Migration%20V1%20to%20V2%2024738de8dcf64eaeab0c4b18c68ee530/Clipboard_-_October_17_2020_2_05_AM.png"></figure><p>&nbsp;</p><ol><li>Perform an user test on the affected queries/mutations</li><li>Run <code>cd elearn &amp;&amp; npx tsc --noEmit &amp;&amp; cd ../admin &amp;&amp; npx tsc --noEmit &amp;&amp; cd ../join &amp;&amp; npx tsc --noEmit &amp;&amp; cd ../auth &amp;&amp; npx tsc --noEmit &amp;&amp; cd ../team &amp;&amp; npx tsc --noEmit &amp;&amp; cd ../gql &amp;&amp; npx tsc --noEmit</code> to check if you missed out any type errors</li><li>Run <code>cd gql &amp;&amp; yarn test</code> and modify the test files to match the Prisma 2 Conventions</li></ol><p>&nbsp;</p><h2><strong>MISC</strong></h2><ul style="list-style-type:none;"><li><strong>Updating ScalarList</strong></li></ul><p>Updating ScalarList is pretty complicated in our migration as we need to mimic how prisma1 "set" works.</p><p>Hence, in the resolver:</p><p>I will delete all the classDates before the populating it with the updated classDates</p><pre><code class="language-plaintext">//Deleting class''s classDates
const removeClassDate = ctx.prisma2.class.update({
        where: { id: args?.where?.id },
        data: {
          classDates: {
            deleteMany: {
              nodeId: args?.where?.id,
            },
          },
        },
      });

//Updating and populating with the updated classDates and other data
const updateClass = ctx.prisma2.class.update({
        data: { ...args.data, classStartDate },
        where: { id: args?.where?.id },
        ...select,
      });

//Transaction
if(args?.classDates){
const updatedClass = await ctx.prisma2.$transaction([removeClassDate, updateClass]);
...
}else{
const updatedClass = await ctx.prisma2.$transaction([updateClass]);
...
}
</code></pre><p>On the front end, classData will just be created as we do not need to worry if there will be unique constraints as our backend has already removed all the classDates prior to the update.</p><pre><code class="language-plaintext">const createClassDates = classData?.classDates.map((each: string, index: number) =&gt; {
        return {
          position: (index + 1) * 1000,
          value: each,
        };
      });

await updateClassMutation({
        variables: {
          data: {
            ...classData,
            course: {
              connect: { id: classData.course },
            },
            location: {
              connect: { id: classData.location },
            },
            subsidyType: classData.subsidyType,
            subsidy: subsidyData,
            classDates: {
              create: createClassDates,
            },
            ...classConfigData,
          },
          where: { id: classId },
        },
      });</code></pre><ul style="list-style-type:none;"><li><strong>SomethingConnection</strong></li></ul><p>To mimic the behaviour of prisma1''s connection, we made use of 2 resolvers, findManyClass &amp; findManyClassCount</p><pre><code class="language-plaintext">query AllClassesByPageWithRegistrations(
  $first: Int = 10
  $skip: Int = 0
  $where: V2ClassWhereInput! = {}
  $orderBy: [V2ClassOrderByInput!] = [{ classStartDate: desc }]
) {
  classesConnection: findManyClass(take: $first, skip: $skip, where: $where, orderBy: $orderBy) {
    id
    cohort
    classDates
    capacity
    openForRegistration
    isPrivateClass
    hoursPerLesson
    subsidyType
    location {
      id
      locationCode
    }
    course {
      id
      courseCode
    }
    registrations {
      id
      status
    }
    createdAt
  }
  findManyClassCount(where: $where)
}</code></pre><ul style="list-style-type:none;"><li><strong>Cornercase in Nested Update Mutation</strong></li></ul><p>In Prisma 1, i am able to pass in such a mutation, to use <strong>update</strong> user to <strong>create</strong> a staff</p><pre><code class="language-plaintext">const res = await mutate({
        mutation: UpdateMyUser,
        variables: {
          data: {
            email: ''test+user+ta+edited@hackwagon.com'',
            profile: {
              update: {
                fullName: ''Tan Ah Kao'',
                phone: ''+65 93823812'',
                dateOfBirth: new Date(Date.UTC(2020, 9 - 1, 1, 15, 0)).toISOString(),
              },
            },
            staff: {
                create: {
                  resume: { create: {} },
                  termAndCondition: {
                    create: {
                      id: ''tac+id'',
                      content: ''&lt;p&gt;hello&lt;/p&gt;'',
                    },
                  },
                  acceptedTermAndContionAt: new Date(Date.UTC(2020, 9 - 1, 1, 15, 0)).toISOString(),
                  bankName: ''OCBC'',
                  bankBranchCode: ''OC'',
                  bankAccountNumber: ''1234567'',
                  scStaffId: 123,
                },
            },
          },
        },
        // @ts-ignore
        http: { headers: { authorization: `Bearer ${token}` } },
      });</code></pre><p>However in Prisma 2, using the same query will result in the following error:</p><p><code>The change you are trying to make would violate the required relation ''StaffToUser'' between the Staff and User models.</code></p><p>So, the workaround is to update with <strong>upsert</strong></p><pre><code class="language-plaintext">const res = await mutate({
        mutation: UpdateMyUser,
        variables: {
          data: {
            email: ''test+user+ta+edited@hackwagon.com'',
            profile: {
              update: {
                fullName: ''Tan Ah Kao'',
                phone: ''+65 93823812'',
                dateOfBirth: new Date(Date.UTC(2020, 9 - 1, 1, 15, 0)).toISOString(),
              },
            },
            staff: {
              upsert: {
                update: {
                  resume: { create: {} },
                  termAndCondition: {
                    create: {
                      id: ''tac+id'',
                      content: ''&lt;p&gt;hello&lt;/p&gt;'',
                    },
                  },
                  acceptedTermAndContionAt: new Date(Date.UTC(2020, 9 - 1, 1, 15, 0)).toISOString(),
                  bankName: ''OCBC'',
                  bankBranchCode: ''OC'',
                  bankAccountNumber: ''1234567'',
                  scStaffId: 123,
                },
                create: {
                  resume: { create: {} },
                  termAndCondition: {
                    create: {
                      id: ''tac+id'',
                      content: ''&lt;p&gt;hello&lt;/p&gt;'',
                    },
                  },
                  acceptedTermAndContionAt: new Date(Date.UTC(2020, 9 - 1, 1, 15, 0)).toISOString(),
                  bankName: ''OCBC'',
                  bankBranchCode: ''OC'',
                  bankAccountNumber: ''1234567'',
                  scStaffId: 123,
                },
              },
            },
          },
        },
        // @ts-ignore
        http: { headers: { authorization: `Bearer ${token}` } },
      });</code></pre><p><br><br>&nbsp;</p>', '<p><a href="Engineering%20Wiki%20e86204846e0a4c03b4a33ca527f58fac/Zeit%20Now%204f1a2579861244fcaad38323692cb478.html">🔺Zeit Now</a></p><ul><li><span style="color:hsl(0, 0%, 100%);">We use Zeit Now platform to host most of all our V2 infrastructure as Lambdas. Please contact @nguyen van tue to get set up with the right credentials.&nbsp;</span></li></ul><p><a href="Engineering%20Wiki%20e86204846e0a4c03b4a33ca527f58fac/Digital%20Ocean%2048bf5e620e3d4af7b2bb456011f563a1.html">🐬Digital Ocean</a></p><ul><li><span style="color:hsl(0, 0%, 100%);">We use Digital Ocean to host servers that require persistence. We also utilise Digital Ocean for our Postgres Databases. Please contact </span><span style="color:hsl(0,0%,100%);">@nguyen van tue</span><span style="color:hsl(0, 0%, 100%);"> to get set up with the right credentials.&nbsp;</span></li></ul><p><a href="Engineering%20Wiki%20e86204846e0a4c03b4a33ca527f58fac/Heroku%208d5b7f2f93734420b223ba788c0a72d2.html">🦸Heroku</a></p><ul><li>We use Heroku for some fringe projects. Please contact <span style="color:hsl(0,0%,100%);">@nguyen van tue</span> to get set up with the right credentials.</li><li><a href="#57987900-6331-4326-95d0-99eb33f4ff86">Projects hosted on Heroku</a></li><li><a href="#04a5a69f-a8ba-46ed-b72f-10a902eff870">Backend</a></li><li><a href="#1121d706-54ea-4bad-913c-f5ea312406a8">Frontend</a></li><li><strong>Projects hosted on Heroku</strong></li></ul><p><a href="Engineering%20Wiki%20e86204846e0a4c03b4a33ca527f58fac/AWS%205edf09e6ec434d56b518e895d5ff3e1c.html">🕸AWS</a></p><ul><li><span style="color:hsl(0, 0%, 100%);">We use AWS for Amazon S3 primarily. Please contact @</span><span style="color:hsl(0,0%,100%);">nguyen van tue</span><span style="color:hsl(0, 0%, 100%);"> to get set up with the right credentials.&nbsp;</span></li></ul>', '<h2>1. Install git</h2><ul><li>you can see here <a href="https://www.youtube.com/watch?v=nbFwejIsHlY">https://www.youtube.com/watch?v=nbFwejIsHlY</a> to understand how to install git on window.</li><li>create account on github and apply to project</li></ul><h2>2. Config in local and connect to github</h2><p>you have to add ssh key for the first time use git</p><p>open git bash, type and then enter until end process.</p><pre><code class="language-plaintext">ssh-keygen -t rsa -C yourEmail
</code></pre><pre><code class="language-plaintext">cat ~/.ssh/id_rsa.pub
</code></pre><ul><li>You will see ssh key copy them and paste to link <a href="https://github.com/settings/ssh/new">https://github.com/settings/ssh/new</a> at key field</li></ul>', '<p><a href="Engineering%20Wiki%20e86204846e0a4c03b4a33ca527f58fac/Code%20Reviews%208b4666bd9e694dcda8a778089c5a30b6.html">✔️Code Reviews</a></p><p><a href="Engineering%20Wiki%20e86204846e0a4c03b4a33ca527f58fac/Backend%20471494e81c6743219b5f8f058c5aed73.html">🖥Backend</a></p><ul><li><strong>Backend</strong></li><li><strong>Server-side</strong></li><li>We use the GraphQL Yoga framework in Node.JS to implement our backend</li><li><strong>GraphQL</strong></li><li>We use GraphQL for writing our backend APIs. For a guide on getting started with GraphQL, check out this <a href="https://graphql.org/learn/">documentation</a>.</li><li><strong>Postgres</strong></li><li>We use Postgres for our database. For a guide on getting started with Postgres, check out this <a href="https://www.postgresql.org/docs/manuals/">documentation</a>.</li></ul><p><a href="Engineering%20Wiki%20e86204846e0a4c03b4a33ca527f58fac/Engineering%20Directory%20f5d1148357e749a8bd9503bb53aa8af3.html">🙋Engineering Directory&nbsp;</a></p><p><a href="Engineering%20Wiki%20e86204846e0a4c03b4a33ca527f58fac/Architecture%20Overview%209ff0faf31a554fb8a48fe59982307679.html">🔌Architecture Overview</a></p><ul><li><br><strong>Database</strong></li><li>Hosted on a digitalocean droplet</li><li>Postgresql</li><li>&nbsp;</li><li><strong>Backend</strong></li><li>Hosted as lambdas (serverless) on vercel</li><li>Prisma to communicate with our postgresdb</li><li>Mocha and chai as our test suite</li><li>Apollo Graphql to manage queries and mutations to feed the front end</li><li>&nbsp;</li><li><strong>Frontend</strong></li><li>Hosted as lambdas (serverless) on vercel</li><li>Javascript based, Typescript</li><li>React NextJS Framework</li><li>&nbsp;</li><li><strong>CI/CD</strong></li><li>Buddy.works</li><li>Github Actions</li></ul>');


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.project VALUES (1, 'nasa', 'built webapp for manager emloyee');
INSERT INTO public.project VALUES (7, 'amazon', 'create search engine app for amazon');


--
-- Data for Name: sprint; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sprint VALUES (2, 1, '2021-01-10', '2021-01-27', 0, 'sprint 2', 'none description', 0);
INSERT INTO public.sprint VALUES (1, 1, '2021-01-05', '2021-01-28', 1, 'sprint 1', 'none description', 0);


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.task VALUES (1, 'UI for benefit form', 'create UI for benefit form follow link: designtt.com/id?12343231', 4, 4, 1, 1, 2, 0);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teams VALUES (1, 1, 4, 'PM');
INSERT INTO public.teams VALUES (2, 1, 5, 'FE');
INSERT INTO public.teams VALUES (4, 7, 4, 'PM');
INSERT INTO public.teams VALUES (8, 1, 6, 'QA');


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" VALUES (4, 'Nguyễn Văn Tuệ', 'nvtuehcmus@gmail.com', '$2b$10$eg9BmxUjZZicYmtz5ijKzOSMRW74KFZn.6cihemHkhfW0Rp/7gogy', 'Viet nam', 'Full Stackk', '324 lê hồng phong p1 q1p', '1999-06-30', NULL);
INSERT INTO public."user" VALUES (6, 'dương thị quỳnh nhi', 'nhikhum44@gmail.com', '$2b$10$eg9BmxUjZZicYmtz5ijKzOSMRW74KFZn.6cihemHkhfW0Rp/7gogy', 'Viet nam', 'QA', '324 lê hồng phong p1 q1p', '1999-06-30', NULL);
INSERT INTO public."user" VALUES (5, 'Nguyễn Văn Phúc', 'tstyle9xx@gmail.com', '$2b$10$eg9BmxUjZZicYmtz5ijKzOSMRW74KFZn.6cihemHkhfW0Rp/7gogy', 'Viet nam', 'FE', '324 lê hồng phong p1 q1p', '1999-06-30', NULL);


--
-- Name: enginer_wiki_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enginer_wiki_id_seq', 8, true);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 7, true);


--
-- Name: sprint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprint_id_seq', 6, true);


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_id_seq', 1, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 8, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 7, true);


--
-- Name: enginer_wiki enginer_wiki_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enginer_wiki
    ADD CONSTRAINT enginer_wiki_pk PRIMARY KEY (id);


--
-- Name: project project_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pk PRIMARY KEY (id);


--
-- Name: task task_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pk PRIMARY KEY (id);


--
-- Name: teams teams_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pk PRIMARY KEY (id);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: enginer_wiki_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX enginer_wiki_id_uindex ON public.enginer_wiki USING btree (id);


--
-- Name: project_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX project_id_uindex ON public.project USING btree (id);


--
-- Name: sprint_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX sprint_id_uindex ON public.sprint USING btree (id);


--
-- Name: task_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX task_id_uindex ON public.task USING btree (id);


--
-- Name: teams_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX teams_id_uindex ON public.teams USING btree (id);


--
-- Name: enginer_wiki enginer_wiki_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enginer_wiki
    ADD CONSTRAINT enginer_wiki_project_id_fk FOREIGN KEY (project) REFERENCES public.project(id);


--
-- Name: sprint sprint_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint
    ADD CONSTRAINT sprint_project_id_fk FOREIGN KEY (project) REFERENCES public.project(id);


--
-- Name: task task_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_project_id_fk FOREIGN KEY (project) REFERENCES public.project(id);


--
-- Name: task task_sprint_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_sprint_id_fk FOREIGN KEY (sprint) REFERENCES public.sprint(id);


--
-- Name: task task_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_user_id_fk FOREIGN KEY (assign) REFERENCES public."user"(id);


--
-- Name: teams teams_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_project_id_fk FOREIGN KEY (project) REFERENCES public.project(id);


--
-- PostgreSQL database dump complete
--

