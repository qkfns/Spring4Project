<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="pp" value="10"/>
<fmt:parseNumber var="pdcnt" value="${pdnct}"/>

<fmt:parseNumber var="sp" integerOnly="true"
                 value="${(cp-1)/pp}"/>
<fmt:parseNumber var="sp" value="${sp * 10 + 1}"/>
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<fmt:parseNumber var="tp" value="${pdcnt / pp}" integerOnly="true"/>
<c:if test="${(pdcnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp+1}" />
</c:if>

<fmt:parseNumber var="snum" integerOnly="true"
                 value="${pdcnt - (cp - 1) * pp}" />


<c:set var="navlnk" value="/pds/list?cp="/>
<c:if test="${not empty param.findkey}">
    <c:set var="navlnk" value="/pds/find?findtype=${param.findtype}&findkey=${param.findkey}&cp="/>
</c:if>

    <div id="main">
        <div class="margin30">
            <h3><i class="bi bi-cloud-download-fill bidragup"></i> 자료실</h3>
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
                        &nbsp;<button type="button" id="pdfindbtn" class="btn btn-dark">
                        <i class="bi bisearch"> </i>검색</button>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <button type="button" id="newpd"
                            class="btn btn-info"><i class="bi bi-plus-circle"></i> 새글쓰기</button>
                </div>
            </c:if>
        </div>
        <div class="row margin1050">
            <div class="col-12">
                <table class="table table-striped tblines text-center table-hover">
                    <thead style="background: #dff0d8">
                        <tr>
                            <th style="width: 7%">번호</th>
                            <th>제목</th>
                            <th style="width: 12%">작성자</th>
                            <th style="width: 10%">작성일</th>
                            <th style="width: 7%">추천</th>
                            <th style="width: 7%">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="text-danger">
                            <th>공지</th>
                            <th><span class="badge badge-danger">Hot</span>메롱</th>
                            <th>운영자</th>
                            <th>2021.01.15</th>
                            <th>10</th>
                            <th>128</th></tr>

                        <c:forEach var="p" items="${pds}">
                        <tr><td>${snum}</td>
                            <td><a href="/pds/view?pno=${p.pno}&cp=${cp}">${p.title}</a></td>
                            <td>${p.userid}</td>
                            <td>${fn:substring(p.regdate,0,10)}</td>
                            <td>${p.thumbs}</td>
                            <td>${p.views}</td></tr>
                            <c:set var="snum" value="${snum -1 }"/>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div> <!-- 게시판 테이블-->
        <div class="row">
            <div class="col-12">
                <ul class="pagination justify-content-center">
                    <%-- '이전'이 표시되어야 할때는  sp > 10 --%>
                    <c:if test="${cp gt 10}">
                        <li class="page-item">
                        <a href="${navlnk}${sp-10}" class="page-link">이전</a></li>
                    </c:if>

                    <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                        <c:if test="${i le tp}">
                            <c:if test="${i ne cp}">
                                <li class="page-item">
                                    <a href="${navlnk}${i}" class="page-link font-weight-bold">${i}</a></li>
                            </c:if>
                            <c:if test="${i eq cp}">
                                <li class="page-item active">
                                    <a href="${navlnk}${i}" class="page-link font-weight-bold">${i}</a></li>
                            </c:if>
                        </c:if>
                    </c:forEach>

                    <c:if test="${ep lt tp}">
                    <li class="page-item"><a href="${navlnk}${sp+10}" class="page-link">다음</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>

