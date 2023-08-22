const move = document.getElementsByClassName('move');

for(m of move){
    m.addEventListener("click", function(){
        // page 번호를 select의 value에 대입
        page.value = this.getAttribute("data-num")
        frm.submit();
    });
}