@IsTest
public class ALP_CSET_CustomSetTest {
	private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;

	// Constructor Tests -----------------------------------------------------------

	@IsTest
	public static void testConstructorReturnsACustomSet() {
		// Arrange
		List<Integer> numberList = new List<Integer>();

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = new ALP_CSET_CustomSet(numberList);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(), result);
	}

	@IsTest
	public static void testConstructorRemovesDuplicatesInTheGivenEnumerable() {
		// Arrange
		List<Integer> numberList = new List<Integer>{1, 1, 2, 3};

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = new ALP_CSET_CustomSet(numberList);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(new List<Integer>{1, 2, 3}), result);
	}

	// isEmpty Tests -----------------------------------------------------------

	@IsTest
	public static void testIsEmptyReturnsTrueForSetsWithNoElements() {
		// Arrange
		ALP_CSET_CustomSet setUnderTest = new ALP_CSET_CustomSet();

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = setUnderTest.isEmpty();
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testIsEmptyReturnsFalseForSetsWithElements() {
		// Arrange
		ALP_CSET_CustomSet setUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = setUnderTest.isEmpty();
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	// contains Tests -----------------------------------------------------------

	@IsTest
	public static void testContainsReturnsFalseWhenSetIsEmpty() {
		// Arrange
		ALP_CSET_CustomSet setUnderTest = new ALP_CSET_CustomSet();
		Integer testValue = 1;

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = setUnderTest.contains(testValue);
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	@IsTest
	public static void testContainsReturnsTrueWhenElementIsInTheSet() {
		// Arrange
		Integer testValue = 1;
		ALP_CSET_CustomSet setUnderTest = new ALP_CSET_CustomSet(new List<Integer>{testValue, 2, 3});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = setUnderTest.contains(testValue);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testContainsReturnsFalseWhenElementIsNotInTheSet() {
		// Arrange
		Integer testValue = 4;
		ALP_CSET_CustomSet setUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 2, 3});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = setUnderTest.contains(testValue);
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	// isSubsetOf Tests -----------------------------------------------------------

	@IsTest
	public static void testIsSubsetOfReturnsTrueWhenBothEmpty() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isSubsetOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testIsSubsetOfReturnsTrueWhenParameterIsEmpty() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isSubsetOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testIsSubsetOfReturnsFalseWhenRootIsEmptyButParameterHasValues() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isSubsetOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	@IsTest
	public static void testIsSubsetOfReturnsTrueWhenSetsHaveExactSameElements() {
		// Arrange
		List<Integer> memberList = new List<Integer>{1, 2, 3};
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(memberList);
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(memberList);

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isSubsetOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testIsSubsetOfReturnsTrueWhenParameterIsLargerAndHasAllRootElements() {
		// Arrange
		List<Integer> memberList = new List<Integer>{1, 2, 3};
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(memberList);

		memberList.add(4);
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(memberList);

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isSubsetOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testIsSubsetOfReturnsFalseWhenParameterDoesNotContainRootElements() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 2, 3});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{4, 1, 3});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isSubsetOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	// isDisjointedFrom Tests -----------------------------------------------------------

	@IsTest
	public static void testIsDisjointedFromReturnsTrueWhenBothEmpty() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isDisjointedFrom(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testIsDisjointedFromReturnsTrueWhenRootIsEmpty() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isDisjointedFrom(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testIsDisjointedFromReturnsTrueWhenParameterIsEmpty() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isDisjointedFrom(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testIsDisjointedFromReturnsFalseWhenSetsShareAnElement() {
		// Arrange
		Integer sharedElement = 2;
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, sharedElement});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{sharedElement, 3});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isDisjointedFrom(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	@IsTest
	public static void testIsDisjointedFromReturnsTrueWhenSetsShareNoElement() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 2});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{3, 4});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.isDisjointedFrom(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	// equals Tests -----------------------------------------------------------

	@IsTest
	public static void testEqualsReturnsTrueWhenBothEmpty() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.equals(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testEqualsReturnsFalseWhenRootEmptyButParameterHasValues() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 2, 3});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.equals(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	@IsTest
	public static void testEqualsReturnsFalseWhenParameterEmptyButRootHasValues() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 2, 3});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.equals(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	@IsTest
	public static void testEqualsReturnsTrueWhenElementsAreEqual() {
		// Arrange
		Integer element1 = 1;
		Integer element2 = 2;
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{element1, element2});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{element2, element1});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.equals(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(result);
	}

	@IsTest
	public static void testEqualsReturnsFalseWhenElementsAreNotEqual() {
		// Arrange
		Integer element1 = 1;
		Integer element2 = 2;
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{element1, element2, 3});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{element1, element2, 4});

		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.equals(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assert(!result);
	}

	// add Tests -----------------------------------------------------------

	@IsTest
	public static void testAddElementToEmptySetShouldResultInSetOnlyWithAddedElement() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		Integer value = 3;

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.add(value);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(new List<Integer>{3}), result);
	}

	@IsTest
	public static void testAddElementToSetShouldResultInSetOnlyWithAllOldAndNewElements() {
		// Arrange
		List<Integer> originalValueList = new List<Integer>{1, 2, 4};
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(originalValueList);
		Integer value = 3;

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.add(value);
		}
		Test.stopTest();

		// Assert
		originalValueList.add(value);
		System.assertEquals(new ALP_CSET_CustomSet(originalValueList), result);
	}

	@IsTest
	public static void testAddExistingElementDoesNotChangeTheSet() {
		// Arrange
		Integer value = 3;
		List<Integer> originalValueList = new List<Integer>{1, 2, value};
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(originalValueList);

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.add(value);
		}
		Test.stopTest();

		// Assert
		originalValueList.add(value);
		System.assertEquals(new ALP_CSET_CustomSet(originalValueList), result);
	}

	// equals Tests -----------------------------------------------------------

	@IsTest
	public static void testIntersectionOfTwoEmptySetsShouldBeAnEmptySet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.intersectionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(), result);
	}

	@IsTest
	public static void testIntersectionWithEmptyRootSetShouldBeAnEmptySet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{3, 2, 5});

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.intersectionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(), result);
	}

	@IsTest
	public static void testIntersectionWithEmptyParameterSetShouldBeAnEmptySet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 2, 3, 4});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.intersectionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(), result);
	}

	@IsTest
	public static void testIntersectionWithNoSharedElementsIsAnEmptySet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 2, 3});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{4, 5, 6});

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.intersectionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(), result);
	}

	@IsTest
	public static void testIntersectionWithSharedElementsIsASetOfTheSharedElements() {
		// Arrange
		Integer sharedElement1 = 2;
		Integer sharedElement2 = 3;
		ALP_CSET_CustomSet rootSetUnderTest
				= new ALP_CSET_CustomSet(new List<Integer>{1, sharedElement1, sharedElement2, 4});
		ALP_CSET_CustomSet parameterSetUnderTest
				= new ALP_CSET_CustomSet(new List<Integer>{sharedElement2, sharedElement1, 5});

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.intersectionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(new List<Integer>{sharedElement1, sharedElement2}), result);
	}

	// differenceOf Tests -----------------------------------------------------------

	@IsTest
	public static void testDifferenceOfTwoEmptySetsIsAnEmptySet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.differenceOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(), result);
	}

	@IsTest
	public static void testDifferenceOfEmptyRootSetAndAParameterWithValuesIsAnEmptySet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{3, 2, 5});

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.differenceOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(), result);
	}

	@IsTest
	public static void testDifferenceOfNonEmptyRootSetAndAnEmptyParameterSetIsAnEmptySet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 2, 3, 4});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.differenceOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(rootSetUnderTest, result);
	}

	@IsTest
	public static void testDifferenceTwoNonEmptySetsIsASetOfElementsThatAreOnlyInTheRootSet() {
		// Arrange
		Integer uncommonElement1 = 3;
		Integer uncommonElement2 = 1;
		Integer commonElement = 2;
		ALP_CSET_CustomSet rootSetUnderTest
				= new ALP_CSET_CustomSet(new List<Integer>{uncommonElement1, commonElement, uncommonElement2});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{commonElement, 4});

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.differenceOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(new List<Integer>{uncommonElement1, uncommonElement2}), result);
	}

	// unionOf Tests -----------------------------------------------------------

	@IsTest
	public static void testUnionOfTwoEmptySetsIsAnEmptySet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.unionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(new ALP_CSET_CustomSet(), result);
	}

	@IsTest
	public static void testUnionOfEmptySetWithParameterWithValuesIsAParameterSet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet();
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{2});

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.unionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(parameterSetUnderTest, result);
	}

	@IsTest
	public static void testUnionOfRootWithValuesWithEmptyParameterSetIsTheRootSet() {
		// Arrange
		ALP_CSET_CustomSet rootSetUnderTest = new ALP_CSET_CustomSet(new List<Integer>{1, 3});
		ALP_CSET_CustomSet parameterSetUnderTest = new ALP_CSET_CustomSet();

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.unionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(rootSetUnderTest, result);
	}

	@IsTest
	public static void testUnionOfTwoNonEmptySetsContainsAllUniqueElements() {
		// Arrange
		Integer uncommonElement1 = 1;
		Integer uncommonElement2 = 2;
		Integer commonElement = 3;
		ALP_CSET_CustomSet rootSetUnderTest
				= new ALP_CSET_CustomSet(new List<Integer>{uncommonElement1, commonElement});
		ALP_CSET_CustomSet parameterSetUnderTest
				= new ALP_CSET_CustomSet(new List<Integer>{uncommonElement2, commonElement});

		// Act
		ALP_CSET_CustomSet result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = rootSetUnderTest.unionOf(parameterSetUnderTest);
		}
		Test.stopTest();

		// Assert
		List<Integer> uniqueElementList = new List<Integer>{uncommonElement1, uncommonElement2, commonElement};
		System.assertEquals(new ALP_CSET_CustomSet(uniqueElementList), result);
	}
}