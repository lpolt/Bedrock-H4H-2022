import web3 from './web3'

const DaiAddress = "0x5592ec0cfb4dbc12d3ab100b257153436a1f0fea";
const DaiAbi = require("./erc20abi.json");
const DaiContract = new web3.eth.Contract(JSON.parse(JSON.stringify(DaiAbi)), DaiAddress);

export default DaiContract 
