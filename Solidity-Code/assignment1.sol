pragma solidity ^0.8.0;

interface Vehicle{
    event log(string);
    function service() virtual external;
}

contract Car is Vehicle{
    function service() override virtual public{
        emit log("Car Service");
    }
}

contract Truck is Vehicle{
    function service() override virtual public{
        emit log("Truck Service");
    }
}

contract Mbike is Vehicle{
    function service() override virtual public{
        emit log("Mbike Service");
    }
}

contract CarBike is Car, Mbike{
     function service() override(Car, Mbike) public{
        emit log("CarBike.Service");
    }
}

contract ServiceCenter{
    function DoService() public {
        CarBike rickshaw= new CarBike();
        rickshaw.service();
    }
}
