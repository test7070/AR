<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
	<head>
		<title></title>
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

			var q_name = "addime";
			var q_readonly = ['txtNoa'];
			var bbmNum = [];
			var bbmMask = [];
			q_sqlCount = 6;
			brwCount = 6;
			brwList = [];
			brwNowPage = 0;
			brwKey = 'noa';
			q_xchg = 1;
			brwCount2 = 20;
			aPop = new Array(
			);

			$(document).ready(function() {
				bbmKey = ['noa'];
				brwCount2 = 20
				q_brwCount();
				q_gt(q_name, q_content, q_sqlCount, 1);
            });

            function sum() {
				cmbStyle();
				//cmbKind();
			}
			/*
			function cmbKind() {
                switch ( $('#cmbKind').val() ) {
                    case '冷軋':
                        q_cmbParse("cmbSpec", ('').concat(new Array('','0.3','0.4A','0.4','0.5A','0.5','0.6A','0.6','0.7','0.8','0.9','1.0','1.1','1.2','1.3','1.4','1.5','1.6','1.7','1.8','1.9','2')));
                        break;
                    case '熱軋':
                        q_cmbParse("cmbSpec", ('').concat(new Array('','2.0','2.3','2.5','3.0','4.0','4.5','5.0','6.0','6.3')));
						break;
					case '300系冷軋':
                        q_cmbParse("cmbSpec", ('').concat(new Array('','0')));
						break;
					case '300系熱軋':
                        q_cmbParse("cmbSpec", ('').concat(new Array('','0')));
                        break;
                    default:
                }
            }
			*/

            function cmbStyle() {
                switch ( $('#cmbStyle').val() ) {
                    case '厚度附價':
                        $("#txtProductno").attr('readonly', true);
                        $("#txtWidth1").attr('readonly', true);
                        $("#txtUsetype").attr('readonly', true);
                        $('#txtProductno').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtWidth1').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtUsetype').css('background-color', '#DDDDDD').css('color', 'black');
						document.getElementById("cmbKind").disabled = false;
						document.getElementById("cmbSpec").disabled = false;
                        $("#txtPstyle").attr('readonly', false);
                        $('#txtDime1').attr('readonly', false);
                        $('#txtDime2').attr('readonly', false);
                        $('#txtPstyle').css('background-color', 'white').css('color', 'black');
                        $('#txtDime1').css('background-color', 'white').css('color', 'black');
                        $('#txtDime2').css('background-color', 'white').css('color', 'black');
                        break;
                    case '寬度加價':
                        $("#txtProductno").attr('readonly', true);
                        document.getElementById("cmbKind").disabled = true;
                        document.getElementById("cmbSpec").disabled = true;
                        $("#txtPstyle").attr('readonly', true);
                        $("#txtDime1").attr('readonly', true);
                        $("#txtDime2").attr('readonly', true);
                        $("#txtUsetype").attr('readonly', true);
                        $('#txtProductno').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtPstyle').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtDime1').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtDime2').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#cmbSpec').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtUsetype').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtWidth1').attr('readonly', false);
                        $('#txtWidth1').css('background-color', 'white').css('color', 'black');
                        break;
                    case '料別附價':
                        $("#txtProductno").attr('readonly', true);
                        document.getElementById("cmbKind").disabled=true;
                        document.getElementById("cmbSpec").disabled=true;
                        $("#txtPstyle").attr('readonly', true);
                        $('#txtWidth1').attr('readonly', true);
                        $("#txtDime1").attr('readonly', true);
                        $("#txtDime2").attr('readonly', true);
                        $('#txtProductno').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtPstyle').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtDime1').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtDime2').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#cmbSpec').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtWidth1').css('background-color', '#DDDDDD').css('color', 'black');
                        $("#txtUsetype").attr('readonly', false);
                        $('#txtUsetype').css('background-color', 'white').css('color', 'black');
                        break;
                    case '表面加減價':
                        $("#txtProductno").attr('readonly', true);
                        document.getElementById("cmbKind").disabled=true;
                        document.getElementById("cmbSpec").disabled=true;
                        $("#txtUsetype").attr('readonly', true);
                        $('#txtWidth1').attr('readonly', true);
                        $("#txtDime1").attr('readonly', true);
                        $("#txtDime2").attr('readonly', true);
                        $('#txtProductno').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtUsetype').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtDime1').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtDime2').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#cmbSpec').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtWidth1').css('background-color', '#DDDDDD').css('color', 'black');
                        $("#txtPstyle").attr('readonly', false);
                        $('#txtPstyle').css('background-color', 'white').css('color', 'black');
                        break;
                    case '鋼種加減價':
                        $("#txtPstyle").attr('readonly', true);
                        document.getElementById("cmbKind").disabled=true;
                        document.getElementById("cmbSpec").disabled=true;
                        $("#txtUsetype").attr('readonly', true);
                        $('#txtWidth1').attr('readonly', true);
                        $("#txtDime1").attr('readonly', true);
                        $("#txtDime2").attr('readonly', true);
                        $('#txtPstyle').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtUsetype').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtDime1').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtDime2').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#cmbSpec').css('background-color', '#DDDDDD').css('color', 'black');
                        $('#txtWidth1').css('background-color', '#DDDDDD').css('color', 'black');
                        $("#txtProductno").attr('readonly', false);
                        $('#txtProductno').css('background-color', 'white').css('color', 'black');
                        break;
                    default:
                }
            } 

			function main() {
				if (dataErr) {
					dataErr = false;
					return;
				}
				mainForm(0);
			}

			function mainPost() {
				bbmMask = [['txtMon', r_picm]];
				q_mask(bbmMask);
				bbmNum = [['txtDime1', 10, 2, 1],['txtDime2', 10, 2, 1],['txtWidth1', 10, 2, 1],['txtPrice', 10, q_getPara('vcc.pricePrecision'), 1]];
				q_gt('custtype', '', 0, 0, 0, "custtype");
                q_cmbParse("cmbStyle", ('').concat(new Array('','鋼種加減價','表面加減價','料別附價','寬度加價','厚度附價')));
				q_cmbParse("cmbKind", ('').concat(new Array('', '300系冷軋', '300系熱軋', '冷軋', '熱軋')));
			}

			function q_boxClose(s2) {
				var ret;
				switch (b_pop) {
					case q_name + '_s':
						q_boxClose2(s2);
						break;
				}
			}

			function q_gtPost(t_name) {
				switch (t_name) {
					case 'custtype':
						var as = _q_appendData("custtype", "", true);
						if (as[0] != undefined) {
							var t_item = "@";
							for (i = 0; i < as.length; i++) {
								t_item = t_item + (t_item.length > 0 ? ',' : '') + $.trim(as[i].noa) + '@' + $.trim(as[i].namea);
                            }
						}
						break;
					case q_name:
						if (q_cur == 4)
							q_Seek_gtPost();
						break;
				}
			}

			function _btnSeek() {
				if (q_cur > 0 && q_cur < 4)
					return;
				q_box('addime_s.aspx', q_name + '_s', "500px", "400px", q_getMsg("popSeek"));
			}

			function btnIns() {
				_btnIns();
				$('#txtNoa').val('AUTO');
				$('#txtMon').val(q_date().substring(0,7)).focus();
			}

			function btnModi() {
				if (emp($('#txtNoa').val()))
					return;
				_btnModi();
				$('#txtMon').focus();
			}

			function btnPrint() {

			}

			function q_stPost() {
				if (!(q_cur == 1 || q_cur == 2))
					return false;
				Unlock();
			}

			function btnOk() {
				Lock();
				var t_date = $('#txtMon').val();
				var s1 = $('#txt' + bbmKey[0].substr(0, 1).toUpperCase() + bbmKey[0].substr(1)).val();
				if (s1.length == 0 || s1 == "AUTO")
					q_gtnoa(q_name, replaceAll((t_date.length == 0 ? q_date() : t_date), '/', ''));
				else
					wrServer(s1);
			}

			function wrServer(key_value) {
				var i;
				xmlSql = '';
				if (q_cur == 2)
					xmlSql = q_preXml();
				$('#txt' + bbmKey[0].substr(0, 1).toUpperCase() + bbmKey[0].substr(1)).val(key_value);
				_btnOk(key_value, bbmKey[0], '', '', 2);
			}

			function refresh(recno) {
				_refresh(recno);
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
		</script>
		<style type="text/css">
			#dmain {
				overflow: hidden;
			}
			.dview {
				float: left;
				width: 1000px;
				border-width: 0px;
			}
			.tview {
				border: 5px solid gray;
				font-size: medium;
				background-color: black;
			}
			.tview tr {
				height: 30px;
			}
			.tview td {
				padding: 2px;
				text-align: center;
				border-width: 0px;
				background-color: #FFFF66;
				color: blue;
			}
			.dbbm {
				float: left;
				width: 550px;
				/*margin: -1px;
				 border: 1px black solid;*/
				border-radius: 5px;
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
				width: 10%;
			}
			.tbbm .tdZ {
				width: 1%;
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
			}
			.tbbm tr td .lbl.btn:hover {
				color: #FF8F19;
			}
			.txt.c0 {
				width: 70%;
				float: left;
			}
			.txt.c1 {
				width: 100%;
				float: left;
			}
			.txt.c2 {
				width: 25%;
				float: left;
			}
			.txt.c3 {
				width: 73%;
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
			.tbbs input[type="text"] {
				width: 98%;
			}
			.tbbs a {
				font-size: medium;
			}
			.num {
				text-align: right;
			}
			.bbs {
				float: left;
			}
			input[type="text"], input[type="button"] {
				font-size: medium;
			}
		</style>
	</head>
	<body ondragstart="return false" draggable="false"
	ondragenter="event.dataTransfer.dropEffect='none'; event.stopPropagation(); event.preventDefault();"
	ondragover="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
	ondrop="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
	>
		<!--#include file="../inc/toolbar.inc"-->
		<div id='dmain'>
			<div class="dview" id="dview">
				<table class="tview" id="tview">
					<tr>
						<td align="center" style="width:20px; color:black;"><a id='vewChk'> </a></td>
						<td align="center" style="width:100px; color:black;"><a id='vewMon'> </a></td>
						<td align="center" style="width:150px; color:black;"><a id='vewNoa'> </a></td>
						<td align="center" style="width:150px; color:black;"><a>類別</a></td>
						<td align="center" style="width:150px; color:black;"><a>鋼種</a></td>
						<td align="center" style="width:150px; color:black;"><a>產品名稱</a></td>
						<td align="center" style="width:150px; color:black;"><a>表面</a></td>
						<td align="center" style="width:150px; color:black;"><a>厚度項目</a></td>
						<td align="center" style="width:150px; color:black;"><a>厚度1</a></td>
						<td align="center" style="width:150px; color:black;"><a>厚度2</a></td>
						<td align="center" style="width:150px; color:black;"><a>寬度</a></td>
						<td align="center" style="width:150px; color:black;"><a>價格</a></td>
					</tr>
					<tr>
						<td><input id="chkBrow.*" type="checkbox" style=' '/></td>
						<td id='mon' style="text-align: center;">~mon</td>
						<td id='noa' style="text-align: center;">~noa</td>
						<td id='style' style="text-align: center;">~style</td>
						<td id='productno' style="text-align: center;">~productno</td>
						<td id='kind' style="text-align: center;">~kind</td>
						<td id='pstyle' style="text-align: center;">~pstyle</td>
						<td id='spec' style="text-align: center;">~spec</td>
						<td id='dime1' style="text-align: center;">~dime1</td>
						<td id='dime2' style="text-align: center;">~dime2</td>
						<td id='Width1' style="text-align: center;">~Width1</td>
						<td id='price' style="text-align: center;">~price</td>
					</tr>
				</table>
			</div>
			<div class='dbbm'>
				<table class="tbbm" id="tbbm" border="0">
					<tr style="height:1px;"><td></td><td></td><td></td><td></td><td class="tdZ"></td></tr>
					<tr>
						<td><span> </span><a id='lblNoa' class="lbl"> </a></td>
						<td><input id="txtNoa" type="text" class="txt c1" /></td>
					</tr>
					<tr>
						<td><span> </span><a id='lblMon' class="lbl"> </a></td>
						<td><input id="txtMon" type="text" class="txt c1" /></td>
					</tr>
                    <tr>
						<td><span> </span><a id='' class="lbl">類別</a></td>
						<td><select id='cmbStyle' class="txt c1" onchange="cmbStyle()"> </select></td>
                        <td><span> </span><a id='' class="lbl">鋼種</a></td>
                        <td><input id="txtProductno" type="text" class="txt c1" /> </td>
					</tr>
                    <tr>
						<td><span> </span><a id='' class="lbl">產品名稱</a></td>
						<td><select id="cmbKind" class="txt c1" onchange="cmbKind()"> </select></td>
					</tr>
					<tr>
						<td><span> </span><a id='' class="lbl">表面</a></td>
						<td><input id="txtPstyle" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='' class="lbl">料別</a></td>
                        <td><input id="txtUsetype" type="text" class="txt c0" /> 料</td>
					</tr>
					<tr>
						<td><span> </span><a id='' class="lbl">厚度項目</a></td>
						<td><input id="cmbSpec" type="text" class="txt c0" /></td>
						<!---<td><select id="cmbSpec" class="txt c1""> </select></td>--->
					</tr>
					<tr>
						<td><span> </span><a id='' class="lbl">厚度</a></td>
						<td><input id="txtDime1" type="text" class="txt num c0" />mm</td>
                        <td align="center" style="width:15px">～</td>
                        <td><input id="txtDime2" type="text" class="txt num c0" />mm</td>
					</tr>
					<tr>
						<td><span> </span><a id='' class="lbl">寬度</a></td>
						<td><input id="txtWidth1" type="text" class="txt num c0" />mm</td>
					</tr>
					<tr>
						<td><span> </span><a id='' class="lbl">附價</a></td>
						<td><input id="txtPrice" type="text" class="txt num c1" /></td>
					</tr>
				</table>
			</div>
		</div>
		<input id="q_sys" type="hidden" />
	</body>
</html>