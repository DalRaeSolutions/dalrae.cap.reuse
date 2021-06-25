# Reuse demo 

## PREP

### On main screen:
- fullscreen browser. run projects with `npm run dev` as the ports are already set
  - http-server on the `reuse-demo` folder, list of links on port 8080
  - tab 1: addresses on port 4006
  - tab 2: base on port 4005
  - tab 3: extension on port 4004
- fullscreen VSCode in `reuse-demo` folder

## For prezzo 

### Intro 
- Introduction of Tanveer and Jorg. Mention COVID

- Explain why we're looking at reuse
  - In a complex app, reuse is better than reinventing the wheel
  - Reuse can be a method to separate code 

### Demo time

**DEMO** 
- show app running on port 4006 to show list of addresses
- show app running on port 4005 to show list of orders and customers
- show app running on port 4004 that has added fields and customer addresses

### Explanation of reuse concepts
- Extend and use a DB entity
- Extend and use a service entity 
- How to use and connect to another service
- How to reuse a screen

### Explanation of how to package a service and do the imports

- creating and importing the npm package, importing EDMX file

**DEMO** 
```
npm pack ./dalrae.cap.reuse.base
mkdir extend_demo
cd extend_demo && cds init
cp ../reuse-base-1.0.0.tgz .
pnpm add ./reuse-base-1.0.0.tgz
cds import ../ADDRESSES.edmx
```

### What works and doesn't work, what questions did we ask ourselves
- Deployment
  - Every CAP application creates its own schema when deploying to CF. 
  - They don't share data so they so common data is best fetched through another service like search helps
  - open question: multitenancy
  - It also means that any changes and deployments made to the base application do not affect the extended application. npm package is just a snapshot in time

- Versioning
  - we've used `npm pack`, can also use npmjs or host your own
  - The NPM package takes its version from `package.json`, mta uses `mta.yml` package version and deployed version can misalign
    - **DEMO** Show a a few `packs`
  - having multiple apps with multiple versions of the base will make for a complicated landscape 
  - changes to imported services are immediate and the extensions should be considered before changing them

- Security can be overwritten
  - Pondered on this as a means to provide context or security consious services or entities 
  - security annotations can be set on a database entity
  - like all annotations it can be replaced in the extending service
  - open question: reusing security roles, are they deployed too? Locally, mock auth had to be re-entered in the `.csdrc` file

- External services 
  - Try not to mix V4 and V2 services. While it can be done, there are incompatibilities mainly in date notations
  - You can use an external service in the same manner without importing the EDMX. You only need to do the import if you
    want to use the other service's entities
  - External service entities can be used in draft?