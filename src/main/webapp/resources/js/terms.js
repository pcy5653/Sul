$('#allCheck').click(function(){
    let c = $("#allCheck").prop("checked")
    
    $('.checks').each(function(i,e){
        $(e).prop("checked",c)
    })
    if($("#check1").prop("checked")&& $("#check2").prop("checked")){
        $("#btn").attr("disabled", false);
        $("#btn").val("다음단계로");
    }else{
        $("#btn").attr("disabled", true);
        $("#btn").val("필수약관에 동의하세요.");
    }
})

$('.checks').click(function(){
    let result = true;
    
    $('.checks').each(function(i,e){
        if(!$(e).prop("checked")){
            result = false;
            return false;
        }
    })
    $('#allCheck').prop("checked",result)
    if($("#check1").prop("checked")&& $("#check2").prop("checked")){
        $("#btn").attr("disabled", false);
        $("#btn").val("다음단계로");
    }else{
        $("#btn").attr("disabled", true);
        $("#btn").val("필수약관에 동의하세요.");
    }
})

$("#btn").click(function(){
    let a = '<div class="mobileNo">'

    a= a + '<label for="phone">휴대폰 번호</label><br>'
    a= a + '<input id="phone" type="text" name="phone" title="전화번호 입력" class="input" placeholder="-빼고 숫자만 입력" required />'
    a= a + '<button type="button" id="phoneChk" class="button_big">인증번호 보내기</button><div id="phoneMsg"></div>'
    a= a + '<span class="tip"></span><br><input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required />'
    a= a + '<button type="button" id="phoneChk2" class="button_big" >본인인증</button>'
    a= a + '<span class="point successPhoneChk"></span>'
    a= a + '<input type="hidden" id="phoneDoubleChk" /></div>'
    $("#pcheck").append(a)
})

//폰번호 유효성검사
$('#pcheck').on("keyup","#phone",function(){
    phoneCheck = true;
    $("#phoneMsg").text("");
    fetch("getPhoneCheck?phone=" + phone.value, { method: "get" })
        .then((response) => { return response.text() })
        .then((r) => {
            if (r.trim() == 0) {
                phoneCheck = false;
                $("#phoneMsg").text("이미 가입된 번호입니다.");
                $("#phoneMsg").css("color", "red");
                $("#phoneMsg").append('<a href="./login">로그인</a>');
            }
        })
    if ($("#phone").val().includes('-')) {
        phoneCheck = false;
        $("#phoneMsg").text("'-'를 제외한 번호만 입력해주세요.")
        $("#phoneMsg").css("color", "red");
    }
})
// 휴대폰번호인증
let code2 = "";
$('#pcheck').on("click","#phoneChk",function(){
    let phone = $("#phone").val();
    if (phoneCheck) {
        if (phone.length != 11) {
            alert("유효한 휴대폰번호를 입력해주세요.")
        } else {

            alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");

            $.ajax({
                type: "GET",
                url: "phoneCheck?phone=" + phone,
                cache: false,
                success: function (data) {
                    if (data == "error") {
                        alert("휴대폰 번호가 올바르지 않습니다.")
                        $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
                        $(".successPhoneChk").css("color", "red");
                        $("#phone").attr("autofocus", true);
                    } else {
                        $("#phone2").attr("disabled", false);
                        $("#phoneChk2").css("display", "inline-block");
                        $(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
                        $(".successPhoneChk").css("color", "green");
                        $("#phone").attr("readonly", true);
                        code2 = data;
                    }
                }
            });
        }
    }
})

// 인증번호 대조
let p= false;
$('#pcheck').on("click","#phoneChk2",function(){
    if ($("#phone2").val() == code2) {
        $(".successPhoneChk").text("인증번호가 일치합니다.");
        $(".successPhoneChk").css("color", "green");
        $("#phoneDoubleChk").val("true");
        $("#phone2").attr("disabled", true);
        p = true;
        if(p){
            $("#pcheck").append('<button type="submit" id="regBtn" class="button_big">계속하기</button>')
        }
    } else {
        $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
        $(".successPhoneChk").css("color", "red");  
        $("#phoneDoubleChk").val("false");
        $(this).attr("autofocus", true);
    }
})
