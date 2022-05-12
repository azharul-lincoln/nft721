pragma solidity ^0.8.2;

contract ERC721 {

    mapping(address => uint256) internal _balances;
    
    mapping(uint256 => address) internal _owoners;
    
    mapping(address => mapping(address => bool )) private _operatorApprovals;

    mapping(uint256 => address) private _tokenApprovals;

    event ApprovalForAll(address indexed _owoner, address indexed operator, bool _approved);
    event Approval(address _owoner, address _approved, uint256 _tokenId);

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

    /// Enable or disable an oparetor to manage all of msg.senders assets
    function setApprovalForAll( address operator, bool approved) public {
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    /// Check if an address is an oparetor for another address
    function isApprovedForAll(address owoner, address operator) public view returns(bool) {
        return _operatorApprovals[owoner][operator];
    }

    //Updates an approves address for NFT
    function approve(address to, uint256 tokenId) public {
        address owoner = owonerOf(tokenId);
        _tokenApprovals[tokenId] = to;
        emit Approval(msg.sender, to, tokenId);
    }

    // function getApproved();
}

