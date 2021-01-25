<%@ page pageEncoding="UTF-8" %>
    <div id="main">
        <div class="margin30">
            <h3><i class="bi bi-chat-dots-fill bidragup"></i> 게시판</h3>
            <hr>
        </div>

        <div class="row margin1050">
            <div class="col-6">
                <button type="button" id="prevbtn"
                        class="btn btn-light">
                    <i class="bi bi-chevron-left bidragup"></i> 이전게시물</button>
                <button type="button" id="nextbtn"
                        class="btn btn-light">
                    <i class="bi bi-chevron-right bidragup"></i> 다음게시물</button>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="newbdbtn"
                        class="btn btn-light">
                    <i class="bi bi-plus-circle-fill bidragup"></i> 새글쓰기</button>
            </div>
        </div> <!-- 버튼들 -->
        <div class="row margin1050 ">
            <table class="table tblines">
                <tr><th colspan="2" class="tblines2 tbbg1"><h2>Praesent quis magna vitae nuc malesuada tempor a pretium metus</h2></th></tr> <!-- 제목 -->
                <tr class="tbbg2"><td>qkfns</td><td class="text-right">2021.01.25 12:12:12 / 45 / 256</td></tr> <!-- 작성자,작성일,조회수 -->
                <tr class="tbbg3"><td colspan="2">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                    Nam sagittis feugiat sapien id convallis.<br>
                    Vestibulum pulvinar urna felis, eu suscipit mauris semper quis.<br>
                    Morbi malesuada risus in tempus eleifend.<br>
                    In sed maximus nisi, a vestibulum elit. Mauris id dolor quam.<br>
                    Donec imperdiet laoreet tortor sed interdum.<br>
                    Nulla accumsan eros et purus pharetra, in egestas massa dignissim.<br>
                    Sed sit amet erat ornare dui molestie auctor nec sed nisl.
                </td></tr> <!-- 본문 -->
            </table>
        </div> <!-- 본문글 -->
        <div class="row margin1050">
            <div class="col-6">
                <button type="button" id="upbdbtn"
                        class="btn btn-warning">
                    <i class="bi bi-pencil-square bidragup"></i> 수정하기</button>
                <button type="button" id="rmbdbtn"
                        class="btn btn-danger">
                    <i class="bi bi-trash-fill bidragup"></i> 삭제하기</button>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listbdbtn"
                        class="btn btn-light">
                    <i class="bi bi-card-list bidragup"></i> 목록으로</button>
            </div>
        </div> <!-- 버튼들 -->
        <div class="row margin1050">
            <h3><i class="bi bi-chat-square-dots-fill bidragup"></i> 나도 한마디</h3>
            <table class="table tblines tbwide">
                <tr><td><h4>qkfns</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Morbi malesuada risus in tempus eleifend.<br>
                            In sed maximus nisi, a vestibulum elit. Mauris id dolor quam.<br></p><!-- 댓글 -->
                        <ul class="list-unstyled">
                            <li>
                                <div class="cmtbg2"><span class="h4">zzyzzy</span><span class="pushright">2021-01-30 16:16:16</span></div>
                                <p>Nulla accumsan eros et purus pharetra, in egestas massa dignissim.<br>
                                    Sed sit amet erat ornare dui molestie auctor nec sed nisl.</p>
                            </li>
                        </ul> <!-- 댓글의 댓글 -->
                    </td></tr>
                <tr><td><h4>qkfns</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Morbi malesuada risus in tempus eleifend.<br>
                            In sed maximus nisi, a vestibulum elit. Mauris id dolor quam.<br></p><!-- 댓글 -->
                    </td></tr>
                <tr><td><h4>qkfns</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Morbi malesuada risus in tempus eleifend.<br>
                            In sed maximus nisi, a vestibulum elit. Mauris id dolor quam.<br></p><!-- 댓글 -->
                    </td></tr>
                <tr><td><h4>qkfns</h4></td>
                    <td>
                        <div class="cmtbg1">2021-01-30 15:15:15</div>
                        <p>Morbi malesuada risus in tempus eleifend.<br>
                            In sed maximus nisi, a vestibulum elit. Mauris id dolor quam.<br></p><!-- 댓글 -->
                    </td></tr>

            </table>
        </div> <!-- 댓글목록 -->
        <div class="row margin1050">
            <form id="replyfrm" class="card card-body bg-light">
                <div class="form-group row justify-content-center">
                    <label class="pushtop50 text-primary font-weight-bold">로그인하세요</label>&nbsp;
                    <textarea id="comment" rows="5" class="form-control col-7"></textarea>&nbsp;
                    <span><button id="bdcmtbtn" class="btn btn-dark pushtop50">
                        <i class="bi bi-chat-text-fill bidragup"></i> 댓글쓰기</button></span>
                </div>
            </form>
        </div> <!-- 댓글폼 -->

    </div>
