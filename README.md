![Example-Logo](https://i.imgur.com/iv5Zdek.png)
# Lobstex Masternode Setup Guide (Ubuntu 16.04)
This guide will assist you in setting up a Lobstex Masternode on a Linux Server running Ubuntu 16.04. (Use at your own risk)

If you require further assistance contact the support team @ [Discord](https://discord.gg/pdUX3Uh)
***
## Requirements
1) **10,000 Lobstex coins.**
2) **A Vultr VPS running Linux Ubuntu 16.04.**
3) **A Windows local wallet.**
4) **An SSH client such as [Bitvise](https://dl.bitvise.com/BvSshClient-Inst.exe)**
***
## Contents
* **Section A**: Preparing the local wallet.
* **Section B**: Creating the VPS within [Vultr](https://www.vultr.com/?ref=7296974). 
* **Section C**: Downloading and installing Bitvise.
* **Section D**: Connecting to the VPS and installing the MN script via Bitvise.
* **Section E**: Connecting & Starting the masternode.
***

## Section A: Preparing the Local wallet

1. Download most recent Lobstex wallet from https://github.com/avymantech/lobstex/releases/tag/v2.0                           
   to your LOCAL system 

	a. If Windows firewall blocks the wallet, it is safe to allow 
		
		Generate your Masternode's Private Key 
	
		Go to the "Tools" dropdown and select "Debug Console" 

	



	b.	Type this command into the console 
              
	      		masternode genkey
			
	
	c.	Save GENKEY on NOTEPAD/NOTES


 

2. Generate Masternode address and name it

a. Still in the Debug Console, enter this command, replacing "YourMasternodeName" with the name you want for your Masternode. 
              
	      getaccountaddress YourMasternodeName 

		(ex. getaccountaddress mynode) 
		
		
3. Send 10,000 LOBS to the wallet address you generated

a. Copy the address you generated in the last step EXACTLY. We CAN NOT help
anyone who has sent their LOBS to the wrong address.

b. You can verify it is the correct address when you paste it into the "Pay to:" field,
the "Label" field should autopopulate to your Masternode's name.



4. Get proof of transaction to the Masternode

a. Enter this command into the Debug Console

               `masternode outputs` 

This can take a second
 

Type the command below and press enter 

   

* Copy the long key (this is your transaction ID) and the 0 or 1 at the end (this is your output index)
* Paste these into the text document you created earlier as you will need them in the next step.
***



## Section B: Creating the VPS within [Vultr](https://www.vultr.com/?ref=7296974) 
***Step 1***
* Register at [Vultr](https://www.vultr.com/?ref=7296974)
***

***Step 2***
* After you have added funds to your account go [here](https://my.vultr.com/deploy/) to create your Server
***

***Step 3*** 
* Choose a server location (preferably somewhere close to you)
![Example-Location](https://i.imgur.com/ozi7Bkr.png)
***

***Step 4***
* Choose a server type: Ubuntu 16.04
![Example-OS](https://i.imgur.com/aSMqHUK.png)
***

***Step 5***
* Choose a server size: $5/mo will be fine 
![Example-OS](https://i.imgur.com/UoGoHcM.png)
***

***Step 6*** 
* Set a Server Hostname & Label (name it whatever you want)
![Example-hostname](https://i.imgur.com/uu0rvOr.png)
***

***Step 7***
* Click "Deploy now"

![Example-Deploy](https://i.imgur.com/4qpYuH0.png)
***


## Section C: Downloading and installing BitVise. 

***Step 1***
* Download Bitvise [here](https://dl.bitvise.com/BvSshClient-Inst.exe)
***

***Step 2***
* Select the correct installer depending upon your operating system. Then follow the install instructions. 

![Example-PuttyInstaller](https://i.imgur.com/yF3694G.png)
***


## Section D: Connecting to the VPS & Installing the MN script via Bitvise.

***Step 1***
* Copy your VPS IP (you can find this by going to the server tab within Vultr and clicking on your server. 
![Example-Vultr](https://i.imgur.com/z41MiwY.png)
***

***Step 2***
* Open the bitvise application and fill in the "Hostname" box with the IP of your VPS.
![Example-PuttyInstaller](https://i.imgur.com/vkN1alC.png)
***

***Step 3***
* Copy the root password from the VULTR server page.
![Example-RootPass](https://i.imgur.com/JnXQXav.png)
***

***Step 4***
* Type "root" as the login/username.
![Example-Root](https://i.imgur.com/11GMkvA.png)
***

***Step 5*** 
* Paste the password into the Bitvise terminal by right clicking (it will not show the password so just press enter)
![Example-RootPassEnter](https://i.imgur.com/zVhOAKu.png)
***

***Step 6*** 
* Once you have clicked open it will open a security alert (click yes).  
***

***Step 7***
* Paste the code below into the Bitvise terminal then press enter (it will just go to a new line)
![Example-RootPassEnter](https://i.imgur.com/vuDtUVj.png)

`wget -q https://raw.githubusercontent.com/avymantech/Masternode/master/lobstex_install.sh`
***

***Step 8***
* Paste the code below into the Bitvise terminal then press enter

`bash lobstex_install.sh`

![Example-Bash](https://i.imgur.com/myvmKTE.png)

***

***Step 9***
* Sit back and wait for the install (this will take 10-20 mins)
***

***Step 10***
* When prompted to enter your GEN key - Copy The masternode Genkey earlier generated and press enter

![Example-installing](https://i.imgur.com/sLvWd1S.png)
***

***Step 11***
* You will now see all of the relavant information for your server.
* Keep this terminal open as we will need the info for the wallet setup.
![Example-installing](https://i.imgur.com/Q87LcnW.png)
***


***Step 12***

* <h2>Upload Lobstex Lite on server</h2>

* <h3>Type these commands in console:</h3>

* <h5><i>wget https://github.com/avymantech/lobstex/releases/download/2.3.1/Lobstex.Linux.2.3.1.zip</i></h5>

* <h5><i>unzip LinuxLite.zip</i></h5> 

* <h5><i>chmod u+x lobstexd</i></h5>

* <h5><i>chmod u+x lobstex-cli</i></h5>

# Section E: Connecting & Starting the masternode 

***Step 1***
* Go to the tools tab within the wallet and click open "masternode configuration file" 
![Example-create](https://i.imgur.com/COsfvfA.png)
***

***Step 2***

* Fill in the form. 
* For `Alias` type something like "MN01" **don't use spaces**
* The `Address` is the IP and port of your server (this will be in the Bitvise terminal that you still have open).
* The `PrivKey` is your masternode private key (This is also in the Bitvise terminal that you have open).
* The `TxHash` is the transaction ID/long key that you copied to the text file.
* The `Output Index` is the 0 or 1 that you copied to your text file.
![Example-create](https://i.imgur.com/9b1I3bk.png)

Click "File Save"
***

***Step 3***
* Close out of the wallet and reopen Wallet
*Click on the Masternodes tab "My masternodes"
* Click start all in the masternodes tab
***
Congratulations! You have now setup a masternode. If you do not, please contact support and they will assist you.  
***
