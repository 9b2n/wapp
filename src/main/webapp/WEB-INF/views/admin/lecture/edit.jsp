<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Wapp Team B Admin</title>
    <!-- core:css -->
    <link rel="stylesheet" href="../../../assets/vendors/core/core.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- end plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../../assets/fonts/feather-font/css/iconfont.css">
    <link rel="stylesheet" href="../../../assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../../assets/css/demo_1/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../../assets/images/favicon.png" />
</head>
<body class="sidebar-dark">
<div class="main-wrapper">

    <!-- partial:../../partials/_sidebar.html -->
    <jsp:include page="/WEB-INF/views/partials/admin_sidebar.jsp"/>
    <!-- partial -->

    <div class="page-wrapper">

        <!-- partial:../../partials/_navbar.html -->
        <jsp:include page="/WEB-INF/views/partials/admin_navbar.jsp"/>
        <!-- partial -->

        <div class="page-content">

            <nav class="page-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                </ol>
            </nav>

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title">Lecture</h6>
                            <c:set var="lecture" value="${lecture}"/>
                            <form action="/admin/editLecture?lecNo=${lecture.lecNo}" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputText1">CATEGORY</label>
                                    <input type="text" oninput="btn_status()" class="form-control" id="exampleInputText1" placeholder="Lecture Category" name="lecCategory" value="${lecture.lecCategory}" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputText2">NAME</label>
                                    <input type="text" oninput="btn_status()" class="form-control" id="exampleInputText2" placeholder="Lecture Name" name="lecName" value="${lecture.lecName}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputNumber1">PRICE</label>
                                    <input type="number" oninput="btn_status()" class="form-control" id="exampleInputNumber1" placeholder="Price" name="lecPrice" value="${lecture.lecPrice}">
                                </div>

                                <div class="form-group">
                                    <label>File upload</label>
                                    <input type="file" oninput="btn_status()" name="lecImage" id="exampleImage1" class="file-upload-default" onchange="fileTypeCheck(this)" accept="image/*">
                                    <div class="input-group col-xs-12" accept="image/*">
                                        <c:set var="lecimg" value="${lecture.lecImg.replaceAll('/files/lectureImage/','')}"/>
                                        <input type="text" class="form-control file-upload-info" disabled="" placeholder="Upload Image"  value="${lecimg}">
                                        <span class="input-group-append">
												<button class="file-upload-browse btn btn-primary" type="button">Upload</button>
											</span>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit" disabled="disabled" id="sub_btn">수정</button>
                                <button class="btn btn-primary" type="button" onclick="location.href='/admin/lecture/data-table'">취소</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- partial:../../partials/_footer.html -->
        <jsp:include page="/WEB-INF/views/partials/admin_footer.jsp"/>
        <!-- partial -->

    </div>
</div>

<script>

    function btn_status() {
        if (document.getElementById("exampleInputText1").value !== '' &&
            document.getElementById("exampleInputText2").value !== '' &&
            document.getElementById("exampleInputNumber1").value !== '') {
            document.getElementById("sub_btn").disabled = false;
        } else {
            document.getElementById("sub_btn").disabled = true;
        }
    }

    function fileTypeCheck(obj) {

        pathpoint = obj.value.lastIndexOf('.');
        filepoint = obj.value.substring(pathpoint + 1, obj.length);
        filetype = filepoint.toLowerCase();

        if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg' || filetype == 'bmp') {
            return true;
        } else {
            alert('옳지 않은 파일형식입니다.');
            parentObj = obj.parentNode
            node = parentObj.replaceChild(obj.cloneNode(true), obj);
            return false;
        }
    }

</script>
<!-- core:js -->
<script src="../../../assets/vendors/core/core.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->
<!-- end plugin js for this page -->
<!-- inject:js -->
<script src="../../../assets/vendors/feather-icons/feather.min.js"></script>
<script src="../../../assets/js/template.js"></script>
<!-- endinject -->
<!-- custom js for this page -->
<script src="../../../assets/js/file-upload.js"></script>
<!-- end custom js for this page -->
</body>
</html>