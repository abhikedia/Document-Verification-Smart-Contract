This contract uses solidity version 0.5.0

The name of the smart contract is 'verify'. It has a structure named verification which stores details of uploaded documents such as-
1. document_name(stores type of document example birth certificate, mark sheets,etc.)
2. Then it has document_number(Every document is assigned a unique number for verification. This takes that unique number as an input).
3. It also has uploaded_by which stores the address of the person by whom the document was uploaded.
4. It contains a bool variable which checks any document with that hash exists previously or not.

The structure is being mapped to string type. It maps the details of the document entered in structure with the hash of that document.
**There are various tools which can be used to find the hash of any document. We need to choose a common hashing algorithm for hashing all the documents and later for verifying them.
  Otherwise, it may be a problem that hashing is done using SHA-256 and document verification is being done after hashing the document with MD5. The documents will never match!
 Let's say we use SHA-256.

Then there is a function named 'store' which takes 3 inputs -document name, document number, and the hash of the document generated using any tool. It stores the details of the document on the 
blockchain.
There is a function 'verify_data' which takes the hash of document and verifies whether the document has previously been uploaded or not. If the hash matches, the details of the document is
printed along with the address of the person who uploaded that document.

**After uploading any document, no unique id is assigned to that document by this smart-contract. As there is no point of remembering the id to verify it in the future.
  Instead, the hash can directly be entered and checked whether a document is present or not.

At last, there is a modifier whose purpose is to check that no document gets uploaded more than once. As uploading documents cost gas and there is no point of uploading the same document several times. Each document will have a different hash and so there is no chance of two documents having the same hash.

How is this smart contract working?
This contract takes details of your document such as document number, type of document and hash of that document. These details are stored in a structure which is mapped to a string which is hash of the document. Before storing a new document, the contract checks whether the document has previously been uploaded or not. If it has, the document is not uploaded and a message is logged. For verification, the hash of a document is entered. If it matches with the hash of any document which has been uploaded previously, the details of the document along with the address of the person who uploaded that document is displayed. Otherwise, the document was never uploaded or the document has been tampered. 
The documents should be uploaded by some verified authority. So there is no case of tampering from their side. And each time, the document is verified by someone, he may get authentic details.