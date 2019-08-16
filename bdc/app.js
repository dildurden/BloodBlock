var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var Web3 = require('web3');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

web3 = new Web3('http://localhost:8545');//Connecting to Blockchain rpc endpoint
//Initialize the account and contract instances

  account ="0x87939fc162bc94c50701aa859a9ca3fe38a31a6c";//account Address
  contractaddress="0xc58467d547323960d94242dd0a8700f0b12b1daa";//Contract Address
  //Initialize the contract Abi
  contractabi = [
    {
      "constant": false,
      "inputs": [
        {
          "name": "_id",
          "type": "uint256"
        },
        {
          "name": "_name",
          "type": "string"
        },
        {
          "name": "_age",
          "type": "uint256"
        },
        {
          "name": "_place",
          "type": "string"
        },
        {
          "name": "_mob",
          "type": "uint256"
        },
        {
          "name": "_bldVol",
          "type": "uint256"
        },
        {
          "name": "_donorCond",
          "type": "uint8"
        },
        {
          "name": "_donGen",
          "type": "uint8"
        },
        {
          "name": "_grp",
          "type": "uint8"
        }
      ],
      "name": "setDonor",
      "outputs": [],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [
        {
          "name": "_id",
          "type": "uint256"
        }
      ],
      "name": "getSample",
      "outputs": [
        {
          "name": "_age",
          "type": "uint256"
        },
        {
          "name": "_place",
          "type": "string"
        },
        {
          "name": "_bldVol",
          "type": "uint256"
        },
        {
          "name": "_donorCond",
          "type": "uint8"
        },
        {
          "name": "_donGen",
          "type": "uint8"
        },
        {
          "name": "_grp",
          "type": "uint8"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    }
  ]
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
app.use('/users', usersRouter);

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
