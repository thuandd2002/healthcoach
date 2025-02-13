// JavaScript Document
function check_all(obj) {
    var ch = $("." + $(obj).attr('data-check'));
    if ($(obj).is(':checked')) {
        ch.attr('checked', true);
    } else {
        ch.attr('checked', false);
    }
}
;
function check_null() {
    var ok = true;
    $('.spanalert').remove();
    $('.notNull').each(function () {
        if ($(this).val() == '') {
            $('<br><span class="spanalert">' + $(this).attr('data-alert') + '</span>').insertAfter($(this));
            ok = false;
        }
    });
    return ok;
}
$(function () {
    if ($('#autourl').is(':checked')) {
        $('#url').attr('disabled', true);
    } else {
        $('#url').attr('disabled', false);
    }
    // change auto url
    $('#autourl').change(function () {
        if ($(this).is(':checked')) {
            $('#url').attr('disabled', true);
        } else {
            $('#url').attr('disabled', false);
        }
    });
});


$(function () {
    $('#choose_datatype input').change(function () {
        action_select_type($(this).val());
        var mes = '<select name="parentid" style="WIDTH: 300px" ><option value="0">Đang tải...</option></select>';
        $("#cls_category").html(mes);
        $("#cls_category").load('index4.php?page=action_ajax&code=loadcommbo&data_type=' + $(this).val() + '&lang=' + lang, function (response, status, xhr) {
            if (status == "error") {
                var msg = "Sorry but there was an error: ";
                alert(msg + xhr.status + " " + xhr.statusText);
            }
        });
    });

});



//show message
function show_mes($msg) {
    $.blockUI({
        message: $msg,
        fadeIn: 700,
        fadeOut: 700,
        timeout: 2000,
        showOverlay: false,
        centerY: false,
        css: {
            width: '350px',
            top: '60px',
            left: '',
            right: '10px',
            border: 'none',
            padding: '5px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: .6,
            color: '#fff'
        }
    });
}


function selectFileWithCKFinder(elementId) {
    CKFinder.popup({
        chooseFiles: true,
        width: 1100,
        height: 800,
        onInit: function (finder) {
            finder.on('files:choose', function (evt) {
                var file = evt.data.files.first();
                var output = document.getElementById(elementId);
                output.value = file.getUrl();
                $("#" + elementId + "-thumb").html('<img src="' + file.getUrl() + '" class="img-polaroid marginright5" align="left" width="160">');
            });
            finder.on('file:choose:resizedImage', function (evt) {
                var output = document.getElementById(elementId);
                output.value = evt.data.resizedUrl;
            });
        }
    });
}

$().ready(function () {
    $('.filefinder-button').click(function () {
        var data_input = $(this).attr("data-input");
        selectFileWithCKFinder(data_input);
    });
    
    
    $('#browserimage').click(function () {
        selectFileWithCKFinder("imageurl");
    });
    
    $('#browserimageadv').click(function () {
        selectFileWithCKFinder("imageurladv");
    });
    
    $('#browserfile').click(function () {
        selectFileWithCKFinder("fileurl");
    });
    
    
    

    var xxx = 1;
    $("#multi_browser_image").click(function () {
        CKFinder.popup({
            chooseFiles: true,
            selectMultiple: true,
            width: 800,
            height: 600,
            onInit: function (finder) {
                finder.on('files:choose', function (evt) {
                    /*var file = evt.data.files.first();*/
                    evt.data.files.each(function (item) {
                        xxx++;

                        $('<div class="collection_cell"><div class="image"><a href="' + item.getUrl() + '" class="highslide" onclick="return hs.expand(this)"><img src="' + item.getUrl() + '" width="200" /></a></div> <input name="image_name[]" type="text" class="txtname name_image" placeholder="Tiêu đề..."><textarea name="image_desc[]" class="txtname" style="height:60px;resize:none; " placeholder="Mô tả..."></textarea><div style="padding-left:10px;"><span class="labelorder" >Thứ tự</span><input name="image_thu_tu[]" type="text" class="txtorder image_thu_tu" placeholder="Thứ tự..."><a class="btn btn-mini" style="margin-top:2px; margin-left:10px;" onclick="delete_multi_image($(this)); return false"><i class="icon-trash"></i>&nbsp;Xóa</a><div style="c"></div></div><input type="hidden" name="image_path[]" value="' + item.getUrl() + '" class="collection_image" /></div>').appendTo('#show_collection_cell');

                    });
                });
            }
        });

    });
    
    

});



function showItemElfinderMulti(id, xxx) {

        CKFinder.popup({
            chooseFiles: true,
            selectMultiple: true,
            width: 800,
            height: 600,
            onInit: function (finder) {
                finder.on('files:choose', function (evt) {
                    /*var file = evt.data.files.first();*/
                    evt.data.files.each(function (item) {
                        xxx++;

                        $('<div class="collection_cell"><div class="image"><a href="' + item.getUrl() + '" class="highslide" onclick="return hs.expand(this)"><img src="' + item.getUrl() + '" width="200" /></a></div> <input name="image_name[]" type="text" class="txtname name_image" placeholder="Tiêu đề..."><textarea name="image_desc[]" class="txtname" style="height:60px;resize:none; " placeholder="Mô tả..."></textarea><div style="padding-left:10px;"><span class="labelorder" >Thứ tự</span><input name="image_thu_tu[]" type="text" class="txtorder image_thu_tu" placeholder="Thứ tự..."><a class="btn btn-mini" style="margin-top:2px; margin-left:10px;" onclick="delete_multi_image($(this)); return false"><i class="icon-trash"></i>&nbsp;Xóa</a><div style="c"></div></div><input type="hidden" name="image_path[]" value="' + item.getUrl() + '" class="collection_image" /></div>').appendTo('#show_collection_cell');

                    });
                });
            }
        });
		

}

function delete_multi_image(obj) {
    if (confirm("Bạn muốn xóa ảnh này?")) {
        obj.parent().parent().remove();
    } else {
        return false;
    }
}


function removeFile(obj) {
    obj.parent().remove();
}


function dropdownList(obj) {
    $(obj).click(function () {
        $('ul', this).slideToggle();
    });
}