document.getElementById("frm").addEventListener("submit", function (event) {
    let checks = [false]; // 초기화

    const reviewContents = document.getElementById("reviewContents");
    const rcMsg = document.getElementById("rcMsg");
 

    // reviewContents 유효성 검사
    if (reviewContents.value.trim() === "") {
        rcMsg.innerHTML = "리뷰 내용을 입력하세요.";
        rcMsg.className = "f";
        checks[0] = true;
    } else {
        rcMsg.innerHTML = '리뷰 등록완료';
        rcMsg.className = "t";
    }

    if (checks.includes(true)) {
        event.preventDefault(); // 양식 제출 막기
        alert("빈칸 입력 또는 틀린 내용을 수정해주세요.");
    }
});