# PowerShell
# ���� ARK ����
# �������ò�����: https://ark.fandom.com/wiki/Server_configuration
#------------------------------------------------
# ʾ����bin/run_ark.ps1 
#           [-u ${USER}]            # ָ�������ն˵��û���Ĭ�Ϸ� root�������� UID ���� USERNAME��
#           [-n ${ServerName}]      # ���������ƣ��� steam �������Ͽ����ģ�
#           [-m ${MapName}]         # ��ͼ��
#           [-i ${ModIds}]          # ��ͼ MOD ID �б���Ӣ�Ķ��ŷָ�
#           [-c ${PlayerAmount}]    # ��������
#           [-p ${ServerPassword}]  # ����������
#           [-a ${AminPassword}]    # ����Ա����
#------------------------------------------------

param(
    [string]$u="1000",
    [string]$n="EXP_ARK_Server",
    [string]$m="Ragnarok",
    [string]$i="",
    [int]$c=10, 
    [string]$p="EXP123456", 
    [string]$a="ADMIN654321"
)

$USER = "1000"
if(![String]::IsNullOrEmpty($u)) {
    if(($u -eq "root") -or ($u -eq "0")) {
        $USER = "root"
    }
}

$SERVER_NAME = $n
$SERVER_MAP = $m
$GAME_MOD_IDS = $i
$MAX_PLAYERS = $c
$SERVER_PASSWORD = $p
$ADMIN_PASSWORD = $a


$CONTAINER_NAME = "ARK_SVC"
$CONTAINER_ID = (docker ps -aq --filter name="$CONTAINER_NAME")
if([String]::IsNullOrEmpty($CONTAINER_ID)) {
    Write-Host "[$CONTAINER_NAME] ����û������ ..."

} else {
    docker exec -d -u $USER $CONTAINER_ID sh -c "/home/steam/bin/ark.sh -n ${SERVER_NAME} -m ${SERVER_MAP} -i ${GAME_MOD_IDS} -c ${MAX_PLAYERS} -p ${SERVER_PASSWORD} -a ${ADMIN_PASSWORD}"
    Write-Host "ARK ������ (user=$USER) ..."
    Write-Host "�Ժ���ˢ�� steam �������б� ..."
}
