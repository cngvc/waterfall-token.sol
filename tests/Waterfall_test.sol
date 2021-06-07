// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
import "remix_tests.sol"; 
import "remix_accounts.sol";
import "../contracts/Waterfall.sol";

contract WaterfallTest is Waterfall {
    uint256 supply = 1000000000 * 10**12;
    
    address recipientWithFee;
    address recipientNoFee;
    
    function beforeAll() public {
        recipientWithFee = TestsAccounts.getAccount(1);
        recipientNoFee = TestsAccounts.getAccount(2);
    }

    function initTest() public {
        Assert.equal(name(), "Waterfall", "Token should be has a name");
        Assert.equal(symbol(), "WATERFALL", "Token should be has a symbol");
        Assert.equal(totalSupply(), supply, "Token should be has supply");
        Assert.equal(balanceOf(msg.sender), supply, "Token owner should be has volumn");
    }
    
    function transferTestWithFee() public {
        transfer(recipientWithFee, 1000000000 * 10**2);
        uint256 recipientTokens = balanceOf(recipientWithFee);
        Assert.equal(recipientTokens, 1000000000 * 10**2 * 0.98, "Transfer should be successfully with fee 2%");
        Assert.equal(totalFees(), 1000000000 * 10**2 * 0.02, "Total fee should be equal 2% of transaction volumn");
    }
    
    function transferTestNoFee() public {
        excludeFromFee(msg.sender);
        transfer(recipientNoFee, 1000000000 * 10**2 );
        uint256 recipientTokens = balanceOf(recipientNoFee);
        Assert.equal(recipientTokens, 1000000000 * 10**2, "Transfer should be successfully with fee 0%");
    }
}
