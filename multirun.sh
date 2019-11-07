# to be used with git bisect; use 'exit 0/1' instead of break; will run jest tests a given number of times.

NUMBEROFRUNS="$1"
if [ $# -eq 0 ] ; then echo 'Please provide a number of runs: '; read NUMBEROFRUNS ; fi

TESTFILE="$1"
if [ $# -eq 0 ] ; then echo 'Please provide a test file name: '; read TESTFILE ; fi

for i in {1..$NUMBEROFRUNS}; do
   echo "\n\n============================ will run test nr. $i"
   jest --bail --config jest.config.json $TESTFILE
   if [[ $? -eq 0 ]]; then
       echo "The result is successful"
   else
       echo "The result is unsuccessful"
       break
   fi
done
