// << add.jsp >>
// 1. 파일 추가
// => add(파일 추가 btn)누를 시 file 생성 (최대 3개)
let count = 0;
let idx = 0;

$('#add').click(function(){
    if(count<3){
        let i = '<div id="file"'+idx+'>';
        i = i.concat('<input type="file" name="photos" id="pic">');
        i = i.concat('<span class="df" data-id="file"'+idx+'> X </span>');
        i = i.concat('</div>');

        $('#fileList').append(i);
        count++;
        idx++;
    }else{
        alert("파일은 최대 3개까지 입니다.")
    }
})

// 2. 파일 삭제
// => span 누를 시, 파일 삭제
$('#fileList').on("click", ".df", function(){
    let del = $(this).attr("data-id");
    $('#'+del).remove();
    count--;
})


// << update.jsp >>
// 1. 수정 파일 삭제
const delets = document.getElementsByClassName("delets");

for(del of delets){
    del.addEventListener("click", function(){
        let num = this.getAttribute("data-delete-num");
        let check = confirm("정말로 삭제하시겠습니까? 삭제 시 복구 불가합니다.");

        if(check){
            fetch("./fileDelete?fileNum="+num, {method : "get"})
                .then((result)=>{return result.text()})
                .then((r)=>{
                    if(r.trim()=='1'){
                        this.previousSibling.previousSibling.remove();
                        this.remove();
                        count--;
                    }
                })
        }
    })
}

// 2. 수정 파일 추가(최대 3개)
if(delets != null){
    count = delets.length;
}