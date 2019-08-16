var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: '' });
});
router.post('/setDonor',function(req,res,next){
  // res.send(req.body); Testing post
  let data = req.body;
   
  //Conditional Statement for Checking the no:of Medical Conditions
  
 //using instance of the contract to set donor data variables
 console.log(data.mCondition1);
 
  Contractinstance.methods.setDonor(data.donorno,data.donorName,data.age,data.location,data.mobno,data.mCondition1,data.gender,data.bloodGroup).send({from:account,gas:600000}).then((txn)=>{
    res.send(txn);
   });
  //  MODIFICATION NEEDED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!git
   
})

router.post('/getSample',(req,res,next)=>{
  let data =req.body;
  //using instance of the contract to fetch donor details
  Contractinstance.methods.getSample(data.search).call({from:account}).then((txn)=>{
    res.send(txn);
  });
})
module.exports = router;