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


