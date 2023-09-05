// 1. Title 미작성 시 넘어가지 않도록 설정.
// 2. sms 체크 여부

// 1번
const btn = document.getElementById("btn");
const subject = document.getElementById("subject");
const contents = document.getElementById("contents");
const frm = document.getElementById("frm");

// 1_2번
const yes = document.getElementById("sms_yes");
const no = document.getElementById("sms_no");
const sms = document.getElementById("smsCheck")

btn.addEventListener("click", function(){
    // 1번
    if(subject.value=="" && contents.value==""){
        alert("제목과 내용은 필수 입니다.");
        subject.focus();
        
    }else if(subject.value=="" || contents.value==""){
        alert("제목과 내용은 필수 입니다.")
        subject.focus();
    } else {
        frm.submit();
    }


    // 2번
    let yesVal = yes.value;
    let noVal = no.value;
    if (yes.checked) {

    } else {
        yesVal = 0; 
        noVal = 1;// 체크가 안 되었을 때
    }
});