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

// 3. 문의에 대한 답변
const title = document.querySelectorAll('.listTitle');
const ref = document.querySelectorAll('.listRef');
const comment = document.querySelectorAll('.comment');
//let c = comment.getAttribute("data-ex-num");

// title.forEach(t => {
//     t.addEventListener("click", function() {
//         const num = this.getAttribute('data-num');
//         console.log(num);
//         // ref가 같은 애들은 같은 페이지 보여주기 
        
        

//         // 본인 페이지 가기
//         //location.href="./detail?num="+num;

        
//     });
// });


// title.forEach(t => {
//     t.addEventListener("click", function() {
//         const num = this.getAttribute('data-num');
//         console.log(num);
        
//         ref.forEach(r => {
//             const f = r.value;                              // ref
//             //console.log(f);
//             const s = r.getAttribute('data-step');       // step
//             //console.log(s);
//             // 같은 ref 중에 step이 1인 경우
//             // 같은 ref의 step이 0의 상세내용에 내용 출력
//             console(num.n);
//             // if(num.n == n || s == 1){
                
//             // }

            
            
//         });
//     });
// });

title.forEach(t => {
    t.addEventListener("click", function() {
        const num = this.getAttribute('data-num');
        console.log(num);
        
        ref.forEach(r => {
            const f = r.getAttribute('data-ref');                           // ref
            const s = r.getAttribute('data-step');       // step
            
            // 같은 ref 중에 step이 1인 경우
            // 같은 ref의 step이 0의 상세내용에 내용 출력
            if (num == f && s == "1") {
                console.log("Matching num:", num);
                console.log("Matching ref:", f);
                console.log("Matching step:", s);
                console.log("-----------------");
                console.log("f의 첫답변 ", r.value);

                //location.href="./detail?num="+num;

                // 여기에 조건에 맞는 동작 추가
            }
        });
    });
});






