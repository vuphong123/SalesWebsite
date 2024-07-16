<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div class="wrapper">
    <jsp:include page="layout/_sidebar.jsp"/>
    <div class="main">
        <jsp:include page="layout/_navbar_admin.jsp"/>
        <div class="pt-3">
            <jsp:include page="${viewName}.jsp"/>
        </div>
        <div class="footer">
            <jsp:include page="layout/_footer.jsp"/>
        </div>
    </div>
    <%--    <div class="main container mt-3">--%>

    <%--    </div>--%>
</div>
</body>
</html>
