# Introduction

<!-- TODO: annexe -->
[a](README.md/)

# Préparer le PC admin
## Clé publique ssh
Générer le pair de clé publique et privé depuis le PC depuis lequel on va lancer la processus de **Discovery** OpenShift par exemple:
```shell
ssh-keygen -t ed25519
```
> Le but est de permettre aux hôtes d'effectuer des débogages pendant le processus de découverte.

# Identifier le nom de domaine désiré
- Le nom de domaine
> à vérifier sa disponibilité sur [OVH](https://www.ovh.com/fr/order/webcloud/?#/webCloud/domain/select?selection=~())
- Acheter le nom de domaine désiré

# Préparation
## Récupérer les fichier legaux de MAS
### Entitlement Id
Récupérer votre Entitlement key depuis [My IBM](https://myibm.ibm.com/dashboard/)
![alt text](images/EntitlementKey.png)

### License key
Récupérer votre license depuis [IBM License Key Center](https://licensing.flexnetoperations.com/control/ibmr/login?nextURL=%2Fcontrol%2Fibmr%2Fibmrindex)
| Field             | Content                                            |
|-------------------|----------------------------------------------------|
| Number of Keys    | How many AppPoints to assign to the license file   |
| Host ID Type      | Set to Ethernet Address                            |
| Host ID           | Enter any 12 digit hexadecimal string              |
| Hostname          | Set to the hostname of your OCP instance           |
| Port              | Set to 27000                                       |

> [Document de référence](https://ibm-mas.github.io/cli/guides/install/#12-mas-license-file)



## Télécharger Redhat discory disque
1. se connecter sur la [Red Hat Hybrid Cloud Console](https://console.redhat.com)
2. Choisir le produit **OpenShift**
3. Cliquer sur le bouton **Create Cluster**
4. Choisir l'onglet **Datacenter**
5. Cliquer sur le lien **Bare Metal(x86_64)**
6. Choisir l'option **Interactive**
7. Suivis l'instruction pour créer le cluster
	- Etape: Cluster détails
		- Le nom de Cluster
		- Le nom de base domaine
		- La version de OpenShift
		- CPU architecture
		- Cocher la case **Install single node OpenShift(SNO)**
	- Etape: **Operators** ne choisir rien TODO: a vérifier
	- Etape: **Host discovery**
		- Fournir le clé publique généré précédement
		- Cliquer sur le bouton **Generate Discovery ISO**

# Configuration OVH
## Achat de serveur
TODO: A compléter

## Configurer le Bios afin de démarrer le serveur OVH depuis ISO
### Accès IPMI depuis OVH BareMetal server
![alt text](<images/console ovh server.png>)
![alt text](<images/IPMI java webstart.png>)

### Configurer BIOS pour démarrer le serveur OVH avec ISO de Openshift Discovery
1. Charger le fichier ISO sur IPMI
2. Configurer BIOS pour démarrer le serveur OVH depuis ISO

__L'article référentiel__
- version [web](https://support.us.ovhcloud.com/hc/en-us/articles/360000108630-How-to-Install-an-OS-with-IPMI#v2)
- version [pdf](./reference/How%20to%20Install%20an%20OS%20with%20IPMI%20–%20Articles.pdf)

> **Attention:** 
> Nous avons rencontré la difficulte de lancer le fichier .jnpl (java webstart) depuis le PC mastérisé par Capgemini. Finir par réserver une environnement TechZone pour effectuer les opérations nécessaire.


# La processus de Discovery commence
Lorsque le serveur OVH se démarre à partir de ISO Discovery. La processus de Discovery est démarré

## Constat
Depuis l'IHM de la création de cluster de Openshift, l'host du serveur OVH doit s'afficher.
> **Attention:** 
> Lorsque la processus de Discovery se termine, il faut pas oublier à desactiver la démarrage ISO depuis BIOS


## Résultat
Lorsque que la prcessus de discovery se termine, on aura tous les infos de access présent sur la console cluster de votre compte RedHat.
![alt text](images/ocpDiscoveryFinished.png)


# Générer Certificat pour la domaine
Suite à l'installation la console de OCP utilise par défaut les certificat **selfsigned**, en conséquence il est bloqué par plus part des équipe sécurité dans l'entreprise.

Dans cette étape nous allons installer le certificat validé (par letsencrypt) sur OCP.

[Document référence](https://www.edouard.bzh/guide-certificat-wildcard-lets-encrypt-acmesh-nginx-ovh/)

## Générer certificat
### Solution 1: Générer localement en manuel?
### Solution 2: Utiliser 

