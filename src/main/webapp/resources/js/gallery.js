// write
$('#newgalbtn').on('click', function() {
    if ($('#title').val() == '') alert('제목을 작성하세요!');
    else if ($('#contents').val() == '') alert('본문을 작성하세요!');
    else if ($('#file1').val() == '') alert('업로드할 이미지를 선택하세요!');
    else {
        $('#newgalfrm').attr('method', 'post');
        $('#newgalfrm').attr('enctype', 'multipart/form-data');
        $('#newgalfrm').attr('action', '/gallery/write');
        $('#newgalfrm').submit();
    }
});


// list
function showimg(gno){
    location.href = '/gallery/view?gno=' + gno;
}


