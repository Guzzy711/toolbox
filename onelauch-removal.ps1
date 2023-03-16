get-process -name *onelaunch* | stop-process -force

get-process -name *chromium* | stop-process -force

foreach ($folder in (get-childitem c:\users)) {

$path = $folder.pspath + "\\appdata\\local\\onelaunch"

if (test-path $path) {

write-output "Deleting: $path"

remove-item $path -recurse -force -confirm:$false

}

$path = $folder.pspath + "\appdata\roaming\microsoft\windows\start menu\programs\OneLaunch"

if (test-path $path) {

write-output "Deleting: $path"

remove-item $path -recurse -force -confirm:$false

}

}

foreach ($registry_hive in (get-childitem registry::hkey_users)) {

$path = "$registry\_hive.pspath" + "\\software\\onelaunch"

if (test-path $path) {

write-output "Deleting: $path"

remove-item $path -force -recurse

}

}

unregister-scheduledtask -taskname "OneLaunchLaunchTask" -confirm:$false -erroraction silentlycontinue