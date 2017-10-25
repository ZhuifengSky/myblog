<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyBlog</title>
<link rel="stylesheet" href="/static/css/index.css" />
<link rel="stylesheet" href="/static/css/style.css" />
<link rel="stylesheet" href="/static/css/blog.min.css" />
<link rel="stylesheet" href="/static/js/bootstrap/2.3.1/css_flat/bootstrap.min.css" type="text/css" id="remove-bt-css1" />
<script src="/static/js/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/static/js/jquery1.42.min.js"></script>
<script type="text/javascript"
	src="/static/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/static/js/json/json2.js"></script>
<script type="text/javascript" src="/static/js/json/json_parse.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$.ajax({
					type : "GET",
					url : "/index/getColumns",
					dataType : "json",
					success : function(json) {
						if (json != null) {
							var dataObj = eval(json);//转换为json对象 
							var clmns = "";
							//遍历json数组 
							$.each(dataObj, function(i, item) {
								clmns += "<li><a href="+item.targetUrl+">"
										+ item.name + "</a></li>";
							});
							$("#columnList").append(clmns);
							var cls = "<div class='clear'></div>";
							$("#columnList").append(cls);
						} else {
							alert("请求失败!")
						}
					},
					error : function(XMLHttpRequest, errorThrown) {
						alert(errorThrown);
					}
				});
			});
	
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body>
	<!--header start-->
	<div id="header">
		<h3>MyBlog</h3>
		<p>xxxxxx。</p>
	</div>
	<!--header end-->
	<!--nav-->
	<div id="nav">
		<ul id="columnList"></ul>
	</div>
	<!--nav end-->
	<!--content start-->
	<div id="content">
	    <form action="/index/getArticles" method="post" id="searchForm">
	       <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		   <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}" />
		<!--left-->
		<div class="left" id="c_left">
			<div class="s_tuijian">
				<h2>
					文章<span>列表</span>
				</h2>
			</div>
			<!--wz-->
			<div class="content_text">
				<c:forEach items="${page.list}" var="art">
					<div class="wz">
						<h3>
							<a href="#" title="${art.subTitle}">${art.title}</a>
						</h3>
						<dl>
							<dd>
								<p class="dd_text_1">${art.descStr}</p>
								<p class="dd_text_2">
									<span class="left author">${art.authorName}</span>
									<span class="left sj">时间:${art.createDate}</span>
									<span class="left fl">分类:<a href="#"title="${art.categoryName}">${art.categoryName}</a></span>
									<span class="left yd"><a href="#" title="阅读全文">阅读全文</a> </span>
								<div class="clear"></div>
								</p>
							</dd>
							<div class="clear"></div>
						</dl>
					</div>
				</c:forEach>
			</div>
			<!--wz end-->
		</div>
		<!--left end-->
		<!--right-->
		<div class="right" id="c_right">
			<div class="s_about">
				<h2>关于博主</h2>
				<img src="images/my.jpg" width="230" height="230" alt="博主" />
				<p>博主：XX</p>
				<p>职业：web前端、视觉设计</p>
				<p>简介：</p>
				<p>
					<a href="#" title="联系博主"><span class="left b_1"></span></a><a
						href="#" title="加入QQ群，一起学习！"><span class="left b_2"></span></a>
				<div class="clear"></div>
				</p>
			</div>
			<!--栏目分类-->
			<div class="lanmubox">
				<div class="hd">
					<ul>
						<li>精心推荐</li>
						<li>最新文章</li>
						<li class="hd_3">随机文章</li>
					</ul>
				</div>
				<div class="bd">
					<ul>
						<li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
						<li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
						<li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
						<li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
						<li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
					</ul>
					<ul>
						<li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
						<li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
						<li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
						<li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
						<li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
					</ul>
					<ul>
						<li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
						<li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
						<li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
						<li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
						<li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
					</ul>
				</div>
			</div>
			<!--end-->
			<div class="link">
				<h2>友情链接</h2>
				<p>
					<a href="#">个人博客</a>
				</p>
			</div>
		</div>
		<!--right end-->
		<div class="clear"></div>
		<div class="pagination">${page}</div>
		</form>
	</div>
	<!--content end-->
	<!--footer start-->
	<div id="footer">
		<p>
			Design by:<a href="" target="_blank">dd</a> 2017-8-9
		</p>
	</div>
	<!--footer end-->
	<script type="text/javascript">
		jQuery(".lanmubox").slide({
			easing : "easeOutBounce",
			delayTime : 400
		});
	</script>
	<script type="text/javascript" src="/static/js/nav.js"></script>
</body>
</html>