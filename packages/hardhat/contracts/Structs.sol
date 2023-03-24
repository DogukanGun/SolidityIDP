pragma solidity >= 0.8.0  < 0.9.0;

import "hardhat/console.sol";

contract Structs{

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] todos;

    function getTodoOf(uint _index) public view returns(string memory text){
        Todo memory todo = todos[_index];
        return todo.text;
    }

    function setTodoOf(string calldata _todo) public onlyOwner{
        todos.push(Todo(_todo,false));
    }

    modifier onlyOwner() {
        require(msg.sender == owner,"Not owner");
        _;
    }
}