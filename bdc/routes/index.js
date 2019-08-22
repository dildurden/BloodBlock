var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: '' });
});
router.post('/setDonor',function(req,res,next){
  // res.send(req.body); Testing post
  let data = req.body;
 
  //using instance of the contract to set donor data variables
  console.log(data.mCondition1);
  console.log(data.donorno);
  /**Donor number removed as mapping is address based.
   medCounter and array med[] is used to check wether 3or more medical conditions turns to be true
  */
  let medCounter = 0;
  let counter = 0;
  med =[];
  med.push(data.mCondition1,data.mCondition2,data.mCondition3,data.mCondition4,data.mCondition5);
  console.log("Value of Conditions are: ",med);
  console.log("the length is: ",med.length)
  for(i=0;i<med.length;i++){
      if(med[i] == "true")
        medCounter++;
  }
  if(medCounter >= 3){
     mCondition = "true"; //med conition set to true so that donor is rejected
  }
  else
    mCondition = "false"; //med condition set to false 
  //  sender = web3.eth.accounts.create();
  console.log("ender Address ",account)
  Contractinstance.methods.setDonor(data.donorno,data.donorName,data.age,data.location,data.mobno,mCondition,data.gender,data.bloodGroup).send({from:account,gas:600000}).then((txn)=>{
    res.send(txn);
   });
  //  MODIFICATION NEEDED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!git
  /*
   Contractinstance.methods.setDonor(data.donorno,data.donorName,data.age,data.location,data.mobno,data.mCondition1,data.gender,data.bloodGroup).send({from:account,gas:600000}).then((txn)=>{
    res.send(txn);
   });
  */ 
});

router.get('/getSample',(req,res,next)=>{
  let data =req.query;
  Contractinstance.methods.getSample().call({from:account}).then((txn)=>{
    res.render("getSample",{result:txn})
  })
})

module.exports = router;
