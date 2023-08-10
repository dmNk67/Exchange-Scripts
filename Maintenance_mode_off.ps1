# Automatische Ermittlung des Servernamens
$serverName = $env:COMPUTERNAME

# Set-MailboxServer
Set-MailboxServer –Identity $serverName –DatabaseCopyAutoActivationPolicy Unrestricted

# Resume-ClusterNode
Resume-ClusterNode –Name $serverName

# Set-ServerComponentState
Set-ServerComponentState –Identity $serverName –Component HubTransport –State Active –Requester Maintenance

# Set-MailboxServer
Set-MailboxServer –Identity $serverName –DatabaseCopyActivationDisabledAndMoveNow $False

# Set-ServerComponentState
Set-ServerComponentState $serverName –Component ServerWideOffline –State Active –Requester Maintenance
