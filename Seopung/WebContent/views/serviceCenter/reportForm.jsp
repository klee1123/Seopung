<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<style>
    .outer{
        background:white;
        margin:auto;
        width:1000px;
        height:800px;
        margin-top:50px;
    }
    #insertForm>table{border:1px solid white}
    #insertForm>table textarea{width:100%; box-sizing:border-box}
</style>
</head>
<body>

    <div class="outer">
        <br>
        <h2 align="center">서풍에 신고하기</h2>
        <br>
        <h5 align="center">
            * 신고하신 내용은 증거자료를 참고하여 서풍 약관에 의거해 조치됩니다.<br>
            * 증거 내용이 불충분하거나 타당한 이유가 아니면 무효 처리됩니다.<br>
            * 허위 신고의 경우 신고자가 제재받을 수 있음을 유념해주세요.<br></h5>

        <form action="" id="insertForm" method="post">
            <!-- 카테고리, 제목, 내용, 첨부파일 -->

            <table align="center">
                <tr>
                    <th width="70">신고유형</th>
                    <td width="500">
                        <select name="category">
                            <option value="10">신고 내용을 선택하세요.</option>
                            <option value="20">영리목적, 홍보성</option>
                            <option value="30">불법성</option>
                            <option value="40">욕설, 인신공격</option>
                            <option value="50">도배 및 광고</option>
                            <option value="60">개인정보 노출</option>
                            <option value="70">음란성, 선정성</option>
                            <option value="80">모방 또는 명의 도용</option>
                            <option value="90">기타</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <th>신고내용</th>
                    <td>
                        <textarea name="content" rows="10" style="resize:none;"></textarea>
                    </td>
                </tr>

                <tr>
                    <td>약관 동의</td>
                    <td><input type='checkbox' name='check' value=''></td>
                </tr>

            </table>

            <br>
            
            <div align="center">
                <button type="submit">제출하기</button>
            </div>

        </form>
    </div>
</body>
</html>