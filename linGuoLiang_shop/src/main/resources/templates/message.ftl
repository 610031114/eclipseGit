<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/bootstrap.min.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript" src="/js/popper.min.js" ></script>
<script type="text/javascript" src="/js/bootstrap.min.js" ></script>

<script type="text/javascript">

	function back(){
		history.back();
	}

</script>

</head>
<body>
		<table  class="table table-hover">
			<tr>
				<th>店铺编号名称</th>
				<td> ${shop.sid} </td>
			</tr>
			<tr>
			<tr>
				<th>店铺名称</th>
				<td> ${shop.sname} </td>
			</tr>
			<tr>
				<th>创建日期</th>
				<td> ${shop.times?string('yyyy-MM-dd')} </td>
			</tr>
			<tr>
				<th>销售商品</th>
				<td>
					<#list good_list as g>
						 <input type="checkbox" name="gids" disabled 
						 	<#list gidList as gg>
								<#if g.gid=gg>checked</#if>
							</#list>
						  value="${g.gid}">${g.gname}
					</#list>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn btn-primary" onclick="back()" >返回</button>
				</td>
			</tr>
		</table>
</body>
</html>