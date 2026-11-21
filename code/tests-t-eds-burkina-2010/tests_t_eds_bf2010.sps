* Encoding: UTF-8.
* -----------------------------------------------------------------------------
* Tests t sur l'Enquête démographique et de santé du Burkina Faso 2010 (fichier Femmes)
* Master de recherche en démographie, ISSP, Université Joseph Ki-Zerbo :
* cours de probabilités, estimation et tests (séances pratiques 1 à 4).
* Auteur : Wendyam Ariel TIEMTORE
*
* Pratique 1 : tests t sur l'âge, l'âge au premier mariage, l'âge à la première
*              naissance et le nombre d'enfants, avec la pondération de l'enquête.
* Pratique 2 : recodages en indicatrices (instruction, contraception, mariage et
*              naissance avant 18 ans, religion) et tests sur les proportions.
* Pratique 3 : comparaison des régions du Centre et du Sahel aux valeurs nationales.
* Pratique 4 : comparaison de régions deux à deux (Centre, Est, Sahel).
*
* Données : fichier Femmes de l'EDS Burkina Faso 2010, à demander au DHS Program
* (non inclus). Seul le chemin d'accès a été retiré du fichier rendu.
* -----------------------------------------------------------------------------

***Ouverture de la base**.
GET 
  File="edsBF2010_Femme.SAV".

***Pondération***.
Compute poids=v005/1000000.
EXECUTE.

WEIGHT by poids.

***Pratique 1***.
T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=v012 v511 v212 v201
  /CRITERIA=CI(.95).

***Pratique 2***.

RECODE v012 (15 thru 19=1) (20 thru Highest=0) INTO v012_rec.
VARIABLE LABELS  v012_rec 'Age recodée'.
VALUE LABELS v012_rec 1 'Moins de 20 ans' 0 'Plus de 20 ans'.
EXECUTE.

RECODE v106 (0=1) (MISSING=SYSMIS) (1 thru 3=0) INTO sans_nivinst.
VARIABLE LABELS  sans_nivinst "sans niveau d'instruction".
EXECUTE.
RECODE v106 (1=1) (MISSING=SYSMIS) (2 thru 3=0) (0=0)  INTO primaire.
VARIABLE LABELS  primaire "niveau d'instruction primaire".
EXECUTE.
RECODE v106 (2=1) (MISSING=SYSMIS) (3=0) (0=0) (1=0) (9=SYSMIS) INTO secondaire.
VARIABLE LABELS  secondaire "niveau d'instruction secondaire".
EXECUTE.
RECODE v106 (3=1) (MISSING=SYSMIS) (2=0) (0=0) (1=0) (9=SYSMIS) INTO supérieur.
VARIABLE LABELS  supérieur "niveau d'instruction supérieur".
EXECUTE.

RECODE v313 (0=0) (MISSING=SYSMIS) (2 thru 3=1) INTO contra_quel.
VARIABLE LABELS  contra_quel 'contraceptive quelconque'.
EXECUTE.
RECODE v313 (0=0) (MISSING=SYSMIS) (3=1) (2=0) INTO contra_moderne.
VARIABLE LABELS  contra_moderne 'contraceptive moderne'.
EXECUTE.
RECODE v313 (0=0) (MISSING=SYSMIS) (2=1) (3=0) INTO contra_tradi.
VARIABLE LABELS  contra_tradi 'contraceptive traditionnelle'.
EXECUTE.

RECODE v212 (12 thru 17=1) (18 thru Highest=0) (MISSING=SYSMIS) INTO v212_rec.
VARIABLE LABELS  v212_rec 'enfant avant 18 ans'.
EXECUTE.

RECODE v511 (10 thru 17=1) (18 thru Highest=0) (MISSING=SYSMIS) INTO v511_rec.
VARIABLE LABELS  v511_rec 'mariage avant 18 ans'.
EXECUTE.

RECODE v130 (1=1) (0=0) (2=0) (3=0) (4=0) (96=0) (MISSING=SYSMIS) INTO muslim.
VARIABLE LABELS  muslim 'musulmanes'.
EXECUTE.
RECODE v130 (2=1) (0=0) (1=0) (3=1) (4=0) (96=0) (MISSING=SYSMIS) INTO chrétiennes.
VARIABLE LABELS  chrétiennes 'chrétiennes'.
EXECUTE.
RECODE v130 (3=1) (0=0) (2=0) (1=0) (4=0) (96=0) (MISSING=SYSMIS) INTO protestantes.
VARIABLE LABELS  protestantes 'protestantes'.
EXECUTE.
RECODE v130 (4=1) (0=0) (2=0) (3=0) (1=0) (96=0) (MISSING=SYSMIS) INTO animistes.
VARIABLE LABELS  animistes 'animistes'.
EXECUTE.

T-TEST
  /TESTVAL=0
  /MISSING=ANALYSIS
  /VARIABLES=v012_rec sans_nivinst primaire secondaire supérieur contra_quel contra_moderne 
  contra_tradi v212_rec v511_rec muslim chrétiennes protestantes animistes
  /CRITERIA=CI(.95).

***Pratique3***.

***Région du Centre**.
DATASET COPY  Centre.
DATASET ACTIVATE  Centre.
FILTER OFF.
USE ALL.
SELECT IF (v024 = 3).
EXECUTE.
DATASET ACTIVATE Jeu_de_données1.

DATASET ACTIVATE Centre.
T-TEST
  /TESTVAL=28.79
  /MISSING=ANALYSIS
  /VARIABLES=v012
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=17.49
  /MISSING=ANALYSIS
  /VARIABLES=v511
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=19.04
  /MISSING=ANALYSIS
  /VARIABLES=v212
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=3.30
  /MISSING=ANALYSIS
  /VARIABLES=v201
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1939
  /MISSING=ANALYSIS
  /VARIABLES=v012_rec
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.7397
  /MISSING=ANALYSIS
  /VARIABLES=sans_nivinst
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1364
  /MISSING=ANALYSIS
  /VARIABLES=primaire
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1143
  /MISSING=ANALYSIS
  /VARIABLES=secondaire
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.0097
  /MISSING=ANALYSIS
  /VARIABLES=supérieur
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1528
  /MISSING=ANALYSIS
  /VARIABLES=contra_quel
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1426
  /MISSING=ANALYSIS
  /VARIABLES=contra_moderne
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.0102
  /MISSING=ANALYSIS
  /VARIABLES=contra_tradi
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.3311
  /MISSING=ANALYSIS
  /VARIABLES=v212_rec
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.5762
  /MISSING=ANALYSIS
  /VARIABLES=v511_rec
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.6178
  /MISSING=ANALYSIS
  /VARIABLES=muslim
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.2999
  /MISSING=ANALYSIS
  /VARIABLES=chrétiennes
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.0671
  /MISSING=ANALYSIS
  /VARIABLES=protestantes
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.0736
  /MISSING=ANALYSIS
  /VARIABLES=animistes
  /CRITERIA=CI(.95).

***Région du Sahel**.
DATASET ACTIVATE Jeu_de_données1.
DATASET COPY  Sahel.
DATASET ACTIVATE  Sahel.
FILTER OFF.
USE ALL.
SELECT IF (v024 = 12).
EXECUTE.
DATASET ACTIVATE Jeu_de_données1.

DATASET ACTIVATE Sahel.
T-TEST
  /TESTVAL=28.79
  /MISSING=ANALYSIS
  /VARIABLES=v012
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=17.49
  /MISSING=ANALYSIS
  /VARIABLES=v511
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=19.04
  /MISSING=ANALYSIS
  /VARIABLES=v212
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=3.30
  /MISSING=ANALYSIS
  /VARIABLES=v201
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1939
  /MISSING=ANALYSIS
  /VARIABLES=v012_rec
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.7397
  /MISSING=ANALYSIS
  /VARIABLES=sans_nivinst
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1364
  /MISSING=ANALYSIS
  /VARIABLES=primaire
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1143
  /MISSING=ANALYSIS
  /VARIABLES=secondaire
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.0097
  /MISSING=ANALYSIS
  /VARIABLES=supérieur
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1528
  /MISSING=ANALYSIS
  /VARIABLES=contra_quel
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.1426
  /MISSING=ANALYSIS
  /VARIABLES=contra_moderne
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.0102
  /MISSING=ANALYSIS
  /VARIABLES=contra_tradi
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.3311
  /MISSING=ANALYSIS
  /VARIABLES=v212_rec
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.5762
  /MISSING=ANALYSIS
  /VARIABLES=v511_rec
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.6178
  /MISSING=ANALYSIS
  /VARIABLES=muslim
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.2999
  /MISSING=ANALYSIS
  /VARIABLES=chrétiennes
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.0671
  /MISSING=ANALYSIS
  /VARIABLES=protestantes
  /CRITERIA=CI(.95).
T-TEST
  /TESTVAL=0.0736
  /MISSING=ANALYSIS
  /VARIABLES=animistes
  /CRITERIA=CI(.95).

T-TEST
  /TESTVAL=29
  /MISSING=ANALYSIS
  /VARIABLES=v012
  /CRITERIA=CI(.95).

T-TEST
  /TESTVAL=28.7
  /MISSING=ANALYSIS
  /VARIABLES=v012
  /CRITERIA=CI(.95).

***Pratique4**.
**Sahel-Centre**.
DATASET ACTIVATE Jeu_de_données1.
T-TEST GROUPS=v024(3 12)
  /MISSING=ANALYSIS
  /VARIABLES=v012 v511 v212 v201 v012_rec sans_nivinst primaire secondaire supérieur contra_quel 
  contra_moderne contra_tradi v212_rec v511_rec muslim chrétiennes protestantes animistes
  /CRITERIA=CI(.95).
****Sahel-Est**.
DATASET ACTIVATE Jeu_de_données1.
T-TEST GROUPS=v024(8 12)
  /MISSING=ANALYSIS
  /VARIABLES=v012 v511 v212 v201 v012_rec sans_nivinst primaire secondaire supérieur contra_quel 
  contra_moderne contra_tradi v212_rec v511_rec muslim chrétiennes protestantes animistes
  /CRITERIA=CI(.95).
***Centre-Est***.
DATASET ACTIVATE Jeu_de_données1.
T-TEST GROUPS=v024(3 8)
  /MISSING=ANALYSIS
  /VARIABLES=v012 v511 v212 v201 v012_rec sans_nivinst primaire secondaire supérieur contra_quel 
  contra_moderne contra_tradi v212_rec v511_rec muslim chrétiennes protestantes animistes
  /CRITERIA=CI(.95).

T-TEST GROUPS=v024(3 12)
  /MISSING=ANALYSIS
  /VARIABLES=v012 v012_rec
  /CRITERIA=CI(.95).
