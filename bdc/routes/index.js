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
  Contractinstance.methods.setDonor(data.donorno,data.donorName,data.age,data.location,data.mobno,data.mCondition1,data.gender,data.bloodGroup).send({from:account,gas:600000}).then((txn)=>{
    res.send(txn);
   });
  //  MODIFICATION NEEDED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!git
   
});

router.get('/getSample',(req,res,next)=>{
  let data =req.query;
  Contractinstance.methods.getSample(data.search).call({from:account}).then((txn)=>{
    res.render("getSample",{result:txn})
  })
})

module.exports = router;
