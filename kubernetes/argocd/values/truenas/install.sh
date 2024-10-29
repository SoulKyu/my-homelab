helm upgrade \
--install \
--values freenas-iscsi-pool01.yaml \
--namespace democratic-csi \
zfs-iscsi-pool01 democratic-csi/democratic-csi

helm upgrade \
--install \
--values freenas-nfs-pool01.yaml \
--namespace democratic-csi \
zfs-nfs-pool01 democratic-csi/democratic-csi

helm upgrade \
--install \
--values freenas-iscsi-pool02.yaml \
--namespace democratic-csi \
zfs-iscsi-pool02 democratic-csi/democratic-csi

helm upgrade \
--install \
--values freenas-nfs-pool02.yaml \
--namespace democratic-csi \
zfs-nfs-pool02 democratic-csi/democratic-csi