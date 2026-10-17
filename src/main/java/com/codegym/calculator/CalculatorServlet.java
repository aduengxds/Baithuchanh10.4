package com.codegym.calculator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/calculate")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            String firstValue = request.getParameter("firstOperand");
            String secondValue = request.getParameter("secondOperand");
            String operatorValue = request.getParameter("operator");

            if (firstValue == null || secondValue == null
                    || operatorValue == null
                    || firstValue.isBlank()
                    || secondValue.isBlank()
                    || operatorValue.length() != 1) {
                throw new IllegalArgumentException(
                        "Vui lòng nhập đầy đủ hai toán hạng và phép tính."
                );
            }

            double firstOperand = Double.parseDouble(firstValue.trim());
            double secondOperand = Double.parseDouble(secondValue.trim());
            char operator = operatorValue.charAt(0);

            if (!Double.isFinite(firstOperand)
                    || !Double.isFinite(secondOperand)) {
                throw new IllegalArgumentException(
                        "Toán hạng phải là số hữu hạn."
                );
            }

            double result = Calculator.calculate(
                    firstOperand,
                    secondOperand,
                    operator
            );

            if (!Double.isFinite(result)) {
                throw new ArithmeticException(
                        "Kết quả vượt quá giới hạn số cho phép."
                );
            }

            request.setAttribute("firstOperand", firstOperand);
            request.setAttribute("secondOperand", secondOperand);
            request.setAttribute("operator", operator);
            request.setAttribute("result", result);

        } catch (NumberFormatException e) {
            request.setAttribute(
                    "error",
                    "Vui lòng nhập toán hạng đúng định dạng số."
            );

        } catch (ArithmeticException | IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/result.jsp")
                .forward(request, response);
    }
}