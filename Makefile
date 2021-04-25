
step01:
	cd neo4j && docker-compose up -d
step02:
	cd neo4j && docker-compose down 
step03:
	npx create-grandstack-app notes
step04:
	git add . && git commit --no-verify  -m 'wip(app): comment here' && git push
step05:
  cd notes && npm run start && npm run seedDb # starts api & ui at the same time

