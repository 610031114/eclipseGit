<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/bootstrap.min.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="/js/popper.min.js" ></script>
<script type="text/javascript" src="/js/bootstrap.min.js" ></script>

</head>
<script type="text/javascript">
	$(function(){
		$("#ck").click(function(){
			$("[name='sids']").prop("checked",$(this).is(":checked"));
		})
		
		
	})
	
	function deleteAll(){
		var sids = $("[name='sids']:checked").map(function(){
			return this.value;
		}).get();
		if(sids==""){
			alert("请先选中删除项!");
		}else{
			if(confirm("确认删除编号为"+sids+"的店铺吗?")){
				$.post(
					"deleteAll?sids="+sids,
					function(msg){
						if(msg>0){
							alert("删除成功!");
							location.reload(true);
						}else{
							alert("删除失败,请联系管理员!");
						}
					}
					)
			}
		}
	}
</script>
<body>
	<form action="/list" method="post">
		<input type="hidden" name="cpage">
		销售商品：<#list good_list as g>
					<input type="checkbox" name="gids" 
						<#list map.gidsList as gid >
							<#if gid=g.gid>checked</#if>
						</#list>
					 value="${g.gid}">${g.gname}
				</#list> <br>
		店铺名称：<input type="text" name="likename" value="${map.likename}" >
				<button type="submit" class="btn btn-primary" >查询</button>
				<button type="button" class="btn btn-success" onclick="location='toAdd'">添加</button>
				<button type="button" class="btn btn-danger" onclick="deleteAll()">批量删除</button>
	</form>
	
	<table  class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th> <input type="checkbox" id="ck"> </th>
				<th>编号</th>
				<th>店铺名称</th>
				<th>创建日期</th>
				<th>销售商品</th>
				<th>操作</th>
			</tr>
		</thead>
		<#list shop_list as s>
			<tr>
				<td> <input type="checkbox" name="sids" value="${s.sid}"> </td>
				<td>${s.sid}</td>
				<td>${s.sname}</td>
				<td>${s.times?string('yyyy-MM-dd')}</td>
				<td>${s.names}</td>
				<td> <input class="btn btn-primary" type="button" value="详情" onclick="location='toMessage?sid=${s.sid}'"> </td>
			</tr>
		</#list>
	</table>
	<#include "page.ftl" />
</body>
</html>