<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src = "js/jquery.cookie.js"></script>
<script type="text/javascript">
	$(function() {
		/* var $cookieBtn = $("[type=button]");
		$cookieBtn.click(function() {
			
			if ($("#textVal").val().length === 0) {
				alert("name을 입력해주세요");
				
				return
			} else {
				var target = $("#textVal").val();
				
				$("tbody tr").each(function() {
					
					if (target === $(this).find("td:eq(1)").text()) {
						
						if(!$(this).hasClass("trLine")) {
							$(this).addClass("trLine");
						} else {
							$(this).removeClass("trLine");
						}
					}
				})
			}
		}) */
		
		lineCheck.init();
		lineCheck.initFn();
		
		
		
		var arr = trCookie.getCookieArray();
		
		for(var i = 0; i < arr.length; i++) {
			$("tbody tr:eq(" + arr[i] +")").addClass("trLine");
		}
	});
	
	var lineCheck = {
			$cookieBtn : null,
			
			init : function () {
				this.$cookieBtn = $("[type=button]");
			},
			
			initFn : function() {
				var that = this;
				
				this.$cookieBtn.click(function() {
					if ($("#textVal").val().length === 0) {
						alert("name을 입력해주세요");
						
						return
					} else {
						that.drawLine($("#textVal").val());
					}
				})
				
			},
			
			drawLine : function(target) {
				var arr = [];
				
					$("tbody tr").each(function() {
					
					if (target === $(this).find("td:eq(1)").text()) {
						
						if(!$(this).hasClass("trLine")) {
							$(this).addClass("trLine");
						} else {
							$(this).removeClass("trLine");
						}
					}
					
					if($(this).hasClass("trLine")) {
						arr.push($(this).index());
					}
				})
				
				//alert(arr);
				trCookie.setCookieArray(arr);	
				
				if ($(".trLine").length === $("tbody tr").length) {
					alert("다 채웠다.")
				} else if ($(".trLine").length === 0) {
					alert("다 지웠다");	
				}
					
			}
			
	}
	
	var trCookie = {
			setCookieArray : function(arr){
				var str = "";
				for(var key in arr) {
				
					if (str !== "") {
						str += ",";
					}
					str += key + ":" + arr[key];
					
				}
				
				this.setCookie(str);
			},
	
			setCookie : function(str) {
				/* var d = new Date();
				
				d.setTime(d.getTime() + (1*24*60*60*1000));
			
				var expires = "expires=" + d.toUTCString();
				
				document.cookie = "trCookie=" + str + ";" + expires; */
				
				$.cookie("trCookie", str, {expires :1});
			},
			
			getCookie : function() {
				/* var name = "trCookie=",
					cookie = document.cookie;
				return cookie.substring(name.length, cookie.length); */
				
				return $.cookie("trCookie");
			},
			
			getCookieArray : function() {
				var str = this.getCookie();
				
				if (str === null) {
					str = "";
				}
				
				var tmpl = str.split(","),
					result = [];
					
				for (var i in tmpl) {
					var tmp = tmpl[i].split(":");
					result[tmp[0]] = tmp[1];
				}
				
				return result;
			}
			
	}
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