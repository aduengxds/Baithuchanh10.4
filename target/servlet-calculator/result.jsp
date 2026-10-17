<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tính toán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
        }

        .error {
            color: #c62828;
        }

        .result {
            font-size: 20px;
        }
    </style>
</head>
<body>
    <h1>Kết quả tính toán</h1>

    <%
        String error = (String) request.getAttribute("error");

        if (error != null) {
    %>
        <p class="error"><%= error %></p>
    <%
        } else {
            Double firstOperand =
                    (Double) request.getAttribute("firstOperand");
            Double secondOperand =
                    (Double) request.getAttribute("secondOperand");
            Character operator =
                    (Character) request.getAttribute("operator");
            Double result =
                    (Double) request.getAttribute("result");

            if (firstOperand != null && secondOperand != null
                    && operator != null && result != null) {
                DecimalFormat format = new DecimalFormat("0.##########");
    %>
        <p class="result">
            <%= format.format(firstOperand) %>
            <%= operator %>
            <%= format.format(secondOperand) %>
            =
            <strong><%= format.format(result) %></strong>
        </p>
    <%
            } else {
    %>
        <p>Không có dữ liệu để tính toán.</p>
    <%
            }
        }
    %>

    <p>
        <a href="${pageContext.request.contextPath}/index.jsp">
            Quay lại máy tính
        </a>
    </p>
</body>
</html>