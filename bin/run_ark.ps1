# PowerShell
#------------------------------------------------
# ���� ARK ����
# �������ò�����: https://ark.fandom.com/wiki/Server_configuration
#------------------------------------------------
# ʾ����bin/run_ark.ps1 
#           [-u ${USER}]                        # ָ�������ն˵��û���Ĭ�Ϸ� root�������� UID ���� USERNAME��
#           [-s ${ServerName}]                  # ���������ƣ��� steam �������Ͽ����ģ�
#           [-m ${MapName}]                     # ��ͼ��
#           [-n ${PlayerAmount}]                # ��������
#           [-p ${ServerPassword}]              # ����������
#           [-a ${AminPassword}]                # ����Ա����
#           [-d ${Difficulty}]                  # ��Ϸ�Ѷ�
#           [-h ${HarvestAmount}]               # ��Դ��ñ���
#           [-t ${TamingSpeed}]                 # ѱ����������
#           [-r ${ResourcesRespawnPeriod}]      # ��Դ��������
#           [-g ${CropGrowthSpeed}]             # ������������
#           [-x ${XPMultiplier}]                # �����ñ���
#           [-i ${ModIds}]                      # ��ͼ MOD ID �б���Ӣ�Ķ��ŷָ�
#------------------------------------------------

param(
    [string]$u="1000",
    [string]$s="EXP_ARK_Server",
    [string]$m="TheIsland",
    [int]$c=10, 
    [string]$p="EXP123456", 
    [string]$a="ADMIN654321",
    [string]$d="0.2",
    [string]$h="1.0",
    [string]$t="1.0",
    [string]$r="1.0",
    [string]$g="1.0",
    [string]$x="1.0",
    [string]$i=""
)

$USER = "1000"
if(![String]::IsNullOrEmpty($u)) {
    if(($u -eq "root") -or ($u -eq "0")) {
        $USER = "root"
    }
}

$SERVER_NAME = $s
$SERVER_MAP = $m
$MAX_PLAYERS = $c
$SERVER_PASSWORD = $p
$ADMIN_PASSWORD = $a
$DIFFICULTY_MULT = $d
$HARVEST_MULT = $h
$TAMING_MULT = $t
$RESOURCE_MULT = $r
$GROWTH_MULT = $g
$XP_MULT = $x
$GAME_MOD_IDS = $i


$CONTAINER_NAME = "ARK_SVC"
$CONTAINER_ID = (docker ps -aq --filter name="$CONTAINER_NAME")
if([String]::IsNullOrEmpty($CONTAINER_ID)) {
    Write-Host "[$CONTAINER_NAME] ����û������ ..."

} else {
    docker exec -d -u $USER $CONTAINER_ID /home/steam/bin/ark.sh `
        -s "${SERVER_NAME}" `
        -m "${SERVER_MAP}" `
        -c "${MAX_PLAYERS}" `
        -p "${SERVER_PASSWORD}" `
        -a "${ADMIN_PASSWORD}" `
        -d "${DIFFICULTY_MULT}" `
        -h "${HARVEST_MULT}" `
        -t "${TAMING_MULT}" `
        -r "${RESOURCE_MULT}" `
        -g "${GROWTH_MULT}" `
        -x "${XP_MULT}" `
        -i "${GAME_MOD_IDS}"
    Write-Host "ARK ������ (user=$USER) ..."
    Write-Host "�Ժ���ˢ�� steam �������б� ..."
}
