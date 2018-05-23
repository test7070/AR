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
        q_tables = 's';
		var q_name = "adpro2";
        var q_readonly = ['txtNoa'];
        var q_readonlys = [];
        var bbmNum = [];
        var bbsNum = [['txtTwd', 10, 3, 1], ['txtUsd', 10, 3, 1]];
        var bbmMask = [];
        var bbsMask = [];
        q_sqlCount = 6;
		brwCount = 6;
		brwList = [];
		brwNowPage = 0;
		brwKey = 'Noa';
		brwCount2= 6;
		aPop = new Array( );
        $(document).ready(function () {
            bbmKey = ['noa'];
            bbsKey = ['noa', 'mon'];
			brwCount2 = 20;
			q_brwCount();
			q_gt(q_name, q_content, q_sqlCount, 1);
        });
        //////////////////   end Ready
        function main() {
            if (dataErr){
				dataErr = false;
				return;
            }
            mainForm(1); 
        }  
		
        function mainPost() { 
            q_getFormat();
			bbmMask = [['txtMon', r_picm]];
			q_mask(bbmMask);
            //bbmNum = [['txtPrice', 10, q_getPara('vcc.pricePrecision'), 1]];
            q_cmbParse("cmbPstyle", ('').concat(new Array('', '300系冷軋', '300系熱軋')));
            q_cmbParse("cmbProductno", ('').concat(new Array('', '鋼種附價', '表面附價','寬度附價','厚度附價')));
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
				case q_name:
					if (q_cur == 4)
						q_Seek_gtPost();
					break;
			}
        }

		function _btnSeek() {
			if (q_cur > 0 && q_cur < 4)
				return;
			q_box('adpro2_s.aspx', q_name + '_s', "500px", "400px", q_getMsg("popSeek"));
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

        function combPay_chg(){
        }

        function bbsAssign() {  
        	for(var j = 0; j < q_bbsCount; j++) {
	           if (!$('#btnMinus_' + j).hasClass('isAssign')) {
               }
            }
            _bbsAssign();
        }

        function btnIns() {
				_btnIns();
				$('#txtNoa').val('AUTO');
				//$('#txtDatea').val(q_date());
				$('#txtMon').focus();
		}
        function btnModi() {
            if (emp($('#txtNoa').val()))
				return;
            _btnModi();
        }
        function btnPrint() {
			//q_box("z_cud_ar.aspx?" + r_userno + ";" + r_name + ";" + q_time + ";date=" + $('#txtDatea').val() + ";" + r_accy, 'z_cud_ar', "95%", "95%", q_getMsg('popPrint'));
        }

        function wrServer(key_value) {
            var i;
            $('#txt' + bbmKey[0].substr( 0,1).toUpperCase() + bbmKey[0].substr(1)).val(key_value);
            _btnOk(key_value, bbmKey[0], bbsKey[1], '', 2);
        }

        function bbsSave(as) {
            /*if (!as['mechno'] ) {  
				as[bbsKey[1]] = '';   
				return;
            }*/
            q_nowf();
            return true;
        }
        ///////////////////////////////////////////////////  以下提供事件程式，有需要時修改
		function refresh(recno) {
				_refresh(recno);
		}
		function q_popPost(s1) {
		
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
            .dbbs {
				width: 150px;
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
				width: 1300px;
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
        .tbbs{
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
        <div class="dview" id="dview" style="float: left; width:32%;">
			<table class="tview" id="tview">
				<tr>
					<td align="center" style="width:20px; color:black;"><a id='vewChk'> </a></td>
					<td align="center" style="width:100px; color:black;"><a id='vewMon'> </a></td>
					<td align="center" style="width:150px; color:black;"><a id='vewNoa'> </a></td>
					<td align="center" style="width:150px; color:black;"><a id='vewPstyle'> </a></td>
					<td align="center" style="width:150px; color:black;"><a>項目</a></td>
				</tr>
				<tr>
					<td ><input id="chkBrow.*" type="checkbox" style=" "/></td>
					<td id='mon' style="text-align: center;">~mon</td>
					<td id='noa' style="text-align: center;">~noa</td>
					<td id='pstyle' style="text-align: left;">~pstyle</td>
					<td id='product' style="text-align: left;">~product</td>
				</tr>
			</table>
		</div>

		<div class='dbbm'>
			<table class="tbbm"  id="tbbm">
				<tr style="height:1px;">
					<td> </td><td> </td><td> </td><td class="tdZ"> </td>
				</tr>
				<tr>
					<td><span> </span><a id='lblNoa' class="lbl"> </a></td>
					<td><input id="txtNoa"  type="text" class="txt c1" /></td>
				</tr>
				<tr>
					<td><span> </span><a id='lblMon' class="lbl"> </a></td>
					<td><input id="txtMon"  type="text" class="txt c1" /></td>
				</tr>
				<tr>
					<!---<td><span> </span><a id='lblPstyle' class="lbl btn"> </a></td>--->
                    <td><span> </span><a class="lbl">系列</a></td>
                    <td><select id='cmbPstyle' class="txt c1" > </select></td>
				</tr>
				<tr>
					<td><span> </span><a class="lbl">附價類別</a></td>
					<td><select id='cmbProductno' class="txt c1" > </select></td>
				</tr>
                <tr>
                    <td><span> </span><a id="lblMemo" class="lbl"> </a></td>
					<td><input id="txtMemo" type="text" class="txt c3" /></td>
                </tr>
			</table>
		</div>

        <div class="dbbs">
            <table id="tbbs" class='tbbs'  border="1"  cellpadding='2' cellspacing='1'  >
                <tr style="color:White; background:#003366;">
		    	    <td align="center" ><input class="btn" id="btnPlus" type="button" value="+" style="font-weight: bold;" /></td>
			        <td align="center" ><a>項目</a></td>
                    <td align="center" style ="width:30px;"><a>台幣(TWD/MT)</a></td>
                    <td align="center" style ="width:30px;"><a>美金(TWD/MT)</a></td>
                </tr>
                <tr style='background:#cad3ff;'>
	    	    	<td align="center"><input class="btn" id="btnMinus.*" type="button" value="-" style=" font-weight: bold;" /></td>
                    <td><input class="txt c1" id="txtItme" type="text"/></td>
                    <td><input class="txt num" id="txtTwd.*" type="text"/></td>
                    <td><input class="txt num" id="txtUsd.*" type="text"/></td>
    	    	</tr>
            </table>
        </div>

        </div>
        <input id="q_sys" type="hidden" />
</body>
</html>