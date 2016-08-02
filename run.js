const path = require('path')
const argv = require('minimist')(process.argv.slice(2), {
  alias: {
    p: 'port',
    d: 'pushd',
    l: 'lang'
  },
  default: {
    port: 48284,
    db: './push.db',
    lang: 'en'
  }
})

if (!argv.pushd) {
  throw new Error('missing "pushd" url')
}

const createServer = require('./')
const port = Number(argv.port)
createServer({
  db: path.resolve(argv.db),
  pushd: argv.pushd,
  port: Number(argv.port),
  lang: argv.lang
})

console.log(`running on port ${port}, connecting to pushd at ${argv.pushd}`)
