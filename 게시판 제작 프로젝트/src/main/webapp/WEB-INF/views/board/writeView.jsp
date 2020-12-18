<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	 	
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .form-control").length;
			for(var i = 0; i<regForm; i++){
				if($(".form-control").eq(i).val() == "" || $(".form-control").eq(i).val() == null){
					alert($(".form-control").eq(i).attr("title"));
					return true;
				}
			}
		}
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
	</script>
	<body>
		<div>
			<%@include file="../layout/header.jsp" %>
		</div>
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">

				<c:if test="${member.userId != null}">
						<div class="form-group">
							<label for="title" class="col-sm-2 control-label">제목</label>
							<input type="text" id="title" name="title" class="form-control" title="제목을 입력하세요."/>
						</div>
						<div class="form-group">
							<label for="content" class="col-sm-2 control-label">내용</label>
							<textarea id="content" name="content" class="form-control" title="내용을 입력하세요."></textarea>
						</div>
						<div class="form-group">	
							<label for="writer" class="col-sm-2 control-label">작성자</label>
							<input type="text" id="writer" name="writer" class="form-control" title="작성자를 입력하세요." readonly="readonly" value="${member.userId}" />
						</div>
						<table>
							<tbody>
								<tr>
									<td id="fileIndex">
									</td>
								</tr>
							</tbody>			
						</table>					
										<button class="write_btn btn btn-success" type="submit">작성</button>	
										<button  class="fileAdd_btn btn btn-secondary" type="button">파일추가</button>	
					</c:if>
					<c:if test="${member.userId == null}">
						<p>로그인 후에 작성하실 수 있습니다.</p>
					</c:if>

				</form>
				
			</section>
			<hr />
		</div>
	</body>
</html>