# 🥕당근마켓🥕

##  💻 프로젝트 소개
당근마켓을 클론코딩하여 만든 사이트입니다.
 
* 당근마켓 클론코딩 홈페이지: http://13.125.150.98:8080/main/main_view
```
아이디: aaaa123  비밀번호: aaaa123
```
* 시연 영상: https://youtu.be/2Ez4Rb7c_F0

* 노션: https://innate-rugby-85f.notion.site/87944d15005d4cc69160eeabfa016f40
 (PDF파일: [당근마켓_클론코딩.pdf](https://github.com/immingooo/carrot_market/files/10976006/_.pdf) )
 

## ⏱ 개발 기간
* 2023.01.30 ~ 2023.03.07

> 일정표 링크: https://docs.google.com/spreadsheets/d/1xpb50cubg17faKI1HsoI77gZlOBvnJhO/edit?usp=sharing&ouid=107593773136340825445&rtpof=true&sd=true

## ⚔ 기술 스택
**[Front-End]**

<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap4-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white"/>

**[Back-End]** 

<img src="https://img.shields.io/badge/Spring Boot 2.7.9-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=white"> <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL EC2&logoColor=white"> <img src="https://img.shields.io/badge/MyBatis-4479A1?style=for-the-badge&logo=MyBatis EC2&logoColor=white"> <img src="https://img.shields.io/badge/Gradle-02303A?style=for-the-badge&logo=Gradle&logoColor=white"> <img src="https://img.shields.io/badge/Amazon EC2-FF9900?style=for-the-badge&logo=Amazon EC2&logoColor=white"> 

## 📝 화면 기획
|![메인화면](https://user-images.githubusercontent.com/101551707/225053683-b416c84a-0c2f-4366-853d-2063462e36dd.png)| ![로그인](https://user-images.githubusercontent.com/101551707/225171201-1be722d8-2158-41f8-b030-eed0ef01fe6b.png) | ![회원가입](https://user-images.githubusercontent.com/101551707/225171244-0a489636-8e05-4a89-8070-2431a2779093.png) |
| :-----------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------: |
|                                                       메인화면                                                        |                                                      로그인                                                       |                                                     회원가입                                                      |

| ![글 작성](https://user-images.githubusercontent.com/101551707/225171266-59c4eaf1-114e-4bcf-a40e-6441ced555e8.png) | ![글 상세](https://user-images.githubusercontent.com/101551707/225171292-47a1d542-0f91-430d-b833-6d63fa9785c3.png) | ![채팅](https://user-images.githubusercontent.com/101551707/225171322-e95a4eaa-fede-4ce0-9048-76e1dcdf7682.png) | ![후기작성](https://user-images.githubusercontent.com/101551707/225171348-4c6331b8-ce95-4cc3-98de-32fa917597f1.jpg) |
| :-----------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------: |
|                                                      글작성                                                      |                                                       글 상세                                                        |                                                      채팅                                                        |                                                     후기작성                                                      |

> 기획서 링크: https://ovenapp.io/view/paAvCs2fGN8lyUNYgZKIVfX5VNExbgcT/h0bBY

## 🛢 ERD 다이어그램
<img src="https://user-images.githubusercontent.com/101551707/225052519-13f2b97d-2000-4a27-a53e-e16babeac704.png"  width="900" height="500">

> ERD 다이어그램 링크: https://www.erdcloud.com/p/835uCxuzwJpBzrS4C

## 🔗 URL 설계

### 1) 화면 URL설계
| 화면 | URL Path(경로) |
| --- | --- |
| 메인 | http://13.125.150.98:8080/main/main_view |
| 회원가입 | http://13.125.150.98:8080/user/sign_up_view |
| 로그인 | http://13.125.150.98:8080/user/sign_in_view |
| 글 상세 | http://13.125.150.98:8080/used_goods/used_goods_detail_view?usedGoodsId=35 |
| 검색결과 | http://13.125.150.98:8080/main/search_view?keyword=%EC%BF%A0%ED%82%A4 |

### 2) API 설계
<img src="https://user-images.githubusercontent.com/101551707/225055932-f6daae14-6d63-49e2-ad2d-29f7437ed11f.jpg"  width="700" height="370">
<img src="https://user-images.githubusercontent.com/101551707/225056028-d40c0b19-2aa4-4cf0-bf8a-ce1013dee047.jpg"  width="700" height="450">
<img src="https://user-images.githubusercontent.com/101551707/225056101-4fa32f48-7bdb-44d4-b9d9-4cfe6f99d4a7.jpg"  width="700" height="200">

## 📌 주요기능
### 글 작성
<img src="https://user-images.githubusercontent.com/101551707/225205251-fed8b65d-9bf5-4e5f-8a56-2e7850ddf718.gif"  width="800" height="500">

```
회원이 글을 작성하는 화면입니다. 이미지는 최대 5개까지 업로드 할 수 있습니다.
```

### 글 상세화면
<img src="https://user-images.githubusercontent.com/101551707/225205639-130b2427-59bb-4e0d-bea3-bd0725cc7a1d.gif"  width="800" height="600">

```
글 상세화면 입니다. 이미지는 슬라이드형식으로 구현하여 넘기면서 확인할 수 있습니다. 
글에 대한 좋아요를 클릭할 수 있고 조회수와 채팅개수, 좋아요 개수도 나타나도록 했습니다.
```

### 채팅하기
<img src="https://user-images.githubusercontent.com/101551707/225205256-409d4d47-7c80-4e5c-9a83-d2172e0aa168.gif"  width="800" height="500">

```
채팅화면 입니다. 3초마다 화면을 불러와서 실시간 채팅처럼 구현했습니다. 
```

## 💥 트러블 슈팅
* 글 작성<br>
  [UsedGoodsBO](https://github.com/immingooo/carrot_market/blob/6c0dc28d8c8e93a0bf407ddb04fc00a140eeb5da/src/main/java/com/carrotMarket/usedGoods/bo/UsedGoodsBO.java#L49)<br>
  [usedGoodsMapper](https://github.com/immingooo/carrot_market/blob/bc060a6922724ca4994da85ebda0a3bf8b606136/src/main/resources/mappers/usedGoodsMapper.xml#L6)
* [다중 이미지처리](https://github.com/immingooo/carrot_market/blob/bc060a6922724ca4994da85ebda0a3bf8b606136/src/main/resources/mappers/usedGoodsMapper.xml#L35)
* [조회수](https://github.com/immingooo/carrot_market/blob/bc060a6922724ca4994da85ebda0a3bf8b606136/src/main/java/com/carrotMarket/usedGoods/bo/UsedGoodsBO.java#L224)
* 검색화면<br>

## 💡 느낀점
프로젝트를 시작하고 구체적인 구현을 하기 시작하면서 내가 할 수 있을까라는 생각이 들고 두려웠지만 하루하루 기능들을 구현해내고 오류를 해결해가면서 어느순간 제가 직접 만든 사이트가 만들어져 있어져 신기했습니다. 

이번 프로젝트를 하면서 사용자에게 필요한 정보만 보여주기 위해 가공해야 하는 상황을 많이 다뤄서  앞으로 필요한 정보들을 가공해야 할 때 잘할 수 있겠다라는 자신감이 생겼고 CRUD 흐름에 대해 더 잘 이해가 된 것 같아서 더 복잡한 CRUD도 구현해보고 싶다는 생각이 들었습니다. 

프로젝트를 하면서 아쉬웠던 점은 채팅을 구현할 때 웹소켓이라는 개념에 대해 공부해서 채팅을 구현해보고 싶었는데 복잡한 로직을 웹소켓으로 구현하기에는 어려워서 잠시 멈춰두었지만 웹소켓에 대한 개념을 알게 되었고 나중에 채팅이 아니더라도 실시간으로 알림을 주고받을 때 사용해보고싶다는 생각이 들었습니다.
