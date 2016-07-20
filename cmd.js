#!/bin/bash

const createServer = require('./')
const close = createServer({
  db: './push.db',
  pushd: 'http://127.0.0.1:24432',
  port: 48284
})
