package com.codegym.calculator;

public class Calculator {

    public static double calculate(
            double firstOperand,
            double secondOperand,
            char operator) {

        switch (operator) {
            case '+':
                return firstOperand + secondOperand;

            case '-':
                return firstOperand - secondOperand;

            case '*':
                return firstOperand * secondOperand;

            case '/':
                if (secondOperand == 0) {
                    throw new ArithmeticException(
                            "Không thể chia cho 0!"
                    );
                }
                return firstOperand / secondOperand;

            default:
                throw new IllegalArgumentException(
                        "Toán tử không hợp lệ!"
                );
        }
    }
}
