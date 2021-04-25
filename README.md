# weekly36
## Nodejs Grandstack Graphql Neo4j Cypher Apollo React Typescript

-------------
- neo4j/docker-compose.yml
```yml
version: '3'
services:
  neo4j:
    image: neo4j:latest
    ports:
      - 7474:7474
      - 7687:7687
    volumes:
      - ./conf:/conf
      - ./data:/data
      - ./import:/import
      - ./logs:/logs
      - ./plugins:/plugins
    environment: 
      NEO4J_AUTH: neo4j/secret

```
-------------

- http://locahost:7474/browser
```
( user: neo4j, pass: secret ) 
MATCH (n) RETURN count(n)
( must return 0, so you are connected and running querys )
```

- Makefile
```
step01:
	cd neo4j && docker-compose up -d
step02:
	cd neo4j && docker-compose down 
step03:
	npx create-grandstack-app notes

```

-------------
- Now we have configured
```
nodes/api/.env ( the environment variables from the creation, with local db now ) 
```

- Local configuration ( basic learning to understand where things are  )
```
:~/projects/weekly36$ cat notes/api/.env 
# Use this file to set environment variables with credentials and configuration options
# This file is provided as an example and should be replaced with your own values
# You probably don't want to check this into version control!

NEO4J_URI=bolt://localhost:7687
NEO4J_USER=neo4j
NEO4J_PASSWORD=secret

# Uncomment this line to specify a specific Neo4j database (v4.x+ only)
#NEO4J_DATABASE=neo4j

GRAPHQL_SERVER_HOST=0.0.0.0
GRAPHQL_SERVER_PORT=4001
GRAPHQL_SERVER_PATH=/graphql
```

