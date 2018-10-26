// src/lottery.js
import web3 from './web3';

const address = '0xf32750091405BFcf67b213c2c7593F5E8df10a99';
const abi = [{"constant":true,"inputs":[],"name":"note","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_note","type":"string"}],"name":"writeNote","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_note","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}];

export default new web3.eth.Contract(abi, address);