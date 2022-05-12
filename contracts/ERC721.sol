pragma solidity ^0.8.2;

contract ERC721 {
    
    mapping(address => uint256) internal _balances;
    mapping(uint256 => address) internal _owoners;



    // Returns the number of NFT's assigned to an owoner
    function balanceOf(address owoner) public view returns(uint256){
        require( owoner != address(0), "Address is zero" );
        return _balances[owoner];
    }

    // Find the address of the owoner of the NFT
    function owonerOf( uint256 tokenId ) public view returns(address){
        address owoner = _owoners[tokenId];
        require(owoner != address(0), "Invalid token id");
        return owoner;
    }

}

