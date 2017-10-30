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
<script type="text/javascript" src="/center/js/jquery-1.7.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(document).ready(function(){
	//alert($('#selector').val());
	$('#search_textarea').keydown(function( event ){
		if ( event.which == 13 ) {
			search();
		}
	});
});

function search(){
	switch($('#selector').val()){
	case "":
		break;
	case "buyer_id":
		search_buyer_id();
		//alert("TEST");
		break;
	case "seller_id":
		//alert("TEST");
		break;
	case "product":
		//alert("TEST");
		break;
	case "board":
		//alert("TEST");
		break;
	case "order":
		//alert("TEST");
		break;
	};
}

function search_buyer_id(){
	var buyer_id=""+$('#search_textarea').val();
	var url ="/center/buyer_iframe?buyer_id="+buyer_id;
	var url_info = "/center/info?buyer_id="+buyer_id;
	
	$('#buyer_iframe').attr("src",url);
	$('#info_iframe').attr("src",url_info);
	//alert(buyer_id);
}



</script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
html{
	font-family: 'Nanum Pen Script', serif;
	font-size:12pt;
	overflow:hidden;
	width:1280px;
	margin:0px;
	padding:0px;
}
a:hover{
	color:black;
	text-decoration:none;
}
a:active{
	color:black;
	text-decoration:none;
}
a:visited{
	color:black;
	text-decoration:none;
}
a:link{
	color:black;
	text-decoration:none;
}
</style>
<title>center</title>
</head>

<body>
	<div>
		<input type="text" id="search_textarea" name="textarea" >
		<select id="selector" name="categori"
			style="font-family: 'Nanum Pen Script', serif;font-size:12pt;">
			<option value="buyer_id">구매자 아이디</option>
			<!-- <option value="seller_id">판매자 아이디</option>
			<option value="product">상품</option>
		    <option value="board">게시판</option>
		    <option value="order">주문</option> -->
		</select>
		<button type="submit" onclick="search()"
			style="cursor:pointer;border:1px solid #e2e2e2;border-radius:5px;outline:none;">
			검색</button>
		
	</div>
	<div>
		<div style="float:left;width:300px;height:200px;">
			<span style="position:absolute;background-color:white;">구매자 정보</span>
			<div style="border:1px solid black;margin-top:5px;">
				<iframe
					id="buyer_iframe"
					style="border:0px;height:180px;width:280px;"
					src="/center/buyer_iframe"
					>
				
				</iframe>
			</div>
			<div style="padding:5px;"></div>
			<span style="display:none;position:absolute;background-color:white;">판매자 정보</span>
			<div style="display:none;border:1px solid black;margin-top:5px;">
				<iframe
					style="border:0px;"
					src="/center/seller_iframe"
					>
				
				</iframe>
			</div>
		</div>
		<div style="float:left;padding-left:10px;">
			
			<span style="position:absolute;background-color:white;">정보</span>
			<div style="border:1px solid black;margin-top:5px;width:900px;height:200px;">
				<div style="padding:5px;"></div>
				<div>
					<iframe
					id="info_iframe"
					style="width:900px;height:200px;border:0px;"
					src="/center/info"
					>
				
					</iframe>
				</div>
			</div>
			<div style="padding:5px;"></div>
			<span style="position:absolute;background-color:white;">상세 정보</span>
			<div style="border:1px solid black;margin-top:5px;width:900px;height:200px;">
				<div style="padding:5px;"></div>
				<div>
					<iframe
					id="info_iframe_detail"
					style="width:900px;height:200px;border:0px;"
					src="/center/info_detail_order"
					>
				
					</iframe>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</body>
</html>