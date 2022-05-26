// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./ERC721.sol";

/**
 *
 * Support document
 * https://vanity-eth.tk/ public and private key for testing
 * public_key: 0x7Da46A30119546Fb453281fb4004Ad2A8dDBCD03
 * private_key: edd7f4be23e4d132e3721c6127e167c508664c238065836bbd9c1667777385dd
 *
 * Ropsten Pub_K: 0x07F40064a260b0715f815Eb58837Fee32D79e79C
 * Ropsten Private_K: e61f5ad4cccfd9dd92eccde5bec836077fae9e20d4ae3f5676b82ed4aed46d6f

 */

contract SuperMarioWorld is ERC721 {
    string public name; // ERC 721Metadata

    string public symbol; // ERC 721Metadata

    uint256 public tokenCount;

    mapping(uint256 => string) private _tokenURIs;

    /**
     * @dev
     * 1.
     */
    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    /**
     * Returns a URL tht points to the metadata
     * @dev Throw if invalid tokenId
     */
    function tokenURI(uint256 tokenID) public view returns (string memory) {
        require(_owoners[tokenID] != address(0), "TokenId does not exit");
        return _tokenURIs[tokenID];
    }

    /**
     * Create a new NFT inside our collection
     *
     */
    function mint(string memory _tokenURI) public {
        tokenCount += 1; //tokenID
        _balances[msg.sender] += 1;
        _owoners[tokenCount] = msg.sender;
        _tokenURIs[tokenCount] = _tokenURI;

        emit Transfer(address(0), msg.sender, tokenCount);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        pure
        override
        returns (bool)
    {
        return interfaceId == 0x80ac58cd || interfaceId == 0x5b5e139f;
    }
}
