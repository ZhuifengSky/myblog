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
<link rel="stylesheet" href="/static/css/blog.min.css" />
<link rel="stylesheet"
	href="/static/js/bootstrap/2.3.1/css_flat/bootstrap.min.css"
	type="text/css" id="remove-bt-css1" />
<script src="/static/js/bootstrap/2.3.1/js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
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
								clmns += "<a href="+item.targetUrl+">"
										+ item.name + "</a>";
							});
							$("#nav").append(clmns);
							var cls = "<div class='clear'></div>";
							$("#nav").append(cls);
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
<body style="height: 100%">
    <canvas id="cas" style="position:absolute;top:0px;left:0px;z-index:1;">您的浏览器不支持HTML5 canvas，请换一个浏览器。</canvas>
	<div id="container"> <!--header start-->
	<div id="header">
		<h3>MyBlog</h3>
		<p>xxxxxx。</p>
	</div>
	<!--header end--> <!--nav-->
	<div id="nav"></div>
	<!--nav end--> <!--content start-->
	<div id="content">
		<div id="left">aaa</div>
		<form action="/index/getArticles" method="post" id="searchForm">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" />
			<div id="right">
				<c:forEach items="${page.list}" var="art">
					<div class="wz">
						<h4>
							<a href="#" title="${art.subTitle}">${art.title}</a>
						</h4>
						<dl>
							<dd>
								<p class="dd_text_1">${art.descStr}</p>
								<p class="dd_text_2">
									<span class="left author">${art.authorName}</span> <span
										class="left sj">时间:${art.createDate}</span> <span
										class="left fl">分类:<a href="#"
										title="${art.categoryName}">${art.categoryName}</a></span> <span
										class="left yd"><a href="#" title="阅读全文">阅读全文</a> </span>
								<div class="clear"></div>
								</p>
							</dd>
							<div class="clear"></div>
						</dl>
					</div>
				</c:forEach>
				<div class="clear"></div>
				<div class="pagination">${page}</div>
			</div>
		</form>
	</div>
	<!--content end--> <!--footer start-->
	<div id="footer">
		<p>
			Design by:<a href="" target="_blank">dd</a> 2017-8-9
		</p>
		
	</div>
	<!--footer end--> 
    </div>
	<script>
		var canvas = document.getElementById("cas");
		var ctx = canvas.getContext("2d");
		resize();
		window.onresize = resize;
		function resize() {
			canvas.width = document.body.clientWidth; 
			canvas.height = document.body.clientHeight;
			
		}

		var RAF = (function() {
			return window.requestAnimationFrame
					|| window.webkitRequestAnimationFrame
					|| window.mozRequestAnimationFrame
					|| window.oRequestAnimationFrame
					|| window.msRequestAnimationFrame || function(callback) {
						window.setTimeout(callback, 1000 / 60);
					};
		})();

		// 鼠标活动时，获取鼠标坐标
		var warea = {
			x : null,
			y : null,
			max : 20000
		};
		window.onmousemove = function(e) {
			e = e || window.event;

			warea.x = e.clientX;
			warea.y = e.clientY;
		};
		window.onmouseout = function(e) {
			warea.x = null;
			warea.y = null;
		};

		// 添加粒子
		// x，y为粒子坐标，xa, ya为粒子xy轴加速度，max为连线的最大距离
		var dots = [];
		for (var i = 0; i < 200; i++) {
			var x = Math.random() * canvas.width;
			var y = Math.random() * canvas.height;
			var xa = Math.random() * 2 - 1;
			var ya = Math.random() * 2 - 1;

			dots.push({
				x : x,
				y : y,
				xa : xa,
				ya : ya,
				max : 6000
			})
		}

		// 延迟100秒开始执行动画，如果立即执行有时位置计算会出错
		setTimeout(function() {
			animate();
		}, 100);

		// 每一帧循环的逻辑
		function animate() {
			ctx.clearRect(0, 0, canvas.width, canvas.height);

			// 将鼠标坐标添加进去，产生一个用于比对距离的点数组
			var ndots = [ warea ].concat(dots);

			dots.forEach(function(dot) {

				// 粒子位移
				dot.x += dot.xa;
				dot.y += dot.ya;

				// 遇到边界将加速度反向
				dot.xa *= (dot.x > canvas.width || dot.x < 0) ? -1 : 1;
				dot.ya *= (dot.y > canvas.height || dot.y < 0) ? -1 : 1;

				// 绘制点
				ctx.fillRect(dot.x - 0.5, dot.y - 0.5, 1, 1);

				// 循环比对粒子间的距离
				for (var i = 0; i < ndots.length; i++) {
					var d2 = ndots[i];

					if (dot === d2 || d2.x === null || d2.y === null)
						continue;

					var xc = dot.x - d2.x;
					var yc = dot.y - d2.y;

					// 两个粒子之间的距离
					var dis = xc * xc + yc * yc;

					// 距离比
					var ratio;

					// 如果两个粒子之间的距离小于粒子对象的max值，则在两个粒子间画线
					if (dis < d2.max) {

						// 如果是鼠标，则让粒子向鼠标的位置移动
						if (d2 === warea && dis > (d2.max / 2)) {
							dot.x -= xc * 0.03;
							dot.y -= yc * 0.03;
						}

						// 计算距离比
						ratio = (d2.max - dis) / d2.max;

						// 画线
						ctx.beginPath();
						ctx.lineWidth = ratio / 2;
						ctx.strokeStyle = 'rgba(0,0,0,' + (ratio + 0.2) + ')';
						ctx.moveTo(dot.x, dot.y);
						ctx.lineTo(d2.x, d2.y);
						ctx.stroke();
					}
				}

				// 将已经计算过的粒子从数组中删除
				ndots.splice(ndots.indexOf(dot), 1);
			});

			RAF(animate);
		}
	</script>
</body>
</html>