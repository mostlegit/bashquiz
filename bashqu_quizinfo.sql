-- MySQL dump 10.13  Distrib 5.5.57, for Linux (x86_64)
--
-- Host: localhost    Database: bashqu_quizinfo
-- ------------------------------------------------------
-- Server version	5.5.57-cll

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questions` (
  `QuestionNumber` int(11) NOT NULL AUTO_INCREMENT,
  `Points` int(11) NOT NULL DEFAULT '100',
  `CorrectAnswer` varchar(1) NOT NULL,
  `Question` varchar(300) NOT NULL,
  `OptionA` varchar(300) NOT NULL,
  `OptionB` varchar(300) NOT NULL,
  `OptionC` varchar(300) DEFAULT NULL,
  `OptionD` varchar(300) DEFAULT NULL,
  `AddInfo` mediumtext COMMENT 'This is information about the answer',
  PRIMARY KEY (`QuestionNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (18,100,'A','What command would display the contents of the second column the fastest on a large text file : example.txt?','cut -d \\  -f 2 example.txt','cat example.txt | perl -pale \'$_=\"@F[0,2]\"\'','cat example.txt| rev | awk {\'print $(NF-1)\'}','awk \'{print $2}\' example.txt','cut is very light. \r\nAwk and Perl both have significant overhead. \r\nWhile awk and perl both have more overhead than cut, they are also more powerful and worth learning.\r\nrev reversed the file which adds a lot of unnecessary overhead\r\nAll of these solutions would have gotten you the correct output'),(3,100,'C','What does this command do:\r\nfor i in $(cat /home*/*/etc/*/passwd|sed \'s/ //g\');do u=`echo -n \"$i\"|cut -d: -f1`;d=`echo -n \"$i\"|cut -d/ -f5`;echo $u@$d;done','Reset all email passwords','Reset all FTP passwords','Shows all email accounts on the server','Show all FTP accounts on the server','The only way you can get this question totally wrong is to run it in a bash shell without knowing what it does. \r\nThe command starts by inspecting all cpuser\'s etc folders for a passwd file inside a directory (which is the domain)\r\nThe sed formats and subsequent variable sustitution are used for formatting\r\nThe command could be better written as:\r\ncat /home*/*/etc/*/passwd| awk -F\'[/:]\' {\'print $9,$10\'} | while read user domain; do echo \"$user@$domain\"; done\r\nIf you can come up with a better way email it to chases@inmotionhosting.com for a 100 point bonus'),(4,100,'B','True or False: cp -p will keep the immutable attribute on a file','True','False','','','There is not a POSIX command that will allow you to copy the immutable attribute.'),(5,100,'A','True/False: A non-root user cannot execute a script that has execute but not read privileges (111)','True','False','','','Here is the output from attempting to run a test script without read permission: \r\n$ ls -lah testscript.py \r\n---x--x--x 1 root root 17K Mar 11  2015 testscript.py\r\n\r\n$ ./testscript.py \r\n/usr/bin/python: can\'t open file \'./testscript.py\': [Errno 13] Permission denied'),(6,100,'B','Which one of these options is not a way to transfer over the SSH protocol','scp','wget','rsync','sftp','sftp, scp, and rsync are all wrappers for SSH. \r\nwget allows you to use many protocols including FTP and TCP'),(2,100,'D','What is the most safe way to run a loop (ex. fixperms) on all cPanel users','for user in $(\\ls /var/cpanel/users); do fixperms $user; done','\\ls /var/cpanel/users| while read user; do fixperms $user; done','\\ls /var/cpanel/users/ | xargs fixperms','for user in /var/cpanel/users/*; do fixperms $(basename $user); done ','You should never parse ls. \r\nThere are lots of reasons for why that is very unsafe and you should read here: \r\nhttp://mywiki.wooledge.org/ParsingLs \r\nif you got this question wrong or guessed. '),(7,100,'B','Give a command to empty the file without invoking an editor','touch file.txt','> file.txt','echo \'\\n\' > file.txt','mv /dev/null file.txt','Touch will create a new file but not blank an existing file. \r\necho \'\\n\' > file.txt will echo a new line so the file will have one line\r\n\r\nIf you moved or removed /dev/null you can recreate it with: \r\n    mknod /dev/null c 1 3\r\n    chmod 666 /dev/null'),(8,100,'D','How would you create a file named -i','touch \\-i','touch \'-i\'','touch \\-\\i','touch \\\\-i','Here are the errors provided by all the incorrect answers: \r\nCT-4147-bash-4.1# touch \\-i\r\ntouch: invalid option -- \'i\'\r\nTry `touch --help\' for more information.\r\nCT-4147-bash-4.1# touch \'-i\'\r\ntouch: invalid option -- \'i\'\r\nTry `touch --help\' for more information.\r\nCT-4147-bash-4.1# touch \\-\\i\r\ntouch: invalid option -- \'i\'\r\nTry `touch --help\' for more information.\r\n\r\nYou can also use: touch -- -i'),(9,100,'C','You just added a function to your .bashrc called checkusers() and want to reload the .bashrc file. How would you do that without logging out and logging back in','reload ~/.bashrc','refresh ~/.bashrc','source ~/.bashrc','mv ~/.bashrc /etc/active_profile','You can also use: . ~/.bashrc'),(10,100,'D','Which one of these commands emulates tail - f','less -f\r\n\r\n','awk -F','head -end','less +F','Using less -F is useful if you need to scroll the output from your keyboard in addition to watching the live tail. '),(11,100,'C','Which of these would generate an output of 15:','echo \"10 + 5\"','echo $(eval(10+5))','echo $((10 + 5))','echo 10 + 5','In addition to the $((a + b)) format you can use bc:\r\n# echo \"10 + 5\" | bc\r\n15'),(12,100,'A','What would be the final Boolean logic of the expression\r\nFalse and (True and False) or (False or True)\r\n','True','False','True and False','True or True','You can read more about Boolean Logic here: \r\nhttps://en.wikipedia.org/wiki/Boolean_algebra'),(13,100,'C','What is the output to $((10 % 3))\r\n','3','2','1','3.33333333333333...','The modulo operator gives you the remainder from a division. 10 divided by 3 gives you 3 with a remainder of 1. '),(14,100,'A','True/False: The default behaviour of tee will overwrite a file\'s contents rather than append.','True','False',NULL,NULL,NULL),(15,100,'D','Which of these would be the appropriate way to redirect stderr to stdout and then displaying both on stdout and redirect output to a file?','2>1 | tee output\r\n','2>1>3 >> output','2>&1>&3 >> output','2>&1 | tee output',''),(16,100,'C','If you need to write a bash loop that repeats 10 times, you can do it as:\r\nfor i in $(seq 1 10); do echo loop number $i; done\r\nWhich of these would be another valid way to way to write that loop\r\n\r\n','while read {1..10}; do echo loop number $i; done','for i in {1...10}; do echo loop number $i; done','for i in {1..10}; do echo loop number $i; done','while read {1...10}; do echo loop number $i; done','Here\'s a good reference on Bash Brace Expansion: http://www.linuxjournal.com/content/bash-brace-expansion'),(17,100,'C','How would you add the folder ~/flask_bin/ to your path?','$PATH=$PATH+~/flask_bin','PATH=$PATH+~/flask_bin','PATH=$PATH:~/flask_bin','$PATH=$PATH:~/flask_bin','When a command name is specified by the user or an exec call is made from a program, the system searches through $PATH, examining each directory from left to right in the list, looking for a filename that matches the command name. When it finds a file in the $PATH matching that name, it will execute it.\r\nPATH is set with the syntax \r\nPATH=$PATH:/folder/to/add1:/second/folder/to/add2'),(1,100,'D','How would I take 10 files with names 1 to 10, and input all of the content into one .txt file?','while read {1..10}; do echo $i > newfile; done','< {1..10} > newfile','cat 1..10 > newfile;','cat {1..10} > newfile','< {1..10} > newfile\r\nWill work in zsh but not in bash. \r\nIn bash it will cause an ambiguous redirect.'),(19,100,'C','How would you grep cat or dog or fish?','grep \"cat|dog|fish\"','grep -e \"cat|dog|fish\"','grep -E \"cat|dog|fish\"','grep -e \"[cat|dog|fish]\"','When using grep -e you have to escape your | so it would look like\r\ngrep -e \"cat\\|dog\\|fish\"'),(20,100,'B','How would you grep for Ninja Master or Ninja Blackbelt but not Ninja Turtles','grep -P \'Ninja (??Turtles)\'','grep -P \'Ninja (?!Turtles)\'','grep -P \'Ninja .*!Turtles\'','grep -P \'Ninja .?!Turtles\'','This concept is called regex lookahead and you can read more about it here: http://www.regular-expressions.info/lookaround.html'),(21,100,'A','If you wanted to execute a script fix_hacked_index across all cPanel users with 50 running concurrently, how would you do that.','parallel --gnu -j 50 fix_hacked_index::: $(\\ls /var/cpanel/users)','for cpuser in /var/cpanel/users/*; do fix_hacked_index $(basename $cpuser) &50; done','\\ls /var/cpanel/users/ | xargs -I {} -j50 fix_hacked_index {}','for cpuser in /var/cpanel/users/*; do sleep 50& fix_hacked_index $(basename $cpuser); wait; done','You can also use: \r\n\\ls /var/cpanel/users | parallel --gnu -j 50 fixperms\r\n\r\nThe xargs example would work if you replaced -j with -P\r\n'),(22,100,'C','You have a fish tank where you check the temperature every 5 minutes. The script takes a varying amount of time to run. Which of these commands would not execute the script check_fishtank.sh 5 minutes apart','while true; do check_fishtank.sh; sleep 300; ;done','while true; do timeout 300 check_fishtank.sh &; sleep 300; done','watch -n 300 \'sh check_fishtank.sh\'','while true; do sleep 300&; check_fishtank.sh; wait; done','In example A if the script took 60 seconds to run, then it would run in 360 second increments or script_run_time + sleep time. '),(23,100,'C','Which of these will result in the least command executions if a customer has 1000 .htaccess in /home/:','for i in $(find /home/ -name \".htaccess\"); do sed -i s/AddHandler/#AddHandler/ $i; done','find /home/ -name \".htaccess\" | xargs -P 50 -I {} sed -i s/AddHandler/#AddHandler/ {};','find /home/ -name \".htaccess\" -exec  sed -i s/AddHandler/#AddHandler/ {} +','find /home/ -name \".htaccess\" -exec  sed -i s/AddHandler/#AddHandler/ {} \\;','Using + instead of {} in find will make it buffer the arguments and run them in groups, causing less executions of the same command. '),(24,100,'B','What will be the result of this command:\r\nfind ./ -name pets -exec grep -q dog {} \\; -exec replace cat toy -- {} +','It will search for dog in file pets and attempt to run replace on any files named pets\r\n','It will search for dog and then only run the replace if it finds dog','It will fail because of syntax errors\r\n',NULL,'When you stack exec commands to find, they will continue only if the previous one succeeds.'),(25,100,'B','Which of these commands will show you the IP address of the server you are on.','wget fetchip.com','curl fetchip.com','php http://fetchip.com','php fetchip.com','wget will download the index/file, while curl will show it by default.\r\nYou shouldn\'t be using php on domain names.'),(26,100,'D','If you had a file with variables in the format:\r\nhost=\'Inmotion Hosting\'\r\nphonenumber=\'888-321-4678 (757-416-6575 Int\'l)\'\r\n...\r\nand you wanted to be able to reference $phonenumber, \r\nhow would you read that file into variables?','export imh_vars\r\n','import imh_vars\r\n','read imh_vars\r\n','source imh_vars\r\n','Source is also good for files you have lots of variables declared like a bashrc.'),(27,100,'B','What command would allow you to see the maximum allowed opened files for your current user','grep nproc /etc/security/limits.conf','ulimit -n','cat /proc/diskstats','cat /proc/cmdline','You can also use ulimit -a to check more environmental variables'),(28,100,'D','Which command will result in correctly identifying when you are on a webhostinghub server:','if ! \'webhostinghub\' in hostname; then echo \"You are on WebHosting Hub\"; else echo \"You are on InMotion Hosting\"','hostname | grep -q webhostinghub || echo \"You are on WebHosting Hub\" && echo \"You are on InMotion Hosting\"','if \'webhostinghub\' in hostname; then echo \"You are on WebHosting Hub\"; else echo \"You are on InMotion Hosting\"; fi','hostname | grep -q webhostinghub && echo \"You are on WebHosting Hub\" || echo \"You are on InMotion Hosting\"','In this command first it checks the status code on grep -q, and then uses && to execute if the grep as successful and || to execute if the grep was not successful.'),(29,100,'A','How would you rewrite\r\ngrep -q \'123.123.123.123\' /var/log/maillog && echo \'IP found\' || echo \'IP not found\'\r\nusing if/then syntax','if $(grep -q 70.30.133.130 /var/log/maillog); then echo \'IP found\'; else echo \'IP not found\'; fi\r\n','if [[grep -q 70.30.133.130 /var/log/maillog]]; then echo \'IP found\'; else echo \'IP not found\'; fi\r\n','if i in $(grep -q 70.30.134.130 /var/log/maillog); do echo \'IP Found\'; echo \'IP not found\'; done\r\n','while read 70.30.134.130 in /var/log/maillog; do echo \'IP found\'; else echo \'IP not found\'; done',NULL),(30,100,'C','Which is not a valid way to read loop through the variables \"Pet\" and \"Owner\" from the file pets:\r\nCrookshanks Hermione\r\nTrevor Neville\r\nHedwig Harry\r\n...','cat pets | while read Pet Owner; do echo \"$Owner owns $Pet\"; done','while read Pet Owner; do echo \"$Owner owns $Pet\"; done < pets','for line in $(cat pets); do Owner=$(echo $line|awk {\'print $1\'}); Pet=$(echo $line|awk {\'print $2\'}); echo \"$Owner owns $Pet\"; done','cat pets | while read line; do Owner=$(echo $line|awk {\'print $1\'}); Pet=$(echo $line|awk {\'print $2\'}); echo \"$Owner owns $Pet\"; done','The default delimiter for for is a space, so the for loop would not collect both variables appropriately.'),(31,100,'D','Which of these will make uneven columns more readable','sed -r \"s:\\x1B\\[[0-9;]*[mK]::g\"\r\n','col1=() col2=() col3=() printf \'<%s>\\n\'\r\n','sort -k\r\n','column -t\r\n','You can also set column width using printf.'),(32,100,'D','If you ran the command ./runme userna5 chases@inmotionhosting.com\r\nHow would I reference the variable chases@inmotionhosting.com\r\n','$0\r\n','$1\r\n','$!!:1\r\n','$2\r\n','The variable would be referenced by its position in the command that was called. In this case the second position or $2. '),(33,100,'B','If you want to make it so you can not remove a file, which one of these attributes would be the best:','chattr +a filename','chattr +i filename','chmod +t filename\r\n','chmod --sticky-bit filename','Sticky-bit will not stop the owner from removing the file. \r\nThe attribute that makes this change is called the immutable attribute. '),(34,100,'C','Which command does not have a progress function','rsync','tar','cp','pv','cp does not have a progress indicator. Rsync does not provide a full progress on the task in the version we use, but provides progress on the file being transferred. '),(35,100,'C','How would you sort results by the second column\r\n','column -t2\r\n','sort -n2\r\n','sort -k2\r\n','uniq -c2\r\n',NULL),(36,100,'C','Which one of these commands is the equivilent of sed -i s/inmotion/webhostinghub/ file.txt\r\n','replace s/inmotion/webhostinghub/g testfile\r\n','replace s/inmotion/webhostinghub testfile\r\n','replace inmotion webhostinghub -- testfile\r\n','replace inmotion webhostinghub --testfile\r\n','Once you get used to sed you probably won\'t use replace very much. It does have very simple syntax though. '),(37,100,'A','Which of these commands would allow you to join an already existing screensession that is attached by another user','screeen -x\r\n','screen -X\r\n','screen -Rd\r\n','screen -r','You might consider switching to tmux though. It has advanced features like watch only mode or splitting your session into horizontal and vertical panes. '),(38,100,'B','How would you check the main domain of a user inside a cpanel package?','read --archived cpmove-chasestest/userdata/main --input cpmove-chasestest.tar.gz\r\n','tar xf cpmove-chasestest.tar.gz cpmove-chasetest/userdata/main -O\r\n','tar -cjf cpmove-chasestest.tar.gz cpmove-chasestest\r\n','tar -ztvf cpmove-chasestest.tar.gz cpmove-chasestest/userdata/main\r\n','For this question it\'s important to know how to open a file from within an archive. That is done with the syntax: \r\ntar xf myArchive.tar folder/someFile.txt -O'),(39,100,'C','If you ran the command \r\nfixperms userna5\r\nand wanted to reference userna5 in the next command, how would you do that: ','$? \r\n','?$ \r\n','!!:1 \r\n','!!:2\r\n','Since userna5 is the first argument, you can use !!:1. If it was the second argument you would use !!:2'),(40,100,'A','Which of these are not equivilent? \r\n','[[:alpha::]]\r\n','[0-9a-zA-Z]\r\n','[a-zA-Z0-9]\r\n','[[:alnum::]]\r\n','[[:alpha::]] does not match numbers, but only upper and lowercase letters. '),(41,100,'D','If you had an array \"randomlist=(\'hermione\' \'harry\' \'ginny\' \'snape\')\" and wanted to grab a random item, how would you do that? ','RANDOM % randomlist','sed \'g/1/$#/#/\' randomlist','echo $randomlist | awk {\'print $RANDOM\'}','echo ${randomlist[\"$[RANDOM % ${#randomlist[@]}]\"]}','Option D uses Modulo to get a random number in the size of the array, and then gets that position from the array.'),(42,100,'C','When you echo $(date)it displays in the format: Mon Apr 18 10:18:15 PDT 2016\r\nHow would I get the minutes value from $(date)\r\n','echo $(date) | cut -f3 -d\':\'\r\n','echo $(date) | awk -F : {\'print $3\'}\r\n','echo $(date) | awk -F : {\'print $2\'}\r\n','echo $(date) | awk -F : {\'print $1\'}\r\n','-F will set the delimiter for awk. \r\n$1 would be\r\nMon Apr 18 10\r\n$3 would be:15 PDT 2016\r\nThe cut example pulls the same as awk -F : {\'print $3\'}'),(43,100,'C','Sometimes logs vary in format depending on software version. Imagine a scenario where you needed to get the time from the 3rd colum sometimes and the 4th column other times. How would you write an awk statement to print the important column? ','imptcolumn=\'3\'; awk -v $getcol=\"$imptcolumn\" {\'print getcol\'} /var/log/messages\r\n','imptcolumn=\'3\'; awk -v $getcol=\"$imptcolumn\" {\'print $getcol\'} /var/log/messages\r\n','imptcolumn=\'3\'; awk -v getcol=\"$imptcolumn\" {\'print getcol\'} /var/log/messages\r\n','imptcolumn=\'3\'; awk -v getcol=\"$imptcolumn\" {\'print $getcol\'} /var/log/messages\r\n','Here\'s how you would use this same concept to pull all child accounts of a reseller: \r\nuser=\'chases5\'; awk -vSEARCH=\"$user\" -F \\: \'match($0, user) {print $1}\' /etc/trueuserowners '),(44,100,'B','How would you print the number 38.18691032909810984 with two decimal places where the number is $moneyowed\r\n','echo -c1-5 $moneyowed\r\n','printf \"%0.2f\\n\" $moneyowed\r\n','echo $moneyowed | awk -F.{\'print $2\'}\r\n','echo $moneyowed | cut -c1-5\r\n','Cut will not round to the decimal, giving you an inaccurate total. printf is able to handle that more intelligently. '),(45,100,'A','COUNTER=99; until [  $COUNTER -lt 1 ]; do echo \"$COUNTER bottles of beer on the wall $COUNTER bottles of beer. Take one down pass it around $(($COUNTER -1 )) bottles of beer on the wall\" ; let COUNTER-=1; done\r\nThis command would work to create the lyrics to \"99 beers on the wall\"','True','False',NULL,NULL,'This was intended to introduce you to bash until loops. Until loops are a lot like while loops. Here is the basic syntax\r\nuntil condition; do thing; done\r\nBe careful not to get stuck in endless loop while using bash loops.'),(46,100,'D','How would you change the field separator in a for loop to a semi-colon from a space break for your session','for -d \';\'\r\n','for --delimiter=\';\'','RS=\';\'\r\n','IFS=\';\'\r\n','Setting the IFS allows you to run for loops on lines instead of breaking by delimiter. Otherwise you would need to use while instead of for. '),(47,100,'B','How would you change directories to the folder that contains the file that is symlinked at /usr/bin/custom-ns','cd $(basename(alias custom-ns))\r\n','cd $(dirname $(readlink -f $(which custom-ns)))\r\n','cd $(dirname $(which custom-ns))\r\n','cd $($(readlink -f $(which custom-ns)))\r\n','which will tell you where the symlink is\r\nreadlink will tell you where the symlink links to\r\ndirename will tell you that file\'s directory name'),(48,100,'B','echo \"I love dogs\" > pets\r\nsed \'s/dog/cat/g\' pets > pets2\r\ndiff -u pets pets2 > hello.patch\r\nIf you wanted to backport changes to pets2 back to pets, how would you do that. ','patch pets pets.patch','patch -R pets pets.patch','diff pets2 <<< pets.patch','diff -r pets2 < pets.patch','You would use patch -R, or reverse patch. If you reversed the order of the diff then you would not need the -R. '),(49,100,'D','How would you show the ctime of a file?\r\n','find ./ --display=ctime filename\r\n','stat -ctime filename\r\n','stat filename\r\n','ls -l --time=ctime filename\r\n','You can also do ls -l --time=mtime'),(50,100,'D','What does ctime represent','When the file was created','When the owner was changed','When the permissions were changed','When the inode was changed','ctime represents changes to the inode, or changes to owner, group, link count, mode, etc.\r\nIt is a very common misconception that it is the creation time of the file.');
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `email` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `points` int(11) NOT NULL,
  `UserPass` char(64) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '1' COMMENT 'Question Number last completed',
  `ResultJSON` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `UserID` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('poopbutt@inmotionhosting.com','butt','poop',15,'2016-04-07 21:38:51',0,'c8250a2b9b0c153577cfd54622d907af522d564e2e5c850a89b496320e1b4d6d',1,NULL),('chases@inmotionhosting.com','Stricklan','Chase',4,'2016-04-06 18:01:38',4700,'c8250a2b9b0c153577cfd54622d907af522d564e2e5c850a89b496320e1b4d6d',51,'{\"Quiz1\": {\"Q46\": [\"A\", \"Correct\"], \"Q47\": [\"D\", \"Correct\"], \"Q44\": [\"A\", \"Incorrect\"], \"Q45\": [\"A\", \"Incorrect\"], \"Q42\": [\"D\", \"Correct\"], \"Q43\": [\"A\", \"Incorrect\"], \"Q40\": [\"A\", \"Incorrect\"], \"Q41\": [\"A\", \"Correct\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"B\", \"Correct\"], \"Q50\": [\"B\", \"Incorrect\"], \"Q37\": [\"A\", \"Incorrect\"], \"Q51\": [\"D\", \"Correct\"], \"Q39\": [\"B\", \"Correct\"], \"Q38\": [\"A\", \"Correct\"]}}'),('jadonn@inmotionhosting.com','Naas','Jadon',6,'2016-04-06 18:20:56',0,'e8b83dcc381a314e1d4058b31aedd1eb2f4fc97256f7379a2a8fde0924c4974b',1,NULL),('jesser@inmotionhosting.com','Rhodes','Jesse',7,'2016-04-06 18:37:53',0,'f6aad5b7e361f89567a1c034c2bc739651e3e4d5fd3bef9a62dccbc61b91db37',1,NULL),('danielk@inmotionhosting.com','King','Daniel',8,'2016-04-06 18:41:41',0,'65b1b33ecb7786729fedcbbfd2d71766515d55c2f9dccc4cb3b472be131ea321',1,NULL),('madeleinef@inmotionhosting.com','Fehlman','Madeleine',9,'2016-04-06 19:00:11',0,'1b38c8b0a8faf24f4b3d43304e7bd5ec0bfc1aed246a1dbb80e3af2cc9375f0c',1,NULL),('jacobh@inmotionhosting.com','Hipps','Jacob',10,'2016-04-06 19:00:41',0,'2e1de2c84cde895a26cb8a3cb6a14c08744157adcb0e9b3c2d4dbb9fc7845fd0',1,NULL),('seanc@inmotionhosting.com','Combs','Sean',11,'2016-04-06 19:04:27',0,'b8c0c8bec6f4d90c89938d934ecb9b7b7c372a41a488110e7f948fbb95ae52c4',1,NULL),('blackrob@inmotionhosting.com','Rob','Black',12,'2016-04-06 20:55:35',0,'daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5',1,NULL),('courtney@inmotionhosting.com','Stricklan','Courtney',14,'2016-04-06 21:43:18',0,'5d476c53869cb03a888a6c3f9acc6cf9b218841d855634fd984bbdc05f8238e7',1,NULL),('davidb@inmotionhosting.com','bryant','dave',16,'2016-04-07 21:42:29',0,'a69a68287c2d037629fca2145931e5ffa1ecadfd150babce7d74595988bb31e4',1,NULL),('brandonf@inmotionhosting.com','Florin','Brandon',17,'2016-04-07 22:00:39',0,'d91a9cd46b63edff63d7775045da56fc9c8cb22c675bee2a40499dd9d7f946b8',1,NULL),('treyf@inmotiohosting.com','Faison','Trey',18,'2016-04-08 15:55:51',0,'0b87d8ee8a55fe5543e52b3276964301d975740261582dffb4f2142acfa842d4',1,NULL),('treyf@inmotionhosting.com','Faison','Trey',19,'2016-04-08 15:57:02',0,'0b87d8ee8a55fe5543e52b3276964301d975740261582dffb4f2142acfa842d4',1,NULL),('macel@inmotionhosting.com','louvier','mace',23,'2016-12-21 21:30:02',0,'00684628fee42dfb0f1a3576ed89045838564a5a5cfd087d1077f7681d5facc6',1,NULL),('toml@inmotionhosting.com','ludwig','tom',20,'2016-05-03 12:20:41',2600,'ab28b5e9c550a0c41f837544c56de18696c363a3b7d5f80f82a28783c573f167',51,'{\"Quiz1\": {\"Q46\": [\"B\", \"Incorrect\"], \"Q47\": [\"D\", \"Correct\"], \"Q44\": [\"D\", \"Incorrect\"], \"Q45\": [\"B\", \"Correct\"], \"Q42\": [\"D\", \"Correct\"], \"Q43\": [\"C\", \"Correct\"], \"Q41\": [\"A\", \"Correct\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"B\", \"Correct\"], \"Q50\": [\"D\", \"Correct\"], \"Q51\": [\"D\", \"Correct\"]}}'),('johnsi@inmotionhosting.com','Simpson','John',22,'2016-12-21 21:28:39',2400,'20eba7a9f572113cd906a5442430bce250dfb312aba8149d680cf9f85eb74ea0',51,'{\"Quiz1\": {\"Q46\": [\"A\", \"Correct\"], \"Q47\": [\"C\", \"Incorrect\"], \"Q44\": [\"D\", \"Incorrect\"], \"Q45\": [\"D\", \"Incorrect\"], \"Q42\": [\"C\", \"Incorrect\"], \"Q43\": [\"C\", \"Correct\"], \"Q41\": [\"A\", \"Correct\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"D\", \"Incorrect\"], \"Q50\": [\"B\", \"Incorrect\"], \"Q51\": [\"D\", \"Correct\"]}}'),('test@inmotionhosting.com','test','test',21,'2016-05-18 22:21:00',0,'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414',1,NULL),('collins@inmotionhosting.com','Simmons','Collin',25,'2016-12-21 22:15:15',0,'23c13615c42ecd54354df614523a2b92b19448d4e6a1f49bf61f51ed50a087e4',1,NULL),('keithe@inmotionhosting.com','e','keith',26,'2016-12-21 22:15:35',0,'ebf1eee550e1decd319d641155cfd344c68bc24bafcc3f5fa0c650f9645f6892',2,'{\"Quiz1\": {\"Q2\": [\"A\", \"Incorrect\"]}}'),('craigh@inmotionhosting.com','Harper','Craig',24,'2016-12-21 21:48:30',0,'0ef425d1600e2e14ddf203cf45f8c400a5ccb603a3c2ae28b8749a0a7a480b2b',1,NULL),('williamwa@inmotionhosting.com','Walters','Will',27,'2016-12-21 22:25:18',2000,'a4f1c133a9388edbd1acc58a03db59f83ed30f4856201ef8df533bb7566c6f16',51,'{\"Quiz1\": {\"Q46\": [\"A\", \"Correct\"], \"Q47\": [\"A\", \"Incorrect\"], \"Q44\": [\"B\", \"Incorrect\"], \"Q45\": [\"C\", \"Incorrect\"], \"Q42\": [\"C\", \"Incorrect\"], \"Q43\": [\"C\", \"Correct\"], \"Q41\": [\"D\", \"Incorrect\"], \"Q48\": [\"C\", \"Incorrect\"], \"Q49\": [\"D\", \"Incorrect\"], \"Q50\": [\"D\", \"Correct\"], \"Q51\": [\"D\", \"Correct\"]}}'),('michaelcl@inmotionhosting.com','Clayton','Mike',28,'2016-12-21 22:54:52',0,'ea1ad5df7361ea587722fba29159677c95fc75c1a409d6adb0d41a67eefb97d4',1,NULL),('conorf@inmotionhosting.com','Futro','Conor',36,'2016-12-28 18:46:01',4200,'75439dbb0498d88df0df81ec0fa4090da69e7ead42ce800dabd35e11f96dbadf',51,'{\"Quiz1\": {\"Q46\": [\"B\", \"Incorrect\"], \"Q47\": [\"D\", \"Correct\"], \"Q44\": [\"D\", \"Incorrect\"], \"Q45\": [\"B\", \"Correct\"], \"Q42\": [\"D\", \"Correct\"], \"Q43\": [\"C\", \"Correct\"], \"Q50\": [\"D\", \"Correct\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"A\", \"Incorrect\"], \"Q51\": [\"D\", \"Correct\"]}}'),('michaelcla@inmotionhosting.com','Clayton','Mike',29,'2016-12-21 23:14:12',0,'848db2f7c6464412be42d616925e7a54132890739b52e4a5079870bf74cca298',2,'{\"Quiz1\": {\"Q2\": [\"A\", \"Incorrect\"]}}'),('williamwh@inmotionhosting.com','Whitcomb','William',30,'2016-12-21 23:27:35',1500,'81e5b1e6c30e0e92118a8eb8a005d4a8001162db217d9a505393434cd178b024',35,'{\"Quiz1\": {\"Q35\": [\"D\", \"Incorrect\"], \"Q27\": [\"C\", \"Incorrect\"], \"Q31\": [\"B\", \"Incorrect\"], \"Q33\": [\"B\", \"Incorrect\"], \"Q32\": [\"A\", \"Incorrect\"], \"Q22\": [\"B\", \"Incorrect\"], \"Q23\": [\"D\", \"Incorrect\"], \"Q24\": [\"C\", \"Correct\"], \"Q25\": [\"B\", \"Correct\"], \"Q26\": [\"A\", \"Incorrect\"], \"Q34\": [\"B\", \"Correct\"], \"Q28\": [\"A\", \"Incorrect\"], \"Q29\": [\"C\", \"Incorrect\"], \"Q30\": [\"A\", \"Correct\"]}}'),('michaelr@inmotionhosting.com','R','Michael',31,'2016-12-21 23:27:38',2800,'ad96ff6dcc6f07c99657008bff1a12a6445a20a28510980972cf4a5ca5852c51',51,'{\"Quiz1\": {\"Q46\": [\"A\", \"Correct\"], \"Q47\": [\"D\", \"Correct\"], \"Q44\": [\"D\", \"Incorrect\"], \"Q45\": [\"B\", \"Correct\"], \"Q42\": [\"D\", \"Correct\"], \"Q43\": [\"B\", \"Incorrect\"], \"Q41\": [\"A\", \"Correct\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"B\", \"Correct\"], \"Q50\": [\"B\", \"Incorrect\"], \"Q51\": [\"A\", \"Incorrect\"]}}'),('allens@inmotionhosting.com','Sturgeon','Allen',32,'2016-12-21 23:32:35',700,'c5cabf307947e3f222aaca453553a60eff84072bf2921a9d6b4b25fdad2d06de',22,'{\"Quiz1\": {\"Q21\": [\"C\", \"Incorrect\"], \"Q22\": [\"C\", \"Incorrect\"]}}'),('harryj@inmotionhosting.com','Jackson','Harry',35,'2016-12-27 18:09:05',2300,'efe160e6f9da15cea51c7c36f07ad5e433b9a216f324758d764131158964a428',51,'{\"Quiz1\": {\"Q46\": [\"A\", \"Correct\"], \"Q47\": [\"D\", \"Correct\"], \"Q44\": [\"D\", \"Incorrect\"], \"Q45\": [\"D\", \"Incorrect\"], \"Q42\": [\"A\", \"Incorrect\"], \"Q43\": [\"B\", \"Incorrect\"], \"Q40\": [\"C\", \"Correct\"], \"Q41\": [\"A\", \"Correct\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"D\", \"Incorrect\"], \"Q50\": [\"D\", \"Correct\"], \"Q51\": [\"D\", \"Correct\"]}}'),('caseyb@inmotionhosting.com','B','Casey',33,'2016-12-22 17:50:37',4200,'6477415c54e95cf807801a2a9379e933fc30c2bbcb3780389bd0148e8adf935e',51,'{\"Quiz1\": {\"Q46\": [\"A\", \"Correct\"], \"Q47\": [\"D\", \"Correct\"], \"Q44\": [\"C\", \"Correct\"], \"Q45\": [\"B\", \"Correct\"], \"Q42\": [\"D\", \"Correct\"], \"Q43\": [\"C\", \"Correct\"], \"Q50\": [\"C\", \"Incorrect\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"A\", \"Incorrect\"], \"Q51\": [\"D\", \"Correct\"]}}'),('Docs@inmotionhosting.com','Tables','Bobby',34,'2016-12-23 05:31:08',800,'d1eebbd96eaea40144b89f73859a54c9528376bd90e902cea0f4ffac9e28cc21',15,'{\"Quiz1\": {\"Q3\": [\"A\", \"Incorrect\"], \"Q2\": [\"B\", \"Incorrect\"], \"Q5\": [\"B\", \"Correct\"], \"Q4\": [\"C\", \"Correct\"], \"Q7\": [\"B\", \"Correct\"], \"Q6\": [\"A\", \"Correct\"], \"Q9\": [\"D\", \"Correct\"], \"Q8\": [\"C\", \"Incorrect\"], \"Q15\": [\"A\", \"Correct\"], \"Q14\": [\"B\", \"Incorrect\"], \"Q11\": [\"A\", \"Incorrect\"], \"Q10\": [\"A\", \"Incorrect\"], \"Q13\": [\"A\", \"Correct\"], \"Q12\": [\"C\", \"Correct\"]}}'),('claytons','Shannon','Clayton',37,'2016-12-28 18:46:27',2100,'ba88f6504229348631eff209f64e572df04391b3bd2774c4bab1d80b47f5b232',51,'{\"Quiz1\": {\"Q46\": [\"A\", \"Correct\"], \"Q47\": [\"B\", \"Incorrect\"], \"Q44\": [\"C\", \"Correct\"], \"Q45\": [\"C\", \"Incorrect\"], \"Q42\": [\"D\", \"Correct\"], \"Q43\": [\"C\", \"Correct\"], \"Q41\": [\"A\", \"Correct\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"D\", \"Incorrect\"], \"Q50\": [\"B\", \"Incorrect\"], \"Q51\": [\"A\", \"Incorrect\"]}}'),('Craigharper2010@gmail.com','H','Craig',38,'2016-12-28 18:58:19',0,'c7a799a1de0c24c01668faeec6cff08fd68b68254a5a24d506578492191b50a8',1,NULL),('timr@inmotionhosting.com','Riggs','Tim',43,'2017-01-13 15:24:32',0,'8067412eeb5e2186a0c7ffcec11012fd7906129d4de3ad888f078ba308c48b51',1,NULL),('jeraldj@inmotionhosting.com','Johnson','Jerald',40,'2016-12-29 19:15:45',3000,'02e673f828f7ea345157433eb4ae6fdd21ee12c26f7286b63ec1b77953948c36',51,'{\"Quiz1\": {\"Q46\": [\"B\", \"Incorrect\"], \"Q47\": [\"A\", \"Incorrect\"], \"Q44\": [\"D\", \"Incorrect\"], \"Q45\": [\"B\", \"Correct\"], \"Q42\": [\"C\", \"Incorrect\"], \"Q43\": [\"B\", \"Incorrect\"], \"Q41\": [\"A\", \"Correct\"], \"Q48\": [\"B\", \"Correct\"], \"Q49\": [\"C\", \"Incorrect\"], \"Q50\": [\"C\", \"Incorrect\"], \"Q51\": [\"C\", \"Incorrect\"]}}'),('danieln@inmotionhosting.com','Nelems','Daniel',41,'2016-12-29 19:43:52',0,'b0d737c59ca7f93d95f1a092b5cd5f9a4c815602b951b5300d369f0cd3f950d5',3,'{\"Quiz1\": {\"Q3\": [\"A\", \"Incorrect\"], \"Q2\": [\"C\", \"Incorrect\"]}}'),('lorenzos@inmotionhosting.com','Salazar','Lorenzo',39,'2016-12-28 19:21:10',3200,'13f245446f85bb8b221a13aa358b087599bb4876f32e714ca8014ff731afc0c2',51,'{\"Quiz1\": {\"Q46\": [\"A\", \"Correct\"], \"Q47\": [\"D\", \"Correct\"], \"Q44\": [\"C\", \"Correct\"], \"Q45\": [\"B\", \"Correct\"], \"Q42\": [\"B\", \"Incorrect\"], \"Q43\": [\"C\", \"Correct\"], \"Q50\": [\"C\", \"Incorrect\"], \"Q48\": [\"D\", \"Incorrect\"], \"Q49\": [\"B\", \"Correct\"], \"Q51\": [\"B\", \"Incorrect\"]}}'),('jonathanb@inmotionhosting.com','Ball','Jon',42,'2017-01-13 15:07:51',2200,'6fcd5dce53f00488a994cd954fc4e9b971aeed598b2b23b0c65c26dda321c418',30,'{\"Quiz1\": {\"Q22\": [\"B\", \"Incorrect\"], \"Q23\": [\"D\", \"Incorrect\"], \"Q24\": [\"B\", \"Incorrect\"], \"Q25\": [\"B\", \"Correct\"], \"Q26\": [\"B\", \"Correct\"], \"Q27\": [\"D\", \"Correct\"], \"Q28\": [\"B\", \"Correct\"], \"Q29\": [\"D\", \"Correct\"], \"Q30\": [\"B\", \"Incorrect\"]}}'),('mathewl@inmotionhosting.com','Long','Mathew',46,'2017-06-06 19:55:24',3200,'ab0a250472004c1ae4728a2a7c5394448e34a9dab2084e5b03987dc7ee34981e',51,'{\"Quiz1\": {\"Q46\": [\"B\", \"Incorrect\"], \"Q47\": [\"D\", \"Correct\"], \"Q44\": [\"D\", \"Incorrect\"], \"Q45\": [\"B\", \"Correct\"], \"Q42\": [\"C\", \"Incorrect\"], \"Q43\": [\"C\", \"Correct\"], \"Q50\": [\"C\", \"Incorrect\"], \"Q48\": [\"C\", \"Incorrect\"], \"Q49\": [\"B\", \"Correct\"], \"Q51\": [\"D\", \"Correct\"]}}'),('allenp@inmotionhosting.com','Pittard','Allen',44,'2017-01-13 15:33:56',0,'3b4cc4be881299f060de8249c7b762c58f0fa34590868bffe9e842ed54d0915b',1,NULL),('michaelk@inmotionhosting.com','Kuchta','Michael',45,'2017-01-19 22:46:08',100,'5b9806448615e26e7e96b3d67438516713a7a86cf616693759e43343a69027da',2,'{\"Quiz1\": {\"Q2\": [\"D\", \"Correct\"]}}'),('coreye@inmotionhosting.com','E','Corey',47,'2017-08-08 20:54:35',100,'c4a6ba6e514015d689eeb53559b0ff05ffd65468a4f3965951fff4932665c76f',2,'{\"Quiz1\": {\"Q2\": [\"D\", \"Correct\"]}}'),('jasonsm@inmotionhosting.com','Smith','Jason',48,'2017-08-08 20:55:59',0,'53a02fb05ff4ae7e2d2269ea7beb6e3b396e075ba2307ba2007cd51417d61954',1,NULL),('willp@inmotionhosting.com','P','Will',49,'2017-08-08 21:03:45',1600,'0afdb44ebe9ab0811f9c7704c23c8b235f53d9d226e93df9040b5964953ec70c',23,'{\"Quiz1\": {\"Q22\": [\"D\", \"Incorrect\"], \"Q23\": [\"D\", \"Incorrect\"]}}');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-09 10:16:16