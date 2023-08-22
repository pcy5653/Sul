const id = document.getElementById("id");
const idMsg = document.getElementById("idMsg");
const pw = document.getElementById("pw");
const pwMsg = document.getElementById("pwMsg");
const pw2 = document.getElementById("pw2");
const pw2Msg = document.getElementById("pw2Msg");
const name1 = document.getElementById("name1");
const nameMsg = document.getElementById("nameMsg");
const address = document.getElementById("address");
const addressMsg = document.getElementById("addressMsg");
const birth = document.getElementById("birth");
const birthMsg = document.getElementById("birthMsg");
const frm = document.getElementById("frm");
const input = document.getElementsByClassName("input");
let checks = [false, false, false, false, false, false, false];
let agree = false;
let phoneCheck = true;
//체크박스 체크여부
$(".checkboxs").click(checkedChange);

function checkedChange() {
    if ($(this).prop("checked")) {
        $("label[for=" + this.id + "]").text("동의되었습니다.");
        $("label[for=" + this.id + "]").css("color", "blue");
        agr();
    } else {
        $("label[for=" + this.id + "]").text("동의 해주시기 바랍니다.");
        $("label[for=" + this.id + "]").css("color", "red");
        agree = false;
    }
}

function agr() {
    if ($("#agreement1").prop("checked") && $("#agreement2").prop("checked")) {
        agree = true;
    }
}

$("#phone").keyup(function () {
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

//휴대폰 인증번호 대조
$("#phoneChk2").click(function () {
    if ($("#phone2").val() == code2) {
        $(".successPhoneChk").text("인증번호가 일치합니다.");
        $(".successPhoneChk").css("color", "green");
        $("#phoneDoubleChk").val("true");
        $("#phone2").attr("disabled", true);

    } else {
        $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
        $(".successPhoneChk").css("color", "red");
        $("#phoneDoubleChk").val("false");
        $(this).attr("autofocus", true);
    }
});
//휴대폰 번호 인증
let code2 = "";
$("#phoneChk").click(function () {
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
});
//휴대폰 인증번호 대조
$("#phoneChk2").click(function () {
    if ($("#phone2").val() == code2) {
        $(".successPhoneChk").text("인증번호가 일치합니다.");
        $(".successPhoneChk").css("color", "green");
        $("#phoneDoubleChk").val("true");
        $("#phone2").attr("disabled", true);
        checks[4] = true;
    } else {
        $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
        $(".successPhoneChk").css("color", "red");
        $("#phoneDoubleChk").val("false");
        $(this).attr("autofocus", true);
    }
});


$("#id").blur(function () {
    $("#idMsg").text = '';
    fetch("idCheck?id=" + id.value, { method: "get" })
        .then((response) => { return response.text() })
        .then((r) => {
            if (r.trim() == 1) {
                if (id.value.length > 10 || id.value == '') {
                    idMsg.innerHTML = '아이디를 10자이내로 입력하시오';
                    idMsg.className = 'f';
                } else {
                    idMsg.innerHTML = '사용 가능한 아이디 입니다.';
                    idMsg.className = 't';
                    checks[0] = true;
                }
            } else {
                idMsg.innerHTML = '이미 가입된 아이디 입니다.';
                idMsg.className = 'f';
            }
        })
});

pw.addEventListener("blur", function () {
    if (pw.value.length < 8 || pw.value.length > 16 || pw.value == '') {
        pwMsg.innerHTML = "비밀번호를 8자이상 16자이내로 입력하시오.";
        pwMsg.className = "f"
    } else {
        pwMsg.innerHTML = '사용가능한 비밀번호';
        pwMsg.className = "t"
        checks[1] = true;
    }

});

pw2.addEventListener("keyup", function () {
    if (pw2.value == pw.value) {
        pw2Msg.innerHTML = "비밀번호가 일치합니다.";
        pw2Msg.className = "t";
        checks[2] = true;
    } else {
        pw2Msg.innerHTML = "비밀번호가 틀렸습니다";
        pw2Msg.className = "f";
    }
});

name1.addEventListener("blur", function () {
    nameMsg.innerHTML = '';
    if (name1.value == '') {
        nameMsg.innerHTML = "이름을 입력해주세요";
        nameMsg.className = 'f';
    } else {
        checks[3] = true;
    }
});


address.addEventListener("blur", function () {
    addressMsg.innerHTML = '';
    if (address.value == '') {
        addressMsg.innerHTML = "주소를 입력하세요.";
        addressMsg.className = "f";
    } else {
        checks[5] = true;
    }
})

birth.addEventListener("change", function () {
    let check = emptyCheck(birth);
    birthMsg.innerHTML = "생년월일을 입력하세요.";
    birthMsg.className = "f";
    if (!check) {
        birthMsg.innerHTML = "OK";
        birthMsg.className = "s";
        checks[6] = true;
    }
})

function emptyCheck(element) {
    if (element.value == null || element.value.length == 0) {
        return true;
    } else {
        return false;
    }
}

$("#btn").click(function () {
    let allCheck = checks.includes(false);
    if (!allCheck) {
        if (agree) {
            frm.submit();
        } else {
            alert("약관에 동의해주세요");
        }
    } else {
        for (let i = 0; checks.length; i++) {
            if (checks[i] == false) {
                input[i].focus();
                alert("빈칸을 채워주세요.")
                return;
            }
        }
    }
})




