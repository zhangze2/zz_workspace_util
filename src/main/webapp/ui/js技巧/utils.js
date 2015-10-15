/**
* 1. 减少重复代码的编写，让开发人员更专注于业务相关代码
* 2. 进行接口封装，即使不使用当前框架，切换不影响已写出的代码
* 3. 使用更方便，更简洁，更统一
* 4. 其他通用控件有待扩展...
* 5. 方便转成jQuery版：(function($){ var EveUI = {...}; $.EveUI = EveUI; })(jQuery);
*/
var EveUI = {
	/** 弹出窗常用接口 **/
	window : {
		open : function (params) { // 异步请求内容窗口
			$.ajax({
				type : "post",
				url : params.url,
				data : params.data || "",
				success : function (data) {
					$("<div id='" + params.uuid + "'></div>").appendTo("body");
					$("#" + params.uuid).html(data);
					var win = $("#" + params.uuid).kendoWindow({
							title : params.title || false,
							width : params.width || "auto",
							height : params.height || "auto",
							modal : true,
							close : function () {
								$("#" + params.uuid).data("kendoWindow").destroy();
							}
						}).data("kendoWindow");
					win.center();
					win.open();
				}
			});
		},
		tips : function (content, time) { // 短暂提示框，默认1.5秒，可自定义
			$("body").prepend('<div id="_tips_win_"></div>');
			$("#_tips_win_").html('<p style="min-width:200px;font-size:16px;text-align:center;">' + content + '</p>');
			var win = $("#_tips_win_").kendoWindow({
					title : false,
				}).data("kendoWindow");
			win.center();
			win.open();
			setTimeout('EveUI.window.close("_tips_win_");', time || 1500);
		},
		confirm : function (content, ok, cancel) { // 确认框
			$("body").prepend('<div id="_confirm_win_"></div>');
			var hstr = '<p style="min-width:200px;font-size:16px;text-align:center;">' + content
					+ '</p><div style="text-align:center;margin-top:3px;"><a name="ok" class="k-button k-button-icontext">'
					+ '确定</a>&nbsp;&nbsp;<a name="cancel" class="k-button k-button-icontext">取消</a></div>';
			$("#_confirm_win_").html(hstr);
			$("#_confirm_win_ a[name='ok']").click(function () {
				if (ok != undefined) {
					ok();
				}
				EveUI.window.close("_confirm_win_");
			});
			$("#_confirm_win_ a[name='cancel']").click(function () {
				if (cancel != undefined) {
					cancel();
				}
				EveUI.window.close("_confirm_win_");
			});
			var win = $("#_confirm_win_").kendoWindow({
					title : false,
				}).data("kendoWindow");
			win.center();
			win.open();
		},
		close : function (uuid) {
			$("#" + uuid).data("kendoWindow").destroy();
		}
	},
	/** 表格常用接口 **/
	table : {
		page : function (params) { // 分页表格
			$("#" + params.uuid).kendoGrid({
				dataSource : {
					transport : {
						read : {
							type : "post",
							url : params.url,
							dataType : "json",
							data : params.data
						}
					},
					schema : {
						data : function (d) {
							return d.result;
						},
						total : function (d) {
							return d.total;
						}
					},
					pageSize : params.pageSize || 10,
					serverPaging : true,
					serverSorting : true,
					serverFiltering : true
				},
				scrollable : true,
				sortable : false,
				pageable : {
					messages : {
						display : "第{0} - {1}条记录 共 {2}条记录",
						empty : "没有符合条件的数据项",
						page : "页",
						of : "of {0}",
						itemsPerPage : "条记录/页",
						first : "第一页",
						previous : "上一页",
						next : "下一页",
						last : "最后一页",
						refresh : "刷新"
					}
				},
				columns : params.columns,
				height : params.height || "auto",
				dataBound : params.dataBound || function (e) {}
			});
		},
		normal : function (params) { // 常规表格
			$("#" + params.uuid).kendoGrid({
				dataSource : {
					transport : {
						read : {
							type : "post",
							url : params.url,
							dataType : "json",
							data : params.data
						}
					}
				},
				scrollable : true, //是否显示滚动条
				sortable : false, //是否排序显示
				columns : params.columns,
				height : params.height || "auto",
				dataBound : params.dataBound || function (e) {}
			});
		},
		refresh : function (uuid) {
			$("#" + uuid).data("kendoGrid").dataSource.read();
		}
	},
	/** 列表常用接口 **/
	list : {
		page : function (params) { // 分页列表
			var dataSource = new kendo.data.DataSource({
					transport : {
						read : {
							type : "post",
							url : params.url,
							dataType : "json",
							data : params.data || {}
						}
					},
					schema : {
						data : function (data) {
							return data.result;
						},
						total : function (data) {
							return data.total;
						}
					},
					pageSize : params.pageSize || 15,
					serverPaging : true,
					serverSorting : true,
					serverFiltering : true
				});
			$("#" + params.pager).kendoPager({
				dataSource : dataSource,
				messages : {
					display : "第{0} - {1}条 共 {2}条",
					empty : "没有符合条件的数据项",
					page : "页",
					of : "of {0}",
					itemsPerPage : "条/页",
					first : "第一页",
					previous : "上一页",
					next : "下一页",
					last : "最后一页",
					refresh : "刷新"
				}
			});
			$("#" + params.uuid).kendoListView({
				dataSource : dataSource,
				dataBound : params.dataBound || function (e) {},
				template : params.template
			}).data("kendoListView");
		},
		normal : function (params) { // 常规列表
			$("#" + params.uuid).kendoListView({
				dataSource : params.dataSource || {
					transport : {
						read : {
							type : "post",
							url : params.url,
							dataType : "json",
							data : params.data || {}
						}
					}
				},
				dataBound : params.dataBound || function (e) {},
				template : params.template
			}).data("kendoListView");
		},
		refresh : function (uuid) {
			$("#" + uuid).data("kendoListView").dataSource.read();
		}
	},
	/** 下拉框常用接口 **/
	select : {
		show : function (params) {
			$("#" + params.uuid).kendoDropDownList({
				dataTextField : params.name,
				dataValueField : params.key,
				dataSource : params.datas || {
					transport : {
						read : {
							type : "post",
							url : params.url,
							dataType : "json"
						}
					},
					pageSize : 100,
					serverFiltering : true,
					serverPaging : true
				},
				height : "200px",
				change : params.change || function () {},
			});
		},
		refresh : function (uuid) {
			$("#" + uuid).data("kendoDropDownList").dataSource.read();
		}
	}
};