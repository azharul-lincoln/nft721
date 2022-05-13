pragma solidity ^0.8.2;

contract ERC721 {

    mapping(address => uint256) internal _balances;
    
    mapping(uint256 => address) internal _owoners;
    
    mapping(address => mapping(address => bool )) private _operatorApprovals;

    mapping(uint256 => address) private _tokenApprovals;

    event ApprovalForAll(address indexed _owoner, address indexed operator, bool _approved);
    event Approval(address indexed _owoner, address indexed _approved, uint256 _tokenId);
    event Transfer( address indexed _from, address indexed _to, uint256 indexed _tokenId );


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
        
        emit ApprovalForAll( msg.sender, operator, approved );
    }

    /// Check if an address is an oparetor for another address
    function isApprovedForAll(address owoner, address operator) public view returns(bool) {
        return _operatorApprovals[owoner][operator];
    }

    //Updates an approves address for NFT
    function approve(address to, uint256 tokenId) public {
        address owoner = owonerOf(tokenId);
        require(msg.sender == owoner || isApprovedForAll( owoner, msg.sender), "msg.sender is not owoner or approved oparetor" );
        _tokenApprovals[tokenId] = to;
        emit Approval(msg.sender, to, tokenId);
    }

    /// Gets the approved address for a single NFT
    function getApproved( uint256 tokenId) public view returns (address) {
        require( _owoners[tokenId] != address(0) , "token id does not exits" );
        return _tokenApprovals[tokenId];
    }

    function transferFrom( address from, address to, uint256 tokenId ) public {
        address owoner = owonerOf(tokenId);

        require( 
            msg.sender == owoner ||
            isApprovedForAll( owoner, msg.sender) || 
            getApproved(tokenId) == msg.sender, 
            "MSG.SENDER is not alowed for the transfer"
        );

        require( 
            from == owoner,
            "invalid owenr of the NFT"
        );

        require( 
            to == address(0),
            "invalid address to transfar the NFT"
        );

        require( 
            _owoners[tokenId] != address(0),
            "tokenId is not a valid NFT"
        );
        
        
        //removing all approval for the NFT that have given by the old owoner
        approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owoners[tokenId] = to;

        emit Transfer( from, to, tokenId);

    }
}

