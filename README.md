# Alpinism

This project is a collection of programming exercises from [Exercism](https://exercism.io/) ported to Salesforce.

Usually this will be as pure Apex code, but as the exercise may merit, some solutions may also include SObjects,
Lightning Web Components, or other Salesforce technologies.

When possible SObjects have been preferred over "pure" Apex _metadata.objects because SObjects allow for named parameters,
accessing by SObjectField, and potentially other properties and methods which may prove desirable.


## Exercises

| Exercism Name | Other Names | Project Prefix |
|---------------|-------------|----------------|
| [Connect](https://exercism.io/my/solutions/d1a4151ec4c84d2fb3d8aedbc0a63795) | [Hex](https://en.wikipedia.org/wiki/Hex_%28board_game%29) / Polygon / CON-TAC-TIX | ALP_CONX_ |
| [Custom Set](https://exercism.io/my/solutions/a660b002e1c14679895063781fb4dd16) |   | ALP_CSET_ |
| [Spiral Matrix](https://exercism.io/my/solutions/17c85d91725648abb399fe7b85552d7d) | | ALP_SMTX_ |

## Testing Notes

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

 