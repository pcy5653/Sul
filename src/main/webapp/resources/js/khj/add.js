document.getElementById("frm").addEventListener("submit", function (event) {
    let checks = [false, false, false, false, false, false, false, false, false]; // 초기화

    const productName = document.getElementById("productName");
    const pnMsg = document.getElementById("pnMsg");
    const price = document.getElementById("price");
    const priceMsg = document.getElementById("priceMsg");
    const proof = document.getElementById("proof");
    const proofMsg = document.getElementById("proofMsg");
    const contents = document.getElementById("contents");
    const contentsMsg = document.getElementById("contentsMsg");
    const stock = document.getElementById("stock");
    const stockMsg = document.getElementById("stockMsg");
    const base = document.getElementById("base");
    const baseMsg = document.getElementById("baseMsg");
    const capacity = document.getElementById("capacity");
    const capacityMsg = document.getElementById("capacityMsg");
    const expiryDate = document.getElementById("expiryDate");
    const expiryDateMsg = document.getElementById("expiryDateMsg");
    const storageMethod = document.getElementById("storageMethod");
    const storageMethodMsg = document.getElementById("storageMethodMsg");

    // productName 유효성 검사
    if (productName.value.trim() === "") {
        pnMsg.innerHTML = "상품의 이름을 입력하세요.";
        pnMsg.className = "f";
        checks[0] = true;
    } else {
        pnMsg.innerHTML = '상품이름 등록완료';
        pnMsg.className = "t";
    }

    // price 유효성 검사
   if (price.value.trim() === "") {
        priceMsg.innerHTML = "가격을 입력하세요.";
        priceMsg.className = "f";
        checks[1] = true;
    } else if (!/^\d+$/.test(price.value.trim())) {
        priceMsg.innerHTML = "가격은 숫자만 입력하세요.";
        priceMsg.className = "f";
        checks[1] = true;
    } else {
        priceMsg.innerHTML = '가격 등록완료';
        priceMsg.className = "t";
    }

    // proof 유효성 검사
    const proofValue = proof.value.trim();
    if (proofValue === "") {
        proofMsg.innerHTML = "알콜 도수를 입력하세요.";
        proofMsg.className = "f";
        checks[2] = true;
    } else if (!/^\d{1,2}(\.\d)?$/.test(proofValue)) {
        proofMsg.innerHTML = "알콜 도수는 정수 두 자리 또는 정수 한 자리와 소수점 이하 한 자리만 입력하세요.";
        proofMsg.className = "f";
        checks[2] = true;
    } else {
        proofMsg.innerHTML = '도수 등록완료';
        proofMsg.className = "t";
    }

    // contents 유효성 검사
    if (contents.value.trim() === "") {
        contentsMsg.innerHTML = "내용을 입력하세요.";
        contentsMsg.className = "f";
        checks[3] = true;
    } else {
        contentsMsg.innerHTML = '내용 등록완료';
        contentsMsg.className = "t";
    }

    // stock 유효성 검사
    const stockValue = stock.value.trim();
    if (stockValue === "") {
        stockMsg.innerHTML = "재고 수량을 입력하세요.";
        stockMsg.className = "f";
        checks[4] = true;
    } else if (!/^\d+$/.test(stockValue)) {
        stockMsg.innerHTML = "재고 수량은 정수만 입력하세요.";
        stockMsg.className = "f";
        checks[4] = true;
    } else {
        stockMsg.innerHTML = '수량 등록완료';
        stockMsg.className = "t";
    }

    // base 유효성 검사
    if (base.value.trim() === "") {
        baseMsg.innerHTML = "원료를 입력하세요.";
        baseMsg.className = "f";
        checks[5] = true;
    } else {
        baseMsg.innerHTML = '원료 등록완료';
        baseMsg.className = "t";
    }
    
    // capacity 유효성 검사
   if (capacity.value.trim() === "") {
        capacityMsg.innerHTML = "용량을 입력하세요.";
        capacityMsg.className = "f";
        checks[6] = true;
    } else if (!/^\d+$/.test(capacity.value.trim())) {
        capacityMsg.innerHTML = "용량은 숫자만 입력하세요.";
        capacityMsg.className = "f";
        checks[6] = true;
    } else {
        capacityMsg.innerHTML = '용량 등록완료';
        capacityMsg.className = "t";
    }
    
        // expiryDate 유효성 검사
    if (expiryDate.value.trim() === "") {
        expiryDateMsg.innerHTML = "유통기한을 입력하세요.";
        expiryDateMsg.className = "f";
        checks[7] = true;
    } else {
        expiryDateMsg.innerHTML = '유통기한 등록완료';
        expiryDateMsg.className = "t";
    }
    
        // STORAGEMETHOD 유효성 검사
    if (storageMethod.value.trim() === "") {
        storageMethodMsg.innerHTML = "보관방법을 입력하세요.";
        storageMethodMsg.className = "f";
        checks[8] = true;
    } else {
        storageMethodMsg.innerHTML = '보관방법 등록완료';
        storageMethodMsg.className = "t";
    }

    if (checks.includes(true)) {
        event.preventDefault(); // 양식 제출 막기
        alert("빈칸 입력 또는 틀린 내용을 수정해주세요.");
    }
});