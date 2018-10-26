pragma solidity ^0.4.21;

contract Lottery {
    address public manager;
    address[] public players;

    constructor() public {
        manager = msg.sender;
    }

    function enter() public payable {
    	require(msg.value > .01 ether);
        players.push(msg.sender);
    }

    function random() private view returns (uint) {
    	// sha3() / keccak256() 도 require() 처럼 global function
        return uint(keccak256(abi.encodePacked(block.difficulty, now, players)));
    }
    
    function pickWinner() public {
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address[](0);
    }
    
    modifier restricted() {
        require(msg.sender == manager);
        _; // function 에 restricted 키워드가 있으면 _에 해당 function 코드들이 들어간다.
    }
    
    function getPlayers() public view returns(address[]) {
        return players
    }
    
}