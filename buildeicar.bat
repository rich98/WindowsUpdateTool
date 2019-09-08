echo off

set p1=X5O!P%%@
set p2=AP[4\PZX54(P
set p4=)7CC)7}$EICAR
set p5=-STANDARD
set p6=-ANTIVIRUS-
set p7=TEST-
set p8=FILE!$H+
set p9=H*


echo %p1%%p2%^^%p4%%p5%%p6%%p7%%p8%%p9% >buildeicar.txt

rem This file creates the eicar test string used to test antivirus products. I'm going to show you an issue with windows defender
rem The set commands are used to breakup the string so not to trigger the antivirus product 
rem The full string can be found here http://2016.eicar.org/85-0-Download.html its near the bottom of that page