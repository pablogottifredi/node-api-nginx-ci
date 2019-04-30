#!/bin/bash
BLUE='\033[0;34m'
NC='\033[0;0m'
# build code from /src to /dist
echo -e "${BLUE}Remove previous data from dist folder ${NC}"
rm -rf dist && mkdir dist
echo -e "${BLUE}Traspile code using babel ${NC}"
npx babel src --out-dir dist
echo -e "${BLUE}Copying package.json to dist ${NC}"
cp package.json dist
cd dist 

