<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--
    // 게시판 네비게이션
    // 현재 페이지에 따라 보여줄 페이지 블록을 결정
    // ex) 총 페이지수pages가 27일 때
    // cp = 1 : 1 2 3 4 5 6 7 8 9 10
    // cp = 3 : 1 2 3 4 5 6 7 8 9 10
    // cp = 9 : 1 2 3 4 5 6 7 8 9 10
    // cp = 11 : 11 12 13 14 15 16 17 18 19 20
    // cp = 17 : 11 12 13 14 15 16 17 18 19 20
    // cp = 23 : 21 22 23 24 25 26 27
    startPage = floor((cp - 1) / 10) * 10 + 1
    endPage = startPage + 9
--%>

<%--
    // 글번호 재조정
    // 총게시물수total : 150, 페이지당 게시물수pp : 10
    // page 1 : 150~141
    // page 2 : 140~131
    // page 3 : 130~121
    //  ...
    // page n : snum = total - (n - 1) * 10
--%>

<%-- 게시판, 자료실과는 달리 갤러리의 페이지당 게시물 수는 10이 아닌 24로 설정!!--%>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="pp" value="24" />

<fmt:parseNumber var="sp" integerOnly="true" value="${((cp - 1) / pp)}" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" />
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<fmt:parseNumber var="tp" value="${galcnt / pp}" integerOnly="true" />
<c:if test="${(galcnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<fmt:parseNumber var="snum" integerOnly="true"
         value="${galcnt - (cp - 1) * pp}"  />

<%-- 검색여부에 따라 네비게이션 링크 출력을 다르게 함 --%>
<%-- 일반 목록 출력 : /gallery/list?cp= --%>
<%-- 검색후 목록 출력 : /gallery/find?findtype=???&findkey=???&cp=?? --%>
<c:set var="navlnk" value="/gallery/list?cp=" />
<c:if test="${not empty param.findkey}">
    <c:set var="navlnk">
        /gallery/find?findtype=${param.findtype}&findkey=${param.findkey}&cp=</c:set>
</c:if>
<%-- 이미지 출력을 위한 기본 주소 설정 --%>
<%-- http://localhost/cdn/_thumb/small_글번호_파일명_ --%>
<%--<c:set var="baseImgURL" value="http://localhost/cdn"/>--%>
<c:set var="baseImgURL" value="http://3.34.122.27:4417/cdn"/>
<c:set var="thumbURL" value="${baseImgURL}/_thumb/small_"/>

<%-- bootstrap의 card image 사용시
     card 박스의 크기는 240px (15rem)
     따라서, 썸네일 이미지의 크기는 220 x 220px로 설정
     1920x1080 해상도에서 card 박스는 한행에 4개를 배치할 수 있음
 --%>



<div id="main">
    <div class="margin30">
        <h3><i class="bi bi-cloud-download-fill bidragup"></i> 갤러리</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <c:if test="${not empty UID}">
            <div class="col-6">
                <div class="form-group row">
                    <select name="findtype" id="findtype" class="form-control col-4">
                        <option value="title">제목</option>
                        <option value="ticon">제목 + 내용</option>
                        <option value="contents">내용</option>
                        <option value="userid">작성자</option>
                    </select>&nbsp;
                    <input type="text" name="findkey" id="findkey" class="form-control col-5">
                    &nbsp;<button type="button" id="galfindbtn" class="btn btn-dark">
                        <i class="bi bi-search"> </i>검색</button>
                </div>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="newgal" class="btn btn-info">
                    <i class="bi bi-plus-circle bidragup"></i> 새글쓰기</button>
            </div>
        </c:if>
    </div>

    <div class="row margin1050">
        <div class="col-12">
            <ul class="list-inline">
                <c:forEach var="g" items="${gals}">
                    <li class="list-inline-item">
                        <div class="card" style="width: 238px;">
                            <img src="${thumbURL}${g.gno}_${fn:split(g.fnames,"[/]")[0]}" class="card-img-top"
                                width="220" height="220" onclick="javascript:showimg('${g.gno}')"
                            style="cursor: pointer">
                            <div class="card-body">
                                <h5 class="card-title">${g.title}</h5>
                                <p class="card-text">${g.userid}
                                    <span style="float:right">${fn:substring(g.regdate,0,10)}</span></p>
                                <p class="card-text">
                                    <i class="bi bi-eye"></i>${g.views}
                                    <span style="float:right">
                                    <i class="bi bi-hand-thumbs-up"></i>${g.thumbs} </span></p>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </div><!-- 게시판 테이블 -->

    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">
                <%-- '이전'이 표시되어야 할때는 sp > 10  --%>
                <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                        <a href="${navlnk}${sp-10}" class="page-link">이전</a></li>

                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <c:if test="${i le tp}">
                        <c:if test="${i ne cp}">
                            <li class="page-item">
                                <a href="${navlnk}${i}"
                                    class="page-link font-weight-bold">${i}</a></li>
                        </c:if>

                        <c:if test="${i eq cp}">
                            <li class="page-item active">
                                <a href="${navlnk}${i}"
                                    class="page-link font-weight-bold">${i}</a></li>
                        </c:if>
                    </c:if>
                </c:forEach>

                <%-- '다음'이 표시되어야 할때는 ???  --%>
                <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                    <a href="${navlnk}${sp+10}" class="page-link">다음</a></li>
            </ul>
        </div>
    </div><!-- 페이지네이션 -->

</div>