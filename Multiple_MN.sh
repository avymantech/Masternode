Multiple MasterNodes on 1 IP

prerequisite: VPS (eg. ubuntu 16.04), one already running lobstex-MN

#copy your lobstexd and lobstex-cli into your $PATH eg.

sudo cp lobstexd /usr/bin
sudo cp lobstex-cli /usr/bin

#copy your .lobstex datadir to a new .lobstexB datadir, just to be safe
#stop your running lobstexd before

lobstex-cli stop
cp -r .lobstex .lobstexB
lobstexd
cd .lobstexB

#edit lobstex.conf

nano lobstex.conf

#increment rpcport=15156 to rpcport=15157
#(this is the port lobstex-cli will talk to your new daemon)
#add a line 
#bind=127.0.0.2
#(for further nodes increment rpcport=15157+x and bind=127.0.0.2+x
#eg. rpcport=15157, bind 127.0.0.3 for MN3)
#adjust masternodeprivkey=64bBmC2Ea.................ef3
#to the new value you got from the wallet-debug-console with: masternode genkey
#save ^x y ENTER

#edit a new shell-script for an easy startup of the second-MN

cd ..
nano lobstexdB

#!/bin/bash

lobstexd -datadir=/home/USERNAME/.lobstexB 

#save

chmod +x lobstexB

#edit a new shell-script for easy communication with the second-MN

nano lobstexB-cli

#!/bin/bash

lobstex-cli -datadir=/home/USERNAME/.lobstexB -rpcport=15157 $@
#replace USERNAME (and increment rpcport=.... for the next MNs)
#save

chmod +x lobstex-cli

#start your second MN

./lobstexdB

#check it with

./lobstexB-cli masternode status
