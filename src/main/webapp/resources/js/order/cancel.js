$(function(){
	$("input[type='radio']").change(function(){
		if($(this).attr("id") == "otherReason"){
			if($("#reasonInputField").length == 0){
				let el = "<div id='reasonInputField'>";
				el += "<textarea maxlength='200' placeholder='기타 사유를 입력해주세요.' style='resize:none;'></textarea>";
				el += "<div id='counter'>";
				el += "<span>0</span> <i>/</i> <span>200</span>";
				el += "</div>";
				el += "</div>";
				$("#reason > div:last-child").after(el);
			}
		}else{
			$("#reasonInputField").remove();
		}
	});
	
	$("#reason").on("keydown keyup", "#reasonInputField > textarea", function(){
		var reason = $(this).val();
		if(reason.length <= 200){
			$("#counter > span:first-child").html(reason.length);
		}
	});
});