# rentcar_project

2015년도에 교육과정에서 진행했던 프로젝트.  <br />
프로젝트 리더로서 설계부터 개발까지 모두 담당하였으며 요구사항 정의서, 기술서, 설계서, PDCA보고서 등을 작성하는 등 여러가지 경험 <br />
프로젝트 시연 및 발표는 국어, 일본어 2가지로 진행 <br />
클라이언트 단에 맵을 달아서 출발지와 목적지등을 설정하면 유류비를 계산해주는 기능을 만들었음. (tmap API, DAUM Map을 활용)
<br />

- 사용기술 
> JAVA, Javascript, Struts2, MyBatis, Oracle, jQuery, Ajax etc...


<br />

기본적인 렌터카 프로세스는 존재합니다. 하지만 고객의 Needs를 완벽하게 충족시키는 렌터카 시스템이 없습니다. 
예를 들어 고객이 차량을 예약할 때 사용료는 알 수 있지만 거리와 연비까지 감안하지 않아서 문의 하는 경우가 많습니다. 
따라서 저희 렌터카 시스템은 이동거리에 따라 차량에 따른 연비를 계산해서 고객의 예산 수립에 도움이 되는 기능이 추가 되어있는
어디에도 적용할 수 있는 렌터카 시스템입니다.


## 기능 요구사항
1)	고객 회원가입
2)	로그인 후 고객 페이지에서 렌터카 예약 가능
- 기본적인 사용료 시스템   
	  기간/할인/차량선택/보험/옵션 등을 선택하는 기본적인 사용료 시스템
	  추가로 Map에서 출발 위치와 도착 위치를 지정해서 차량에 따른 연비를 계산해
	  고객의 예산 수립에 도움을 줌 <br />
3) 관리자 페이지
- 관리자는 고객이 입력 한 예약 정보를 확인 후 승인을 내릴 수 있는 결정권이 있고 차량 별로 캘린더를 통해 예약현황을 확인 및 관리 할 수 있다.
- 사고 발생시 사고 정보를 입력 후 사고차량의 상태를 체크한 문서양식을 다운 받아 작성 후 정비소에 인도한다.
- 사고가 난 차량은 정비가 끝날 때까지 캘린더에서 비활성화(블록)표시를 주어 예약불가능으로 설정한다.
- 정비가 완료된 차량은 렌터카직원이 직접 시운전을 하여 차량이 완벽하게 정비가 되었는지를 확인한 후 문제가 없다면 차량의 상태를 업데이트한다. (최고 관리자 결제)
- 차량 정보 등록 및 삭제
- 최고 관리자(지점장)은 인사 관리 시스템으로 사원의 직급을 조절하거나 신입사원의 아이디를 승인한다.
- 직급에 따라 관리할 수 있는 기능(메뉴)가 다름.


<br /> <br /> <br />


## 목표 시스템 개념도

![1](https://user-images.githubusercontent.com/54887506/114271641-59854e80-9a4d-11eb-8201-71d16528d8b0.jpg) <br /><br /> <br /><br />

## DB ERD
![11](https://user-images.githubusercontent.com/54887506/114271871-8e45d580-9a4e-11eb-9a1e-6ee783a99911.jpg)

<br /> <br /> <br /> <br />
## 인터페이스 요구사항 (클라이언트)

![2](https://user-images.githubusercontent.com/54887506/114271643-5a1de500-9a4d-11eb-9c23-10682fddb444.jpg) <br />
![3](https://user-images.githubusercontent.com/54887506/114271644-5ab67b80-9a4d-11eb-9f69-c330bf9d2385.jpg) <br />
![4](https://user-images.githubusercontent.com/54887506/114271645-5ab67b80-9a4d-11eb-8769-c8ada35f1907.jpg) <br />
![5](https://user-images.githubusercontent.com/54887506/114271646-5b4f1200-9a4d-11eb-9102-277cc5e5733f.jpg) <br />
![6](https://user-images.githubusercontent.com/54887506/114271647-5b4f1200-9a4d-11eb-8ed7-12db2696c6b3.jpg) <br />
![7](https://user-images.githubusercontent.com/54887506/114271648-5be7a880-9a4d-11eb-8d3b-abed372291e9.jpg) <br />
![8](https://user-images.githubusercontent.com/54887506/114271649-5c803f00-9a4d-11eb-825f-e80ce51d8253.jpg) <br />
![9](https://user-images.githubusercontent.com/54887506/114271650-5c803f00-9a4d-11eb-93b2-dc779c5f9725.jpg) <br />
![10](https://user-images.githubusercontent.com/54887506/114271651-5d18d580-9a4d-11eb-83cf-e08b3949a875.jpg) <br />


<br /> <br /> <br /> <br />

## 인터페이스 요구사항 (관리자)
![12](https://user-images.githubusercontent.com/54887506/114274699-b804f980-9a5a-11eb-8565-8a9e92d70363.jpg)<br />
![13](https://user-images.githubusercontent.com/54887506/114274700-b89d9000-9a5a-11eb-8141-18ed49ef65be.jpg)<br />
![14](https://user-images.githubusercontent.com/54887506/114274701-b9362680-9a5a-11eb-969c-d8ee7b092b5c.jpg)<br />
![15](https://user-images.githubusercontent.com/54887506/114274702-b9362680-9a5a-11eb-9f35-8bffb9269c86.jpg)<br />
![16](https://user-images.githubusercontent.com/54887506/114274703-b9cebd00-9a5a-11eb-8c26-8e6280970944.jpg)<br />
![17](https://user-images.githubusercontent.com/54887506/114274705-b9cebd00-9a5a-11eb-9deb-b6d710d22f39.jpg)<br />
![18](https://user-images.githubusercontent.com/54887506/114274707-ba675380-9a5a-11eb-98d7-ab6f0e664182.jpg)<br />
![19](https://user-images.githubusercontent.com/54887506/114274709-ba675380-9a5a-11eb-9f1b-e614c8eb59db.jpg)<br />
![20](https://user-images.githubusercontent.com/54887506/114274710-baffea00-9a5a-11eb-9a11-02f25b44ec6d.jpg)<br />
![21](https://user-images.githubusercontent.com/54887506/114274711-baffea00-9a5a-11eb-8942-fd33f5c58be8.jpg)<br />
![22](https://user-images.githubusercontent.com/54887506/114274712-bb988080-9a5a-11eb-90ae-cac48498d01d.jpg)<br />




