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
step04:
  cd notes && npm run start && npm run seedDb

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

-------------
- Commit this changes, for future docs/steps by steps, or baby steps
```
( husky > pre-commit hook failed (add --no-verify to bypass) )
:~/projects/weekly36$ git commit --no-verify  -m 'feat(app): init grandstack, connected to local neo4j db. with api/.env'
```

-----------------------
- Solving somthing Today 2021.04.25
```
14:33:48 React-TS | To fix the dependency tree, try following the steps below in the exact order:
14:33:48 React-TS | 
14:33:48 React-TS |   1. Delete package-lock.json (not package.json!) and/or yarn.lock in your project folder.
14:33:48 React-TS |   2. Delete node_modules in your project folder.
14:33:48 React-TS |   3. Remove "eslint" from dependencies and/or devDependencies in the package.json file in your project folder.
14:33:48 React-TS |   4. Run npm install or yarn, depending on the package manager you use.
```

- Fixing eslint version Default Verbose Message when init app
```
:~/projects/weekly36/notes$ cd notes
:~/projects/weekly36/notes$ rm -rf node_modules
:~/projects/weekly36/notes$ rm package-lock.json
:~/projects/weekly36/notes$ cat package.json 
{
  "devDependencies": {
    "concurrently": "^5.2.0",
    "dotenv": "^8.2.0",
    "execa": "^4.0.2",
    "grandstack": "^0.0.1",
    "husky": ">=4",
    "lint-staged": ">=10",
    "prettier": "^2.0.5"
  },
  "scripts": {
    "seedDb": "node scripts/seed.js",
    "start": "node scripts/start-dev.js",
    "build": "node scripts/build.js",
    "format": "find . -name \"*.js\" | grep -v node_modules | grep -v build | xargs prettier --write",
    "format:log": "find . -name \"*.js\" | grep -v node_modules | grep -v build | xargs prettier",
    "inferschema:write": "node scripts/inferSchema.js"
  },
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.js": [
      "prettier --write",
      "eslint --fix"
    ]
  }
}
```


-----------------------
- WIP: Fixing some things, may I have to start from other place in other try. Today it is working in this way

- package.json
```json
{
  "devDependencies": {
    "concurrently": "^5.2.0",
    "dotenv": "^8.2.0",
    "execa": "^4.0.2",
    "grandstack": "^0.0.1",
    "husky": ">=4",
    "lint-staged": ">=10",
    "prettier": "^2.2.1"
  },
  "scripts": {
    "seedDb": "node scripts/seed.js",
    "start": "node scripts/start-dev.js",
    "build": "node scripts/build.js",
    "format": "find . -name \"*.js\" | grep -v node_modules | grep -v build | xargs prettier --write",
    "format:log": "find . -name \"*.js\" | grep -v node_modules | grep -v build | xargs prettier",
    "inferschema:write": "node scripts/inferSchema.js"
  },
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.js": [
      "prettier --write",
      "eslint --fix"
    ]
  }
}
```

- ui/package.json
```json
{
  "name": "ui",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@material-ui/core": "^4.11.3",
    "@material-ui/icons": "^4.11.2",
    "@testing-library/jest-dom": "^5.12.0",
    "@testing-library/react": "^11.2.6",
    "@testing-library/user-event": "^12.8.3",
    "react": "^17.0.2",
    "react-dom": "^17.0.2",
    "react-router-dom": "^5.2.0",
    "react-scripts": "4.0.3",
    "web-vitals": "^1.1.1"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  },
  "devDependencies": {
    "@types/react-dom": "^17.0.3",
    "@types/react-router-dom": "^5.1.7"
  }
}
```

