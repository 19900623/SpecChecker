
rem ����淶��鹤��ר�ýű�������ɾ����

pushd ..

echo ���ڻ�ȡ����ERP����......
"%VS140COMNTOOLS%\..\IDE\tf.exe" get *.* /recursive /noprompt

popd

rem echo ȥBinֻ������
attrib "../00 ��Ŀ¼/bin/*.*" -r /S


set msbuildexe=C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe

echo COPYƽ̨���򼯡���
robocopy "../99 packages/����ƽ̨" "../00 ��Ŀ¼/bin" *.dll *.pdb /e /nfl /ndl /np
robocopy "../99 packages/��ģƽ̨" "../00 ��Ŀ¼/bin" *.dll *.pdb /e /nfl /ndl /np

echo COPY����ϵͳ����
rem attrib "../99 packages/����ϵͳ/*.*" -r /S
rem attrib "../99 packages/��Ʒ�ӿ�/�����ӿ�/*.*" -r /S
robocopy "../99 packages/����ϵͳ" "../00 ��Ŀ¼/bin" *.dll *.pdb /e /nfl /ndl /np
robocopy "../99 packages/��Ʒ�ӿ�/�����ӿ�" "../00 ��Ŀ¼/bin" *.dll *.pdb /e /nfl /ndl /np
robocopy "../99 packages/Quartz.2.3.1/lib/net40-client" "../00 ��Ŀ¼/bin" Quartz.dll /e /nfl /ndl /np


echo ����������Ŀ�⡭��
"%msbuildexe%"  "../01 ��Ŀ��/��Ŀ��.sln" /t:Rebuild /p:Configuration="Debug" /consoleloggerparameters:ErrorsOnly /nologo /m

echo ������Ŀ��ӿ��ļ� ...
rem del "..\99 packages\��Ʒ�ӿ�\�����ӿ�\Mysoft.PubPlatform.ProjectOverview.*.*" /q
rem robocopy "../00 ��Ŀ¼/bin" "../99 packages/��Ʒ�ӿ�/�����ӿ�" Mysoft.PubPlatform.ProjectOverview.PublicServices.dll Mysoft.PubPlatform.ProjectOverview.Model.dll /e /nfl /ndl /np

echo ��������������ϵͳ����
"%msbuildexe%"  "../04 ������ϵͳ/������ϵͳ.sln" /t:Rebuild /p:Configuration="Debug" /consoleloggerparameters:ErrorsOnly /nologo /m
rem echo ���������ݽӿ��ļ� ...
rem del "..\99 packages\��Ʒ�ӿ�\�����ݽӿ�\*.*" /q
rem robocopy "../00 ��Ŀ¼/bin" "../99 packages/��Ʒ�ӿ�/�����ݽӿ�" Mysoft.Mdm.*.Interfaces.dll Mysoft.Mdm.*.Model.dll /e /nfl /ndl /np

echo ����������¥ϵͳ����
"%msbuildexe%"  "../02 ��¥ϵͳ/��¥ϵͳ.sln" /t:Rebuild /p:Configuration="Debug" /consoleloggerparameters:ErrorsOnly /nologo /m
rem echo ������¥�ӿ��ļ� ...
rem del "..\99 packages\��Ʒ�ӿ�\��¥�ӿ�\*.*" /q
rem robocopy "../00 ��Ŀ¼/bin" "../99 packages/��Ʒ�ӿ�/��¥�ӿ�" Mysoft.Slxt.*.interfaces.dll Mysoft.Slxt.*.Model.dll /e /nfl /ndl /np

echo �������ɳɱ�ϵͳ����
"%msbuildexe%"  "../03 �ɱ�ϵͳ/�ɱ�ϵͳ.sln" /t:Rebuild /p:Configuration="Debug" /consoleloggerparameters:ErrorsOnly /nologo /m
rem echo �����ɱ��ӿ��ļ� ...
rem del "..\99 packages\��Ʒ�ӿ�\�ɱ��ӿ�\*.*" /q
rem robocopy "../00 ��Ŀ¼/bin" "../99 packages/��Ʒ�ӿ�/�ɱ��ӿ�" Mysoft.Cbxt.*.interfaces.dll Mysoft.Cbxt.*.Model.dll /e /nfl /ndl /np
