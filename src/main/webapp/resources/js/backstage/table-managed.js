var TableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            //table_ShowDevice table_ShowSubstation
            $('#table_ShowDevice').dataTable({
                "aoColumns": [
                  { "bSortable": false },
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  { "bSortable": false }
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示 
                "bFilter" : true, //是否启动过滤、搜索功能
                "bSort" : true, //是否启动各个字段的排序功能  
                "aaSorting" : [[1, "asc"]], //默认的排序方式，第2列，升序排列
                "sScrollX": "100%",
                "bScrollCollapse": true,
                "iDisplayLength": 10,
                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType": "bootstrap",
                "oLanguage": {
                	"sProcessing" : "正在加载中......",
                	"sLengthMenu" : "每页显示 _MENU_ 条记录",
                	"sZeroRecords" : "没有数据！",
                    "sEmptyTable" : "表中无数据存在！",
                    "sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmpty" : "显示0到0条记录",
                    "sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
                    "sSearch" : "搜索:",
                    "oPaginate": {
                    	 "sFirst" : "首页",
                         "sPrevious" : "上一页",
                         "sNext" : "下一页",
                         "sLast" : "末页"
                    }
                },
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });
            
            jQuery('#table_ShowDevice .group-checkable').change(function () {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                    } else {
                        $(this).attr("checked", false);
                    }
                });
                jQuery.uniform.update(set);
            });

            jQuery('#table_ShowDevice_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_ShowDevice_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            /*jQuery('#table_ShowDevice_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown*/
            
            //table_ShowSubstation
            $('#table_ShowSubstation').dataTable({
                "aoColumns": [
                  { "bSortable": false },
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  { "bSortable": false }
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示 
                "bFilter" : true, //是否启动过滤、搜索功能
                "bSort" : true, //是否启动各个字段的排序功能  
                "aaSorting" : [[1, "asc"]], //默认的排序方式，第2列，升序排列
                "sScrollX": "100%",
                "bScrollCollapse": true,
                "iDisplayLength": 10,
                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType": "bootstrap",
                "oLanguage": {
                	"sProcessing" : "正在加载中......",
                	"sLengthMenu" : "每页显示 _MENU_ 条记录",
                	"sZeroRecords" : "没有数据！",
                    "sEmptyTable" : "表中无数据存在！",
                    "sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmpty" : "显示0到0条记录",
                    "sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
                    "sSearch" : "搜索:",
                    "oPaginate": {
                    	 "sFirst" : "首页",
                         "sPrevious" : "上一页",
                         "sNext" : "下一页",
                         "sLast" : "末页"
                    }
                },
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });

            jQuery('#table_ShowSubstation .group-checkable').change(function () {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                    } else {
                        $(this).attr("checked", false);
                    }
                });
                jQuery.uniform.update(set);
            });

            jQuery('#table_ShowSubstation_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_ShowSubstation_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            /*jQuery('#table_ShowDevice_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown*/
            
         	//table_ShowUnitInterval
            $('#table_ShowUnitInterval').dataTable({
                "aoColumns": [
                  { "bSortable": false },
                  null,
                  null,
                  null,
                  { "bSortable": false }
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示 
                "bFilter" : true, //是否启动过滤、搜索功能
                "bSort" : true, //是否启动各个字段的排序功能  
                "aaSorting" : [[1, "asc"]], //默认的排序方式，第2列，升序排列
                "sScrollX": "100%",
                "bScrollCollapse": true,
                "iDisplayLength": 10,
                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType": "bootstrap",
                "oLanguage": {
                	"sProcessing" : "正在加载中......",
                	"sLengthMenu" : "每页显示 _MENU_ 条记录",
                	"sZeroRecords" : "没有数据！",
                    "sEmptyTable" : "表中无数据存在！",
                    "sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                    "sInfoEmpty" : "显示0到0条记录",
                    "sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
                    "sSearch" : "搜索:",
                    "oPaginate": {
                    	 "sFirst" : "首页",
                         "sPrevious" : "上一页",
                         "sNext" : "下一页",
                         "sLast" : "末页"
                    }
                },
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });

            jQuery('#table_ShowUnitInterval .group-checkable').change(function () {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                    } else {
                        $(this).attr("checked", false);
                    }
                });
                jQuery.uniform.update(set);
            });

            jQuery('#table_ShowUnitInterval_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_ShowUnitInterval_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            /*jQuery('#table_ShowUnitInterval_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown*/
            
        }



    };

}();