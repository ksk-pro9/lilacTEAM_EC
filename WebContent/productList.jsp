<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/lilac.css">
<link rel="stylesheet" href="./css/productList.css">
<title>商品一覧</title>
</head>

<body>
<s:include value="header.jsp" />
<div id="contents">
<h1 id="title-center">商品一覧画面</h1>
<%-------エラーメッセージ --------%>
<div class="error">
<s:if test="keywordsErrorMessageList != null">
	<s:iterator value="keywordsErrorMessageList"><s:property /><br></s:iterator>
</s:if>
<s:elseif test="productInfoDtoList==null">
	検索結果がありません。
</s:elseif>
</div>

<s:else>
	<%-----商品一覧全体div-- ------%>
	<div id="product-list">
	<s:iterator value="productInfoDtoList">
		<%-----１つの商品に対するdiv ------%>
		<div class="product-list-box">
		<ul>
			<li>
			<%------　画像をクリックするとProductDetailsActionが実行される ------%>
			<a href='<s:url action="ProductDetailsAction">
			<s:param name="productId" value="%{productId}"/>
			</s:url>'>
			<img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' class="item-image-box-200"/>
			<br>

			<%------　画像の下に商品名、商品名かな、価額が表示される -------%>

				<%--　文字リンク用 --%>
<%-- 			<a href='<s:url action="ProductDetailsAction"> --%>
<%-- 			<s:param name="productId" value="%{productId}"/> -->
<%-- 			</s:url>'> --%>

			<s:property value="productName"/><br>
			<s:property value="productNameKana"/><br>
			<s:property value="price"/>円<br>

<!-- 			</a> -->
			</a>
			</li>
		</ul>
	 	</div>
	</s:iterator>
	</div>
</s:else>
</div>
<div class="footer-space"></div>
<s:include value="footer.jsp"/>
</body>

</html>