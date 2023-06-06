<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>방명록 목록</title>
	        <style>
    	    h2{
  				font-size: 30px;
 				color: #fff;
	  			text-transform: uppercase;
  				font-weight: 300;
  				text-align: center;
 				margin-bottom: 15px;
			}
			table{
 				width:100%;
  				table-layout: fixed;
			}
			.tbl-header{
  				background-color: rgba(255,255,255,0.3);
			}
			.tbl-content{
  				height:300px;
  				overflow-x:auto;
  				margin-top: 0px;
  				border: 1px solid rgba(255,255,255,0.3);
			}
			th{
  				padding: 20px 15px;
  				text-align: left;
  				font-weight: 500;
  				font-size: 16px;
  				color: #fff;
  				text-transform: uppercase;
			}
			td{
  				padding: 15px;
  				text-align: left;
  				vertical-align:middle;
  				font-weight: 300;
  				font-size: 16px;
  				color: #fff;
  				border-bottom: solid 1px rgba(255,255,255,0.1);
			}	

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

			body{
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
    			text-align:center;
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
			section{
  				margin: 50px;
			}

			
  		  </style>
    <script>
        function refreshGuestbook() {
            location.reload();
        }
    </script>
</head>
<body>
<section>
  <h2>방명록 목록</h2>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>번호</th>
          <th>작성자</th>
          <th>이메일</th>
          <th>작성일</th>
          <th>제목</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <c:forEach items="${guestbooks}" var="g">
            <tr>
                <td>${g.num}</td>
                <td>${g.username}</td>
                <td>${g.email}</td>
                <td>${g.dayc}</td>
                <td>
                    <a href="/jwbook/guestbookControl?action=edit&num=${g.num}">${g.title}</a>
                </td>
            </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  <br>
    <div class="buttons">	
    	<button class="btn-hover color-1" onclick="location.href='guestbookControl?action=insert'">등록</button>
    </div>
</section>

</body>
</html>
