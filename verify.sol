pragma solidity ^0.5.0;

/*
Contract name is verify
It has a structure named verification consisting of various variables
*/
contract verify
{
    struct verification{
        string document_name; //type of document example birthcertificate,marksheet,etc.
        uint document_number; //Every document has a valid number. This variable stores that number.
        address uploaded_by; //It stores the address of person who uploaded the documnent.
        bool value; //It is used to check whether the document has been upoaded previously or not.
    }
    
    mapping(string=> verification) hash; //It maps the structure with unique hash of every document.
    
    /*function store is used to upload the document on blockchain
    It takes 3 inputs- document_name, document_number and hash of the document
    */
   function store(string memory name,uint number,string memory _hash) necessary(_hash) public{
        hash[_hash]=verification(name,number,msg.sender,true);
    }
    
    /* function verify is used to check the validity of the document
    Instead of assigning any id to uploaded document to verify in future,
    it takes document hash as input and tells if the document is present along with the details 
    of the document.
    */
    function verify_data(string memory _hash) public view returns(string memory,uint,address){
        if(hash[_hash].value){
            return(hash[_hash].document_name,hash[_hash].document_number,hash[_hash].uploaded_by);
        }
    }
    
    //modifier checks whether a document has been pre uploaded or not.
    //If it exists, message 'Document already uploaded' is displayed.
    modifier necessary(string memory _hash){
        bool present;
        if(hash[_hash].value)
            present=true;
        else
            present=false;
        require(!present,'Document already uploaded');
        _;
    }
   
}