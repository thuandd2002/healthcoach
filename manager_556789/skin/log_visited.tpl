
<div class="c5"></div>
<div class="breadLine">
    <ul class="breadcrumb">
        <li><a href="?"><i class="icon-home"></i></a></li>
                {pathpage}
    </ul>
</div>
<div class="c20"></div>
<!-- START BLOCK : msg -->
    <div>{msg}</div>
    <!-- END BLOCK : msg --> 
<div class="wraper-content">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered table-striped table-hover">

            <tr>
                <th colspan="5">
                    <div style="float:left"><i class="icon-list-alt"></i>&nbsp;Lịch sử truy cập</div>
                    
                </th>
            </tr>
            <tr class="search_box nonehover">
                <td colspan="5">
                	<form action="?page=log_visited" method="post" id="filterform">
                    <div class="form-search" style="margin:0px;">
                        <div class="input-append">
                            <input type="text" autocomplete="off" id="datelog" name="datelog" class="search-query" style="height:20px;" placeholder="Ngày..." value="{datelog}">
                            <button type="submit" class="btn" id="btnSearch">Lọc</button>
                        </div>
                        {parentid}
                    </div>
                    </form>
                        <script type="text/javascript">
							$(function () {
								$('#datelog').datepicker({
									duration: '',
									showTime: false,
									constrainInput: false,
									dateFormat: 'dd/mm/yy',
									changeYear: true,
									changeMonth: true,
									showOtherMonths: true,
									time24h: true,
									currentText: 'Today'
								});
							});
						</script>
                </td>
            </tr>
            <tr class="title">
                
                <td width="130" align="center" class="center">Ngày truy cập</td>
                <td>Url</td>
                <td width="130" style="text-align:center">User</td>
                <td width="130" style="text-align:center">IP</td>
            </tr>
            <!-- START BLOCK : listlog -->
            <tr>

                <td align="center" class="center" valign="middle">{createdate}</td>
                <td>
                    {url}
                    
                </td>
                <td style="text-align:center">
                    <a class="viewuser" data-toggle="modal" href="index4.php?page=userview&id={id_user}" data-target="">{uname} [{username}]</a>

                </td>
                <td style="text-align:center">{ip}</td>
            </tr>
            <!-- END BLOCK : listlog -->

            <tr class="title">
                <td width="16"></td>
                <td colspan="2"></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr class="search_box nonehover">
                <td colspan="5">
                    {pages}
                </td>
            </tr>
        </table>
        <script>
        	$(function(){
				$('.viewuser').click(function(){
					$('.modal-body').load($(this).attr('href'));
					$('#userview').modal('show');
					return false;
				})	
			})
        </script>
        <div id="userview" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">Thông tin user</h3>
          </div>
          <div class="modal-body">
            <p>One fine body…</p>
          </div>
          <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          </div>
  </div>

</div>