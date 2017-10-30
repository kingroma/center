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
<script type="text/javascript" charset="utf-8" src="jquery-ui-1.12.1/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

function fix_table_show(){

	if($('#fix_table').css("display")=="none"){
		$('#fix_table').fadeIn(400);
		$('#fix_table_do_btn').fadeIn(400);
		$('#fix_table_btn').html("&nbsp변경취소&nbsp");
	}else if($('#fix_table').css("display")=="table"){
		$('#fix_table').fadeOut(300);
		$('#fix_table_btn').html("&nbsp변경하기&nbsp");
		$('#fix_table_do_btn').fadeOut(300);
	}
}

</script>


<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
html,input , button{
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
	
	
	margin:0px;padding:0px;
	border:1px solid #e2e2e2;
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
</head>
<body>
<%

Board b = (Board)request.getAttribute("board");
Categori c = new Categori();

//o.getBuyer();
//o.getBuyer_phone();
//o.getComment();//list
//o.getOrder_comment();
//o.getOrder_date();
//o.getOrder_num();
//o.getPrice();
//o.getSeller();
//o.getStatus();
//o.getProduct_num();
%>
<div>
	<table>
		<tr>
			<td style="width:80px;background-color:#cceeff;">
				게시판번호
			</td>
			<td style="width:100px;background-color:#cceeff;">
				올린 일시
			</td>
			<td style="width:80px;background-color:#cceeff;">
				상태
			</td>
			<td style="width:100px;background-color:#cceeff;">
				제목
			</td>
			<td style="width:80px;background-color:#cceeff;">
				카테고리
			</td>
			<td style="width:300px;background-color:#cceeff;">
				내용
			</td>
			<td style="width:50px;background-color:#cceeff;">
				추천수
			</td>
			<td style="width:50px;background-color:#cceeff;">
				조회수 
			</td>
			
		</tr>
	</table>
	<%if(b!=null){
		%>
		<table>
			<tr>
				<td style="width:80px">
					<%=b.getBoard_num() %>
					<%//o.getOrder_num() %>
				</td>
				<td style="width:100px">
					<%=b.getTime() %>
					<%//o.getOrder_date() %>
				</td>
				<td style="width:80px">
					<%=b.getStatus() %>
					<%//o.getStatus() %>
				</td>
				<td style="width:100px">
					<%=b.getTitle() %>
					<%//o.getProduct_num() %>
				</td>
				<td style="width:80px">
					<%=b.getCategori() %>
					<%//o.getSeller() %>
				</td>
				<td style="width:300px">
					<%=b.getTextarea() %>
					<%//o.getPrice() %>
				</td>
				<td style="width:50px">
					<%=b.getRecommend() %>
					<%//o.getOrder_comment() %>
				</td>
				<td style="width:50px">
					<%=b.getSeecount() %>
					<%//o.getBuyer_phone() %> 
				</td>
				
			</tr>
		</table>
		<form action="info_detail_board" method="post">
			<input type="hidden" name="board_num" value="<%=b.getBoard_num()%>">
			<input type="hidden" name="buyer_id" value="<%=b.getBuyer()%>">
			
			<table id="fix_table" style="display:none;">
				<tr>
					<td style="width:80px;">
						
					</td>
					<td style="width:100px;">
						
					</td>
					<td style="width:80px;">
						<select id="selector" name="status"
							style="font-family: 'Nanum Pen Script', serif;font-size:12pt;">
							
							<option value="null"
							<%//if(o.getStatus().equals("ing")) {%> 
							
							<%//}%>
							>null</option>
							
							<option value="error"
							<%//if(o.getStatus().equals("done")) {%> 
							
							<%//}%>
							>cancel</option>
							
							
						</select>
					</td>
					<td style="width:100px;">
						<input name="title" type="text" style="width:95px;" value="<%=b.getTitle()%>">
					</td>
					<td style="width:80px;">
						<select id="selector" name="categori"
							style="width:70px;font-family: 'Nanum Pen Script', serif;font-size:12pt;">
							<%for(int j = 0 ; j < c.getBoardList().size() ; j ++){
								%>
								<option value="<%=c.getBoardList().get(j) %>"
							<%//if(o.getStatus().equals("ing")) {%> 
							
							<%//}%>
							><%=c.getBoardList().get(j) %></option>
								<%
							} %>
							
							
							
						</select>
					</td>
					<td style="width:300px;text-align:left;">
						<input name=textarea type="text" style="width:195px;" value="<%=b.getTextarea()%>">
						
					</td>
					<td style="width:50px;">
						
					</td>
					<td style="width:50px;">
						
					</td>
					
				</tr>
			</table>
			<div style="margin-top:5px;">
				<a target="_blank" href="<%=ManagerStaticAttribute.buyerUrl%>/test_showboard?focus=<%=b.getBoard_num()%>">
					<span style="background-color:#e2e2e2;border:1px solid #e2e2e2;border-radius:5px;padding:1px;cursor:pointer;">&nbsp게시판페이지 바로가기&nbsp</span>
				</a>
				<span id="fix_table_btn" onclick="fix_table_show()" 
					style="background-color:#e2e2e2;border:1px solid #e2e2e2;border-radius:5px;padding:1px;cursor:pointer;">&nbsp변경하기&nbsp</span>
				<button  
					id="fix_table_do_btn"
					style="display:none;background-color:#e2e2e2;border:1px solid #e2e2e2;border-radius:5px;padding:1px;cursor:pointer;">&nbsp변경하기&nbsp
				</button>
			</div>
		</form>
		<%
	} %>
</div>

</body>
</html>