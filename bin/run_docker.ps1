# PowerShell
# ���� docker ����
#------------------------------------------------
# ����ִ��ʾ����
# bin/run_docker.ps1
#------------------------------------------------


# ʹ�����õ� steam �û�����
$ENV:U_ID=1000; `
$ENV:G_ID=1000; `
docker-compose up -d
Write-Host "Server is Running ..."
