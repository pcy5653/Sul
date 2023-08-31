// 1. Title 미작성 시 넘어가지 않도록 설정.

// 1번
const btn = document.getElementById("btn");
const subject = document.getElementById("subject");
const frm = document.getElementById("frm");

// 1_2번
const yes = document.getElementById("sms_yes");
const no = document.getElementById("sms_no");
const sms = document.getElementById("smsCheck")

btn.addEventListener("click", function(){
    // // 1번
    if(subject.value==""){
        alert("제목은 필수 입니다.");
        subject.focus();
    }else {
        frm.submit();
    }

    let smsVal = yes.value;
    if (yes.checked) {
        smsVal = 1; // 체크가 되었을 때
        console.log(smsVal);
    } else {
        smsVal = 0; // 체크가 안 되었을 때
    }
});