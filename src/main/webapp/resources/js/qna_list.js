// 1. page 처리
const move = document.getElementsByClassName('move');

for(m of move){
    m.addEventListener("click", function(){
        // page 번호를 select의 value에 대입
        page.value = this.getAttribute("data-num")
        frm.submit();
    });
}


// 2. 검색 처리
const k = document.getElementById('k');
const kind = document.getElementsByClassName('kind');

let data = k.getAttribute("data-kind");
for(ki of kind){
    if(ki.value == data){
        ki.selected=true;
        break;
    }
} 