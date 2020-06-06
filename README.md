# Alpinism

This project is a collection of programming exercises from [Exercism](https://exercism.io/) ported to Salesforce.

Usually this will be as pure Apex code, but as the exercise may merit, some solutions may also include SObjects,
Lightning Web Components, or other Salesforce technologies.

When possible SObjects have been preferred over "pure" Apex _metadata.objects because SObjects allow for named parameters,
accessing by SObjectField, and potentially other properties and methods which may prove desirable.


## Exercises

| Exercism Name | Other Names | Project Prefix |
|---------------|-------------|----------------|
| [Allergies](https://exercism.io/my/solutions/c3a9418b940e443ca1042ffb0d544dba) | | ALP_ALG_ |
| [Bowling](https://exercism.io/my/solutions/594e2a57d9014c61b53587f4a73a574b) | | ALP_BOWL_ |
| [Connect](https://exercism.io/my/solutions/d1a4151ec4c84d2fb3d8aedbc0a63795) | [Hex](https://en.wikipedia.org/wiki/Hex_%28board_game%29) / Polygon / CON-TAC-TIX | ALP_CONX_ |
| [Custom Set](https://exercism.io/my/solutions/a660b002e1c14679895063781fb4dd16) |   | ALP_CSET_ |
| [Crypto Square](https://exercism.io/my/solutions/1ab1e10566f7451e8bf3153774764f68) | | ALP_CSQ_ |
| [Largest Series Product](https://exercism.io/my/solutions/1c9b756be40f41cbb9f223ef288f83b3) | | ALP_LSP_ |
| [Minesweeper](https://exercism.io/my/solutions/e51061d187544c768322562a45359b09) | | ALP_MNSP_ |
| [Simple Cipher](https://exercism.io/my/solutions/4faeaede7a874e8db4696d3b336f49e3) | [Caesar Cipher](https://en.wikipedia.org/wiki/Caesar_cipher) | ALP_SCIP_ |
| [Sieve](https://exercism.io/my/solutions/1a8c99b313e346a59e30190d642b9547) | [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) | ALP_SIVE_ |
| [Spiral Matrix](https://exercism.io/my/solutions/17c85d91725648abb399fe7b85552d7d) | | ALP_SMTX_ |

## Testing Notes

While for real world project I generally advocate [Martin Fowler's Test Pyramid](https://martinfowler.com/articles/practical-test-pyramid.html),
for these exercises, I've followed a philosophy of [Lean Testing](https://medium.com/@AWGHodder/lean-testing-f900b5a7e82e),
only included Apex adaptations of the original challenges.  

Tests can and should be executed as normal when or after being deployed to any Salesforce org.
I recommend execution with [IntelliJ IDEA](https://www.jetbrains.com/idea/) [Illuminated Cloud](http://www.illuminatedcloud.com/),
however it they can also be executed with Salesforce's built in Developer Console.  
(i.e., through the Developer Console, through the Metadata API by way of any IDE or build too, etc.) 

In order to ensure consistent test execution, all tests uses:
* `Test.startTest()`
* `Test.stopTest()`
* `System.runAs()`

Test Users are generated leveraging the [eXtreme Apex Test Data Factory (XFT)](https://github.com/nilvon9wo/ExtremeApexTestDataFactory).  
This is overkill for pure Apex projects, but may be useful if/when some exercises also use other SObjects.

Test framework code uses two prefixes:

| Prefix | Description                                                     |
|--------|-----------------------------------------------------------------|
| XFTY_  | Code belonging to the extreme Apex Test Data Factory            |
| TEST_  | Code which is or may be modified to be specific to this project |

The class `XFTY_DummySObjectFactoryOutletLookup` leverages the [Business Delegate Pattern](https://www.tutorialspoint.com/design_pattern/business_delegate_pattern.htm) to
locate required "FactoryOutlets" which contain the specifications for each SObject. 

 