// License 
// SPDX-License-Identifier: LGPL-3.0-only

// Solidity version
pragma solidity 0.8.24;

//Contract 
contract PropertyRegistry {
    // Structure to store the details of each property
    struct Property {
        uint256 id;
        string description; 
        address owner; // Address of actual owner  
    }
 
    //Mapping to store properties by ID
    mapping(uint256 => Property)public properties;

    //Event for register activity 
    event PropertyRegistered(uint256 id, string description, address owner);
    event OwnershipTransferred(uint256 id, address previousOwner, address newOwner);

    //Check the owner
    modifier onlyOwner(uint256 _id) {
        require(properties[_id].owner == msg.sender, "You are not the Owner");
        _;
    }
 
    // Function to register a new property
    function registerProperty(uint256 _id, string memory _description) public {
        require(properties[_id].owner == address(0), "The ID is registered");
        properties[_id] = Property({
            id: _id,
            description: _description,
            owner: msg.sender
        });

        emit PropertyRegistered(_id, _description,msg.sender);
    }

    //Funtion to transfer the property
    function transferOwnership(uint256 _id, address _newOwner) public onlyOwner(_id){
        require(_newOwner != address(0), "The new Owner can't be the direction zero");

        address previousOwner = properties[_id].owner;
        properties[_id].owner = _newOwner;

        emit OwnershipTransferred(_id, previousOwner, _newOwner);
    }

    //Funtion to consult the details of property
    function getProperty(uint _id) public view returns(Property memory) { 
        require(properties[_id].owner != address(0), "Property not registred");
        return properties[_id];
    }



}