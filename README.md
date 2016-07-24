
# @tradle/push-server

requires [pushd](https://github.com/rs/pushd) running locally

# Usage

Run pushd (e.g. on port 24432)

```js
const createServer = require('./')
const close = createServer({
  db: './push.db',
  pushd: 'http://127.0.0.1:24432',
  port: 48284
})
```

# Methods

### /register

Register a client's device

POST JSON signed with @tradle/engine

Request:

  POST {
    // signature, as per the tradle protocol
    _t: 'tradle.PNSRegistration',
    _s: Signature,
    // identity object, as per the tradle protocol
    identity: <Object>,
    token: String
  }
  
Response

  Success: 200 OK [Empty Response]

### /susbcriber/:subscriberLink/:publisherLink

Subscribe a client's device
