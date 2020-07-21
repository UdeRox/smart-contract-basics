pragma solidity >=0.4.21 <0.7.0;

contract ApprovalContract {

    address public sender;
    address public receiver;
    address public constant approver = 0xC232132;

    function deposit(address _receiver) external payable{
        require(msg.value >  0);
        sender = msg.sender;
        receiver = _receiver;
    }

    function viewApprover() external pure returns(address){
        return (approver);
    }

    function approve() external {
        require(msg.sender == approver);
        receiver.transfer(address(this).balance);
    }

}