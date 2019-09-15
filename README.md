# CED-B3-G08




# BloodBlock - A Blood Donor Chain

A blockchain-based Blood Donation Management System ; The dApp is created to make the blood donation transparent and decentralised. It helps us to know
whether the blood donated reaches the needed and also donate blood as per request so that there is no blood wastage and spoilage.


### System requirements:

1. Operating system: Ubuntu 16.04
2. System RAM: 4 GB or above (recommended 8 GB)
3. Free System storage: 4 GB on /home

## Installation Prerequisites:

1. Ensure that NodeJS is installed in the system. For more information about NodeJS, go to https://nodejs.org. To check if installed, open a terminal window:
```
node -v
```

2. If NodeJS is not installed, go to https://nodejs.org and download the compatible version based on system OS, or in a terminal window:
```
sudo apt-get install -y nodejs
```

3. Ensure that Truffle is installed. Truffle Suite helps to develop Dapps easily. For more information, go to https://truffleframework.com/. To check if installed, in terminal window:
```
truffle version
```
4. If Truffle is not installed, in terminal window:
``` 
npm install -g truffle
```

5. Ensure that geth is installed. Geth is the official Golang implementation of the Ethereum protocol. To check, in a terminal window:
```
geth version
```

6. To install geth, in a terminal window:
```
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum
```

## Setting up the Dapp

1. Clone the Dapp repository from gitlab. Open a terminal window and paste the following command
``` 
git clone https://gitlab.com/ced_b3_projects/ced-b3-g08

```
2. Open the project folder privatechain and open a terminal from the folder to run geth on a private network.You can notice a shellscript file privatechain.sh, run the file.
```
chmod +x privatechain.sh
./privatechain.sh
```
3. Open the project folder bdc and open a terminal from the folder ,to migrate the smart contract.
```
truffle migrate --reset
```
4. To run the node server ,on the terminal execute
```
npm start
```
5. Open webbrowser and go to "http://localhost:3000" to launch the Dapp

6. If you want to run the dapp in Dev mode kill all existing terminals and run the file devchain.sh in folder bdc.
```
./devchain.sh
```
    Repeat the steps 3,4,5 to continue with the Dapp
7. In order to enter the addresses required in the Dapp create new accounts from the geth javascript console using command <geth attach> and use
```
personal.newAccount(); //Copy the account address and pass as argument to the next function to unlock it
personal.unlockAccount("Your Account address")
```
8. If you want to run the Dapp in multiple node scenario then use the commands in the multinodecommands.txt in the privatechain folder.
9. To run the Dapp in Ropsten test network use
```
truffle deploy --network ropsten
```
