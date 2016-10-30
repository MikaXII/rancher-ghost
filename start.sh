#!/bin/bash

envsubst < config.js.tmpl > config.js
npm start --production
