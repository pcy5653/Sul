//const frm = document.getElementsByClassName('frm');
const c1 = document.getElementsByClassName('c1');

const nn = document.getElementsByClassName("faqIn");
// 1. page 처리
const move = document.getElementsByClassName('move');
const page= document.getElementById('faqPage');
const faqFrm = document.getElementById('faqPageFrm');

for(m of move){
    m.addEventListener("click", function(){
        // page 번호를 select의 value에 대입
        page.value = this.getAttribute("data-num")
        faqFrm.submit();
    });
}


//2. 수정, 삭제 btn 클릭 시 변경
for(let i=0;i<$(".listTitle").length;i++){
    $("#upBtn"+i).click(function(){
        let url = this.getAttribute("data-url");
        //$("#frm"+i).attr("method","post");
        console.log($("#frm"+i).val())
        $("#frm"+i).attr("action",url);
        $("#frm"+i).submit()
        
    })

    $("#deBtn"+i).click(function(){
        alert("정말로 삭제하시겠습니까?")
        let url = this.getAttribute("data-url");
        $("#frm"+i).attr("method","post");
        console.log($("#frm"+i).val())
        $("#frm"+i).attr("action",url);
        $("#frm"+i).submit()
        
    })
}




