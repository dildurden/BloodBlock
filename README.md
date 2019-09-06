# CED-B3-G08




# BloodBlock - A Blood Donor Chain

A blockchain-based Blood Donation Management System


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
2. Open the project folder blockchainData and open a terminal from the folder to run geth.You can notice a shellscript file chain.sh, run the file.
```
chmod +x privatechain.sh
./privatechain.sh
```
3.
## Add your Git username and set your email

On your shell, type the following command to add your username:
```
git config --global user.name "YOUR_USERNAME"
```
To set your email address, type the following command:
```
git config --global user.email "your_email_address@example.com"
```

To verify that you entered your username and email correctly, type:
```
git config --global user.name
git config --global user.email
```


## Basic Git commands

### Clone a repository
To start working locally on an existing remote repository, clone it with the command git clone <repository path>. By cloning a repository, you’ll download a copy of its files into your local computer, preserving the Git connection with the remote repository.

You can find both paths (HTTPS and SSH) by navigating to your project’s landing page and clicking Clone. GitLab will prompt you with both paths, from which you can copy and paste in your command line.

To get started, open a terminal window in the directory you wish to clone the repository files into, and run one of the following commands.
```
git clone https://gitlab.com/ced_b3_projects/ced-b3-g08

```
This command will download a copy of the files in a folder named after the project’s name.

You can then navigate to the directory and start working on it locally.

### Go to the master branch to pull the latest changes from there
```
git checkout master
```
### Download the latest changes in the project
This is for you to work on an up-to-date copy (it is important to do this every time you start working on a project), while you set up tracking branches. You pull from remote repositories to get all the changes made by users since the last time you cloned or pulled the project. Later, you can push your local commits to the remote repositories.
```
git pull
```
### Add and commit local changes
You’ll see your local changes in red when you type git status. These changes may be new, modified, or deleted files/folders. Use git add to stage a local file/folder for committing. Then use git commit to commit the staged files:
```
git add FILE OR FOLDER
git commit -m "COMMENT TO DESCRIBE THE INTENTION OF THE COMMIT"
```
### Send changes to GitLab.com
To push all local commits to the remote repository:
```
git push
```
