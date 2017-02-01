.z.ws
-----

Called when a message on a websocket arrives, as

.z.ws\[char vector|byte vector\]

If the incoming message is a text message the parameter is a char vector; for a binary message the parameter is a byte vector.

Sending a websockets message is limited to async messages only (sync is 'nyi). A char vector will be sent as a text message; a byte vector as a binary message.

The default definition is to echo the message back to the client, i.e. `{neg[.z.w]x}`

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
