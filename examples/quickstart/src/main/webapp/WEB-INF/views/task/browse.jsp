<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>任务管理</title>
    <link href="${ctx}/quickstart/static/styles/editor.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/quickstart/static/js/bootstrap-wysiwyg.js" type="text/javascript"></script>
    <script src="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.js"></script>
    <script src="https://mindmup.s3.amazonaws.com/lib/jquery.hotkeys.js"></script>
    <link href="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
</head>

<body>
		<input type="hidden" name="id" value="${task.id}"/>
		<fieldset>
			<legend><small>管理任务</small><a href="/quickstart/task/update/${task.id}"><small>修改页面</small></a></legend>
			<div class="control-group">
				<label for="task_title" class="control-label">任务名称:</label>
				<div class="controls">
					<input readonly="readonly" type="text" id="task_title" name="title"  value="${task.title}" class="input-large required" minlength="3"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">任务描述:</label>
				<div class="controls">
					<textarea readonly="readonly" id="description" name="description" class="input-large">${task.description}</textarea>
				</div>
			</div>
            <div id="content">
                ${content.content}
            </div>
		</fieldset>
        <script>
            $(function () {
                $('#editor').wysiwyg();
                $('#btnSave').bind('click', function () {
                    $("#editorContent").val($("#editor").html());
                    $.post("/quickstart/editor/save",{
                        content:$("#editorContent").val()
                    },function(data,status){
                        alert(status);
                    });
                });
            });
            $(function(){
                $('#btnRestore').bind('click',function(){
//            $('#editor').wysiwyg();
                    $('#editor').html($("#editor").html());
                });
            });
            $(function(){
                function initToolbarBootstrapBindings() {
                    var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                                'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                                'Times New Roman', 'Verdana'],
                            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
                    $.each(fonts, function (idx, fontName) {
                        fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
                    });
                    $('a[title]').tooltip({container:'body'});
                    $('.dropdown-menu input').click(function() {return false;})
                            .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
                            .keydown('esc', function () {this.value='';$(this).change();});

                    $('[data-role=magic-overlay]').each(function () {
                        var overlay = $(this), target = $(overlay.data('target'));
                        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
                    });
                    if ("onwebkitspeechchange"  in document.createElement("input")) {
                        var editorOffset = $('#editor').offset();
                        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
                    } else {
                        $('#voiceBtn').hide();
                    }
                };
                function showErrorAlert (reason, detail) {
                    var msg='';
                    if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
                    else {
                        console.log("error uploading file", reason, detail);
                    }
                    $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+
                            '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
                };
                initToolbarBootstrapBindings();
                $('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
                window.prettyPrint && prettyPrint();
            });
        </script>
</body>
</html>
