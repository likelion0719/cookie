<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src = "js/jquery.cookie.js"></script>
<script type="text/javascript">
	/* var beforeVar 	  = "",
		nextVar 	  = "",
		$changeTarget = ""; */
	
	var dblClick = {
				beforeVar 	  : "",
				nextVar 	  : "",
				$changeTarget : "",
				
			startModule : function() {
				var that = this;	
				
				
				
				$("tbody tr").dblclick(function() {
					//제이쿼리를 쓸때마다 제이쿼리 객체를 새로 생성하기 떄문에  제이쿼리로 타겟을 잡고 변수에 저장하면 메모리 낭비를 줄일 수 있다.
					//this변수에 $ 를 표시한 이유는 가독성을 위해서 (제이쿼리로 타겟을 잡았다는걸 알려주기 위해)
					var $this = $(this);
					
					
					
					if(!$this.hasClass("trLine")) {
						$this.addClass("trLine");
						
						if (that.beforeVar === "" ) {
							that.beforeVar = $this.find("td:eq(1)").text();
							
							that.$changeTarget = $this;
						} else {
							that.nextVar = $this.find("td:eq(1)").text();
							$this.find("td:eq(1)").text(that.beforeVar);
							that.$changeTarget.find("td:eq(1)").text(that.nextVar);
							that.beforeVar = "";
						}
						
					} else {
						$this.removeClass("trLine");
						that.beforeVar = "";
					}
			})
		}
	}
		
	$(function() {
		dblClick.startModule();
		
		/* $("tbody tr").dblclick(function() {
			//제이쿼리를 쓸때마다 제이쿼리 객체를 새로 생성하기 떄문에  제이쿼리로 타겟을 잡고 변수에 저장하면 메모리 낭비를 줄일 수 있다.
			//this변수에 $ 를 표시한 이유는 가독성을 위해서 (제이쿼리로 타겟을 잡았다는걸 알려주기 위해)
			var $this = $(this);
			
			
			
			if(!$this.hasClass("trLine")) {
				$this.addClass("trLine");
				
				if (beforeVar === "" ) {
					beforeVar = $this.find("td:eq(1)").text();
					
					$changeTarget = $this;
				} else {
					nextVar = $this.find("td:eq(1)").text();
					$this.find("td:eq(1)").text(beforeVar);
					$changeTarget.find("td:eq(1)").text(nextVar);
					beforeVar = "";
				}
				
			} else {
				$this.removeClass("trLine");
				beforeVar = "";
			}
			
		});	 */
	});
	
</script>
<style>
	.trLine {
		border : 4px solid #f00;
	}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-offset-1 col-md-3">
			<div class="form-group">
				<input type="text" id="textVal" class="form-control" placeholder="" value="">
			</div>
		</div>
		<div class="col-md-1">
			<div class="form-group">
				<input type="button" class="btn btn-info btn-fill pull-right" value="쿠키GO">
			</div>
		</div>
	</div>
	<div class="row">
       	<div class="col-md-12">
           	<div class="card">
               	<div class="header">
                   	<h4 class="title">쿠키도 뭐 그렇게 어렵진 않아요.</h4>
                   	<p class="category">쿠키 확실하게 다져서 갑시다~</p>
               	</div>
               	<div class="content table-responsive table-full-width">
                   	<table class="table table-hover table-striped">
                       	<thead>
                           	<th>SeqNo</th>
                       		<th>Name</th>
                       		<th>Salary</th>
                       		<th>Country</th>
                       		<th>City</th>
                       	</thead>
                       	<tbody>
                        	<c:forEach items="${welcomeWebList}" var="welcomeWebList" varStatus="status">
                        		<tr>
                            		<td><c:out value="${welcomeWebList.seqNo}"/></td>
                            		<td><c:out value="${welcomeWebList.userName}"/></td>
                            		<td><c:out value="${welcomeWebList.age}"/></td>
                            		<td><c:out value="${welcomeWebList.country}"/></td>
                            		<td><c:out value="${welcomeWebList.etc}"/></td>
                            	</tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>