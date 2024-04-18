SDK 调用报错
```
TypeError: fetch failed
at node:internal/deps/undici/undici:12344:11
at processTicksAndRejections (node:internal/process/task_queues:95:5)
at async SuiHTTPTransport.request (/home/cleversushi/sui_projects/letsmove/mover/twiagle/code/task6/node_modules/@mysten/sui.js/src/client/http-transport.ts:91:15)
at async SuiClient.getCoins (/home/cleversushi/sui_projects/letsmove/mover/twiagle/code/task6/node_modules/@mysten/sui.js/src/client/client.ts:163:10) {
cause: AggregateError
at internalConnectMultiple (node:net:1114:18)
at internalConnectMultiple (node:net:1177:5)
at Timeout.internalConnectMultipleTimeout (node:net:1687:3)
at listOnTimeout (node:internal/timers:575:11)
at processTimers (node:internal/timers:514:7) {
code: 'ETIMEDOUT',
[errors]: [ [Error], [Error] ]
}
```