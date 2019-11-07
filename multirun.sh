;; to be used with git bisect; use 'exit 0/1' instead of break; can run tests a given number of times.

for i in {1..30}; do
   echo "\n\n============================ will run test nr. $i"
   jest --bail --config jest.config.json ./src/web-push/__tests__/WebPushService.test.ts
   if [[ $? -eq 0 ]]; then
       echo "The result is successful"
   else
       echo "The result is unsuccessful"
       break
   fi
done
