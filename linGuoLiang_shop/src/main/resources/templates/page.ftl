<script type="text/javascript">
	function pageUtil(page){
		$("[name='cpage']").val(page);
		$("form").submit();
	}
</script>

	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  	 <#if page.hasPreviousPage>
	    	<li class="page-item"><a class="page-link" href="javascript:pageUtil('1')">首页</a></li>
	    <#else>
	    	<li class="page-item disabled"><a class="page-link" href="#">首页</a></li>
	    </#if>
	    
	    
	    <#if page.hasPreviousPage>
	    	<li class="page-item">
		      <a class="page-link" href="javascript:pageUtil('${page.prePage}')" aria-label="Previous"  tabindex="-1">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
	    <#else>
	    	<li class="page-item disabled">
		      <a class="page-link" href="#" aria-label="Previous"  tabindex="-1">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
	    </#if>
	    
	    
	  <#list page.navigatepageNums as p>
	  	<#if page.pageNum=p>
	  		 <li class="page-item active"> <a class="page-link" href="javascript:pageUtil('${p}')"  tabindex="-1">${p}<span class="sr-only">(current)</span></a> </li>
		<#else>
			<li class="page-item"><a class="page-link" href="javascript:pageUtil('${p}')"  tabindex="-1">${p}</a></li>	  	
	  	</#if>
	  </#list>
	    
	    
	    <#if page.hasNextPage>
	    	<li class="page-item">
		      <a class="page-link" href="javascript:pageUtil('${page.nextPage}')" aria-label="Next"  tabindex="-1">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
	    <#else>
	    	<li class="page-item disabled">
		      <a class="page-link" href="#" aria-label="Next"  tabindex="-1">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
	    </#if>
	    
	     <#if page.hasNextPage>
	    	<li class="page-item"><a class="page-link" href="javascript:pageUtil('${page.pages}')">尾页</a></li>
	    <#else>
	    	<li class="page-item disabled"><a class="page-link" href="#">尾页</a></li>
	    </#if>
	  </ul>
	</nav>
	