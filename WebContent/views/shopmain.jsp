<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Shop HomePage</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/shop-homepage.css" rel="stylesheet">

  </head>

  <body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">메인으로 돌아가기</a>
        
      </div>
    </nav>

    <div class="container">
      <div class="row">
        <div class="col-lg-4">
        	<div class="card h-30">
        		
	        	<img class="card-img" src="img/background.png">
        		<div class="overlay" id="avatar-body">
	        	<img class="card-img" src="${user_body.itemImgPath}">
	        	</div>
	        	<div class="overlay" id="avatar-hair">
	        	<img class="card-img" src="${user_hair.itemImgPath}">
        		</div>
        		
        		<div class="overlay" id="avatar-shirt">
	        	<img class="card-img" src="${user_shirt.itemImgPath}">
        		</div>
        	</div>
			<div class="card h-70">
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">${user.userName}</a>
                  </h4>
                  
                  <h5>${user.userPoint}포인트</h5>
                  <!-- <h5 id="minus-point"></h5> -->
                  	<div class="card-text">
                  		<div>몸 : ${user_body.itemName}</div>
	                  	<div>머리 : ${user_hair.itemName}</div>
	                  	<div>옷 : ${user_shirt.itemName}</div>
                  	</div>
                  	<div class="float-right">
                  		<button type="button" class="btn btn-outline-danger" id="resetBtn" disabled>되돌리기</button>
                  		<button type="button" class="btn btn-outline-primary" id="purchaseBtn" disabled>구입</button>
                  	</div>
                  	<div class="invisible">
                  		<input type="hidden" id="userid" value="${user.userID}">
                  	</div>
                  </div>
            </div>
        </div>

        <div class="col-lg-8">
          <div class="row">
          	<c:set var="card" value="0"/>
          	<c:forEach begin="0" end="5" step="1" var="vo" items="${item_list}">
	          	<div class="col-lg-4 col-md-6 mb-4">
	          	  <c:set var="card" value="${card+1}"/>
	              <div class="card h-100 item_<c:out value="${card}"/>" id="item_${vo.itemId}_${vo.itemTypeId}">
	               <img class="card-img-top" src="${vo.itemImgPath}">
	                <div class="card-body">
	                  	<div class="d-inline card-title">
		                    <h5><a href="#">${vo.itemName}</a>
		                    <a href="#" class="float-right">#${vo.itemTypeName}</a></h5>
		                </div>
	                  <div>
	                  	<h6>${vo.itemPrice} 포인트</h6>
	                  </div>
	                  <p class="card-text nanum">${vo.itemDetail}</p>
	                  
	                  <div class="float-right">
	                  	<button type="button" class="preview btn btn-outline-primary btn-block">미리보기</button>
	                  </div>
	                </div>
	              </div>
	            </div>
          	</c:forEach>
<!--             <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Item One</a>
                  </h4>
                  <h5>$24.99</h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                </div>
              </div>
            </div> -->
            
          </div>
          <div>
	          <nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item <c:if test="${page.curPage eq 1}">disabled</c:if>">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&lang;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			    <c:forEach begin="1" end="${page.endPage}" var="idx">
			    	<li class="page-item <c:if test="${page.curPage eq idx}">active</c:if>"><a class="page-link" href="#">${idx}</a></li>
			    </c:forEach>
			    <li class="page-item <c:if test="${page.endPage eq page.totalPage}">disabled</c:if>">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&rang;</span>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		  </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->
		<form id="purchase-from">
			<input type="hidden" id="body-id" name="body-id" value="${user_body.itemId}">
			<input type="hidden" id="hair-id" name="hair-id" value="${user_hair.itemId}">
			<input type="hidden" id="shirt-id" name="shirt-id" value="${user_shirt.itemId}">
		</form>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/shop.js"></script>
    <script>
	
		$("#resetBtn").on("click", function() {
			$("#avatar-body").find('img').attr('src', '${user_body.itemImgPath}');
			$("#avatar-hair").find('img').attr('src', '${user_hair.itemImgPath}');
			$("#avatar-shirt").find('img').attr('src', '${user_shirt.itemImgPath}');
			
			$("#body-id").val('${user_body.itemId}');
			$("#hair-id").val('${user_hair.itemId}');
			$("#shirt-id").val('${user_shirt.itemId}');
		});
		
		$("#purchaseBtn").on("click", function() {
			$.ajax({
				type : "post",
				url : "purchase.do",
				data : {
					id : $('#userid').val(),
					body : $('#body-id').val(),
					hair :$('#hair-id').val(),
					shirt : $('#shirt-id').val()
				},
				success : function(data) {
					if (data == 1) {
						alert('구매 성공');
						location.reload();
					}
					
					else if(data == 2){
						alert('구매 목록 없음');
						location.reload();
					}
					
				},

				error : function(error) {
					alert('에러')
				}
			});
		});
	</script>
  </body>

</html>
