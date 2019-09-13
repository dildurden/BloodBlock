var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var Web3 = require('web3');
const ejsLint = require('ejs-lint');
ejsLint.lint();
var indexRouter = require('./routes/index');
/** 
 * Deployed Contract request and usng comtract instance of request to call methods of the register contract
*/
var DonorRegisterJSON = require(path.join(__dirname,"build/contracts/Request.json"));//Donor Contract Variable
web3 = new Web3('http://localhost:8545');//Connecting to Blockchain rpc endpoint
//Initialize the account and contract instances
  account = "0x1ac013d849c86f23f2e95eb4e68cbc20bf97dc93";//account Address for devmode 0xc22e2df070d7552dfe27b976efeb8bc6e76b077a
  contractaddress = DonorRegisterJSON.networks['4002'].address;//Contract Address
  //Initialize the contract Abi
  contractabi = DonorRegisterJSON.abi;
  //Contract Instance
  Contractinstance = new web3.eth.Contract(contractabi,contractaddress);//contract instance



var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
