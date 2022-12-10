# PowerShell
#------------------------------------------------
# ���� docker ����
# bin/run_docker.ps1
#           [-u ${USER}]            # ָ�������ն˵��û���Ĭ�Ϸ� root�������� UID ���� USERNAME��
#------------------------------------------------

param(
    [string]$u="1000"
)

$ID = 1000
if(![String]::IsNullOrEmpty($u)) {
    if(($u -eq "root") -or ($u -eq "0")) {
        $ID = 0
    }
}


$ENV:U_ID=${ID}; `
$ENV:G_ID=${ID}; `
docker-compose up -d
Write-Host "Docker is running (uid=${ID}) ..."
