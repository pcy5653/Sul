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
const vv = question.getAttribute("data-num")
const com = comment.getAttribute("data-step");

console.log(vv);

if(q != com){
//     // text
    let i = '<table>';
    i = i.concat('<tr><th>고객님의 질문</th></tr>');
    i = i.concat('<tr><td>'+content+'</td></tr>');
    i = i.concat('</table>');
    
    question.innerHTML = i;
    
    
//     // file
//     // i = i.concat('<c:forEach items="${dto.qnaDTO.fileDTOs} var ="f">');
//     // i = i.concat('<img src="/resources/upload/qna/${f.fileName}" class="fileImg" data-file-num="${f.fileNum}"></img>');
//     // i = i.concat('</c:forEach>');

    
//     fetch("/qna/detail?num="+vv, {
//         method:"get"
//     })
//     .then((response) => response.text())
//     .then((data) => {
//         //console.log(data);

//         // const pf = document.createElement('div');
//         // pf.id = 'files';
//         // console.log(pf);

//         // data.forEach( f => {
//         //     const img = document.createElement('img');
//         //     img.src = '/resources/upload/qna/${f.fileName}';
//         //     img.className = 'fileImg';
//         //     img.setAttribute('data-file-num', f.fileNum);
//         //     pf.appendChild(img);
//         // });

//         // for(f of r){
//         //     const img = document.createElement('img');
//         //     img.src = '/resources/upload/qna/${f.fileName}';
//         //     img.className = 'fileImg';
//         //     img.setAttribute('data-file-num', f.fileNum);
//         //     pf.appendChild(img);
//         // }

//         // question.appendChild(pf);
//         // console.log(question);
//     });

    //  function getDetail (vv){
    //      $.ajax({
    //          type:'GET',
    //          url:'/qna/detail',
    //          data:{
    //              num : vv
    //          },
    //          dataType:'text',
    //          success: function(result){
    //              $('#question').html(result);
    //              console.log(result);
    //              console.log(typeof(result));
    //          },
    //          error: function(result){
    //              console.log(result)
    //          }
    //      })
    //  }

    //  getDetail(vv);
}

