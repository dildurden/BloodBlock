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
  //instance.methods.setDonor(data.donorno,data.dName,data.age,data.bloodGroup,data.gender).send({from:account,gas:600000}).then((txn)=>{
    res.send(txn);
  // });
})
router.post('/getSample',(req,res,next)=>{
  let data =req.body;
  //using instance of the contract to fetch donor details
  //instance.methods.getSample(data.search)
})
module.exports = router;