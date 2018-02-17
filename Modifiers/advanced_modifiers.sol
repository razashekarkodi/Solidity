pragma solidity ^0.4.*;

contract modifiers{
    
    struct Emp{
        string Name;
    }
    
    bool locked = false;
    
    mapping(string => Emp) emp;
    
    //modifier will update the locked to true before executing the function and then updates locked to false
    modifier lock(){
        locked = true;
        
        _;
        
        locked = false;
    }
    
    function addEmpWithModifier(string _name) lock public {
        if(locked){
            revert();
        }
        
        Emp memory tmp;
        tmp.Name = _name;
        
        emp[_name] = tmp;
    }
    
    function addEmp(string _name) public {
        Emp memory tmp;
        tmp.Name = _name;
        
        emp[_name] = tmp;
    }
    
    function getLockValue() view public returns(bool){
        return locked;
    }
    
}
