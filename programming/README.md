#수업 일지
02/07 사진 가져오기, Pod을 통한 Realm 설치

pod을 통한 RealmSwift 설치
1. 터미널을 열고 디렉토리를 프로젝트폴더로 바꿔준다
2. pod init 을 해준다
3. ls 를 해봐서 Podfile 이 생겼는지 확인
4. vi Podfile 을 해주면 Podfile을 수정할 수 있게 된다.
5. i 를 누르면 수정할 수 있다.
6. end 위에 pod 'RealmSwift', '~> 2.4' 를 입력한다.
7. esc를 누르고 shift + :를 누르고. wq를 입력한다
8. pod install을 입력하면 설치가 시작된다. 기다리자
9. .xcworkspace 확장자를 가진 파일로 프로젝트를 시작한다.

ImagesTable
액션시트 사용하기
알터뷰 사용하기
TableView 와 Realm 사용하기. 

뷰의 라이프싸이클
- 데이터 저장은 ViewWillDisappered가 적당함