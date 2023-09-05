//const frm = document.getElementById('frm');
const c1 = document.getElementsByClassName('c1');
const fileImg = document.getElementsByClassName('fileImg')
const role = document.getElementById('role');
const r_num = role.getAttribute("value");
console.log(r_num);



// 1. 수정, 삭제, 답글 btn 클릭 시 변경
for(c of c1){
    c.addEventListener("click", function(){
        let url = this.getAttribute("data-url");
        
        if(url=='qna/delete'){
            let check = confirm("정말로 삭제하시겠습니까?");
            
            if(check){
                for(file of fileImg){
                    let num = file.getAttribute("data-file-num");
                    
                    fetch("./fileDelete?fileNum="+num, {method : "get"})
                }
            }else{
                return;
            }
            frm.method='post';
        }
        if(url == 'qna/reply'){
            // 관리자 권한(1)만 답글
            if(r_num == 0){
                alert("권한이 없습니다.");
                return;
            }
        }
        frm.action=url;
        frm.submit();
    });
}


// 2. 답글에만 질문 띄워놓기
const question = document.getElementById('question');
const comment = document.getElementById('comment');
const q = question.getAttribute("data-step");
const content = question.getAttribute("data-con");
const pnum = question.getAttribute("data-num");
const com = comment.getAttribute("data-step");


// file test
const files = document.getElementById("files");
const file = files.getAttribute("data-file");
const fn = files.getAttribute("data-name")


console.log(pnum);
console.log(file); // 배열 2개
console.log(typeof(file));
console.log(fn);


// const fileArray = document.getElementById('file').getAttribute('data-file');
// const fileData = fileArray.slice(1, -1);
// const file = fileData.split(',');

// file.forEach(f => {
//     console.log("배열");
//     console.log(f);
//     console.log()
// });



if(q != com){
//     // text
    let i = '<table>';
    i = i.concat('<tr><th>고객님의 질문</th></tr>');
    i = i.concat('<tr><td>'+content+'</td></tr>');
    i = i.concat('</table>');

    // i = i.concat('<c:forEach items="'+files+'"'+' var ="f">');
    // i = i.concat('<img src="/resources/upload/qna/'+files+'" class="fileImg"></img>')
    // i = i.concat('</c:forEach>');
    
    question.innerHTML = i;
    
}


/// ex
const ex = document.getElementById("detail_file");
const e = ex.getAttribute("data-file")
//const en = ex.getAttribute("data-file-name")

console.log("--------------------------------")
console.log(e);
//console.log(en)
console.log(typeof(e));
