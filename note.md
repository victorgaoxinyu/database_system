Overview
1. Relational Database Modeling
	- Design Theory of Relational Databases
	- Hight-Level Database Models
2. Relational Database Programming
3. Modelling and Programming for semistructured data
4. Other issues

# Chapter 1
DBMS:
	- create new data bases, specify schemas
	- query and modify
	- storage
	- durability
	- control access, isolation, atomicity?

Tree-based model
- hierarchical
Graph-based "network" model

SQL -> Structured Query Language
XML -> eXtensible Modeling language

Data warehouses
- information from many legacy db is copied periodically, with the appropriate translation to a central db
Middleware - mediator
- support an integrated model of the data of various db.
- translating between this model and the actual models used by each database

## DBMS
Two distinct sources of commands to DBMS
- conventional users and app
- database admin

### Data-Definition Language Commands (DDL)
- schema-altering data-definition language (DDL)

### Data-manipulation Language (DML)
- does not affect the schema of the database
- may affect the content

### Query processing
Query -> query compiler -> query plan (seq of action) -> execution engine -> seq of requests -> resource manager (who knows data info) -> buffer manager -> bring data from disk to main-memory buffers

Transactions
- must be executed atomically
- in isolation from one another
- durable, effect of any completed transaction must be preserved. 

Transaction processor
2 parts
- concurrency-control manager, or scheduler. 
	- assuring atomicity and isolation
- logging and recovery manager
	- assuring durability 

### Storage and buffer management
Storage manager control the placement of data on disk and it movement between disk and main memory

Data: content of database
Metadata: database schema, describe structure of and constrains on the db
Log Records: info about recent changes, support durability
Statistics: data properties, such as sizes_of
Indexes: data structures that support efficient access. 

### Transaction Processing
Transaction processor tasks:
- Logging
- Concurrency control
- Deadlock resolution

ACID -> Atomicity, Consistency, Isolation, Durability

### The Query Processor
Query compiler consists of three major units:
- query parser
	- builds a tree struct from textual form query
- query preprocessor
	- semantic check on query
	- tree transformation, parse tree -> algebraic operators tree
- query optimizer
	- initial query plan -> best available seq of operations

Execution engine
Interacts with most of other components


## Outline
1. Relational Database Modeling [V]
2. Relational Database Programming [V]
3. Semistructured Data Modeling and programming [?]
4. Database system Implementation [?]
5. Modern Database system Issues [V/?]

# Chapter 2
## Data Model
1. Structure of the data
	- physical data model
	- conceptive model <- used in db world.
2. Operations on the data
	- queries, modifications,
3. Constraints on the data

Important data models:
- relational model
- semistructured data model

Relational model
- constraint -> Section 2.5 and Chapter 7

Semistructured Model
- constrain -> Section Section 11.2
- datatype?
- nested?	

Other Data Model
- add object-oriented features to model
	- values can have structure
	- relations can have associated methods

## Basics of Relational Model
- Attributes
- Schemas
	- `Movies(title, year, length, genre)`
	- (relational) database schema
- Tuples
	- (Gone with the Wind, 1939, 231, drama)
	- always use the order in which the attributes were listed in schema

## Domains
Tuple component must be atomic:
- elementary type, string, int
- not permitted for structure like set, list, array

Movies(title: string, year: int)

## Keys of Relations
A set of attributes forms a key for a relation.

## SQL
Two aspects:
- Data definition sublanguage for declaring database schema 
- Data Manipulation sublanguage for querying and modifying

Three kinds of relations:
- Stored relations -> tables
- Views, relation defined by computation
- Temporary tables, intermediate stuff

`SQL CREATE TABLE`



