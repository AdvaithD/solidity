pragma solidity ^0.4.2;

// Following Auth0 blog tutorial
// https://auth0.com/blog/an-introduction-to-ethereum-and-smart-contracts-part-2/

// Owner claims contract
// Accounts ability to record key-value data

// Simple contract that acts as a datastore in the form of multiple key-value stores
// address -> (key -> value)

contract DataStore {

    string constant public defaultKey = "default";

    mapping(address => mapping(string => string)) private owners;

    function setClaim(string key, string value) {
        owners[msg.sender][key] = value;
    }

    function getClaim(address owner, string key) constant returns (string) {
        return owners[owner][key];
    }

    function setDefaultClaim(string value) {
        setClaim(defaultKey, value);
    }

    function getDefaultClaim(address owner) constant returns (string) {
        return getClaim(owner, defaultKey);
    }

}