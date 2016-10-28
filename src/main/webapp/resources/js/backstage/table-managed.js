var TableManaged = function () {

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            //table_1
            $('#table_1').dataTable({
                "aoColumns": [
                  { "bSortable": false },
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
            
            jQuery('#table_1 .group-checkable').change(function () {
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

            jQuery('#table_1_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_1_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_1_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_2
            $('#table_2').dataTable({
                "aoColumns": [
                    { "bSortable": false },
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

            jQuery('#table_2 .group-checkable').change(function () {
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

            jQuery('#table_2_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_2_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_2_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_3
            $('#table_3').dataTable({
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

            jQuery('#table_3 .group-checkable').change(function () {
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

            jQuery('#table_3_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_3_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_3_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_4
            $('#table_4').dataTable({
                "aoColumns": [
                    { "bSortable": false },
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

            jQuery('#table_4 .group-checkable').change(function () {
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

            jQuery('#table_4_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_4_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_4_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_5
            $('#table_5').dataTable({
                "aoColumns": [
                    { "bSortable": false },
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

            jQuery('#table_5 .group-checkable').change(function () {
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

            jQuery('#table_5_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_5_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_5_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_6
            $('#table_6').dataTable({
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

            jQuery('#table_6 .group-checkable').change(function () {
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

            jQuery('#table_6_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_6_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_6_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_7
            $('#table_7').dataTable({
                "aoColumns": [
                    { "bSortable": false },
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

            jQuery('#table_7 .group-checkable').change(function () {
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

            jQuery('#table_7_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_7_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_7_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_8
            $('#table_8').dataTable({
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

            jQuery('#table_8 .group-checkable').change(function () {
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

            jQuery('#table_8_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_8_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_8_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_9
            $('#table_9').dataTable({
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

            jQuery('#table_9 .group-checkable').change(function () {
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

            jQuery('#table_9_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_9_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_9_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_10
            $('#table_10').dataTable({
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

            jQuery('#table_10 .group-checkable').change(function () {
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

            jQuery('#table_10_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_10_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_10_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

            //table_collage
            $('#table_collage').dataTable({
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
                    { "bSortable": false },
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

            jQuery('#table_collage .group-checkable').change(function () {
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

            jQuery('#table_collage_wrapper .dataTables_filter input').addClass("m-wrap-table medium"); // modify table search input
            jQuery('#table_collage_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#table_collage_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown


        }



    };

}();