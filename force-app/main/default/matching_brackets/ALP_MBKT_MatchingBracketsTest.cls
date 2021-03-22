@IsTest
public with sharing class ALP_MBKT_MatchingBracketsTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_MBKT_MatchingBrackets BRACKETS_UNDER_TEST = ALP_MBKT_MatchingBrackets.getInstance();

    @IsTest
    private static void test_paired_square_brackets_should_be_true() {
        assertIsPaired('[]');
    }

    @IsTest
    private static void test_paired_curly_brackets_should_be_true() {
        assertIsPaired('{}');
    }

    @IsTest
    private static void test_paired_parenthesis_should_be_true() {
        assertIsPaired('()');
    }

    @IsTest
    private static void test_empty_string_should_be_true() {
        assertIsPaired('');
    }

    @IsTest
    private static void test_paired_everything_with_full_symmetry_should_be_true() {
        assertIsPaired('{[()]}');
    }

    @IsTest
    private static void test_paired_everything_with_inner_pairs_should_be_true() {
        assertIsPaired('{()[]}');
    }

    @IsTest
    private static void test_paired_everything_asymmetrical_and_3_deep_should_be_true() {
        assertIsPaired('{()[()]}');
    }

    @IsTest
    private static void test_paired_everything_asymmetrical_and_multiple_top_level_should_be_true() {
        assertIsPaired('(){()[]}');
    }

    @IsTest
    private static void test_closing_parenthesis_should_be_false() {
        assertIsNotPaired(')');
    }

    @IsTest
    private static void test_unpaired_brackets_should_be_false() {
        assertIsNotPaired('[[');
    }

    @IsTest
    private static void test_wrong_ordered_brackets_should_be_false() {
        assertIsNotPaired('}{');
    }

    @IsTest
    private static void test_wrong_closing_brackets_should_be_false() {
        assertIsNotPaired('{]');
    }

    @IsTest
    private static void test_wrong_closing_brackets_2_should_be_false() {
        assertIsNotPaired('[)');
    }

    @IsTest
    private static void test_paired_with_whitespace_should_be_true() {
        assertIsPaired('{ }');
    }

    @IsTest
    private static void test_partially_paired_brackets_should_be_false() {
        assertIsNotPaired('{[])');
    }

    @IsTest
    private static void test_partially_paired_brackets_2_should_be_false() {
        assertIsNotPaired('{[()]]');
    }

    @IsTest
    private static void test_partially_paired_brackets_3_should_be_false() {
        assertIsNotPaired('{[()]}(');
    }

    @IsTest
    private static void test_simple_nested_brackets_should_be_true() {
        assertIsPaired('{[]}');
    }

    @IsTest
    private static void test_several_paired_brackets_should_be_true() {
        assertIsPaired('{}[]');
    }

    @IsTest
    private static void test_paired_and_nested_brackets_should_be_true() {
        assertIsPaired('([{}({}[])])');
    }

    @IsTest
    private static void test_unopened_closing_brackets_should_be_false() {
        assertIsNotPaired('{[)][]}');
    }

    @IsTest
    private static void test_unpaired_and_nested_brackets_should_be_false() {
        assertIsNotPaired('([{])');
    }

    @IsTest
    private static void test_paired_and_wrong_nested_brackets_should_be_false() {
        assertIsNotPaired('[({]})');
    }

    @IsTest
    private static void test_paired_everything_with_full_symmetry_and_a_letter_should_be_true() {
        assertIsPaired('{[()]}a');
    }

    @IsTest
    private static void test_math_expression_should_be_true() {
        assertIsPaired('(((185 + 223.85) * 15) - 543)/2');
    }

    @IsTest
    private static void test_complex_latex_expression_should_be_true() {
        assertIsPaired('\\left(\\begin{array}{cc} \\frac{1}{3} & x\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)');
    }

    private static void assertIsPaired(String value) {
        assertIsPaired(value, true);
    }

    private static void assertIsNotPaired(String value) {
        assertIsPaired(value, false);
    }

    private static void assertIsPaired(String value, Boolean expectedValue) {
        // Arrange : Nothing to do here

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = BRACKETS_UNDER_TEST.isPaired(value);
        }
        Test.stopTest();

        // Assert
        System.assertEquals(expectedValue, result);
    }
}