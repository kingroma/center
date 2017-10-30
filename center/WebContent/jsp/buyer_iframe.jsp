<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.buyer.Buyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
html,input,button{
	font-family: 'Nanum Pen Script', serif;
	font-size:12pt;
}
</style>
</head>
<%
	String buyer_id="";
	if(request.getParameter("buyer_id")!=null)
		buyer_id=(String)request.getParameter("buyer_id");
	

%>
<script>
function buyer_hidden_input_open(){
	if($('#hidden_input_birth').css("display")=="none"){
		$('#hidden_input_birth').fadeIn(500);
		$('#hidden_input_phone').fadeIn(500);
		$('#hidden_input_adress').fadeIn(500);
		$('#hidden_input_mail').fadeIn(500);
		$('#buyer_fix_btn').html("&nbsp수정취소&nbsp ");
		$('#buyer_fix_btn').css("color","red");
		$('#buyer_fix_btn_do').fadeIn(500);
		$('#buyer_status').fadeIn(500);
		//$('#buyer_status_msg').fadeIn(500);
	}else if($('#hidden_input_birth').css("display")=="block"){
		$('#hidden_input_birth').fadeOut(200);
		$('#hidden_input_phone').fadeOut(200);
		$('#hidden_input_adress').fadeOut(200);
		$('#hidden_input_mail').fadeOut(200);
		$('#buyer_fix_btn').css("color","black");
		$('#buyer_fix_btn').html("&nbsp수정하기&nbsp ");
		$('#buyer_fix_btn_do').fadeOut(200);
		$('#buyer_status').fadeOut(200);
		//$('#buyer_status_msg').fadeOut(200);
	}
}

</script>
<body>
	<%if(buyer_id==null|buyer_id.equals("")){ %>
		<!-- 구매자 아이디가 null 일떄  -->
		<table style="boder:1px dotted #e2e2e2;border:1px;margin:5px;margin-top:15px;padding:0px;">
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					아이디
				</td>
				<td style="width:150px;border:1px solid black;">
								
				</td>
			</tr>
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					생년월일
				</td>
				<td style="width:150px;border:1px solid black;">
							
				</td>
			</tr>
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					핸드폰
				</td>
				<td style="width:150px;border:1px solid black;">
								
				</td>
			</tr>
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					주소
				</td>
				<td style="width:150px;border:1px solid black;">
								
				</td>
			</tr>
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					메일
				</td>
				<td style="width:150px;border:1px solid black;">
								
				</td>
			</tr>
		</table>
		<!-- 구매자 아이디가 null 일떄  -->
	<%}else{
		Buyer b = null;
		if(request.getAttribute("b")!=null){
			 b = (Buyer)request.getAttribute("b");
		
		%>
		<!-- 구매자 아이디가 넘어왓을때  -->
			<form action="/center/buyer_iframe" method="post">
			<input type="hidden" name="buyer_id" value="<%=b.getId()%>">
			<div style="position:absolute;margin:0px;padding:0px;">
				
			</div>
			<table style="boder:1px dotted #e2e2e2;border:1px;margin:5px;margin-top:15px;padding:0px;">
				<tr>
					<td style="width:70px;background-color:#cceeff;border:1px solid black;">
						아이디
					</td>
					<td style="width:150px;border:1px solid black;">
						<%=b.getId() %>
						<%if(b.getStatus()==null){
						%>
							<span style="color:green;font-size:9pt;">(정상 회원)</span>
						<%
						}else if(b.getStatus().equals("")){
							%>
							<span style="color:green;font-size:9pt;">(정상 회원)</span>
							<%
						}else if(b.getStatus().equals("error")){
							%>
							<span style="color:red;font-size:9pt;">(로그인 제한)</span>
							<%
						}else if(b.getStatus().equals("soso")){
							%>
							<span style="color:blue;font-size:9pt;">(비정상 회원)</span>
							<%
						}
						%>
					
					</td>
				</tr>
				<tr>
					<td style="width:70px;background-color:#cceeff;border:1px solid black;">
						생년월일
					</td>
					<td style="width:150px;border:1px solid black;">
						<input
							id="hidden_input_birth" 
							type="text" name="birth" value="<%=b.getBirth() %>" 
							style="display:none;position:absolute;">
						<%=b.getBirth() %>
					</td>
				</tr>
				<tr>
					<td style="width:70px;background-color:#cceeff;border:1px solid black;">
						핸드폰
					</td>
					<td style="width:150px;border:1px solid black;">
						<input 
							id="hidden_input_phone" 
							type="text" name="phone" value="<%=b.getPhone() %>" 
							style="display:none;position:absolute;">
						<%=b.getPhone() %>	
					</td>
				</tr>
				<tr>
					<td style="width:70px;background-color:#cceeff;border:1px solid black;">
						주소
					</td>
					<td style="width:150px;border:1px solid black;">
						<input
							id="hidden_input_adress"  
							type="text" name="adress" value="<%=b.getAdress() %>" 
							style="display:none;position:absolute;">
						<%=b.getAdress() %>	
					</td>
				</tr>
				<tr>
					<td style="width:70px;background-color:#cceeff;border:1px solid black;">
						메일
					</td>
					<td style="width:150px;border:1px solid black;">
						<input
							id="hidden_input_mail"  
							type="text" name="mail" value="<%=b.getMail() %>	" 
							style="display:none;position:absolute;">
						<%=b.getMail() %>	
					</td>
				</tr>
			</table>
			<div></div>
			<select id="buyer_status" name="status"
			style="font-family: 'Nanum Pen Script', serif;font-size:12pt;display:none">
				<option value="">정상 회원</option>
				<option value="soso">비정상 회원</option>
				<option value="error">로그인 제한</option>
				
				</select>
			<input type="text" id="buyer_status_msg"
				name="status_msg"
				style="display:none;"
				>
			<div style="padding:1px;"></div>
				
			<input
				type="submit"
				value="수정하기"
				id="buyer_fix_btn_do"
				style="color:green;display:none;cursor:pointer;
				border:1px solid #e2e2e2;border-radius:5px;outline:none;">
			<span
				id="buyer_fix_btn"
				onclick="buyer_hidden_input_open()" 
				style="padding-top:1px;padding-bottom:1px;background-color:#e2e2e2;cursor:pointer;border:1px solid #e2e2e2;border-radius:5px;outline:none;">
				  &nbsp수정하기&nbsp  </span>
			</form>
			
			
			
		<!-- 구매자 아이디가 넘어왓을때  -->
		<%}else{%>
		<!-- 구매자 class null 일떄  -->
		
		<table style="boder:1px dotted #e2e2e2;border:1px;margin:5px;margin-top:15px;padding:0px;">
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
				아이디 
					
				</td>
				<td style="width:150px;border:1px solid black;">
					조회되는 아이디가 없습니다.	
				</td>
			</tr>
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					생년월일
				</td>
				<td style="width:150px;border:1px solid black;">
							
				</td>
			</tr>
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					핸드폰
				</td>
				<td style="width:150px;border:1px solid black;">
								
				</td>
			</tr>
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					주소
				</td>
				<td style="width:150px;border:1px solid black;">
								
				</td>
			</tr>
			<tr>
				<td style="width:70px;background-color:#cceeff;border:1px solid black;">
					메일
				</td>
				<td style="width:150px;border:1px solid black;">
								
				</td>
			</tr>
		</table>
		<!-- 구매자 class null 일떄  -->
		
		<%}
	} %>
</body>
</html>