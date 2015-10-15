(function($){
	$.fn.lyTabs = function(options){
		
		this.select = function(){
			return $(this).find("ul a[id='current']");
		};
		
		$.fn.lyTabs.defaults = {
				className:"selected",
				loadName:"加载中...",
				fadeIn:"normal"
		};
		
		var opts = $.extend({}, $.fn.lyTabs.defaults, options);
		
		return this.each(function(){
			this.loadTab = function(tab){
				_loadTab(tab,true);
			};
			
			var target = $(this);
			
			var myUrl = window.location.href; //get URL
		    var myUrlTab = myUrl.substring(myUrl.indexOf("#"));    
		    var myUrlTabName = myUrlTab.substring(0,4);
		    
		    /*
		     * 第一次进来,隐藏所有div,加载第一个选项卡
		     * */
			target.find("div:first").children().hide();//隐藏所有div
//            target.find("li:first a").attr("id","current");
            target.children().find("div:first").fadeIn();
//            ajax($(target.find("li:first a").attr('name')),target.find("li:first"));
            
            function resetTabs(){
            	target.find("div:first").children().hide();//隐藏所有div
            	target.find("div:first").children().html("");//隐藏所有div
            	target.find("ul a").attr("id","");      
            }
            
            /*
             * 为a标记加载事件
             * */
            target.find("ul a").on("click",function(e) {
                e.preventDefault();
                _loadTab($(this));
            });
            
            /*
             * 加载tab
             * */
            function _loadTab(tab,currentLoad){
            	if (tab.attr("id") == "current" && !currentLoad){ 
                	return       
                }
                else{             
	                resetTabs();
	                tab.attr("id","current"); 
	                ajax($(tab.attr('name')),tab);
	                $(tab.attr('name')).fadeIn();
	                ajax($(tab.attr('name')),tab.parent());
                }
            }
            
            function ajax(div, li) {
            	var filterNames = opts.filterNames;
            	var requestData = {};
            	for(var i=0;i<filterNames.length;i++){
            		var filterName = filterNames[i];
            		var filterValue = "";
            		
            		if(filterName.isValue){
            			filterValue = filterName.value;
            		}else{
            			filterValue = $("#"+filterName.id).val();
            		}
            		
            		if(filterValue == null){
            			filterValue = "";
            		}
            		
            		requestData[filterName.name] = filterValue;
            	}
            	
            	
                var rel = li.find("a").attr("rel");
                if (rel) {     
                    $.ajax({
                        url: rel,
                        data:requestData,
                        dataType: "html",
                        cache: false,
                        success: function (html) {
                            div.html(html);
                        },
                        error: function () {
                            div.html('加载错误，请重试！');
                        }
                    });
                    //li.find("a").removeAttr("rel");  //只ajax一次
                }
            }
            
            for (i = 1; i <= target.find("ul > li").length; i++) {
                if (myUrlTab == myUrlTabName + i) {
                    resetTabs();
                    $("a[name='"+myUrlTab+"']").attr("id","current"); // Activate url tab
                    $(myUrlTab).fadeIn(); // Show url tab content        
                }
            }
		});
	}
})(jQuery);