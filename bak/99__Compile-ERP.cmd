
rem ����淶��鹤��ר�ýű�������ɾ����

pushd ..

echo ���ڻ�ȡ����ERP����......
"%VS140COMNTOOLS%\..\IDE\tf.exe" get *.* /recursive /noprompt

popd

attrib "../00 ��Ŀ¼/bin/*.*" -r /S


set msbuildexe=C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe

echo COPYƽ̨���򼯡���
robocopy "../99 packages/����ƽ̨" "../00 ��Ŀ¼/bin" *.dll *.pdb /e /nfl /ndl /np
robocopy "../99 packages/��ģƽ̨" "../00 ��Ŀ¼/bin" *.dll *.pdb /e /nfl /ndl /np
robocopy "../99 packages/��Ȩ�ļ�" "../00 ��Ŀ¼/bin" *.*  /nfl /ndl /np

echo COPY����ϵͳ����
robocopy "../99 packages/����ϵͳ" "../00 ��Ŀ¼/bin" *.dll *.pdb /e /nfl /ndl /np
robocopy "../99 packages/��Ʒ�ӿ�/�����ӿ�" "../00 ��Ŀ¼/bin" *.dll *.pdb /e /nfl /ndl /np
robocopy "../99 packages/Quartz.2.3.1/lib/net40-client" "../00 ��Ŀ¼/bin" Quartz.dll /e /nfl /ndl /np

attrib "../00 ��Ŀ¼/bin/*.*" -r /S


echo ����������Ŀ�⡭��
"%msbuildexe%"  "../01 ��Ŀ��/��Ŀ��.sln" /t:Rebuild /p:Configuration="Debug" /consoleloggerparameters:ErrorsOnly /nologo /m

echo ��������������ϵͳ����
"%msbuildexe%"  "../04 ������ϵͳ/������ϵͳ.sln" /t:Rebuild /p:Configuration="Debug" /consoleloggerparameters:ErrorsOnly /nologo /m

echo ����������¥ϵͳ����
"%msbuildexe%"  "../02 ��¥ϵͳ/��¥ϵͳ.sln" /t:Rebuild /p:Configuration="Debug" /consoleloggerparameters:ErrorsOnly /nologo /m

echo �������ɳɱ�ϵͳ����
"%msbuildexe%"  "../03 �ɱ�ϵͳ/�ɱ�ϵͳ.sln" /t:Rebuild /p:Configuration="Debug" /consoleloggerparameters:ErrorsOnly /nologo /m
