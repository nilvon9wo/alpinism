# Alpinism

This project is a collection of programming exercises from [Exercism](https://exercism.io/) ported to Salesforce.

Usually this will be as pure Apex code, but as the exercise may merit, some solutions may also include SObjects,
Lightning Web Components, or other Salesforce technologies.

When possible SObjects have been preferred over "pure" Apex _metadata.objects because SObjects allow for named parameters,
accessing by SObjectField, and potentially other properties and methods which may prove desirable.


## Exercises

| Exercism Name | Other Names | Project Prefix |
|---------------|-------------|----------------|
| [Allergies](https://exercism.org/tracks/elixir/exercises/allergies) | | ALP_ALG_ |
| [Bowling](https://exercism.org/tracks/elixir/exercises/bowling) | | ALP_BOWL_ |
| [Connect](https://exercism.org/tracks/elixir/exercises/connect) | [Hex](https://en.wikipedia.org/wiki/Hex_%28board_game%29) / Polygon / CON-TAC-TIX | ALP_CONX_ |
| [Custom Set](https://exercism.org/tracks/elixir/exercises/custom-set) |   | ALP_CSET_ |
| [Crypto Square](https://exercism.org/tracks/elixir/exercises/crypto-square) | | ALP_CSQ_ |
| [Hello World](https://exercism.org/tracks/java/exercises/hello-world) | | ALP_HW_ |
| [Cook your lasagna](https://exercism.org/tracks/java/exercises/lasagna) | | ALP_LSGN_ |
| [Largest Series Product](https://exercism.org/tracks/elixir/exercises/largest-series-product) | | ALP_LSP_ |
| [Matching Brackets](https://exercism.org/tracks/scala/exercises/matching-brackets) | | ALP_MBKT_ |
| [Minesweeper](https://exercism.org/tracks/scala/exercises/minesweeper) | | ALP_MNSP_ |
| [Poker](https://exercism.org/tracks/elixir/exercises/poker) | | ALP_POKR_ |
| [Simple Cipher](https://exercism.org/tracks/elixir/exercises/simple-cipher) | [Caesar Cipher](https://en.wikipedia.org/wiki/Caesar_cipher) | ALP_SCIP_ |
| [Sieve](https://exercism.org/tracks/elixir/exercises/sieve) | [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) | ALP_SIVE_ |
| [Spiral Matrix](https://exercism.org/tracks/elixir/exercises/spiral-matrix) | | ALP_SMTX_ |

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

 