<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String contextName = request.getContextPath(); %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[後台]最新消息-修改</title>
<link rel="stylesheet" type="text/css" href="/backend/css/hotnews/style.css" />
<link rel="stylesheet" type="text/css" href="/backend/css/hotnews/add.css" />
</head>
<body>
<jsp:include page="/backend/header/header.jsp">
	<jsp:param name="menu_action" value="${action}" />
</jsp:include>
<script type="text/javascript" src="/backend/js/formcheck/script.js"></script>
<script type="text/javascript">
function submit(){
	if(formCheck($('#upload'))){
		$('#upload').submit();
	}
}
</script>
<hr />
<form id="upload" action="/backend/item-edit.do" enctype="multipart/form-data" method="post">
<input type="hidden" id="action" name="action" value="${action}" />
<div class="tab_div">
<ul class="tabs">
	<c:forEach items="${itemsList}" var="item" varStatus="number">
		<c:choose>
			<c:when test="${item.lang_id == 1}">
				<li>
					<input type="radio" checked name="tabs" id="tab1">
					<label for="tab1">中文</label>
					<div id="tab-content1" class="tab-content animated fadeIn">
						<div id="hotnews-add-table">
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td"><span>修改</span></div>
								<div class="hotnews-add-td"></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td"><span>編號</span></div>
								<div class="hotnews-add-td">
									<input type="hidden" name="id" value="${item.id}"/>
									${item.id}
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td"><span>標題</span></div>
								<div class="hotnews-add-td"><input type="text" id="title_cht" name="title_cht" value="${item.title}" formcheck="1" errMsg="請輸入標題"/></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">副標題</div>
								<div class="hotnews-add-td"><input type="text" id="subtitle_cht" name="subtitle_cht" value="${item.subtitle}" formcheck="1" errMsg="請輸入副標題"/></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">敘述</div>
								<div class="hotnews-add-td"><textarea id="description_cht" name="description_cht" formcheck="1" errMsg="請輸入敘述"/>${item.description}</textarea></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">作者</div>
								<div class="hotnews-add-td"><input type="text" id="author_cht" name="author_cht" value="${item.author}" formcheck="1" errMsg="請輸入作者"/></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">連結一</div>
								<div class="hotnews-add-td">
									<input type="text" id="link_1_cht" name="link_1_cht" value="${item.linkA}"/>&nbsp;
									<c:if test="${item.linkA != ''}">
										<a href="${item.linkA}" target="_blank">預覽</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">連結二</div>
								<div class="hotnews-add-td">
									<input type="text" id="link_2_cht" name="link_2_cht" value="${item.linkB}"/>&nbsp;
									<c:if test="${item.linkB != ''}">
										<a href="${item.linkB}" target="_blank">預覽</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">連結三</div>
								<div class="hotnews-add-td">
									<input type="text" id="link_3_cht" name="link_3_cht" value="${item.linkC}"/>&nbsp;
									<c:if test="${item.linkC != ''}">
										<a href="${item.linkC}" target="_blank">預覽</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">圖片一</div>
								<div class="hotnews-add-td"><input type="file" id="image_1_cht" name="image_1_cht" /><br />
									<c:if test="${item.imageApath != ''}">
										<img src="<%=contextName%>${item.imageApath}" height="200px"/>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">圖片二</div>
								<div class="hotnews-add-td"><input type="file" id="image_2_cht" name="image_2_cht" /><br />
									<c:if test="${item.imageBpath != ''}">
										<img src="<%=contextName%>${item.imageBpath}" height="200px"/>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">圖片三</div>
								<div class="hotnews-add-td"><input type="file" id="image_3_cht" name="image_3_cht" /><br />
									<c:if test="${item.imageCpath != ''}">
										<img src="<%=contextName%>${item.imageCpath}" height="200px"/>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">分類標籤</div>
								<div class="hotnews-add-td">
									<select id="breadcrumb_1" name="breadcrumb_1_cht">
										<c:forEach items="${level_one}" var="bread">
											<c:if test="${bread.breadcrumb_lang_id == 1}">
												<option value="${bread.breadcrumb_id}" <c:if test="${bread.breadcrumb_id == item.breadcrumbA}">selected</c:if>>${bread.breadcrumb_name}</option>
											</c:if>
										</c:forEach>
									</select>&nbsp;>&nbsp;
									<select id="breadcrumb_2" name="breadcrumb_2_cht">
										<c:forEach items="${level_two}" var="bread">
											<c:if test="${bread.breadcrumb_lang_id == 1}">
												<option value="${bread.breadcrumb_id}" <c:if test="${bread.breadcrumb_id == item.breadcrumbB}">selected</c:if>>${bread.breadcrumb_name}</option>
											</c:if>
										</c:forEach>
									</select>&nbsp;>&nbsp;
									<select id="breadcrumb_3" name="breadcrumb_3_cht">
										<c:forEach items="${level_three}" var="bread">
											<c:if test="${bread.breadcrumb_lang_id == 1}">
												<option value="${bread.breadcrumb_id}" <c:if test="${bread.breadcrumb_id == item.breadcrumbC}">selected</c:if>>${bread.breadcrumb_name}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">檔案下載一</div>
								<div class="hotnews-add-td"><input type="file" id="file_1_cht" name="file_1_cht" />&nbsp;
									<c:if test="${item.fileApath != ''}">
										<a href="${item.fileApath}" target="_blank">下載</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">檔案下載二</div>
								<div class="hotnews-add-td"><input type="file" id="file_2_cht" name="file_2_cht" />&nbsp;
									<c:if test="${item.fileBpath != ''}">
										<a href="${item.fileBpath}" target="_blank">下載</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">檔案下載三</div>
								<div class="hotnews-add-td"><input type="file" id="file_3_cht" name="file_3_cht" />&nbsp;
									<c:if test="${item.fileCpath != ''}">
										<a href="${item.fileCpath}" target="_blank">下載</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">新增日期</div>
								<div class="hotnews-add-td">${item.createDate}</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">瀏覽次數</div>
								<div class="hotnews-add-td">${item.pageviews}</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">置頂</div>
								<div class="hotnews-add-td">
									<select id="top_cht" name="top_cht">
										<option value="0" <c:if test="${item.top == 0}">selected</c:if>>否</option>
										<option value="1" <c:if test="${item.top == 1}">selected</c:if>>是</option>
									</select>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">啟用</div>
								<div class="hotnews-add-td">
									<select id="enabled_cht" name="enabled_cht">
										<option value="0" <c:if test="${item.enabled == 0}">selected</c:if>>否</option>
										<option value="1" <c:if test="${item.enabled == 1}">selected</c:if>>是</option>
									</select>
								</div>
							</div>
						</div>
						<section>
							<div id="container_buttons">
								<p>
									<a class="function_btn" href="#" onclick="submit();return false;">送出</a>
								</p>
							</div>
						</section>
					</div>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<input type="radio" name="tabs" id="tab2">
			        <label for="tab2">English</label>
			        <div id="tab-content2" class="tab-content animated fadeIn">
			        	<div id="hotnews-add-table">
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td"><span>Modify HotNews</span></div>
								<div class="hotnews-add-td"></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td"><span>ID</span></div>
								<div class="hotnews-add-td">${item.id}</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Title</div>
								<div class="hotnews-add-td"><input type="text" id="title_enu" name="title_enu" value="${item.title}"/></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Subtitle</div>
								<div class="hotnews-add-td"><input type="text" id="subtitle_enu" name="subtitle_enu" value="${item.subtitle}"/></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Description</div>
								<div class="hotnews-add-td"><textarea id="description_enu" name="description_enu"/>${item.description}</textarea></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Author</div>
								<div class="hotnews-add-td"><input type="text" id="author_enu" name="author_enu" value="${item.author}"/></div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">LinkA</div>
								<div class="hotnews-add-td"><input type="text" id="link_1_enu" name="link_1_enu" value="${item.linkA}"/>&nbsp;
									<c:if test="${item.linkA != ''}">
										<a href="${item.linkA}" target="_blank">Preview</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">LinkB</div>
								<div class="hotnews-add-td"><input type="text" id="link_2_enu" name="link_2_enu" value="${item.linkB}"/>&nbsp;
									<c:if test="${item.linkB != ''}">
										<a href="${item.linkB}" target="_blank">Preview</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">LinkC</div>
								<div class="hotnews-add-td"><input type="text" id="link_3_enu" name="link_3_enu" value="${item.linkC}"/>&nbsp;
									<c:if test="${item.linkC != ''}">
										<a href="${item.linkC}" target="_blank">Preview</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">ImageA</div>
								<div class="hotnews-add-td"><input type="file" id="image_1_enu" name="image_1_enu" /><br />
									<c:if test="${item.imageApath != ''}">
										<img src="<%=contextName%>${item.imageApath}" height="200px"/>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">ImageB</div>
								<div class="hotnews-add-td"><input type="file" id="image_2_enu" name="image_2_enu" /><br />
									<c:if test="${item.imageBpath != ''}">
										<img src="<%=contextName%>${item.imageBpath}" height="200px"/>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">ImageC</div>
								<div class="hotnews-add-td"><input type="file" id="image_3_enu" name="image_3_enu" /><br />
									<c:if test="${item.imageCpath != ''}">
										<img src="<%=contextName%>${item.imageCpath}" height="200px"/>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Breadcrumb</div>
								<div class="hotnews-add-td">
									<select id="breadcrumb_1" name="breadcrumb_1_enu">
										<c:forEach items="${level_one}" var="bread">
											<c:if test="${bread.breadcrumb_lang_id == 2}">
												<option value="${bread.breadcrumb_id}" <c:if test="${bread.breadcrumb_id == item.breadcrumbA}">selected</c:if>>${bread.breadcrumb_name}</option>
											</c:if>
										</c:forEach>
									</select>&nbsp;>&nbsp;
									<select id="breadcrumb_2" name="breadcrumb_2_enu">
										<c:forEach items="${level_two}" var="bread">
											<c:if test="${bread.breadcrumb_lang_id == 2}">
												<option value="${bread.breadcrumb_id}" <c:if test="${bread.breadcrumb_id == item.breadcrumbB}">selected</c:if>>${bread.breadcrumb_name}</option>
											</c:if>
										</c:forEach>
									</select>&nbsp;>&nbsp;
									<select id="breadcrumb_3" name="breadcrumb_3_enu">
										<c:forEach items="${level_three}" var="bread">
											<c:if test="${bread.breadcrumb_lang_id == 2}">
												<option value="${bread.breadcrumb_id}" <c:if test="${bread.breadcrumb_id == item.breadcrumbC}">selected</c:if>>${bread.breadcrumb_name}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">FileA</div>
								<div class="hotnews-add-td"><input type="file" id="file_1_enu" name="file_1_enu" />&nbsp;
									<c:if test="${item.fileApath != ''}">
										<a href="${item.fileApath}" target="_blank">Download</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">FileB</div>
								<div class="hotnews-add-td"><input type="file" id="file_2_enu" name="file_2_enu" />&nbsp;
									<c:if test="${item.fileBpath != ''}">
										<a href="${item.fileBpath}" target="_blank">Download</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">FileC</div>
								<div class="hotnews-add-td"><input type="file" id="file_3_enu" name="file_3_enu" />&nbsp;
									<c:if test="${item.fileCpath != ''}">
										<a href="${item.fileCpath}" target="_blank">Download</a>
									</c:if>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Create Date</div>
								<div class="hotnews-add-td">${item.createDate}</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Page View</div>
								<div class="hotnews-add-td">${item.pageviews}</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Top</div>
								<div class="hotnews-add-td">
									<select id="top_enu" name="top_enu">
										<option value="0" <c:if test="${item.top == 0}">selected</c:if>>No</option>
										<option value="1" <c:if test="${item.top == 1}">selected</c:if>>Yes</option>
									</select>
								</div>
							</div>
							<div class="hotnews-add-tr">
								<div class="hotnews-add-td">Enabled</div>
								<div class="hotnews-add-td">
									<select id="enabled_enu" name="enabled_enu">
										<option value="0" <c:if test="${item.enabled == 0}">selected</c:if>>No</option>
										<option value="1" <c:if test="${item.enabled == 1}">selected</c:if>>Yes</option>
									</select>
								</div>
							</div>
						</div>
						<section>
							<div id="container_buttons">
								<p>
									<a class="function_btn" href="#" onclick="submit();return false;">Submit</a>
								</p>
							</div>
						</section>
			        </div>
				</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</ul>
</div>
</form>
<jsp:include page="/backend/footer/footer.jsp"></jsp:include>
</body>
</html>