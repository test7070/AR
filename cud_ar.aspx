<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
    <title>排單作業</title>
    <script src="../script/jquery.min.js" type="text/javascript"></script>
    <script src='../script/qj2.js' type="text/javascript"></script>
    <script src='qset.js' type="text/javascript"></script>
    <script src='../script/qj_mess.js' type="text/javascript"></script>
    <script src="../script/qbox.js" type="text/javascript"></script>
    <script src='../script/mask.js' type="text/javascript"></script>
    <link href="../qbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
		this.errorHandler = null;
		function onPageError(error) {
			alert("An error occurred:\r\n" + error.Message);
		}
		q_tables = 's';
		var q_name = "cud";
		var q_readonly = ['txtNoa', 'txtWorker', 'txtWorker2'];
		var q_readonlys = ['txtNoq', 'txtProduct', 'txtMins'];
		var bbmNum = [];
		var bbsNum = [['txtMount6', 10, 2, 1], ['txtWeight6', 10, 2, 1], ['txtMount7', 10, 2, 1], ['txtWeight7', 10, 2, 1], ['txtMount8', 10, 2, 1], ['txtWeight8', 10, 2, 1], ['txtMount9', 10, 2, 1], ['txtWeight9', 10, 2, 1], ['txtMount10', 10, 2, 1], ['txtWeight10', 10, 2, 1]];
		var bbmMask = [];
		var bbsMask = [];
		q_sqlCount = 6;
		brwCount = 6;
		brwList = [];
		brwNowPage = 0;
		brwKey = 'Noa';
		brwCount2 = 6;
		aPop = new Array(
			['txtCustno', 'lblCustno', 'cust', 'noa,comp', 'txtCustno,txtCust', 'cust_b.aspx'],
			['txtProductno_', 'btnProductno_', 'ucc', 'noa,product', 'txtProductno_,txtProduct_', 'ucc_b.aspx']
		);
		$(document).ready(function () {
			bbmKey = ['noa'];
			bbsKey = ['noa', 'noq'];
			q_brwCount();
			q_gt(q_name, q_content, q_sqlCount, 1, 0, '', r_accy);
		});

		//////////////////   end Ready
		function main() {
			if (dataErr) {
				dataErr = false;
				return;
			}
			mainForm(1);
		}

		function mainPost() {
			q_getFormat();
			bbmMask = [['txtDatea', r_picd]];
			q_mask(bbmMask);
		}

		function q_boxClose(s2) { ///   q_boxClose 2/4
			var ret;
			switch (b_pop) {
				case q_name + '_s':
					q_boxClose2(s2); ///   q_boxClose 3/4
					break;
			}   /// end Switch
			b_pop = '';
		}

		function q_gtPost(t_name) {
			switch (t_name) {
				case 'rc2e_import':
					as = _q_appendData(t_name, "", true);
					for (var i = 0; i < as.length; i++) {
						if (q_getPara('sys.steel') == '1') {
							as[i].tablea = 'cuds';
						}
					}
					//alert(q_gridAddRow(bbsHtm, 'tbbs', 'txtWeight7,txtMount8,txtWeight8,txtMount9', as.length, as, 'Weight7,Mount8,Weight8,Mount9', '', ''));
					q_gridAddRow(bbsHtm, 'tbbs', 'txtWeight7,txtMount8,txtWeight8,txtMount9', as.length, as, 'Weight7,Mount8,Weight8,Mount9', '', '');
					break;
			}  /// end switch
		}

		function btnOk() {
			t_err = q_chkEmpField([['txtNoa', q_getMsg('lblNoa')]]);
			if (t_err.length > 0) {
				alert(t_err);
				return;
			}
			sum();
			if (q_cur == 1)
				$('#txtWorker').val(r_name);
			else
				$('#txtWorker2').val(r_name);
			var s1 = $('#txt' + bbmKey[0].substr(0, 1).toUpperCase() + bbmKey[0].substr(1)).val();
			var t_date = trim($('#txtDatea').val());
			if (s1.length == 0 || s1 == "AUTO")
				q_gtnoa(q_name, replaceAll(q_getPara('sys.key_cud') + (t_date.length == 0 ? q_date() : t_date), '/', ''));
			else
				wrServer(s1);
		}

		function _btnSeek() {
			if (q_cur > 0 && q_cur < 4)  // 1-3
				return;
		}
		function btnPricein() { //抓取當月附價
			alert(":");
			for (var j = 0; j < q_bbsCount; j++) {
				var t_noa = $.trim($('#txtNoa').val());
				var t_tggno = $.trim($('#txtTggno').val());
				var t_ordeno = '';
				var t_productno = $.trim($('#txtProductno_' + j).val());
				var t_spec = $.trim($('#txtSpec_' + j).val());
				var t_dime = $.trim($('#txtDime_' + j).val());
				var t_mount6 = $.trim($('#txtMount6_' + j).val());
				var t_width = $.trim($('#txtClass_' + j).val());
				var t_typen = '3';
				q_gt('rc2e_import', "where=^^['" + t_noa + "','" + t_tggno + "','" + t_productno + "','" + t_spec + "','" + t_ordeno + "','" + t_dime + "','" + t_typen + "','" + t_mount6 + "','" + t_width + "')^^", 0, 0, 0, 0, 0, 0, 0, 0, 0, "rc2e_import");
			}
		}
		function bbsAssign() {
			for (var j = 0; j < q_bbsCount; j++) {
				if (!$('#btnMinus_' + j).hasClass('isAssign')) {
				}
			}
			_bbsAssign();
		}
		function btnIns() {
			_btnIns();
			$('#txtNoa').val('AUTO');
			$('#txtDatea').val(q_date()).focus();
			for (var j = 0; j < q_bbsCount; j++) {
				$('#txtNoq_' + j).val(j + 1);
			}
		}
		function btnModi() {
			if (emp($('#txtNoa').val()))
				return;
			_btnModi();
		}
		function btnPrint() {
			q_box("z_cud_ar.aspx?" + r_userno + ";" + r_name + ";" + q_time + ";date=" + $('#txtDatea').val() + ";" + r_accy, 'z_cud_ar', "95%", "95%", q_getMsg('popPrint'));
		}

		function wrServer(key_value) {
			var i;
			$('#txt' + bbmKey[0].substr(0, 1).toUpperCase() + bbmKey[0].substr(1)).val(key_value);
			_btnOk(key_value, bbmKey[0], bbsKey[1], '', 2);
		}

		function bbsSave(as) {
			if (!as['productno'] && !as['product']) {//不存檔條件
				as[bbsKey[1]] = '';
				return;
			}
			q_nowf();
			return true;
		}
		///////////////////////////////////////////////////  以下提供事件程式，有需要時修改
		function refresh(recno) {
			_refresh(recno);
			//q_popPost('txtProductno_');
			$('input[id*="txtProduct_"]').each(function () {
				thisId = $(this).attr('id').split('_')[$(this).attr('id').split('_').length - 1];
				$(this).attr('OldValue', $('#txtProductno_' + thisId).val());
			});
		}
		function q_popPost(s1) {
			switch (s1) {
				case 'txtProductno_':
					$('input[id*="txtProduct_"]').each(function () {
						thisId = $(this).attr('id').split('_')[$(this).attr('id').split('_').length - 1];
						$(this).attr('OldValue', $('#txtProductno_' + thisId).val());
					});
					break;
			}
		}
		function readonly(t_para, empty) {
			_readonly(t_para, empty);
		}

		function btnMinus(id) {
			_btnMinus(id);
		}

		function btnPlus(org_htm, dest_tag, afield) {
			_btnPlus(org_htm, dest_tag, afield);
		}

		function q_appendData(t_Table) {
			return _q_appendData(t_Table);
		}

		function btnSeek() {
			_btnSeek();
		}

		function btnTop() {
			_btnTop();
		}
		function btnPrev() {
			_btnPrev();
		}
		function btnPrevPage() {
			_btnPrevPage();
		}

		function btnNext() {
			_btnNext();
		}
		function btnNextPage() {
			_btnNextPage();
		}

		function btnBott() {
			_btnBott();
		}
		function q_brwAssign(s1) {
			_q_brwAssign(s1);
		}

		function btnDele() {
			_btnDele();
		}

		function btnCancel() {
			_btnCancel();
		}

		function sum() {
			var t_mount6 = 0, t_weight6 = 0, t_mount7 = 0, t_weight7 = 0, t_mount8 = 0, t_weight8 = 0, t_mount9 = 0, t_weight9 = 0, t_mount10 = 0, t_weight10 = 0;
			for (var j = 0; j < q_bbsCount; j++) {
				t_mount6 = dec($('#txtMount6_' + j).val());
				t_weight6 = dec($('#txtWeight6_' + j).val());
				t_mount7 = dec($('#txtMount7_' + j).val());
				t_weight7 = dec($('#txtWeight7_' + j).val());
				t_mount8 = dec($('#txtMount8_' + j).val());
				t_weight8 = dec($('#txtWeight8_' + j).val());
				t_mount9 = dec($('#txtMount9_' + j).val());
				t_weight9 = dec($('#txtWeight9_' + j).val());
				t_mount10 = dec($('#txtMount10_' + j).val());
				t_weight10 = dec($('#txtWeight10_' + j).val());
				t_Mins = (t_mount6 - t_weight6 - t_mount7) + t_weight7 + t_mount8 + t_weight8 + t_mount9 + t_weight9 + t_mount10 + t_weight10;
				$('#txtMins_' + j).val(t_Mins);
			}
		}
    </script>
    <style type="text/css">
				#dmain {
				/*overflow: hidden;*/
            }
            .dview {
				float: left;
				width: 28%;
            }
            .tview {
				margin: 0;
				padding: 2px;
				border: 1px black double;
				border-spacing: 0;
				font-size: medium;
				background-color: #FFFF66;
				color: blue;
				width: 100%;
            }
            .tview td {
				padding: 2px;
				text-align: center;
				border: 1px black solid;
            }
            .dbbm {
                float: left;
                width: 800px;
                border-radius: 5px;
                /*margin: -1px;
                 border: 1px black solid;
				
				float: left;
				width: 70%;
				margin: -1px;
				border: 1px black solid;
				border-radius: 5px;*/
            }
            .tbbm {
				padding: 0px;
				border: 1px white double;
				border-spacing: 0;
				border-collapse: collapse;
				font-size: medium;
				color: blue;
				background: #cad3ff;
				width: 100%;
            }
            .tbbm tr {
				height: 35px;
            }
            .tbbm tr td {
				width: 9%;
            }
            .tbbm .tdZ {
				width: 2%;
            }
            .tbbm tr td span {
				float: right;
				display: block;
				width: 5px;
				height: 10px;
            }
            .tbbm tr td .lbl {
				float: right;
				color: blue;
				font-size: medium;
            }
            .tbbm tr td .lbl.btn {
				color: #4297D7;
				font-weight: bolder;
				font-size: medium;
            }
            .tbbm tr td .lbl.btn:hover {
				color: #FF8F19;
            }
            .txt.c1 {
				width: 98%;
				float: left;
            }
            .txt.c2 {
				width: 75%;
				float: left;
            }
            .txt.c3 {
				width: 47%;
				float: left;
            }
            .txt.c4 {
				width: 18%;
				float: left;
            }
            .txt.c5 {
				width: 80%;
				float: left;
            }
            .txt.c6 {
				width: 25%;
				
            }
            .txt.c7 {
				width: 95%;
				float: left;
            }
            .txt.num {
				text-align: right;
            }
            .tbbm td {
				margin: 0 -1px;
				padding: 0;
            }
            .tbbm td input[type="text"] {
				border-width: 1px;
				padding: 0px;
				margin: -1px;
				float: left;
            }
            .tbbm td input[type="button"] {
				float: left;
				width: auto;
            }
            .tbbm select {
				border-width: 1px;
				padding: 0px;
				margin: -1px;
            }
            .dbbs {
				width: 1890px;
            }
            .tbbs a {
				font-size: medium;
            }

            .num {
				text-align: right;
            }
            .tbbs tr.error input[type="text"] {
				color: red;
            }
            input[type="text"], input[type="button"] {
				font-size: medium;
            }
        .tbbs
        {
            FONT-SIZE: medium;
            COLOR: blue ;
            TEXT-ALIGN: left;
             BORDER:1PX LIGHTGREY SOLID;
             width:100% ; height:98% ;  
        }  
      
       .tbbs .td1{
            width: 8%;
        }
      
    </style>
</head>
<body>
<!--#include file="../inc/toolbar.inc"-->
    <div id='dmain' >
        <div class="dview" id="dview" style="float: left; width:32%;" >
			<table class="tview" id="tview"   border="1" cellpadding='2'  cellspacing='0' style="background-color: #FFFF66;">
				<tr>
					<td align="center" style="width:5%"><a id='vewChk'></a></td>
					<td align="center" style="width:20%"><a id='vewNoa'></a></td>
					<td align="center" style="width:25%"><a id='vewCust'></a></td>
				</tr>
				<tr>
				   <td><input id="chkBrow.*" type="checkbox" style="" /></td>
				   <td align="center" id='noa'>~noa</td>
				   <td align="center" id='cust'>~cust</td>
				</tr>
			</table>
        </div>
        <div class="dbbm"><!--- style="width: 68%;float:left"--->
			<table class="tbbm" id="tbbm" border="0" cellpadding='2' cellspacing='0'>
				<tr>
					<td class='td1'><span> </span><a id="lblNoa" class="lbl"></a></td>
					<td class="td2"><input id="txtNoa" type="text" class="txt c1"/></td>
					<td class='td3'><span> </span><a id="lblDatea" class="lbl"></a></td>
					<td class='td5'><input id="txtDatea"  type="text" class="txt c1"/></td>
					<td class="td6"></td>
					<td class="td7"></td>
				</tr>
				<tr>
					<td class='td1'><span> </span><a id="lblCustno" class="lbl btn"></a></td>
					<td class="td2" colspan="2">
						<input id="txtCustno" type="text" class="txt" style="width:30%;" />
						<input id="txtCust" type="text" class="txt" style="width:65%;" />
					</td>
				</tr>
				<tr>
					<td class='td1'><span> </span><a id="lblWorker" class="lbl"></a></td>
					<td class="td2"><input id="txtWorker"  type="text" class="txt c1"/></td>
					<td class='td3'><span> </span><a id="lblWorker2" class="lbl"></a></td>
					<td class="td4"><input id="txtWorker2"  type="text" class="txt c1"/></td>
					<td class='td5'><input id="btnPricein" type="button" value="匯入附價" onclick="btnPricein()"/></td>
				</tr>
			</table>
        </div>
        <div class="dbbs"> 
        <table id="tbbs" class='tbbs'  border="1"  cellpadding='2' cellspacing='1'  >
            <tr style="color:White; background:#003366;">
				<td align="center" style="width: 30px;"  ><input class="btn" id="btnPlus" type="button" value="+" style="font-weight: bold;" /></td>
				<td align="center" style="width: 40px;"><a>序</a></td>
				<td align="center" style="width: 120px;"><a>鋼種</a></td>
				<td align="center" style="width: 50px;"><a>表面</a></td>
				<td align="center" style="width: 50px;"><a id='lblDime_s'></a></td>
				<td align="center" style="width: 50px;"><a>寬度</a></td>
				<td align="center" style="width: 150px;"><a>代碼<hr> 修編｜用途｜包裝 </a></td>
				<td align="center" style="width: 50px;"><a>母捲數</a></td>
				<td align="center" style="width: 50px;"><a>重量<br/>(MT)</a></td>
				<td align="center" style="width: 50px;"><a>需求<br/>捲數</a></td>
                <td align="center" style="width: 300px;"><a>備註</a></td>
                <td align="center" style="width: 150px;"><a>基價<hr> 基價｜　　｜特殊 </a></td>
                <td align="center" style="width: 50px;"><a>鋼種加價</a></td>
                <td align="center" style="width: 50px;"><a>表面加價</a></td>
                <td align="center" style="width: 50px;"><a>厚度加價</a></td>
                <td align="center" style="width: 50px;"><a>寬度加價</a></td>
                <td align="center" style="width: 150px;"><a>代碼<hr> 修編｜用途｜包裝 </a></td>
				<td align="center" style="width: 50px;"><a>進價</a></td>
				<td align="center" style="width: 100px;"><a>報價單號</a></td>
				<td align="center" style="width: 300px;"><a>繳庫明細</a></td>
            </tr>
            <tr style='background:#cad3ff;'>
				<td align="center"><input class="btn" id="btnMinus.*" type="button" value="-" style=" font-weight: bold;" /></td>
				<td><input class="txt c1" id="txtNoq.*" type="text"/></td>
				<td>
					<input type="text" id="txtProductno.*"  style="width:46%; float:left;"/>
					<input id="txtProduct.*" type="text" style="width:46%;"/>
				</td>
				<td><input class="txt c1" id="txtSpec.*" type="text"/></td>
				<td><input class="txt c1 num" id="txtDime.*" type="text"/></td>
				<td><input class="txt c1 num" id="txtClass.*" type="text"/></td>
				<td>
					<input class="txt c1" id="txtMechno.*" type="text" style="width:30%;"/>
					<input class="txt c1" id="txtMech.*" type="text" style="width:30%;"/>
					<input class="txt c1" id="txtRadius.*" type="text" style="width:30%;"/>
				</td>
				<td><input class="txt c1 num" id="txtMount.*" type="text"/></td>
 				<td><input class="txt c1 num" id="txtWeight.*" type="text"/></td>
 				<td><input class="txt c1 num" id="txtHmount.*" type="text"/></td>
 				<td><input class="txt c1" id="txtMemo.*" type="text"/></td>
				<td>
					<input class="txt c1 num" id="txtMount6.*" type="text" style="width:30%;"/>
					<input class="txt c1 num" id="txtWeight6.*" type="text" style="width:30%;"/>
					<input class="txt c1 num" id="txtMount7.*" type="text" style="width:30%;"/>
				</td>
                <td><input class="txt c1 num" id="txtWeight7.*" type="text"/></td>
                <td><input class="txt c1 num" id="txtMount8.*" type="text"/></td>
                <td><input class="txt c1 num" id="txtWeight8.*" type="text"/></td>
                <td><input class="txt c1 num" id="txtMount9.*" type="text"/></td>
				<td>
					<input class="txt c1 num" id="txtWeight9.*" type="text" style="width:30%;"/>
					<input class="txt c1 num" id="txtMount10.*" type="text" style="width:30%;"/>
					<input class="txt c1 num" id="txtWeight10.*" type="text" style="width:30%;"/>
				</td>
 				<td><input class="txt c1 num" id="txtMins.*" type="text"/></td>
 				<td><input class="txt c1" id="txtOrdeno.*" type="text"/></td>
 				<td><input class="txt c1" id="txtUno.*" type="text"/></td>
			</tr>
        </table>
        </div>
        </div>
        <input id="q_sys" type="hidden" />
</body>
</html>
