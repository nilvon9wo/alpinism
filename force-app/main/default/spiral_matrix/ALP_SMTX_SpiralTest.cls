@IsTest
private class ALP_SMTX_SpiralTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_SMTX_Spiral SPIRAL_UNDER_TEST = new ALP_SMTX_Spiral();

    @IsTest
    static void testMatrixWithDimension0IsAnEmptyList() {
        // Arrange
        Integer testDimension = 0;

        // Act
        List<List<Integer>> actualResultList;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResultList = SPIRAL_UNDER_TEST.matrix(testDimension);
        }

        // Assert
        System.assert(actualResultList.isEmpty());
    }

    @IsTest
    static void testMatrixWithDimension1IsAListOfListContainingOnly1() {
        // Arrange
        Integer testDimension = 1;

        // Act
        List<List<Integer>> actualResultList;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResultList = SPIRAL_UNDER_TEST.matrix(testDimension);
        }

        // Assert
        List<List<Integer>> expectedResultList = new List<List<Integer>>{
                new List<Integer>{
                        1
                }
        };
        System.assertEquals(expectedResultList, actualResultList);
    }

    @IsTest
    static void testMatrixWithDimension2IsAListOfTwoListsContainingValuesThrough4() {
        // Arrange
        Integer testDimension = 2;

        // Act
        List<List<Integer>> actualResultList;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResultList = SPIRAL_UNDER_TEST.matrix(testDimension);
        }

        // Assert
        List<List<Integer>> expectedResultList = new List<List<Integer>>{
                new List<Integer>{
                        1, 2
                },
                new List<Integer>{
                        4, 3
                }
        };
        System.assertEquals(expectedResultList, actualResultList);
    }

    @IsTest
    static void testMatrixWithDimension3IsAListOfTwoListsContainingValuesThrough9() {
        // Arrange
        Integer testDimension = 3;

        // Act
        List<List<Integer>> actualResultList;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResultList = SPIRAL_UNDER_TEST.matrix(testDimension);
        }

        // Assert
        List<List<Integer>> expectedResultList = new List<List<Integer>>{
                new List<Integer>{
                        1, 2, 3
                },
                new List<Integer>{
                        8, 9, 4
                },
                new List<Integer>{
                        7, 6, 5
                }
        };
        System.assertEquals(expectedResultList, actualResultList);
    }

    @IsTest
    static void testMatrixWithDimension4IsAListOfTwoListsContainingValuesThrough16() {
        // Arrange
        Integer testDimension = 4;

        // Act
        List<List<Integer>> actualResultList;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResultList = SPIRAL_UNDER_TEST.matrix(testDimension);
        }

        // Assert
        List<List<Integer>> expectedResultList = new List<List<Integer>>{
                new List<Integer>{
                        1, 2, 3, 4
                },
                new List<Integer>{
                        12, 13, 14, 5
                },
                new List<Integer>{
                        11, 16, 15, 6
                },
                new List<Integer>{
                        10, 9, 8, 7
                }
        };
        System.assertEquals(expectedResultList, actualResultList);
    }

    @IsTest
    static void testMatrixWithDimension5IsAListOfTwoListsContainingValuesThrough25() {
        // Arrange
        Integer testDimension = 5;

        // Act
        List<List<Integer>> actualResultList;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResultList = SPIRAL_UNDER_TEST.matrix(testDimension);
        }

        // Assert
        List<List<Integer>> expectedResultList = new List<List<Integer>>{
                new List<Integer>{
                        1, 2, 3, 4, 5
                },
                new List<Integer>{
                        16, 17, 18, 19, 6
                },
                new List<Integer>{
                        15, 24, 25, 20, 7
                },
                new List<Integer>{
                        14, 23, 22, 21, 8
                },
                new List<Integer>{
                        13, 12, 11, 10, 9
                }
        };
        System.assertEquals(expectedResultList, actualResultList);
    }
}