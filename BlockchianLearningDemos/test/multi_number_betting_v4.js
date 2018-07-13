var MultiNumberBettingV4 = artifacts.require("./MultiNumberBettingV4.sol");

contract('MultiNumberBettingV3', function(accounts) {
  it("should assert true", function() {
    var multi_number_betting_v4;
    return MultiNumberBettingV4.deployed().then(function(instance){
      multi_number_betting_v4 = instance;
      
      // Send a losing guess
      multi_number_betting_v4.guess(8,"John Miller")
     
      // Get the winner name
      return multi_number_betting_v4.getLastWinner.call();

    }).then(function(result){
      console.log("Winner name= "+result);

      // Send a winning guess
      multi_number_betting_v4.guess(3,"Bob Davis")
      return multi_number_betting_v4.totalGuesses.call();
    }).then(function(result){
      console.log("Winner name= "+result);

      return multi_number_betting_v4.daysSinceLastWinning.call();
    }).then(function(result){
      console.log("Days Since Last Winning=",result);
      // Get the winner name
      return multi_number_betting_v4.getLastWinner.call();
    }).then(function(result){
      console.log("Winner name= "+result);
      assert.isTrue((result) == 'Bob');
    });
  });
});