




## 1. Visualisation du disque :  

lsblk
. Créer les partitions
Utilisez fdisk pour créer deux partitions sur le disque /dev/sdb :
sudo cfdisk /dev/sdb
*On peut voir qu'il y a 1 seul disque de 10G  

![Capture d'écran de la partition](Capture d'écran 2024-12-13 093213)  

Tapez *Nouvelle* pour créer une nouvelle partition.
Choisissez *Primaire* pour une partition principale.
Ajuster la taille à *6G*
Sélectionner *Ecrire* puis taper *oui* pour sauvegarder les modifications.  
Aller sur *Quitter"

Pour la deuxième partition :  
Numéro de partition : 2.  
Début : suivant (par défaut).  
Fin : laissez par défaut (jusqu'à la fin du disque).  
Changez le type de la deuxième partition en swap :  
Tapez t, sélectionnez la partition 2, et entrez 82 pour le type "Linux swap".  
*Sauvegardez les modifications avec w.*  

![Capture d'écran de la partition](Capture d'écran 2024-12-13 093213)

## 2. Formater les partitions

Formatage de la partition DATA en ext4 :  
  >*sudo mkfs.ext4 /dev/sdb1 -L DATA*

Configuration de la partition SWAP :  
   >*sudo mkswap /dev/sdb2 -L SWAP*

![Capture d'écran de la partition](Capture d'écran 2024-12-13 093213)    

## 3. Activer et désactiver le swap  

Désactivez l'ancien swap :  
  >*sudo swapoff -a*

Activez le nouveau swap :  
  >*sudo swapon /dev/sdb2*

Vérifiez que le swap actif est celui de la partition SWAP :  
  >*swapon --show*

![Capture d'écran de la partition](Capture d'écran 2024-12-13 093213)

## 4. Monter la partition DATA
Créez un point de montage et montez la partition DATA :  

  >*sudo mkdir -p /mnt/DATA*
  >*sudo mount /dev/sdb1 /mnt/DATA*

![Capture d'écran de la partition](Capture d'écran 2024-12-13 093213)

## 5. Rendre les modifications permanentes
Modifiez le fichier /etc/fstab pour monter automatiquement les partitions et activer le swap au démarrage :

  >*nano /etc/fstab*


Ecrire les lignes suivantes :


/dev/sdb1/ /mnt/DATA  ext4  defaults  0  2
/dev/sdb2/  none       swap  sw        0  0  

![Capture d'écran de la partition](Capture d'écran 2024-12-13 093213)

## 6. Vérifications finales
Vérifiez les partitions :

lsblk
Vérifiez le système de fichiers et les tailles :

df -h
Vérifiez le swap :

swapon --show

![Capture d'écran de la partition](Capture d'écran 2024-12-13 093213)
