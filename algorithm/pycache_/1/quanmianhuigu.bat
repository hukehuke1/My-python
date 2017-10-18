start singlesite-pima.bat http://192.168.19.102/bbs/forum.php/    19.102-C57x86-LANMP-Wdcp
start singlesite-pima.bat http://192.168.29.16/bbs/forum.php/   29.16
start singlesite-jsp.bat http://192.168.119.204:8080/zrlog/  119.204-c65x86-Jboss

::start singlesite-pima.bat http://192.168.19.53/zblog/   19.53
::start singlesite-pima.bat http://192.168.19.115/discuz/forum.php  19.115


::set URL=http://c54x64.dedecms.cn
::set OSlevel=29.38

::echo ¡¾#T26¡¿ÍøÕ¾·À»¤-ÍøÕ¾Â©¶´·À»¤-SQL×¢Èë·À»¤-url·À»¤-postÇëÇó-url±àÂë============[%URL%]============================================================ >> .\%OSlevel%-all.htm
::curl -d "q=%%53%%45%%4c%%45%%43%%54%%20%%46%%49%%45%%4c%%44%%20%%46%%52%%4f%%4d%%20%%54%%41%%42%%4c%%45" %URL%  >> .\%OSlevel%-all.htm