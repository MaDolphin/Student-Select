<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
		<style type="text/css" title="currentStyle">	 	

	 	@import "css/style-protfoliomanage.css"; 
		</style> 
	
	<title>部门数据编辑</title>
	
	<style type="text/css">
	
	.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE1 a:hover{
	COLOR: red;
}

.STYLE1 a{
	COLOR: white;
}

A.relatelink:hover {
	COLOR: #FF6600;
	TEXT-DECORATION: none
}

	</style>
	
</head>
<script src="js/client_validate.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="plug-in/jquery-spin.js"></script>
<script src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jQuery.FillOptions.js"></script>
<script type="text/javascript" src="js/jQuery.CascadingSelect.js"></script>
<script type="text/javascript">

		$(document).ready(function(){
		
			$.spin.imageBasePath = './images/spin1/';

			$(".percent_input").spin({  // 对所有 class="percent_input" 的元素操作
				max: 100,
				min: 0,
				timeInterval: 100
			});
			
			// 查询
			$("#member_department").FillOptions(  
	             "listProjectMemberRefOption!getMemberDepartmentOption.action",    
	             {    
		             datatype:"json",
		             textfield:"department",  
		             valuefiled:"department",   
		             selectedindex:0,//填充并选中第1项    
		             keepold:true//填充并且保留原有项    
	             }    
			);
			
			$("#member_department").AddOption("< - - 请选择部门 - - >","-1",true,0);//最上端插入一个文本为“请选择部门“，值为”-1“的列表项，并且是选中状态
	 		
			$("#member_department").CascadingSelect(
			            $("#member_name"),//需要联动的下拉列表框，必须   
			            "listProjectMemberRefOption!getMemberDepartmentOption.action",    
			            {datatype:"json",textfield:"member_name",valuefiled:"member_name",parameter:"department"},//通过设置parameter:”p”这个参数会生成一个"handler1.ashx?p=xxx”这样的地址来做ajax请求    
			            function(){//完成联动后执行
			            	getMicroportIDByName();
			            }
			 ); 
			 
 			 $("#member_name").CascadingSelect(    
			            $("#microport_id"),//需要联动的下拉列表框，必须    
			            "listProjectMemberRefOption!getMicroportIdByMemberName.action",    
			            {datatype:"json",textfield:"microport_id",valuefiled:"microport_id",parameter:"member_name"},//通过设置parameter:”p”这个参数会生成一个"handler1.ashx?p=xxx”这样的地址来做ajax请求    
			            function(){//完成联动后执行   
			           		if(document.getElementsByName('microport_id')[0].options.length>1){
			           			alert("本公司该员工有重名，请确认工号是否正确 ! ");
			           		}
			            }    
			 );

 			var member_department_ajax=document.getElementById("member_department_para").value;

 			var member_name_para_ajax = document.getElementById("member_name_para").value;

			if(member_department_ajax.length > 0){
				document.getElementById("member_department").value=member_department_ajax;
				member_department_ajax = encodeURIComponent(member_department_ajax);
				$("#member_name").FillOptions(    
			             "listProjectMemberRefOption!getMemberDepartmentOption.action?department="+member_department_ajax,    
			             {    
				             datatype:"json",
				             textfield:"member_name",    
				             valuefiled:"member_name",    
				             selectedindex:0,//填充并选中第1项    
				             keepold:true//填充并且保留原有项
			             }
					);
				
				document.getElementById("member_name").value=member_name_para_ajax;
				member_name_para_ajax = encodeURIComponent(member_name_para_ajax);
				
				$("#microport_id").FillOptions(
			             "listProjectMemberRefOption!getMicroportIdByMemberName.action?member_name="+member_name_para_ajax,    
			             {    
				             datatype:"json",    
				             textfield:"microport_id",    
				             valuefiled:"microport_id",    
				             selectedindex:0,//填充并选中第1项    
				             keepold:true//填充并且保留原有项    
			             }    
				  );
			}

 			// 项目所属子公司和事业部、添加到的项目选择
 			$("#belong_subcompany_dep").FillOptions(    
	             "listProjectMemberRefOption!getSubcompanyAndDepartmentOption.action",    
	             {    
		             datatype:"json", 
		             textfield:"belong_subcompany_dep",    
		             valuefiled:"belong_subcompany_dep", 
		             selectedindex:0,//填充并选中第1项
		             keepold:true//填充并且保留原有项
	             }
			);
 			
 			$("#belong_subcompany_dep").AddOption("< - - 请选择子公司或事业部 - - >","-1",true,0);//最上端插入一个文本为“请选择项目“，值为”-1“的列表项，并且是选中状态
 			
 			$("#belong_subcompany_dep").CascadingSelect(
		            $("#project_id_add"),//需要联动的下拉列表框，必须    
		            "listProjectMemberRefOption!getSubcompanyAndDepartmentOption.action",    
		            {datatype:"json",textfield:"product_name",valuefiled:"project_id",parameter:"belong_subcompany_dep"},//通过设置parameter:”p”这个参数会生成一个"handler1.ashx?p=xxx”这样的地址来做ajax请求    
		            function(){//完成联动后执行
		            	//getMicroportIDByName();
		            } 
		 ); 
			var x = document.getElementById("belongto_year_month_para").value;
			document.getElementById("belongto_year_month").value = x.substring(0, 7);

	  });
		
	  function checkCurrentYearMonth(){
	  
		   var select=document.getElementById("current_year_month");
		  
	      if (select.checked==true)
	        {
	        
	        document.getElementById("belongto_year_month").value = "";
	         
	         document.getElementById("belongto_year_month").disabled="disabled";  
	         
	        }
	      else
	        {
	        // document.getElementById("belongto_year_month").value = "";
	         document.getElementById("belongto_year_month").disabled="";
	        }	
	  }

	  function checkCurrentYearMonthAdd(){
		  
		   var select=document.getElementById("current_year_month_add");
		  
	      if (select.checked==true)
	        { 
	        
	        document.getElementById("belongto_year_month_add").value = "";
	         
	        document.getElementById("belongto_year_month_add").disabled="disabled";  
	         
	        }
	      else
	        {
	         document.getElementById("belongto_year_month_add").disabled="";
	        }	   
	  }

	  function getMicroportIDByName(){
	    // 删除所有的option
		var obj=document.getElementById("microport_id"); 
		
		obj.options.length=0;

	  	var x=document.getElementById("member_name").value;
	  	
	  	$("#microport_id").FillOptions(    
	      		 "listProjectMemberRefOption!getMicroportIdByMemberName.action?member_name=" + encodeURIComponent(x),
	             {    
		             datatype:"json",    
		             textfield:"microport_id",    
		             valuefiled:"microport_id",    
		             selectedindex:0,//填充并选中第1项    
		             keepold:true//填充并且保留原有项    
	             }    
			);
	  }
		
	function searchJoinProjectList(actionUrl){
		
		var check_dep=document.getElementById("member_department").value;
		if(check_dep.length == 0 || check_dep == "< - - 请选择部门 - - >" ||check_dep == -1){
			
			alert("请选择部门！");
			return;
		}
		var check_date=document.getElementById("belongto_year_month").value;
		if( check_date.length == 0 ){
			alert("请选择一个时间参数！");
			return;
		}
		
		var x=document.getElementById("member_department").value;
		document.getElementById("member_department_para").value = x;
		
		    x=document.getElementById("member_name").value;
		document.getElementById("member_name_para").value=x;
		
			x=document.getElementById("microport_id").value;
		document.getElementById("microport_id_para").value=x;
		
		    x=document.getElementById("belongto_year_month").value;
		if(x !=""){
			document.getElementById("belongto_year_month_para").value= x + "-01";
		}else{
			document.getElementById("belongto_year_month_para").value= "";
		}

		searchParaForm.action = actionUrl;
		searchParaForm.submit();	
	}
	
	function addProjectMemberRefForDepFunction(actionUrl){
		
		var check_dep=document.getElementById("member_department").value;
		if(check_dep.length == 0 || check_dep == "< - - 请选择部门 - - >" ||check_dep == -1){
			
			alert("请选择部门！");
			return;
		}
		
		var check_project=document.getElementById("project_id_add").value;
		if(check_project.length == 0 || check_project == "< - - 请选择项目 - - >" ||check_project == -1){
			
			alert("请选择项目！");
			return;
		}
		
		var check_date=document.getElementById("belongto_year_month").value;
		if( check_date.length == 0){
			alert("请选择一个时间参数！");
			return;
		}
		
		var x=document.getElementById("member_department").value;
		document.getElementById("member_department_para").value = x;
		
		    x=document.getElementById("member_name").value;
		document.getElementById("member_name_para").value=x;
		
			x=document.getElementById("microport_id").value;
		document.getElementById("microport_id_para").value=x;
		
		    x=document.getElementById("project_id_add").value;
		document.getElementById("project_id_para").value=x;
		
		    x=document.getElementById("belongto_year_month").value;
		    
		if(x !=""  && x.length == 7){
			document.getElementById("belongto_year_month_para").value= x + "-01";
		}else if(x.length > 10){
			document.getElementById("belongto_year_month_para").value= "";
			alert("时间参数格式不正确，请重新选择！");
			return;
		}
		
		x=document.getElementById("belong_subcompany_dep").value;
		document.getElementById("belong_subcompany_dep_para").value=x;
		
		
		var microport_id = null;
		var member_name = null;
		
		//var project_id_archived =null;
		var if_archived =null;
		
		
		var microport_id_para = document.getElementById("microport_id").value;
		var project_id_para = document.getElementById("project_id_add").value;
		
		var belong_to_year_month_para = document.getElementById("belongto_year_month").value;
		if(belong_to_year_month_para !=""){
			belong_to_year_month_para = belong_to_year_month_para +"-01";
		}
		<%--// 比较添加的时间是否已经归档
		jQuery.ajax({ 
            url : 'checkIfArchivedByBelongYearMonthAndProjectId.action',
            data: {project_id_para:project_id_para,belongto_year_month_para:belong_to_year_month_para},
            contentType: "application/json;charset=utf-8",
            type : 'GET', 
            dataType:'json', 
            success : function(data){ 
            $.each(data,function(idx,item){
            	project_id_archived = item.project_id;
            	if_archived = item.IfArchived;
  	  			  	}); 									   				  
            }, 
            error : function() { 
                alert('数据加载失败,请重试..'); 
            }  
        });
		
		if(if_archived =="noArchive"){
			alert("此月份数据未生成、暂时不可以添加") ;
			return;
		} --%>
		
		// 检查此数据是否在数据库中以存在
		jQuery.ajax({ 
            url : 'checkIfExistMemberNameByMicroportIdAndProjectId.action?'+ new Date(),
            data: {microport_id_para:microport_id_para, project_id_para:project_id_para,belongto_year_month_para:belong_to_year_month_para},
            contentType: "application/json;charset=utf-8",
            type : 'GET', 
            dataType:'json', 
            success : function(data){ 
            
            $.each(data,function(idx,item){
            	microport_id = item.microport_id;
            	member_name = item.member_name;
  	  			  	}); 			
  	  			  								   				  
            }, 
            error : function() { 
                alert('数据加载失败,请重试..'); 
            }  
        });
		
		if(member_name =="nodata"){
			searchParaForm.action = actionUrl;
			searchParaForm.submit();	
		}else{
			//document.getElementById("belongto_year_month").value= "";
			alert(member_name +" (工号："+microport_id+") "+" 在此项目中已经存在 ! ");
			return;
		}
	}
	
	function deleteProjectMemberRefForDep(project_member_ref_id){
		
		document.getElementById("project_member_ref_id_para").value=project_member_ref_id;
		
		searchParaForm.action = "deleteProjectMemberRefForDep";
		searchParaForm.submit();	

	}
	
	function updateProjectMemberPercent(project_member_ref_id){
			
			var selectId = "percent"+project_member_ref_id;
	
			var selectValue=document.getElementById(selectId).value;
			
			if(selectValue < 0 || selectValue > 100 || selectValue ==null | selectValue == ""){
				alert("工作分配比例范围为 0% ~ 100%, 请重新输入");
				return;
			}
			
		 	if(selectValue == 0){
		 		selectValue = 0.00001;
		 	}else{
		 		document.getElementById(selectId).value = selectValue;
		 	}
			
			var member_department_para = document.getElementById("member_department_para").value;
			
			var member_name_para = document.getElementById("member_name_para").value;
			
			var microport_id_para = document.getElementById("microport_id_para").value;
			
			var belongto_year_month_para = document.getElementById("belongto_year_month_para").value;
			
		     
 			var actionUrl = "updateProjectMemberPercent?project_member_ref_id=" + project_member_ref_id+"&percent="+selectValue
 							+"&member_name_para=" + member_name_para +"&microport_id_para="+microport_id_para+
 							"&belongto_year_month_para=" + belongto_year_month_para + "&member_department_para=" + member_department_para;

			window.location.href = actionUrl;
}
	function returnList(actionUrl){
			 verform.action = actionUrl;
			 verform.submit();
		}
</script>

<body >
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr height="24" bgcolor="#353c44" align="left" >
         <td width="2%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
         <td width="80%" valign="bottom"><span class="STYLE1" >项目组合管理  &gt;&gt;  资源管理 &gt;&gt;  部门数据编辑</span></td>
         <td width="18%"  align="right">
	         <span class="STYLE1" >
	         	 <img src="images/del.gif" width="10" height="10" />&nbsp;&nbsp;<s:a href="view/projectportfoliomanage/delete_dep_leave_staff.jsp">删除离职人员</s:a> &nbsp;&nbsp;&nbsp;&nbsp;
	         </span>
         </td>
       </tr>
     </table>
		        
	<form action="" name = searchParaForm>
	
		<input type="hidden" id="member_department_para" name="member_department_para" value ="<s:property value="#request.member_department_para"/>">
		
		<input type="hidden" id="member_name_para" name="member_name_para" value ="<s:property value="#request.member_name_para"/>">
		
		<input type="hidden" id="microport_id_para" name="microport_id_para" value ="<s:property value="#request.microport_id_para"/>">
		
		<input type="hidden" id="belongto_year_month_para" name="belongto_year_month_para" value ="<s:property value="#request.belongto_year_month_para"/>">
		
		<input type="hidden" id="project_member_ref_id_para" name="project_member_ref_id_para" value="">
		
		<input type="hidden" id="project_id_para" name="project_id_para" value="<s:property value="#request.project_id_para"/>">
		
		<input type="hidden" id="belong_subcompany_dep_para" name="belong_subcompany_dep_para"  value="<s:property value="#request.belong_subcompany_dep_para"/>">
		
	</form>

	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	       <td height="24" bgcolor="#d3eaef">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
		         <tr >			            
					<td width="80%">
						<div>
							<label for="member_department"><span class="STYLE10" >人员所属部门</span></label>
								<select name="member_department" id="member_department"  style="width:200px">
								</select>
							<label for="member_name"><span class="STYLE10" >姓名</span></label>
								<select name="member_name" id="member_name" style="width:80px">
								</select>			
							<label for="microport_id"><span class="STYLE10" >工号</span></label>
								<select name="microport_id" id="microport_id"  style="width:80px">
								</select>	
							<label for="belongto_year_month"><span class="STYLE10" >日期</span></label>
							<input id="belongto_year_month"  name="belongto_year_month" style="width:80px" class="Wdate" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM'})"/>
						</div>
					</td>
					
					<td width="20%">
						<input name="return" type="button" class="buttom" style="width:80px" value="查 询" onClick="searchJoinProjectList('joinProjectPercentEdit.action')"/>						
					</td>
		        </tr>
	        </table>
	       </td>
	  </tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	       <td height="24" bgcolor="#d3eaef">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
		        <tr>
			        <td width="80%">			        
			        	<div>
	        			    <label for="belong_subcompany_dep"><span class="STYLE10" >项目所属子公司或事业部</span></label>
							<select name="belong_subcompany_dep" id="belong_subcompany_dep"  style="width:260px">
							</select>
							
	        			    <label for="project_id_add"><span class="STYLE10" >项目名称</span></label>
							<select name="project_id_add" id="project_id_add"  style="width:260px">
							</select>
						</div>
					</td>
					
					<td width="20%">
						<input name="return" type="button" class="buttom" style="width:80px" value="添 加" onClick="addProjectMemberRefForDepFunction('addProjectMemberRefForDep.action')"/>						
					</td>
		        </tr>
	        </table>
	       </td>
	  </tr>
	</table>

	<form name="verform"  action="" method="post"  target="_self" id="verform">
		<fieldset style="width:95%" >
		
			<legend align="center"><s:property value="#request.member_name_para"/> 参与项目或部门名称
				(
				<s:if test="#request.belongto_year_month_para=='2099-09-09 '" >当前月</s:if>
				
				<s:if test="#request.belongto_year_month_para!='2099-09-09 '" >
					<s:property value="#request.belongto_year_month_para"/>
				</s:if>
				)	
			</legend>
			
			<br>
			
			<table width="100%" cellspacing= "0"   cellpadding= "0" class="table">
				<thead>
			      <tr>
			      	<th  style="DISPLAY:none" width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">编号</span></div></th>
			        <th class="table_th" width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">项目编号</span></div></th>
			        <th class="table_th" width="35%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">项目或部门名称</span></div></th>
			        <th class="table_th" width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">工作百分比(%)</span></div></th>
			        <th class="table_th" width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">变动百分比(%)</span></div></th>
			        <th class="table_th" width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">修改(%)</span></div></th>
			        <th class="table_th" width="25%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">保存修改</span></div></th>
			        <th class="table_th" width="25%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">删        除</span></div></th>
			      </tr>
			    <thead>
			    
			    <tbody>
			    
			    <s:iterator value="#request.listJoinProject" id="us">
			    	<tr>
			    		<td class="table_td" style="DISPLAY:none">
			    		
			    			<div align="center"><s:property value="#us.project_member_ref_id"/></div>
			    		
			    		</td>
				   		<td class="table_td">
							<div align="center"><s:property value="#us.project_id"/></div>
						</td>
						
						<td class="table_td">
							<div align="center"><s:property value="#us.product_name"/></div>
						</td>
							
						<td class="table_td">
							<div align="center"><s:property value="#us.input_percent"/></div>
						</td>
						
						<s:if test="#us.change_percent > 0 ">
	                        <td class="table_td">
	                       		<div align="center"><font color="red">▲  <s:property value="#us.change_percent"/></font></div>
	                       	</td> 
	                    </s:if>
	                       
	                    <s:if test="#us.change_percent < 0 ">
	                       	<td class="table_td">
	                       		<div align="center"><font color="green">▼  <s:property value="#us.change_percent"/></font></div>
	                       	</td> 
	                    </s:if>
	                       
	                    <s:if test="#us.change_percent == 0 ">
	                       	<td class="table_td">
	                       		<div align="center"><font color="gray">◆ <s:property value="#us.change_percent"/></font></div>
	                       	</td> 
	                    </s:if>
						
						<td class="table_td">
							<input class="percent_input" type="text"  name="percent<s:property value="#us.project_member_ref_id"/>" id="percent<s:property value="#us.project_member_ref_id"/>" value="0" style="width:80px"/>
						</td>
						
						<td class="table_td">
							<div align="center">
								<input name="return" type="button" class="buttom" value="保存修改" onClick="updateProjectMemberPercent('<s:property value="#us.project_member_ref_id"/>')"/>							
							</div>  
						</td>
						
						<td class="table_td">
							<div align="center">
								<input name="delete" type="button" class="buttom" value="删      除" onClick="deleteProjectMemberRefForDep('<s:property value="#us.project_member_ref_id"/>')"/>							
							</div>  
						</td>
					</tr>
	
			    </s:iterator>
			    
 			    <tr>
			    	<td class="table_td">
			    		<div align="center">合计</div>
			    	</td>
			    	
			    	<td class="table_td">&nbsp</td>
			    	<td class="table_td">
			    		<div align="center"><s:property value="#request.total"/></div>
			    	</td>
			    	<td class="table_td">&nbsp</td>
			    	<td class="table_td">&nbsp</td>
			    	<td class="table_td">&nbsp</td>
			    	<td class="table_td">&nbsp</td>			  
			    </tr>			       
			    </tbody>
		    </table>
		    <br>
		</fieldset>
		<br>
		<br>
		<font size="2" face="arial" color="red">注：如成员工作百分比为零、建议删除该条数据。 </font>
		
		<div class="enter">                                                 
			   <!--  <input name="return" type="button" class="buttom" value="返回" onClick="returnList('listprojectMemberRef.action')"/> -->
		</div>
</form>
</body>
</html>

