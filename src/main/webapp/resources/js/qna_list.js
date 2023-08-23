// 1. 본인 문의 내역만 확인 처리
const id = document.getElementById('id_name');
const list_id = id.getAttribute("data-member-id");
const mem_id = document.getElementById('check_id');
console.log(list_id);
console.log(mem_id.value);
// if(mem_id.value == list_id){

// }


// 2. page 처리
const move = document.getElementsByClassName('move');

for(m of move){
    m.addEventListener("click", function(){
        // page 번호를 select의 value에 대입
        page.value = this.getAttribute("data-num")
        frm.submit();
    });
}


// 3. 검색 처리
const k = document.getElementById('k');
const kind = document.getElementsByClassName('kind');

let data = k.getAttribute("data-kind");
for(ki of kind){
    if(ki.value == data){
        ki.selected=true;
        break;
    }
} 