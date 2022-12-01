#!/bin/sh
# ���� ARK �Ĵ浵/����
#------------------------------------------------
# ʾ����bin/backup.ps1
#------------------------------------------------

$STEAM_DIR = "./volumes/steam"
$STEAM_GAME_DIR = "${STEAM_DIR}/games"
$ARK_APP_DIR = "${STEAM_GAME_DIR}/ark"
$ARK_SAVED_DIR = "${ARK_APP_DIR}/ShooterGame/Saved/SavedArks"
$ARK_CONFIG_DIR = "${ARK_APP_DIR}/ShooterGame/Saved/Config"

$BACKUP_DIR = "./backup"
$VERSION = Get-Date -format "yyyyMMddHH"
$LATEST_BACKUP_DIR = "${BACKUP_DIR}/${VERSION}"
$LATEST_BACKUP_FILE = "${LATEST_BACKUP_DIR}.zip"

Write-Host "ɾ�� 1 Сʱ�ڵ��ظ����� ..."
if (Test-Path ${LATEST_BACKUP_FILE}) {
    Remove-Item "${LATEST_BACKUP_FILE}" -Recurse -Force
}

Write-Host "��������Ŀ¼ ..."
mkdir "${LATEST_BACKUP_DIR}"

Write-Host "���ƴ浵/�����ļ� ..."
Copy-Item "${ARK_SAVED_DIR}" -Destination "${LATEST_BACKUP_DIR}" -Recurse -Force
Copy-Item "${ARK_CONFIG_DIR}" -Destination "${LATEST_BACKUP_DIR}" -Recurse -Force

Write-Host "ѹ���浵/�����ļ� ..."
Compress-Archive -Path "${LATEST_BACKUP_DIR}" -DestinationPath "${LATEST_BACKUP_FILE}"

Write-Host "ɾ����ʱĿ¼ ..."
if (Test-Path ${LATEST_BACKUP_DIR}) {
    Remove-Item "${LATEST_BACKUP_DIR}" -Recurse -Force
}

Write-Host "�������: ${LATEST_BACKUP_FILE}"
