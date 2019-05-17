/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     5/11/2019 11:24:26                           */
/*==============================================================*/


drop index CARACTERISTIQUE_PK cascade;

drop table CARACTERISTIQUE cascade;

drop index CARAC_LISTE_LIAISON2_FK cascade;

drop index CARAC_LISTE_LIAISON_FK cascade;

drop index CARAC_LISTE_LIAISON_PK cascade;

drop table CARAC_LISTE_LIAISON cascade;

drop index DEPARTEMENT_PK cascade;

drop table DEPARTEMENT cascade;

drop index EST_DE_STATUT2_FK cascade;

drop index EST_DE_STATUT_FK cascade;

drop index EST_DE_STATUT_PK cascade;

drop table EST_DE_STATUT cascade;

drop index FONCTION_PK cascade;

drop table FONCTION cascade;

drop index JOURNAL_PK cascade;

drop table JOURNAL cascade;

drop index PAVILLON_PK cascade;

drop table PAVILLON cascade;

drop index EST_DANS_PAVILLON_FK cascade;

drop index FCT_LIAISON_FK cascade;

drop index PIECE_PK cascade;

drop index PARENT_PIECE_FK;

drop table PIECE cascade;

drop index USAGER_RESERVE_FK cascade;

drop index PIECE_RESERVEE_FK cascade;

drop index RESERVATION_PK cascade;

drop table RESERVATION cascade;

drop index STATUT_PK cascade;

drop table STATUT cascade;

drop index TEMPS_AVANCE3_FK cascade;

drop index TEMPS_AVANCE2_FK cascade;

drop index TEMPS_AVANCE_FK cascade;

drop index TEMPS_AVANCE_PK cascade;

drop table TEMPS_AVANCE cascade;

drop index APPARTENANCE_FK cascade;

drop index USAGER_PK cascade;

drop table USAGER cascade;

/*==============================================================*/
/* Table: CARACTERISTIQUE                                       */
/*==============================================================*/
create table CARACTERISTIQUE (
   CARACTERISTIQUE_ID   INT4                 not null,
   CARACTERISTIQUE_DEFINITION TEXT                 not null,
   constraint PK_CARACTERISTIQUE primary key (CARACTERISTIQUE_ID)
);

/*==============================================================*/
/* Index: CARACTERISTIQUE_PK                                    */
/*==============================================================*/
create unique index CARACTERISTIQUE_PK on CARACTERISTIQUE (
CARACTERISTIQUE_ID
);

/*==============================================================*/
/* Table: CARAC_LISTE_LIAISON                                   */
/*==============================================================*/
create table CARAC_LISTE_LIAISON (
   CARACTERISTIQUE_ID   INT4                 not null,
   PAV_ID               CHAR(2)              not null,
   PIECE_ID             CHAR(5)              not null,
   constraint PK_CARAC_LISTE_LIAISON primary key (CARACTERISTIQUE_ID, PAV_ID, PIECE_ID)
);

/*==============================================================*/
/* Index: CARAC_LISTE_LIAISON_PK                                */
/*==============================================================*/
create unique index CARAC_LISTE_LIAISON_PK on CARAC_LISTE_LIAISON (
CARACTERISTIQUE_ID,
PAV_ID,
PIECE_ID
);

/*==============================================================*/
/* Index: CARAC_LISTE_LIAISON_FK                                */
/*==============================================================*/
create  index CARAC_LISTE_LIAISON_FK on CARAC_LISTE_LIAISON (
CARACTERISTIQUE_ID
);

/*==============================================================*/
/* Index: CARAC_LISTE_LIAISON2_FK                               */
/*==============================================================*/
create  index CARAC_LISTE_LIAISON2_FK on CARAC_LISTE_LIAISON (
PAV_ID,
PIECE_ID
);

/*==============================================================*/
/* Table: DEPARTEMENT                                           */
/*==============================================================*/
create table DEPARTEMENT (
   DEPARTEMENT_ID       INTEGER              not null,
   DEPARTEMENT_LABEL    TEXT                 not null,
   DEPARTEMENT_INSCRIPTION TIMESTAMP WITHOUT TIME ZONE                 not null default 'NOW()',
   constraint PK_DEPARTEMENT primary key (DEPARTEMENT_ID)
);

/*==============================================================*/
/* Index: DEPARTEMENT_PK                                        */
/*==============================================================*/
create unique index DEPARTEMENT_PK on DEPARTEMENT (
DEPARTEMENT_ID
);

/*==============================================================*/
/* Table: EST_DE_STATUT                                         */
/*==============================================================*/
create table EST_DE_STATUT (
   STATUT_ID           INTEGER               not null,
   USAGER_CIP           CHAR(8)              not null,
   constraint PK_EST_DE_STATUT primary key (STATUT_ID, USAGER_CIP)
);

/*==============================================================*/
/* Index: EST_DE_STATUT_PK                                      */
/*==============================================================*/
create unique index EST_DE_STATUT_PK on EST_DE_STATUT (
STATUT_ID,
USAGER_CIP
);

/*==============================================================*/
/* Index: EST_DE_STATUT_FK                                      */
/*==============================================================*/
create  index EST_DE_STATUT_FK on EST_DE_STATUT (
STATUT_ID
);

/*==============================================================*/
/* Index: EST_DE_STATUT2_FK                                     */
/*==============================================================*/
create  index EST_DE_STATUT2_FK on EST_DE_STATUT (
USAGER_CIP
);

/*==============================================================*/
/* Table: FONCTION                                              */
/*==============================================================*/
create table FONCTION (
   FCT_NUM              CHAR(4)              not null,
   FCT_LABEL            TEXT                 not null,
   FCT_INSCRIPTION      TIMESTAMP WITHOUT TIME ZONE                 not null default 'NOW()',
   constraint PK_FONCTION primary key (FCT_NUM)
);

/*==============================================================*/
/* Index: FONCTION_PK                                           */
/*==============================================================*/
create unique index FONCTION_PK on FONCTION (
FCT_NUM
);

/*==============================================================*/
/* Table: JOURNAL                                               */
/*==============================================================*/
create table JOURNAL (
   LOG_ID               serial				not null,
   LOG_ENTRY            TEXT				null,
   LOG_TIME             TIMESTAMP WITHOUT TIME ZONE                 null default 'NOW()',
   constraint PK_JOURNAL primary key (LOG_ID)
);

/*==============================================================*/
/* Index: JOURNAL_PK                                            */
/*==============================================================*/
create unique index JOURNAL_PK on JOURNAL (
LOG_ID
);

/*==============================================================*/
/* Table: PAVILLON                                              */
/*==============================================================*/
create table PAVILLON (
   PAV_ID               CHAR(2)              not null,
   PAV_LABEL            TEXT                 not null,
   constraint PK_PAVILLON primary key (PAV_ID)
);

/*==============================================================*/
/* Index: PAVILLON_PK                                           */
/*==============================================================*/
create unique index PAVILLON_PK on PAVILLON (
PAV_ID
);

/*==============================================================*/
/* Table: PIECE                                                 */
/*==============================================================*/
create table PIECE (
	PAV_ID				CHAR(2)				not null,
	PIECE_ID			CHAR(5)				not null,
	FCT_NUM				CHAR(4)				null,
	PIECE_CAPACITE		INT4				not null,
	PIECE_NOTES			TEXT				null,
	PIECE_DISPO_DEB		TIME				null,
	PIECE_DISPO_FIN		TIME				null check(PIECE_DISPO_DEB<PIECE_DISPO_FIN),
	PAV_PARENT			CHAR(2)				null,
	PIECE_PARENT		CHAR(5)				null,
	constraint PK_PIECE primary key (PAV_ID, PIECE_ID)
);

/*==============================================================*/
/* Index: PIECE_PK                                              */
/*==============================================================*/
create unique index PIECE_PK on PIECE (
PAV_ID,
PIECE_ID
);

/*==============================================================*/
/* Index: FCT_LIAISON_FK                                        */
/*==============================================================*/
create  index FCT_LIAISON_FK on PIECE (
FCT_NUM
);

/*==============================================================*/
/* Index: EST_DANS_PAVILLON_FK                                  */
/*==============================================================*/
create  index EST_DANS_PAVILLON_FK on PIECE (
PAV_ID
);

create  index PARENT_PIECE_FK on PIECE (
										PAV_PARENT,
										PIECE_PARENT
	);

/*==============================================================*/
/* Table: RESERVATION                                           */
/*==============================================================*/
create table RESERVATION (
   PAV_ID               CHAR(2)              not null,
   PIECE_ID             CHAR(5)              not null,
   USAGER_CIP           CHAR(8)              not null,
   RESERV_DEB           TIMESTAMP WITHOUT TIME ZONE                 not null,
   RESERV_FIN           TIMESTAMP WITHOUT TIME ZONE                 not null,
   RESERV_LABEL         TEXT                 null,
   constraint PK_RESERVATION primary key (PAV_ID, PIECE_ID, USAGER_CIP, RESERV_DEB, RESERV_FIN)
);

/*==============================================================*/
/* Index: RESERVATION_PK                                        */
/*==============================================================*/
create unique index RESERVATION_PK on RESERVATION (
PAV_ID,
PIECE_ID,
USAGER_CIP,
RESERV_DEB,
RESERV_FIN
);

create index RESERVATION_DATE_ORDRE on RESERVATION (
RESERV_DEB,
RESERV_FIN
);

/*==============================================================*/
/* Index: PIECE_RESERVEE_FK                                     */
/*==============================================================*/
create  index PIECE_RESERVEE_FK on RESERVATION (
PAV_ID,
PIECE_ID
);

/*==============================================================*/
/* Index: USAGER_RESERVE_FK                                     */
/*==============================================================*/
create  index USAGER_RESERVE_FK on RESERVATION (
USAGER_CIP
);

/*==============================================================*/
/* Table: STATUT                                                */
/*==============================================================*/
create table STATUT (
   STATUT_ID            INTEGER              not null,
   STATUT_LABEL         TEXT                 not null,
   STATUT_INSCRIPTION   TIMESTAMP WITHOUT TIME ZONE                 not null default 'NOW()',
   constraint PK_STATUT primary key (STATUT_ID)
);

/*==============================================================*/
/* Index: STATUT_PK                                             */
/*==============================================================*/
create unique index STATUT_PK on STATUT (
STATUT_ID
);

/*==============================================================*/
/* Table: TEMPS_AVANCE                                          */
/*==============================================================*/
create table TEMPS_AVANCE (
   DEPARTEMENT_ID       INTEGER              not null,
   STATUT_ID            INTEGER              not null,
   FCT_NUM              CHAR(4)              not null,
   TEMPS_AVANCE_PERMIS  INTERVAL                 null,
   constraint PK_TEMPS_AVANCE primary key (DEPARTEMENT_ID, STATUT_ID, FCT_NUM)
);

/*==============================================================*/
/* Index: TEMPS_AVANCE_PK                                       */
/*==============================================================*/
create unique index TEMPS_AVANCE_PK on TEMPS_AVANCE (
DEPARTEMENT_ID,
STATUT_ID,
FCT_NUM
);

/*==============================================================*/
/* Index: TEMPS_AVANCE_FK                                       */
/*==============================================================*/
create  index TEMPS_AVANCE_FK on TEMPS_AVANCE (
DEPARTEMENT_ID
);

/*==============================================================*/
/* Index: TEMPS_AVANCE2_FK                                      */
/*==============================================================*/
create  index TEMPS_AVANCE2_FK on TEMPS_AVANCE (
STATUT_ID
);

/*==============================================================*/
/* Index: TEMPS_AVANCE3_FK                                      */
/*==============================================================*/
create  index TEMPS_AVANCE3_FK on TEMPS_AVANCE (
FCT_NUM
);

/*==============================================================*/
/* Table: USAGER                                                */
/*==============================================================*/
create table USAGER (
   USAGER_CIP           CHAR(8)              not null,
   DEPARTEMENT_ID       INTEGER              null,
   USAGER_NOM           TEXT                 not null,
   USAGER_PRENOM        TEXT                 not null,
   USAGER_INSCRIPTION   TIMESTAMP WITHOUT TIME ZONE                 not null default 'NOW()',
   constraint PK_USAGER primary key (USAGER_CIP)
);

/*==============================================================*/
/* Index: USAGER_PK                                             */
/*==============================================================*/
create unique index USAGER_PK on USAGER (
USAGER_CIP
);

/*==============================================================*/
/* Index: APPARTENANCE_FK                                       */
/*==============================================================*/
create  index APPARTENANCE_FK on USAGER (
DEPARTEMENT_ID
);

alter table CARAC_LISTE_LIAISON
   add constraint FK_CARAC_LI_CARAC_LIS_CARACTER foreign key (CARACTERISTIQUE_ID)
      references CARACTERISTIQUE (CARACTERISTIQUE_ID)
      on delete restrict on update restrict;

alter table CARAC_LISTE_LIAISON
   add constraint FK_CARAC_LI_CARAC_LIS_PIECE foreign key (PAV_ID, PIECE_ID)
      references PIECE (PAV_ID, PIECE_ID)
      on delete restrict on update restrict;

alter table EST_DE_STATUT
   add constraint FK_EST_DE_S_EST_DE_ST_STATUT foreign key (STATUT_ID)
      references STATUT (STATUT_ID)
      on delete restrict on update restrict;

alter table EST_DE_STATUT
   add constraint FK_EST_DE_S_EST_DE_ST_USAGER foreign key (USAGER_CIP)
      references USAGER (USAGER_CIP)
      on delete restrict on update restrict;

alter table PIECE
   add constraint FK_PIECE_EST_DANS__PAVILLON foreign key (PAV_ID)
      references PAVILLON (PAV_ID)
      on delete restrict on update restrict;

alter table PIECE
   add constraint FK_PIECE_FCT_LIAIS_FONCTION foreign key (FCT_NUM)
      references FONCTION (FCT_NUM)
      on delete restrict on update restrict;

-- adding children
alter table PIECE
	add constraint FK_PIECE_PARENT_PI_PIECE foreign key (PAV_PARENT, PIECE_PARENT)
		references PIECE (PAV_ID, PIECE_ID)
		on delete restrict on update restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_PIECE_RES_PIECE foreign key (PAV_ID, PIECE_ID)
      references PIECE (PAV_ID, PIECE_ID)
      on delete restrict on update restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_USAGER_RE_USAGER foreign key (USAGER_CIP)
      references USAGER (USAGER_CIP)
      on delete restrict on update restrict;

alter table TEMPS_AVANCE
   add constraint FK_TEMPS_AV_TEMPS_AVA_DEPARTEM foreign key (DEPARTEMENT_ID)
      references DEPARTEMENT (DEPARTEMENT_ID)
      on delete restrict on update restrict;

alter table TEMPS_AVANCE
   add constraint FK_TEMPS_AV_TEMPS_AVA_STATUT foreign key (STATUT_ID)
      references STATUT (STATUT_ID)
      on delete restrict on update restrict;

alter table TEMPS_AVANCE
   add constraint FK_TEMPS_AV_TEMPS_AVA_FONCTION foreign key (FCT_NUM)
      references FONCTION (FCT_NUM)
      on delete restrict on update restrict;

alter table USAGER
   add constraint FK_USAGER_APPARTENA_DEPARTEM foreign key (DEPARTEMENT_ID)
      references DEPARTEMENT (DEPARTEMENT_ID)
      on delete restrict on update restrict;

