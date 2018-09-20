#!/bin/bash

htuser=www-data
ocpath=/var/www/html/owncloud
ocuser=admin

echo $volume_paths
echo ${volume_ids[*]}
echo $volume_names
for i in "${!volume_paths[@]}"; do
	volume_path=${volume_paths[$i]}
	oc_volume_id=${volume_ids[$i]}
	oc_volume_name=${volume_names[$i]}

	echo "load external volume $volume_path"
#        echo $volume_path $oc_volume_id $oc_volume_name

	sudo -u $htuser $ocpath/occ app:enable files_external
	sudo -u $htuser $ocpath/occ files_external:create $oc_volume_name \\OC\\Files\\Storage\\Local null::null
	sudo -u $htuser $ocpath/occ files_external:config $oc_volume_id datadir $volume_path
	sudo -u $htuser $ocpath/occ files_external:option $oc_volume_id enable_sharing true
	sudo -u $htuser $ocpath/occ files_external:applicable --add-user=$ocuser $oc_volume_id
	verify=$(sudo -u $htuser $ocpath/occ files_external:verify $oc_volume_id)
done

sudo -u $htuser $ocpath/occ files:scan --all

return
