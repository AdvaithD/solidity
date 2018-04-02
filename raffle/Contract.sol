pragma solidity ^0.4.20;

contract Blocksplit {
    // declaring variables
    
    // List of addresses, variable named 'players'.
    // address datatype in solidity
    address[] public players;
    
    // Save unique players
    // Mapping datatype: two column table, sort of like key-value store. Key is address, value is bool
    mapping (address => bool) public uniquePlayers;
    
    // Variable to save winners
    address[] public winners;
    
    // Variable which stores address where funds are going to be sent
    // Append 'public' to variables, function allowing external entities to inspect value will
    // be generated
    address public charity = 0x94E4AD8635617BB984E415b0Ac9Af757A3274709;
    
    // accept payments - nameless function declared as 'payable'
    // external - only called from outside the contract
    // payable - 
    function() external payable {
        play(msg.sender);
    }
    
    // Enter raffle
    // 1 - Send directly to contract addres(fallback function invoked)
    // 2 - call play function
    function play(address _participant) payable public {
        // msg - transaction
        // msg.value - 
        require (msg.value >= 1000000000000000 && msg.value <= 100000000000000000);
        require (uniquePlayers[_participant] == false);
        
        // builtin 'push' function in lists
        players.push(_participant);
        
        // Logging participation
        uniquePlayers[_participant] = true;
        
    }
}