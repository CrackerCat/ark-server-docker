# PowerShell
# ���� ARK �����Ľ����ն�
#------------------------------------------------
# ʾ����bin/terminal.ps1
#------------------------------------------------

$CONTAINER_NAME = "ARK_SVC"
$CONTAINER_ID = (docker ps -aq --filter name="$CONTAINER_NAME")
if([String]::IsNullOrEmpty($CONTAINER_ID)) {
    Write-Host "[$CONTAINER_NAME] ����û������ ..."

} else {
    docker exec -it $CONTAINER_ID bash
}
