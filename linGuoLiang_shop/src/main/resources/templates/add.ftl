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
	function addShop(){
		$.post(
			"addShop",
			$("form").serialize(),
			function(msg){
				if(msg>0){
					alert("添加成功!");
					location = "list";
				}else{
					alert("添加失败,请联系管理员!");
				}
			}
		)
	}
</script>
<body>
	<form>
		<table  class="table table-hover">
			<tr>
				<th>店铺名称</th>
				<td> <input type="text" name="sname"> </td>
			</tr>
			<tr>
				<th>创建日期</th>
				<td> <input type="date" name="times"> </td>
			</tr>
			<tr>
				<th>销售商品</th>
				<td>
					<#list good_list as g>
						<input type="checkbox" name="gids" value="${g.gid}">${g.gname}
					</#list>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn btn-primary" onclick="addShop()" >添加</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>