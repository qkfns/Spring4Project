<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 로그인하지 않았으면 list 페이지로 강제 전환 --%>
<c:if test="${empty UID}">
<%--    <c:redirect url="/gallery/list?cp=1" />--%>
</c:if>

<div id="main">
    <div class="margin30">
        <h3><i class="bi bi-card-image bidragup"></i> 갤러리</h3>
        <hr>
    </div>

    <form id="newgalfrm">
        <div class="row margin1050">
            <div class="col-6">
                <h4><i class="bi bi-plus-circle-fill bidragup"></i>
                    새글쓰기</h4>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listgalbtn"
                        class="btn btn-light">
                    <i class="bi bi-card-list bidragup"></i>
                    목록으로</button>
            </div>
        </div> <!-- 상단버튼 -->

        <div class="card card-body bg-light margin1050">
            <div class="form-group row">
                <label for="title"
                       class="col-form-label col-2 text-right">제목</label>
                <input type="text" id="title" name="title"
                       class="form-control col-9">
            </div>
            <div class="form-group row">
                <label for="uid"
                       class="col-form-label col-2 text-right">작성자</label>
                <input type="text" id="uid" name="userid"
                       class="form-control col-9" readonly value="${UID}">
            </div>
            <div class="form-group row">
                <label for="contents"
                       class="col-form-label col-2 text-right">본문내용</label>
                <textarea type="text" id="contents" name="contents"
                          class="form-control col-9" rows="15"></textarea>
            </div>
            <!-- 파일첨부 시작 -->
            <div class="form-group row">
                <label for="file1"
                   class="col-form-label col-2 text-right">파일첨부</label>
                <div class="custom-file col-9">
                    <input type="file" id="file1" name="img"
                                class="custom-file-input">
                    <label class="custom-file-label">업로드할 이미지파일을 선택하세요</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file2" name="img"
                           class="custom-file-input">
                    <label class="custom-file-label">업로드할 이미지파일을 선택하세요</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file3" name="img"
                           class="custom-file-input">
                    <label class="custom-file-label">업로드할 이미지파일을 선택하세요</label>
                </div>
            </div>
            <!-- 파일첨부 끝 -->
            <div class="row">
                <label class="col-2 text-right">자동가입방지</label>
                <img src="../../img/google_recaptcha.gif"
                     width="40%" height="40%" style="margin-left: -5px">
            </div>
        </div> <!-- 새글쓰기 폼 -->

        <div class="row margin1050">
            <div class="col-12 text-center">
                <button type="button" id="newgalbtn"
                        class="btn btn-primary">
                    <i class="bi bi-check"></i> 입력완료</button>
                <button type="button" id="cancelbtn"
                        class="btn btn-danger">
                    <i class="bi bi-x"></i> 취소하기</button>
            </div>
        </div>
    </form>

</div>
