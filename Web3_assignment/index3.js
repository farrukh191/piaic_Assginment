var Tx = require('ethereumjs-tx');
const Web3 = require('web3')
const rpcURL = 'https://mainnet.infura.io/v3/1873aa32de7a4360a949b4f6f28d3b2a' // Your RPC URL goes here
const web3 = new Web3(rpcURL)
const address2 = '0x2e0572504ed619bFED0B7b3519666023434E1368' // Your account address goes here
const address = '0x2e0572504ed619bFED0B7b3519666023434E1368' // Your account address goes here

// web3.eth.getBalance(address, (error, wei) => {
//   console.log(web3.utils.fromWei(
//     wei, 'ether'))
// })

const privateKey1 = Buffer.from(process.env.PRIVATE_KEY_1, 'hex')
const privateKey2 = Buffer.from(process.env.PRIVATE_KEY_2, 'hex')

web3.eth.getTransactionCount(address, (err, txCount) => {
  const txObject = {
    nonce: web3.utils.toHex(txCount),
    to: address2,
    value: web3.utils.toHex(web3.utils.toWei('0.1', 'ether')),
    gasLimit: web3.utils.toHex(21000),
    gasPrice: web3.utils.toHex(web3.utils.toWei('10', 'gwei'))
  }

  console.log(txObject);
  const tx = new Tx(txObject)
  tx.sign(privateKey1)

  const serializedTx = tx.serialize()
  const raw = '0x' + serializedTx.toString('hex')

  web3.eth.sendSignedTransaction(raw, (err, txHash) => {
    console.log('txHash:', txHash)
  })
})
