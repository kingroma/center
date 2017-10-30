<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.product.Product" %>
<%@ page import="com.seller.Seller" %>
<%@ page import="com.order.Order" %>
<%@ page import="com.board.Board" %>
<%@ page import="com.common.ManagerStaticAttribute" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.common.GetProductList" %>

<%@ page import="com.common.Categori" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>

</script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
html{
	font-family: 'Nanum Pen Script', serif;
	font-size:12pt;
}
</style>
<title>center</title>
</head>

<body>
	<div>
		<input type="text" name="search" >
		<select id="categori" name="categori"
			style="font-family: 'Nanum Pen Script', serif;">
			<option value="buyer_id">구매자 아이디</option>
			<option value="seller_id">판매자 아이디</option>
			<option value="product">상품</option>
		    <option value="board">게시판</option>
		    <option value="order">주문</option>
		</select>
	</div>
	
</body>
</html>