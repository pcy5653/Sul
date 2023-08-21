// 1. Title 미작성 시 넘어가지 않도록 설정.
const btn = document.getElementById("btn");
const subject = document.getElementById("subject");
const frm = document.getElementById("frm");

btn.addEventListener("click", function(){
    if(subject.value==""){
        alert("제목은 필수 입니다.");
        // title 강제 작성
        subject.focus();
    }else {
        frm.submit();
    }
})