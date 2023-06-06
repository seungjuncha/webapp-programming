<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>방명록 수정</title>
    <style>
    	.container {
            display: flex;
            justify-content: center;
        }
    	h2 {
            font-size: 30px;
            color: #fff;
            text-transform: uppercase;
            font-weight: 300;
            text-align: center;
            margin-bottom: 15px;
        }
        table {
            width: 50%;
            table-layout: fixed;
            margin-left: auto;
            margin-right: auto;
        }
        .tbl-header {
            background-color: rgba(255, 255, 255, 0.3);
        }
        .tbl-content {
            height: 300px;
            overflow-x: auto;
            margin-top: 0px;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        tr {
            padding: 20px 15px;
            text-align: left;
            font-weight: 500;
            font-size: 16px;
            color: #fff;
            text-transform: uppercase;
        }
        th {
            padding: 15px;
            text-align: center;
            vertical-align: middle;
            font-weight: 300;
            font-size: 16px;
            color: #fff;
            border-bottom: solid 1px rgba(255, 255, 255, 0.1);        
        }
        td {
            padding: 15px;
            text-align: center;
            vertical-align: middle;
            font-weight: 300;
            font-size: 16px;
            color: #fff;
            border-bottom: solid 1px rgba(255, 255, 255, 0.1);
        }
        textarea {
            width: 230%;
            height: 20em;
            border: none;
            resize: none;
        }

        @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

        body {
            background: -webkit-linear-gradient(left, #25c481, #25b7c4);
            background: linear-gradient(to right, #25c481, #25b7c4);
            font-family: 'Roboto', sans-serif;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .buttons {
            margin: 10%;
            text-align: center;
        }

        .btn-hover {
            width: 200px;
            font-size: 16px;
            font-weight: 600;
            color: #fff;
            cursor: pointer;
            margin: 20px;
            height: 55px;
            text-align: center;
            border: none;
            background-size: 300% 100%;
            border-radius: 50px;
            moz-transition: all .4s ease-in-out;
            -o-transition: all .4s ease-in-out;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        .btn-hover:hover {
            background-position: 100% 0;
            moz-transition: all .4s ease-in-out;
            -o-transition: all .4s ease-in-out;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        .btn-hover:focus {
            outline: none;
        }

        .btn-hover.color-1 {
            background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
            box-shadow: 0 4px 15px 0 rgba(49, 196, 190, 0.75);
        }
    </style>
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var title = document.getElementById("title").value;
            var password = document.getElementById("password").value;
            var content = document.getElementById("content").value;
            
            if (username === "" || email === "" || title === "" || password === "" || content === "") {
                alert("모든 입력란을 채워주세요.");
                return false;
            }
        }
        
        function clearForm() {
            document.getElementById("username").value = "";
            document.getElementById("email").value = "";
            document.getElementById("title").value = "";
            document.getElementById("password").value = "";
            document.getElementById("content").value = "";
        }
    </script>
</head>
<body>
    <h2>방명록 수정</h2>
    <form action="/jwbook/guestbookControl" method="POST" onsubmit="return validateForm()">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="num" value="${guestbook.num}">
        
        <table>
            <tr>
                <th><label for="username">작성자</label></th>
                <td><input type="text" name="username" id="username" value="${guestbook.username}"></td>
            </tr>
            <tr>
                <th><label for="email">이메일</label></th>
                <td><input type="text" name="email" id="email" value="${guestbook.email}"></td>
            </tr>
            <tr>
                <th><label for="title">제목</label></th>
                <td><input type="text" name="title" id="title" value="${guestbook.title}"></td>
            </tr>
            <tr>
                <th><label for="password">비밀번호</label></th>
                <td><input type="password" name="password" id="password"></td>
            </tr>
            <tr>
                <td><textarea name="content" id="content" rows="5">${guestbook.content}</textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="buttons">
                        <button class="btn-hover color-1" type="submit">수정</button>
                        <button class="btn-hover color-1" onclick="clearForm(); return false;">삭제</button>
                        <button class="btn-hover color-1" onclick="location.href='guestbookControl?action=list'">목록</button>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
