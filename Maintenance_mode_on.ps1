# Automatische Ermittlung des Servernamens
$serverName = $env:COMPUTERNAME

# Set-MailboxServer
Set-MailboxServer $serverName -DatabaseCopyActivationDisabledAndMoveNow $True

# Set-ServerComponentState
Set-ServerComponentState –Identity $serverName –Component HubTransport –State Draining –Requester Maintenance

# Suspend-ClusterNode
Suspend-ClusterNode –Name $serverName

# Set-MailboxServer
Set-MailboxServer –Identity $serverName –DatabaseCopyAutoActivationPolicy Blocked

# Set-ServerComponentState
Set-ServerComponentState $serverName –Component ServerWideOffline –State InActive –Requester Maintenance
