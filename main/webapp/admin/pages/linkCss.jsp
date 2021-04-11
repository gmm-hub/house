
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/morris/morris.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/select2/select2.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/css/style.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/admin/plugins/bootstrap-slider/slider.css">
<script
        src="${pageContext.request.contextPath}/admin/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/raphael/raphael-min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/morris/morris.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/sparkline/jquery.sparkline.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/knob/jquery.knob.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/daterangepicker/moment.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/fastclick/fastclick.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/iCheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/adminLTE/js/app.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/treeTable/jquery.treetable.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/select2/select2.full.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/bootstrap-markdown/js/markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/ckeditor/ckeditor.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/chartjs/Chart.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/flot/jquery.flot.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/flot/jquery.flot.resize.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/flot/jquery.flot.pie.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/flot/jquery.flot.categories.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script
        src="${pageContext.request.contextPath}/admin/plugins/bootstrap-slider/bootstrap-slider.js"></script>
