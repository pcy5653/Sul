let postcodePopup;
function DaumPostcode(){
	if(postcodePopup == undefined){
		postcodePopup  = new daum.Postcode({
	        oncomplete:function(data){
	            let addr = "";
	            let extraAddr = "";
	            let fullAddr = "";
	            
	            if(data.userSelectedType === "R"){ // 도로명(R)
	            	addr = data.roadAddress;
	            }else { // 지번(J)
	            	addr = data.jibunAddress;
	            }
	            
	            if(data.userSelectedType === "R"){
	            	if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
	            		extraAddr += data.bname;
	                }
	    			
	                if(data.buildingName !== "" && data.apartment === "Y"){
	                	extraAddr += (extraAddr !== "" ? ", " + data.buildingName : data.buildingName);
	                }
	    			
	                if(extraAddr !== ""){
	                	extraAddr = "(" + extraAddr + ")";
	                }
	                
	                fullAddr = extraAddr;
	            }
	            
	            fullAddr = "(" + data.zonecode + ")" + addr + fullAddr;
	            $("#addAddress #address").val(fullAddr);
	            $("#addressDetail").focus();
	        },
	        onclose:function(state){
	        	postcodePopup = undefined;
	        }
	    });
	    
		postcodePopup.open();
	}else{
		alert("팝업 창이 이미 존재합니다.");
	}
}

function validation(element, isSubmit = false){
	let errorMsg = "<div class='error'>" +
							"<img src='../resources/images/order/warning-icon.png'>" +
							"<span>필수 입력 항목입니다.</span>" +
						"</div>";
	
	let phone_regExp = /^(?:(010\d{4}))(\d{4})$/;
	
	if(element.val() == ""){
		if(!isSubmit){
			element.siblings(".error").remove();
			
			element.addClass("error");
			if(element.attr("id") != "address"){
				element.after(errorMsg);
			}
		}
		
		return false;
	}else{
		if(element.attr("name") == "recipientPhone"){
			if(!phone_regExp.test(element.val())){
				if(!isSubmit){
					element.siblings(".error").remove();
					
					element.addClass("error");
					element.after(errorMsg.replace("필수 입력 항목입니다.", "올바르지 않은 휴대폰 번호입니다."));
				}
				
				return false;
			}
		}
		
		element.removeClass("error");
		element.siblings(".error").remove();
	}
	
	return true;
}

$(function(){
	$("body").on("click", "#closeOtherAddress", function(){
		$("#otherAddressBackground").remove();
	});
	
	$("body").on("click", "#otherAddressList #update", function(){
        if(confirm("회원 정보 수정 페이지로 이동하시겠습니까?")){
            location.href = "../member/mypage";
        }
	});
	
	$("body").on("click", "#otherAddressList .delete", function(){
		const target = $(this);
		if(confirm("해당 배송지를 삭제하시겠습니까?")){
			$.ajax({
				url:"./deleteOtherAddress",
				type:"POST",
				data:{
					addressNum:target.attr("data-num")
				},
				success:function(result){
					if(result > 0){
						target.parents(".wrap").remove();
					}else{
						alert("배송지 삭제 실패");
					}
				}
			});
		}
	});
	
	$("body").on("click", "#otherAddressList .select", function(){
		const parent = $(this).parents(".wrap");
		
		let recipient = parent.find(".recipient").html();
		let recipientPhone = parent.find(".recipientPhone").html();
		let recipientAddress = parent.find(".recipientAddress").html();
		
		$("#addressInfo").find("#recipient").html(recipient);
		$("#addressInfo").find("#recipientPhone").html(recipientPhone);
		$("#addressInfo").find("input[name='recipientAddress']").val(recipientAddress);
		
		$("#closeOtherAddress").trigger("click");
	});
	
	$("body").on("click", "#addAddressButton", function(){
		$("#otherAddressBackground").append(
			"<div id='addAddress'>" +
				"<div id='title'>" +
					"<p class='title'>새 배송지 추가</p>" +
					"<img id='closeAddAddress' class='close' src='../resources/images/order/close-icon.png'>" +
				"</div>" +
				"<div id='input'>" +
					"<div>" +
						"<p>수령인</p>" +
						"<input type='text' name='recipient' placeholder='성함을 입력해주세요.'>" +
					"</div>" +
					"<div>" +
						"<p>연락처</p>" +
						"<input type='text' name='recipientPhone' placeholder=\" '-'을 제외한 숫자만 입력해주세요. \">" +
					"</div>" +
					"<div>" +
						"<p>배송지</p>" +
						"<div><input type='text' id='address' placeholder='주소를 입력해주세요.' readonly='readonly'></div>" +
						"<div><input type='text' id='addressDetail' placeholder='상세 주소를 입력해주세요.'></div>" +
					"</div>" +
				"</div>" +
				"<button id='submit' class='skyButton'>저장</button>" +
			"</div>");
		
		$("#addAddress #address").click(function(){
			DaumPostcode();
		});
		
		$("#addAddress input").focusout(function(){
			validation($(this));
		});
		
		$("#closeAddAddress").click(function(){
			$("#addAddress").remove();
		});
	});
});