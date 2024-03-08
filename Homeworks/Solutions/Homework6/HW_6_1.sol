pragma solidity ^0.8.0;

contract EthAmountReturner {
    function returnEthAmount() external payable returns (uint) {
        
    uint amount;        
        assembly {
            amount := callvalue()
        }        
        return amount;
    }
}
