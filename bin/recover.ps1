# PowerShell
#------------------------------------------------
# �ָ� ARK �Ĵ浵/����
# bin/recover.ps1 -v ${yyyyMMddHH}
#------------------------------------------------

param([string]$v="")

$STEAM_DIR = "./volumes/steam"
$STEAM_GAME_DIR = "${STEAM_DIR}/games"
$ARK_APP_DIR = "${STEAM_GAME_DIR}/ark"
$ARK_SAVED_DIR = "${ARK_APP_DIR}/ShooterGame/Saved"

$BACKUP_DIR = "./backup"
$VERSION = $v
if([String]::IsNullOrEmpty(${VERSION})) {
    Write-Host "������ָ�ʱ���, ��ʽΪ: bin/recover.sh yyyyMMddHH"
    Write-Host "�ɻָ��Ĵ浵�ļ��� ${BACKUP_DIR} Ŀ¼"
    Exit
}


Write-Host "��ѹ�浵�ļ� ${RECOVER_FILE} ..."
$RECOVER_FILE = "${BACKUP_DIR}/${VERSION}.zip"
Expand-Archive -Path ${RECOVER_FILE} -DestinationPath ${BACKUP_DIR}


Write-Host "�ָ��浵 ${VERSION} ..."
$RECOVER_DIR = "${BACKUP_DIR}/${VERSION}"
Remove-Item ${ARK_SAVED_DIR} -Recurse -Force
New-Item -Path ${ARK_SAVED_DIR} -ItemType Directory
Move-Item ${RECOVER_DIR}/* ${ARK_SAVED_DIR}/


Write-Host "ɾ������ ..."
$CACHE_DIR = "${BACKUP_DIR}/${VERSION}"
Remove-Item "${CACHE_DIR}" -Recurse -Force


Write-Host "�ָ����"
