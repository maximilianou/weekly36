
step01:
	cd neo4j && docker-compose up -d
step02:
	cd neo4j && docker-compose down 
step03:
	npx create-grandstack-app notes