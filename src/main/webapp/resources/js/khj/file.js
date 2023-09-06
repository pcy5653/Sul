{/* <div class="mb-3">
  	<label for="pic" class="form-label">사진첨부</label>
  	<input type="file" name="photos" class="form-control" id="pic" placeholder="사진을 첨부해주세요.">
</div>	 */}

const fileList = document.getElementById("fileList");
const fileAdd = document.getElementById("fileAdd");
const deletes = document.getElementsByClassName("deletes");

for(del of deletes){
    del.addEventListener("click", function(){
        let num = this.getAttribute("data-delete-num");
        let check = confirm("삭제시 복구가 불가능합니다.");
        if(check){
            fetch("./fileDelete?productImgNum="+num, {method:"GET"})
                .then((result)=>{return result.text()})
                .then((r)=>{
                    if(r.trim() == '1'){
                        this.previousSibling.previousSibling.remove();
                        this.remove();
                        count--;
                    }
                })
        }
    });
}

let max = 1;
let count = 0;
// if(deletes != null) {
//     count = deletes.length;
//     alert(count);
// }
let idx = 0;

$("#fileAdd").click(function(){
    if(count>=max){
        alert("최대 1개만 가능");
        return;
    }
    count++;

    let r = '<div class="input-group mb-3" id="file'+idx+'">'
    r = r+'<input type="file" class="form-control" id="photos" name="photos">'
    r = r+ '<span class="df" data-id="file'+idx+'">X</span>'
    r= r+"</div>";
    count++;

    $("#fileList").append(r);

});

fileList.addEventListener("click", function(event){
    let cl = event.target.classList;
    if(event.target.classList.contains("df")){
        let deleteId = event.target.getAttribute("data-id");
        document.getElementById(deleteId).remove();
        count--;
    }
})




