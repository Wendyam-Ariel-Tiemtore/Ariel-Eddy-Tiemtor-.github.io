*******************************************************************************
* Devoir d'analyse de survie : un essai thérapeutique à deux bras
* Master de recherche en démographie, ISSP, Université Joseph Ki-Zerbo (2024)
* Auteur : Wendyam Ariel TIEMTORE
*
* Question : le traitement (cobalt ou iridium) change-t-il la survie et le délai
* de récidive locale des patientes ?
* Étapes : 1) comparaison des deux bras ; 2) Kaplan-Meier et test du log-rank ;
* 3) analyses univariées du délai de récidive ; 4) modèle de Cox ;
* 5) test des risques proportionnels ; 6) modèle de Weibull.
*
* Données : cobire.txt, fournies pour le cours (non incluses ici).
* Placer le fichier dans le dossier de travail avant d'exécuter le script.
* Par rapport au script rendu, seuls les chemins d'accès ont été retirés et
* l'orthographe des commentaires corrigée : les commandes sont inchangées.
*******************************************************************************

***Importation de la base***.
import delimited "cobire.txt", delimiter(space,collapse) varnames(1) encoding(ISO-8859-2) clear

***Recodage des variables***.
tab sbr
encode sbr,gen (sbr_rec)
tab sbr_rec

tab trait
recode trait (1=1 "cobalt") (2=2 "iridium"), gen (trait_rec)
tab trait_rec

tab recloc
recode recloc (0=0 "non recidive") (1=1 "recidive"), gen (recloc_rec)
tab recloc_rec

tab etatder
recode etatder(0=0 "survie") (1=1 "décès"), gen (etatder_rec)
tab etatder_rec

tab1 trait_rec recloc_rec etatder_rec
****1)Comparaison de la distribution des covariables entre les deux groupes de patientes des bras cobalt et iridium***.
hist age, by(trait_rec) norm
swilk age if trait_rec
sfrancia age if trait_rec
ttest age, by( trait_rec)

hist dimtum, by(trait_rec) norm
swilk dimtum if trait_rec

tab trait_rec sbr_rec, chi2
prop sbr_rec, over(trait_rec)

****2)Le traitement a-t-il un effet sur la survie des patientes?***.
*******on dit à stata qu'on veut travailler sur des données longitudinales***.
stset delaisv, failure(etatder_rec)
tab2 trait_rec etatder_rec,row
*****estimation de la fonction de survie médiane (temps médian)
stsum, by(trait_rec)
*****fonction de survie
sts list, by(trait_rec)
*****fonction de survie en les comparant
sts list, by(trait_rec) compare

*******le graphique de Kaplan-Meier
sts graph,by(trait_rec)
******le test de logrank pondéré**.
sts test trait_rec


****3)Etudions l'effet de chaque covariable séparément sur le délai de récidive (étude univariée)****.
tab age
recode age (29/39=1 "moins de 40ans ") (40/78=2 "40ans et plus"), gen (age_rec)
tab age_rec

tab dimtum
recode dimtum (1/4=1 "moins de 5cm") (5/10=2 "5cm et plus "), gen (dimtum_rec)
tab dimtum_rec
****recodage de sbr selon Kaplan-Meier***.
stset delairec, failure(recloc_rec)
sts graph,by(sbr_rec)
recode sbr_rec (1/2=1 "stade 1") (3=2 "stade 2 ") (4=1) , gen (sbr_rec1)
tab sbr_rec1
sts graph,by(sbr_rec1)

stset delairec, failure(recloc_rec)
***Age**
sts graph, by(age_rec) ci
sts test age_rec
***Dimension de la tumeur**.
sts graph ,by(dimtum_rec) ci
sts test dimtum_rec
***Grade histologique**.
sts graph ,by(sbr_rec1) ci
sts test sbr_rec1
***Groupe de traitement**.
sts graph,by(trait_rec) ci
sts test trait_rec

****4)Ajustons un modèle de régression de Cox (analyse multivariée) incluant toutes les covariables (en 2 classes) pour expliquer le risque de survenue d'une récidive***.
stset delairec, failure(recloc_rec)
stcox i.trait_rec i.sbr_rec1 i.age_rec i.dimtum_rec


****5)Tester sur ce modèle l'hypothèse des risques proportionnels***.
stcox i.trait_rec i.sbr_rec1 i.age_rec i.dimtum_rec
estat phtest

***6)Modèle de Weibull***.
streg i.trait_rec i.age_rec i.dimtum_rec i.sbr_rec1, distribution(weibull)
