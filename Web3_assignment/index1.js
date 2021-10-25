const Web3 = require('web3')
const rpcURL = 'https://mainnet.infura.io/v3/1873aa32de7a4360a949b4f6f28d3b2a' // Your RPC URL goes here
const web3 = new Web3(rpcURL)
const address = '0x2e0572504ed619bFED0B7b3519666023434E1368' // Your account address goes here
web3.eth.getBalance(address, (err, wei) => {
  balance = web3.utils.fromWei(wei, 'ether')
  console.log(balance)
})