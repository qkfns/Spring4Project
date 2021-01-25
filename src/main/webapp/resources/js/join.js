
// jquerty로 이벤트 추가하기 : $(대상).on(이벤트종류, function() {});
// 아이디 # 클래스 .로 접근
// agree
$('#okagree').on('click', function () {
    if (!$('#agree1').is(':checked'))
        alert('이용약관에 동의하세요!');
    else if (!$('#agree2').is(':checked'))
        alert('개인정보활용에 동의하세요!');
    else
        location.href='/join/checkme';
});  //동의함
$('#noagree').on('click', function () {location.href='/index' });  //동의하지않음

// checkme
$('#checkbtn2').on('click',function () {
    if($('#name').val() == '') alert('이름을 입력하세요');
    else if ($('#jumin1').val() == '') alert('주민번호 앞자리를 입력하세요');
    else if($('#jumin2').val() == '') alert('주민번호 뒷자리를 입력하세요');
    else if(!$('#usejm').is(':checked')) alert('주민등록처리에 동의하세요!');
    else
        location.href='/join/joinme?name=' + $('#name').val()
        + '&jumin1=' + $('#jumin1').val()
        + '&jumin2=' + $('#jumin2').val();
});  // 실명확인하기

$('#cancelbtn2').on('click',function () {
    if(confirm('정말로 취소하시겠습니까?'))
        location.href='/index';
});  // 실명확인취소하기

// joinme
$('#joinbtn').on('click', function (){
    if ($('#newuid').val() == "") alert('아이디를 입력하세요!!');
    else if ($('#pws').val() == "") alert('비밀번호를 입력하세요!!');
    else if ($('#repwd').val() == "") alert('비밀번호확인을 입력하세요!!');
    else if ($('#pwd').val() != $('#repwd').val()) alert('비밀번호가 서로 일치하지 않아요!!');
    // else if ($('#zip1').val() == "" ||
    //         $('#zip2').val() =="" ||
    //         $('#addr1').val() == "") alert('우편번호 검색을 하세요!!');
    else if ($('#addr2').val() == "") alert('나머지 주소를 입력하세요');
    // else if ($('#email1').val() == "" ||
    //         $('#email2').val() == "") alert('이메일을 입력하세요!!');
    else if ($('#hp2').val() == "" ||
            $('#hp3').val() == "") alert('전화번호를 입력하세요!!');
    else {
            //분리된 데이터 합치기
            $('#jumin').val( $('#jumin1').val() + '-' + $('#jumin2').val() );
            $('#zipcode').val( $('#zip1').val() + '-' + $('#zip2').val() );
            $('#email').val( $('#email1').val() + '@' + $('#email3').val() );
            $('#phone').val( $('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val() );

            $('#joinfrm').attr('action', '/join/joinme');
            $('#joinfrm').attr('method', 'post');
            $('#joinfrm').submit();
    }
});  // 가입하기

$('#cancelbtn').on('click', function () {
    if(confirm('정말로 취소하시겠습니까?'))
        location.href='/index'; }); // 가입취소하기



