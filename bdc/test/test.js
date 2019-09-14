const json = artifacts.require("Request");
let accounts,bdc,owner;
const interface = json['abi'];
const bytecode = json['bytecode'];

beforeEach(async ()=>{

  accounts = await web3.eth.getAccounts();
  owner = accounts[0];
  bdc = await new web3.eth.Contract(interface).deploy({data:bytecode}).send({from:owner,gas:'4000000'});
})


contract('Request',() => {
  it('deploys a contract',async () =>{
    const reqAddress = await bdc.options.address;
    assert.ok(reqAddress,'Test Failed!!!!');
  })

  it('Donor details added',async ()=>{
    donorid = accounts[1];
    name ="Your Name";
    age = 23;
    place = "your place";
    mob = 999;
    medCond = false;
    bGrp = 1;
    gender = 1;
    donorstats = false;
    active = true;

    try {
      await bdc.methods.setDonor(donorid,name,age,place,mob,medCond,bGrp,gender).send({from:owner,gas:4000000});
      donorRegisteredDetails = await bdc.methods.getSample(donorid).call();
      assert.equal(donorRegisteredDetails[0],age,"test failed!!!");
      assert.equal(donorRegisteredDetails[1],place,"test failed!!!");
      assert.equal(donorRegisteredDetails[2],gender,"test failed!!!");
      assert.equal(donorRegisteredDetails[3],bGrp,"test failed!!!");
      assert.equal(donorRegisteredDetails[4],medCond,"test failed!!!");
      assert.equal(donorRegisteredDetails[5],active,"test failed!!!"); 
    } catch (err) {
      assert(err);
      console.log(err);
    }
  })

  it('Request details',async ()=>{
    requestid = accounts[2];
    location = "Req location";
    bGrp = 1;
    reqstats = false;

    try{
      await bdc.methods.setReq(requestid,location,bGrp).send({from:owner,gas:4000000});
      requsetRegisteredDetails = await bdc.methods.getReq(requestid).call();
      assert.equal(requsetRegisteredDetails[0],location,"test failed!!!");
      assert.equal(requsetRegisteredDetails[1],bGrp,"test failed!!!");
      assert.equal(requsetRegisteredDetails[2],reqstats,"test failed!!!");
    }catch(err){
      assert(err);
      console.log(err);
    }
  })

  it('Accept Request',async ()=>{
    donorid = accounts[1];
    requestid = accounts[2];
    try {
      await bdc.methods.acceptReq(donorid,requestid).send({from:owner,gas:4000000});
      tokens = await bdc.methods.balanceOf(donorid).call();
      console.log('Tokens: ',tokens);
      donorDetails = await bdc.methods.getSample(donorid).call();
      assert.equal(donorDetails[6],tokens,"test failed");
    } catch (err) {
      assert(err);
      console.log(err);
    }
  })
})