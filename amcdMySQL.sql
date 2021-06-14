#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Agence
#------------------------------------------------------------

CREATE TABLE Agence(
        idAgence                    Int  Auto_increment  NOT NULL ,
        nomAgence                   Varchar (150) NOT NULL ,
        adresseAgence               Varchar (250) NOT NULL ,
        dateCreatedAtAgence         Date NOT NULL ,
        dateCessationActiviteAgence Date NOT NULL ,
        telAgence                   Varchar (15) NOT NULL ,
        emailContactAgence          Varchar (50) NOT NULL ,
        siteWebAgence               Varchar (150) NOT NULL
	,CONSTRAINT Agence_PK PRIMARY KEY (idAgence)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Agent
#------------------------------------------------------------

CREATE TABLE Agent(
        idAgent         Int  Auto_increment  NOT NULL ,
        civiliteAgent   Varchar (50) NOT NULL ,
        nomAgent        Varchar (50) NOT NULL ,
        prenomAgent     Varchar (50) NOT NULL ,
        adresseAgent    Varchar (255) NOT NULL ,
        telAgent        Numeric NOT NULL ,
        emailAgent      Varchar (150) NOT NULL ,
        idfAgent        Varchar (150) NOT NULL ,
        mdpAgent        Varchar (150) NOT NULL ,
        salaireAgent    Float NOT NULL ,
        dateEntreeAgent Date NOT NULL ,
        dateSortieAgent Date NOT NULL ,
        idAgence        Int NOT NULL
	,CONSTRAINT Agent_PK PRIMARY KEY (idAgent)

	,CONSTRAINT Agent_Agence_FK FOREIGN KEY (idAgence) REFERENCES Agence(idAgence)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TypeBien
#------------------------------------------------------------

CREATE TABLE TypeBien(
        idTypeBien  Int  Auto_increment  NOT NULL ,
        nomTypeBien Varchar (150) NOT NULL
	,CONSTRAINT TypeBien_PK PRIMARY KEY (idTypeBien)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        idClient       Int  Auto_increment  NOT NULL ,
        civiliteClient Varchar (50) NOT NULL ,
        nomClient      Varchar (50) NOT NULL ,
        prenomClient   Varchar (50) NOT NULL ,
        adresseClient  Varchar (250) NOT NULL ,
        telClient      Numeric NOT NULL ,
        emailClient    Varchar (150) NOT NULL ,
        budgetClient   Float NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (idClient)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Bien
#------------------------------------------------------------

CREATE TABLE Bien(
        idBien          Int  Auto_increment  NOT NULL ,
        titreBien       Varchar (150) NOT NULL ,
        adresseBien     Varchar (250) NOT NULL ,
        dateEnregBien   Datetime NOT NULL ,
        superficieBien  Float NOT NULL ,
        descriptionBien Text NOT NULL ,
        prixBien        Float NOT NULL ,
        idAgent         Int NOT NULL ,
        idTypeBien      Int NOT NULL ,
        idAgence        Int NOT NULL ,
        idClient        Int NOT NULL
	,CONSTRAINT Bien_PK PRIMARY KEY (idBien)

	,CONSTRAINT Bien_Agent_FK FOREIGN KEY (idAgent) REFERENCES Agent(idAgent)
	,CONSTRAINT Bien_TypeBien0_FK FOREIGN KEY (idTypeBien) REFERENCES TypeBien(idTypeBien)
	,CONSTRAINT Bien_Agence1_FK FOREIGN KEY (idAgence) REFERENCES Agence(idAgence)
	,CONSTRAINT Bien_Client2_FK FOREIGN KEY (idClient) REFERENCES Client(idClient)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PhotoBien
#------------------------------------------------------------

CREATE TABLE PhotoBien(
        idPhotoBien    Int  Auto_increment  NOT NULL ,
        titrePhotoBien Varchar (150) NOT NULL ,
        idBien         Int NOT NULL
	,CONSTRAINT PhotoBien_PK PRIMARY KEY (idPhotoBien)

	,CONSTRAINT PhotoBien_Bien_FK FOREIGN KEY (idBien) REFERENCES Bien(idBien)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ContratDeVente
#------------------------------------------------------------

CREATE TABLE ContratDeVente(
        idContratDeVente        Int  Auto_increment  NOT NULL ,
        montantContratDeVente   Float NOT NULL ,
        dateEffetContratDeVente Date NOT NULL ,
        idClient                Int NOT NULL
	,CONSTRAINT ContratDeVente_PK PRIMARY KEY (idContratDeVente)

	,CONSTRAINT ContratDeVente_Client_FK FOREIGN KEY (idClient) REFERENCES Client(idClient)
)ENGINE=InnoDB;

