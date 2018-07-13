pragma solidity ^0.4.22;

contract MultiNumberBettingV3 {

    uint loserCount;
    uint winnerCount;
    string lastWinnerName;
    uint8[3] storageArray;
    uint public lastWinnerAt;

   constructor(uint8 num1, uint8 num2, uint8 num3) public {
        storageArray[0] = num1;   // 0
        storageArray[1] = num2;   // 5
        storageArray[2] = num3;   // 7
    }  

    function guess(uint8 betNumber, string name) public returns(bool) {
    
    for(uint8 i=0; i < storageArray.length; i++){
        if (storageArray[i] == betNumber) {
        // Increase the winner count
          winnerCount++;
          lastWinnerName = name;
          lastWinnerAt = block.timestamp;
          return true;
        } 
     }
     
    loserCount++;
    return false;
    } 

  // Ex-3
  function getLastWinner() returns (string) {

      bytes memory nameBytes = bytes(lastWinnerName);
      // If no winner send "***"
      if (nameBytes.length == 0) {
        return "***";
      }

    string memory retString = new string(3);

    bytes memory toReturn = bytes(retString);

    // 2nd check to cover a winner name less than 3 bytes
    for (uint i = 0; (i < 3) && (i < nameBytes.length); i++) {
      toReturn[i] = nameBytes[i];
    }

    return string(toReturn);
  }

// Total Bet played in the game
  function totalGuesses() public returns (uint){
      return (winnerCount+loserCount);
  }

  function daysSinceLastWinning() returns(uint){
    uint currentDateTime = block.timestamp;
    uint dayPassed;

    if (lastWinnerAt == 0) {
      return 0;
    } else {
     dayPassed = (currentDateTime - lastWinnerAt)/24;
     return dayPassed;
    }
  }
 
  function hoursSinceLastWinning() returns(uint){
    uint currentDateTime = block.timestamp;
    uint dayPassed;

    if (lastWinnerAt == 0) {
      return 0;
    } else {
     dayPassed = ((currentDateTime - lastWinnerAt)*60)/24;
     return dayPassed;
    }
  }

  function minutesSinceLastWinning() returns(uint){
    uint currentDateTime = block.timestamp;
    uint dayPassed;

    if (lastWinnerAt == 0) {
      return 0;
    } else {
     dayPassed = ((currentDateTime - lastWinnerAt)*60*60)/24;
     return dayPassed;
    }
  }
}
