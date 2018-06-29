pragma solidity ^0.4.17;

import "./Ownable.sol";

contract Sponsor is Ownable{

    string name;
    string url;
    bytes32 imageHash;
    uint64 startTime;
    uint duration;

    constructor(string _name,string _url,bytes32 _imageHash,uint _duration) public {
        name=_name;
        url=_url;
        imageHash=_imageHash;
        startTime=uint64(now);
        duration=_duration;
    }

    function setUrl(string _url)public onlyOwner{
        url=_url;
    }
    function getUrl()public view returns (string){
        return url;
    }
    function setHash(bytes32 _imageHash)public onlyOwner{
        imageHash=_imageHash;
    }
    function getHash()public view returns (bytes32){
        return imageHash;
    }
    function setName(string _name)public onlyOwner{
        name=_name;
    }
    function getName()public view returns (string){
        return name;
    }
    function kill(bool flag) public onlyOwner{
        require(flag);
        selfdestruct(owner);
    }
    function getSponsor() public view returns(string ,string ,bytes32 ){
        return (name, url,imageHash);
    }
    function getDuration()public view returns (uint){
        return duration;
    }
}