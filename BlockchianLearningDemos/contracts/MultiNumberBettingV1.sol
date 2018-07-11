pragma solidity ^0.4.22;


contract MultiNumberBettingV1 {

    uint loserCount;
    uint winnerCount;
    uint8[3] storageArray;

    function guess(uint8 betNumber) public returns(bool) {
      bool flag;

     for(uint8 i; i < storageArray.length; i++){
        if (storageArray[i] == betNumber) {
          flag = true;
          winnerCount++;
          break;
        } else {
          flag = false;
        }
       
     }
     
       if (flag = false){
          loserCount++;
       }
      return flag;
    } 

    function totalGuesses() public view returns (uint){
      return (winnerCount + loserCount);
    }

     constructor(uint8 num1, uint8 num2, uint8 num3) public {
        storageArray[0] = num1;   // 0
        storageArray[1] = num2;   // 5
        storageArray[2] = num3;   // 7
    }   
}
