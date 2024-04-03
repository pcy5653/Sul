## 🍶 술담아 (전통주 쇼핑몰)
- [프로젝트 개요](#프로젝트-개요)
- [팀원 소개](#팀원-소개)
- [내 담당 기능](#내-담당-기능)
- [개발환경 및 도구](#개발환경-및-도구)
- [기능 구현](#기능-구현)
    <details><summary>더보기
    </summary>     
       
        1) 회원
           1-1. 전체적인 화면
           1-2. FAQ 목록
           1-3. 1:1 내 문의 목록
           1-4. 1:1 내 문의 등록, 수정, 삭제
           1-5. 리뷰 Best 4 추천 상품 

        2. 관리자
           2-1. FAQ 목록
           2-2. FAQ 등록, 수정, 삭제
           2-3. 1:1 사용자 문의 목록
           2-4. 답변 등록, 수정, 삭제
           2-5 전체 화면 디자인

    </details>

<br>

## 📋프로젝트 개요
<p align="center"><img width="330" alt="술담아" src="https://github.com/koehdcks/Sul/assets/68891642/05326e06-86e5-4a4b-9b96-e2727eaee1c9"></p>

> **프로젝트** : 술담아 (전통주 쇼핑몰)  
> **기획 및 제작** : 김세은, 김동찬, 김민진, 김호진, 박채연  
> **제작 기간** : 2023.08.16 ~ 2023.09.15  
> **분류** : 팀 프로젝트  
> **사용 기술** : SPRING LEGACY  
>> **시스템 아키텍처**   
그림 들어간다.

<br>

## 👨‍👩‍👧‍👦팀원 소개
> **팀장** : 김호진  
> 상품페이지, 상품리뷰  

> 💡**팀원** : **박채연**  
> **FAQ / 1:1 문의, 전체페이지 디자인**

> **팀원** : 김세은  
> 공지사항, 장바구니

> **팀원** : 김동찬  
>회원, 마이페이지, 관리자페이지

> **팀원** : 김민진  
>주문/주문취소, 관리자페이지, 상품페이지

<br>

## 🤠내 담당 기능
> #**회원**   
>>a) 1:1 내 문의 목록  
>>b) 1:1 문의 등록 (파일 첨부 및 SMS 수신 동의), 수정, 삭제  
>>c) 페이징 처리 및 검색 기능

> #**관리자**   
>> a) 1:1 전체 문의 목록. 답변 등록, 수정, 삭제  
>> b) FAQ 목록, 등록, 수정, 삭제, 페이징 처리  
>> c) 총괄 페이지 디자인

<br>

## ⚙️개발환경 및 도구 
> ### Framework  :  ![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)  ![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white) <img src="https://img.shields.io/badge/MyBatis-000000?style=for-the-badge&logo=MyBatis&logoColor=white"> 
> ### Design  : ![Adobe Photoshop](https://img.shields.io/badge/adobe%20photoshop-%2331A8FF.svg?style=for-the-badge&logo=adobe%20photoshop&logoColor=white)
> ### Library : ![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
> ### IDE  : ![SpringToolSuite3](https://img.shields.io/badge/Spring_Tool_Suite3-6DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) ![visualstudiocode](https://img.shields.io/badge/visual_studio_code-007ACC.svg?style=for-the-badge&logo=visualstudiocode&logoColor=white) ![dbeaver](https://img.shields.io/badge/dbeaver-382923.svg?style=for-the-badge&logo=dbeaver&logoColor=white) 
> ### Language  : ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) ![Java](https://img.shields.io/badge/java-FF0000.svg?style=for-the-badge&logo=java&logoColor=white) 
> ### DB : ![oracle](https://img.shields.io/badge/oracle-F80000.svg?style=for-the-badge&logo=oracle&logoColor=white)
> ### Server :  ![apachetomcat](https://img.shields.io/badge/apachetomcat-F8DC75.svg?style=for-the-badge&logo=apachetomcat&logoColor=white)
> ### OS  : ![windows](https://img.shields.io/badge/windows-0078D4.svg?style=for-the-badge&logo=windows&logoColor=white)
> ### Hosting : ![AWS](https://img.shields.io/badge/aws-232F3E.svg?style=for-the-badge&logo=amazonaws&logoColor=white)
> ### Other :  ![docker](https://img.shields.io/badge/docker-2496ED.svg?style=for-the-badge&logo=docker&logoColor=white) ![slack](https://img.shields.io/badge/slack-4A154B.svg?style=for-the-badge&logo=slack&logoColor=white) ![github](https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logo=github&logoColor=white) ![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)


<br>

## 🔍기능 구현
### 1. 회원
1-1. 메인화면
<p align="center">
<img style="width:300px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/23f2566f-f3bd-4ed3-938e-657ff243b8f2" />
<img style="width:200px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/f00c67f0-9041-4d84-8940-6c64a3bbc526" />
</p>

- <술담아> 메인페이지로 평점에 따른 Best 4 상품을 확인할 수 있습니다.

<br>
1-2. FAQ 목록
<p align="center">
<img style="width:400px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/1eb8d29a-a59c-4e26-89f2-6c750ec4ea34" />
</p>

- 카테고리 별로 원하는 FAQ를 확인할 수 있으며, '+' 클릭하면 각 List 상세 내용을 확인할 수 있습니다.

<br>
1-3. 1:1 내 문의 목록
<p align="center">
<img style="width:400px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/609eaec5-9fa5-4ae8-ab50-a807c4601a4f" />
</p>

- 사용자의 문의 목록과 총 건수, 문의내역 및 내용으로 검색이 가능합니다.

<br>
1-4. 1:1 내 문의 등록, 수정, 삭제
<p align="center">
<img style="width:400px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/dafe8fcd-db02-4a58-bf90-31f738d4f002" />
<img style="width:200px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/510ffdba-ac5a-44cb-8a8e-6b83dabdf691" />
</p>

<p align="center">
<img style="width:400px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/73c058ee-7228-4d07-8e37-3bf9a02ae21d" />
<img style="width:200px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/5a762977-045e-49ba-a244-0d2ebf6dcbb9" />
</p>

<p align="center">
<img style="width:400px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/e1931d7a-eeb9-409b-b3e2-0387a9c4cc26" />
<img style="width:200px;" align="center" src="https://github.com/pcy5653/GDJ68_Boot/assets/68891642/5a93d54e-9543-4c31-b7ba-ab356807bddc" />
</p>
