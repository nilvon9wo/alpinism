public with sharing class ALP_CALC_CalculatorConundrum {
    public String calculate(Integer operand1, Integer operand2, String operation) {
        if (operation == null) {
            throw new IllegalArgumentException('Operation cannot be null.');
        }
        if (String.isBlank(operation)) {
            throw new IllegalArgumentException('Operation cannot be blank.');
        }

        Integer result;
        switch on operation {
            when '+' {
                result = operand1 + operand2;
            }
            when '*' {
                result = operand1 * operand2;
            }
            when '/' {
                if (operand2 == 0) {
                    throw new ALP_CALC_IllegalOperationException('Division by zero is not allowed.', new ALP_CALC_ArithmeticException('Division by zero.'));
                }
                result = operand1 / operand2;
            }
            when '-' {
                result = operand1 - operand2;
            }
            when else {
                throw new IllegalArgumentException('Operation \'' + operation + '\' does not exist.');
            }
        }

        return operand1 + ' ' + operation + ' ' + operand2 + ' = ' + result;
    }
}