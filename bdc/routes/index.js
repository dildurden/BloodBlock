var express = require('express');
var router = express.Router();
/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Blood Donor Chain' });
});
router.post('/setDonor',async function(req,res,next){
  // res.send(req.body); Testing post
  let data = req.body;
 
  //using instance of the contract to set donor data variables
  console.log(data.mCondition1);
  console.log(data.donorno);
  /*
   medCounter and array med[] is used to check wether 3or more medical conditions turns to be true
  */
  let medCounter = 0;
  med =[];
  med.push(data.mCondition1,data.mCondition2,data.mCondition3,data.mCondition4,data.mCondition5);
  console.log("Value of Conditions are: ",med);
  console.log("the length is: ",med.length)
  for(i=0;i<med.length;i++){
      if(med[i] == "true")
        medCounter++;
  }
  if(medCounter >= 3){
     mCondition = true; //med conition set to true so that donor is rejected
  }
  else
    mCondition = false; //med condition set to false 
  console.log("ender Address ",account)
  console.log("Counter:",medCounter)
  console.log("Conditions:",mCondition);
  try{
      await Contractinstance.methods.setDonor(data.donorno,data.donorName,data.age,data.location,data.mobno,mCondition,data.gender,data.bloodGroup).send({from:account,gas:600000}).then((txn)=>{
        res.send("Donor "+ data.donorno +" has been registered");
      })
    }catch(err){
      await res.send(err.message);
      console.log(err.message);
    }
  
});

router.get('/getSample',async(req,res,next)=>{
  let data =req.query;
  try {
        await Contractinstance.methods.getSample(data.search).call({from:account}).then((txn)=>{
          res.render("getSample",{result:txn})
        })
  } catch (err) {
    await res.send(err.message);
    console.log(err.message);
  }
})
router.post("/setRequest",async (req,res)=>{
  let data = req.body;
  try {
        await Contractinstance.methods.setReq(data.bankAddr,data.reqlocation,data.reqbloodGroup).send({from:account,gas:600000}).then((txn)=>{
              res.send("Request "+ data.bankAddr +" has been registered");
        })
  } catch (err) {
    await res.send(err.message);
    console.log(err.message);
  }
  
})
///Route for Accepting Request
router.post("/acceptRequest",async (req,res)=>{
  let data = req.body;
  try {
        await Contractinstance.methods.acceptReq(data.donoraddr,data.reqaddr).send({from:account,gas:6000000}).then((txn)=>{
              Contractinstance.methods.getSample(data.donoraddr).call({from:account}).then((donortx)=>{
                Contractinstance.methods.getReq(data.reqaddr).call({from:account}).then((reqtxn)=>{
                  //to check the locations are matching or not as comparing string datatype not possible in solidity
                  if(donortx._place == reqtxn._location){
                    res.send("Request "+ data.reqaddr +" has been accepted by Donor " + data.donoraddr);
                    console.log(txn);
                  }
                  else{
                    res.send("Locations not matching");
                  }
                })
              })
                 
        })
  } catch (err) {
    await res.send(err.message);
    console.log(err.message);
  }  
})
module.exports = router;
