!function(t){t.fn.basicTabs=function(s){var a=t.extend({active_class:"current",list_class:"tabs",content_class:"tab_content",starting_tab:1},s),i=t("."+a.content_class),n=t("."+a.list_class);i.find("div").hide(),i.find("div:nth-child("+a.starting_tab+")").show(),n.find("li:nth-child("+a.starting_tab+")").addClass(a.active_class),t("."+a.list_class+" li a").click(function(s){n.find("li").removeClass(a.active_class),t("."+a.content_class+" > div").hide(),t(this).parent().addClass(a.active_class);var i=t(this).attr("href");t(i).show(),s.preventDefault()})}}(jQuery);
