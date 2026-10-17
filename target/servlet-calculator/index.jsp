<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
        }

        input, select, button {
            box-sizing: border-box;
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px;
        }

        button {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Calculator</h1>

    <form action="${pageContext.request.contextPath}/calculate"
          method="post">

        <label for="firstOperand">Toán hạng thứ nhất:</label>
        <input type="number"
               id="firstOperand"
               name="firstOperand"
               step="any"
               required>

        <label for="operator">Phép tính:</label>
        <select id="operator" name="operator" required>
            <option value="+">Cộng (+)</option>
            <option value="-">Trừ (-)</option>
            <option value="*">Nhân (*)</option>
            <option value="/">Chia (/)</option>
        </select>

        <label for="secondOperand">Toán hạng thứ hai:</label>
        <input type="number"
               id="secondOperand"
               name="secondOperand"
               step="any"
               required>

        <button type="submit">Tính toán</button>
    </form>
</body>
</html>