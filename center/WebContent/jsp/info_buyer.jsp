<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.Board" %>
<%@ page import="com.seller.Seller" %>
<%@ page import="com.common.ManagerStaticAttribute" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.order.Order" %>
<%@ page import="com.common.Categori" %>
<%@ page import="com.board.Board" %>
<%@ page import="com.product.Product" %>
<%@ page import="com.buyer.Buyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
html{
	font-family: 'Nanum Pen Script', serif;
	font-size:12pt;
}
table,td{
	border-spacing:0px;border-style:none;padding:0px;
	margin:0px;
	font-size:12pt;
	text-align:center;
	
}
td{
	
	display:inline-block;
	margin:0px;padding:0px;
	border:1px solid #e2e2e2;
}

</style>
<script>

function fadeInFunction(id,time){
	setTimeout(function(){
		$('#'+id).fadeIn(200);
	},time);
}

function ClickOrder(order_num){
	$(top.document).find("#info_iframe_detail").attr("src","/center/info_detail_order?order_num="+order_num);
}
function ClickBoard(board_num){
	$(top.document).find("#info_iframe_detail").attr("src","/center/info_detail_board?board_num="+board_num);
}


function changepage(){
	if($('#order_list').css("display")=="block"){
		
		$('#order_list').fadeOut(200);
		fadeInFunction('board_list',200);
		$('#change_board_order_btn').html("주문");
		//$('#board_list').fadeIn(300);
	}else if($('#order_list').css("display")=="none"){
		$('#board_list').fadeOut(200);
		fadeInFunction('order_list',200);
		$('#change_board_order_btn').html("게시물");
	}
}
</script>
</head>
<body>
<%
	ArrayList<Order> order_list = (ArrayList<Order>)request.getAttribute("order_list");
	ArrayList<Board> board_list = (ArrayList<Board>)request.getAttribute("board_list");
	ArrayList<Product> product_list = (ArrayList<Product>)request.getAttribute("product_list");
%>

<div style="position:absolute;margin-left:840px;">
	<button id="change_board_order_btn"onclick="changepage()"style="outline:none;font-size:8pt;border:#e2e2e2;border-radius:5px;">게시물</button>
</div>
<div style="">
	<div style="clear:both;"></div>
	
	<div id="order_list" style="overflow:hidden;text-overflow:ellipsis;width:880px;">
		<table style="width:850px;text-align:center;">
			<tr>
				<td style="background-color:#cceeff;
					text-align:center;width:120px;height:15px;">
					주문일
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:80px;height:15px;">
					주문번호
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:400px;height:15px;">
					상품정보
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:100px;height:15px;">
					판매자
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:100px;height:15px;">
					주문상태
				</td>
			</tr>
			
		</table>
		
		<%for(int i = 0 ; i < order_list.size() ; i ++){
			%>
			
			<table style="overflow:scroll;width:850px;cursor:pointer;"
				onclick="ClickOrder('<%=order_list.get(i).getOrder_num()%>')">
				<tr style="margin:0px;padding:0px;">
					<td style="width:120px;height:20px;">
						<%=order_list.get(i).getOrder_date() %>
					</td>
					<td style="width:80px;height:20px;">
						<%=order_list.get(i).getOrder_num() %>
					</td>
					<td style="width:400px;height:20px;;">
						[<%=product_list.get(i).getProduct_num()%>]
						<%=product_list.get(i).getTitle() %>
						
					</td>
					<td style="width:100px;height:20px;">
						<%=order_list.get(i).getSeller() %>
					</td>
					<td style="width:100px;height:20px;">
						<%=order_list.get(i).getStatus() %>
					</td>
				</tr>
				
			</table>
			
			<%
		} %>
		
	</div>
	
	<%
	//board_list.get(0).getBoard_num();
	//board_list.get(0).getBuyer();
	//board_list.get(0).getCategori();
	//board_list.get(0).getRecommend();
	//board_list.get(0).getStatus();
	//board_list.get(0).getTextarea();
	//board_list.get(0).getTitle();
	//board_list.get(0).getSeecount();
	//board_list.get(0).getTime();
	%>
	<div id="board_list"style="display:none;overflow:hidden;text-overflow:ellipsis;width:880px;">
		<table style="width:850px;text-align:center;">
			<tr>
				<td style="background-color:#cceeff;
					text-align:center;width:80px;height:15px;">
					번호
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:120px;height:15px;">
					올린 시간
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:80px;height:15px;">
					상태
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:120px;height:15px;">
					제목
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:80px;height:15px;">
					카테고리
				</td>
				<td style="background-color:#cceeff;
					text-align:center;width:320px;height:15px;">
					내용
				</td>
			</tr>
			
		</table>
		
		<%for(int i = 0 ; i < board_list.size() ; i ++){
			%>
			
			<table style="overflow:scroll;width:850px;cursor:pointer;"
				onclick="ClickBoard('<%=board_list.get(i).getBoard_num()%>')">
				<tr style="margin:0px;padding:0px;">
					<td style="width:80px;height:20px;">
						<%=board_list.get(i).getBoard_num() %>
					</td>
					<td style="width:120px;height:20px;">
						<%=board_list.get(i).getTime() %>
					</td>
					<td style="width:80px;height:20px;">
						<%=board_list.get(i).getStatus() %>
					</td>
					<td style="width:120px;height:20px;;">
						<%=board_list.get(i).getTitle() %>
					</td>
					<td style="width:80px;height:20px;">
						<%=board_list.get(i).getCategori() %>
					</td>
					<td style="width:320px;height:20px;">
						<%=board_list.get(i).getTextarea() %>
					</td>
				</tr>
				
			</table>
			
			<%
		} %>
		
	</div>
	
	<div style="clear:both;"></div>
</div>

</body>
</html>