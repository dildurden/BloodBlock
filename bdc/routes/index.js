var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: '' });
});
router.post('/setDonor',function(req,res,next){
  // res.send(req.body); Testing post
  let data = req.body;
  //Mapping bloodgroups to their enum values
  switch(data.bloodGroup){
    case 'A+':return 0;
    case 'AB+':return 6;
    case 'B+':return 2;
    case 'O+':return 4;
    case 'A-':return 1;
    case 'AB-':return 7;
    case 'B-': return 3;
    case 'O-': return 5;
  }
  //Conditional Statement for Checking the no:of Medical Conditions
  // if(data.medConditions1|| data.medConditions2 ||data.medConditions3 || data.medConditions4 ||data.medConditions5 == 0)
  //    medConditions =0;
  // else
  //    medConditions=1;
 //using instance of the contract to set donor data variables
 /*console.log(data.bloodGroup);
 
  Contractinstance.methods.setDonor(data.donorno,data.donorName,data.age,data.location,data.mobno,'0','1',data.gender,data.bloodGroup).send({from:account,gas:600000}).then((txn)=>{
    res.send(txn);
   });
   MODIFICATION NEEDED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!git
   */
})

router.post('/getSample',(req,res,next)=>{
  let data =req.body;
  //using instance of the contract to fetch donor details
  Contractinstance.methods.getSample(data.search).call({from:account}).then((txn)=>{
    res.send(txn);
  });
})
module.exports = router;