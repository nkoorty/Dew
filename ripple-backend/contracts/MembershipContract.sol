// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MembershipContract {

    address public owner;
    uint256 public membershipFee;
    mapping(address => bool) public members;
    mapping(address => uint256) public membershipExpiry;

    event NewMember(address indexed member, uint256 expiry);
    event MembershipRenewed(address indexed member, uint256 expiry);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    constructor(uint256 _membershipFee) {
        owner = msg.sender;
        membershipFee = _membershipFee;
    }

    function joinSociety() external payable {
        require(msg.value == membershipFee, "Incorrect membership fee.");
        require(!members[msg.sender], "Already a member.");

        members[msg.sender] = true;
        membershipExpiry[msg.sender] = block.timestamp + 365 days;

        emit NewMember(msg.sender, membershipExpiry[msg.sender]);
    }

    function renewMembership() external payable {
        require(msg.value == membershipFee, "Incorrect membership fee.");
        require(members[msg.sender], "Not a member.");
        require(membershipExpiry[msg.sender] < block.timestamp, "Membership still active.");

        membershipExpiry[msg.sender] += 365 days; 

        emit MembershipRenewed(msg.sender, membershipExpiry[msg.sender]);
    }

    function checkMembershipStatus(address _member) external view returns (bool) {
        if (membershipExpiry[_member] > block.timestamp) {
            return true; 
        } else {
            return false; 
        }
    }

    function changeMembershipFee(uint256 _newFee) external onlyOwner {
        membershipFee = _newFee;
    }

    function withdraw() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    fallback() external payable {
        revert("Cannot send ETH directly to this contract.");
    }
}
