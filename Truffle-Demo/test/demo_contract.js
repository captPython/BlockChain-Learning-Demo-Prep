contract('DemoContract', function(accounts) {
  it("should assert true", function(done) {
    var demo_contract = DemoContract.deployed();
    assert.isTrue(true);
    done();
  });
});
