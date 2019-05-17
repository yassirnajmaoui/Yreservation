
/* Procedure/trigger description:
    Adds log_entry in Journal when adding a new status in the
    status table
*/
------------------------------------------------------------------------------------------------------------------------
drop FUNCTION if exists log_added_status() cascade;
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION log_added_status()
    RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO 
        journal(log_entry, log_time)
    values
        ('added new status: ' || new.statut_label , now());
    return NEW;
END;
$$
LANGUAGE plpgsql;
------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER log_adding_status
    AFTER INSERT
    ON statut
    FOR EACH row
    EXECUTE PROCEDURE log_added_status();
------------------------------------------------------------------------------------------------------------------------

/* Procedure/trigger description:
    TODO
*/
------------------------------------------------------------------------------------------------------------------------
drop FUNCTION if exists is_taken(p_pav_id char(2), p_piece_id char(5), p_reserv_deb timestamp, p_reserv_fin timestamp) cascade;
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION is_taken(p_pav_id char(2), p_piece_id char(5), p_reserv_deb timestamp, p_reserv_fin timestamp)
	RETURNS bool AS $$
BEGIN
	IF(p_piece_id IS NULL) THEN
		RETURN FALSE;
	END IF;
	IF(EXISTS(
			SELECT res.reserv_deb, res.reserv_fin from
				reservation as res
			WHERE (p_piece_id=res.piece_id AND p_pav_id=res.pav_id) AND (
					(res.reserv_deb <= p_reserv_deb AND res.reserv_fin > p_reserv_deb)
					OR (res.reserv_deb >= p_reserv_deb AND res.reserv_deb < p_reserv_fin))
		)) THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
	LANGUAGE plpgsql;
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
drop FUNCTION if exists reservation_dispo() cascade;
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION reservation_dispo()
	RETURNS TRIGGER AS $$
	declare parent_id char(5);
	declare parent_pav char(2);
	declare son_avance_permise interval;
	declare son_departement INTEGER;
	declare son_statut INTEGER;
	declare sa_piece_fonction char(4);
	declare sa_piece_dispo_deb time;
	declare sa_piece_dispo_fin time;
	declare temprow piece%rowtype;
BEGIN
	SELECT pav_parent,piece_parent,fct_num,piece_dispo_deb,piece_dispo_fin
	    into parent_pav,parent_id,sa_piece_fonction,sa_piece_dispo_deb,sa_piece_dispo_fin
		from piece
			where piece.piece_id=NEW.piece_id and piece.pav_id=NEW.pav_id;
	SELECT departement_id into son_departement from usager where usager.usager_cip=NEW.usager_cip;
	SELECT statut_id into son_statut from est_de_statut where est_de_statut.usager_cip=NEW.usager_cip;
	SELECT temps_avance_permis into son_avance_permise
		from temps_avance as t
			where t.departement_id=son_departement and t.statut_id=son_statut and t.fct_num=sa_piece_fonction;
	-- Check if you're too early
	IF((NEW.reserv_fin - now() > son_avance_permise) or (son_avance_permise is null)) THEN RETURN OLD; END IF;
	-- Check if you're withing the range of availability of the room
	IF( sa_piece_dispo_deb is not null and sa_piece_dispo_fin is not null and (
	    (cast(NEW.reserv_deb as time) not between sa_piece_dispo_deb and sa_piece_dispo_fin) or
	    (cast(NEW.reserv_fin as time) not between sa_piece_dispo_deb and sa_piece_dispo_fin))) THEN
	    RETURN OLD; END IF;
	-- Check if children are also available
	FOR temprow IN
		select pav_id,piece_id from
			piece where piece.piece_parent = NEW.piece_id and piece.pav_parent = NEW.pav_id
		LOOP
			if(is_taken(temprow.pav_id, temprow.piece_id, NEW.reserv_deb, NEW.reserv_fin)) then return old; end if;
		END LOOP;
	IF(
		-- Find ERRORS HERE
			NEW.reserv_fin <= NEW.reserv_deb
			OR
			(cast(NEW.reserv_deb as date) != cast(NEW.reserv_fin as date))
			OR
			(is_taken(NEW.pav_id, NEW.piece_id, NEW.reserv_deb, NEW.reserv_fin))
		-- Check parent rooms
			OR
			(is_taken(parent_pav, parent_id, NEW.reserv_deb, NEW.reserv_fin))
		) THEN
		return OLD;
	ELSE
		return NEW;
	END IF;
END;
$$
	LANGUAGE plpgsql;
------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER reservation_dispo
	BEFORE INSERT OR UPDATE
	ON reservation
	FOR EACH row
EXECUTE PROCEDURE reservation_dispo();
------------------------------------------------------------------------------------------------------------------------

/* Procedure/trigger description:
    Write to journal when a reservation is updated or deleted
*/
------------------------------------------------------------------------------------------------------------------------
drop FUNCTION if exists log_reserv_update_remove() cascade;
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION log_reserv_update_remove()
    RETURNS TRIGGER AS $$
BEGIN
    if(tg_op = 'UPDATE') THEN
        INSERT INTO
            journal(log_entry, log_time)
        values
            ('Reservation of ' || old.usager_cip  || ': ' || old.pav_id || '-' || old.piece_id ||
             ', '|| old.reserv_deb || '--' || old.reserv_fin || ' was updated to '
                 || new.reserv_deb || '--' || new.reserv_fin, now());
    END IF;
    IF(tg_op = 'DELETE') THEN
        INSERT INTO
            journal(log_entry, log_time)
        values
        ('Reservation of ' || old.usager_cip  || ': ' || old.pav_id || '-' || old.piece_id ||
         ', '|| old.reserv_deb || '--' || old.reserv_fin || ' was deleted', now());
    END IF ;
    return NEW;
END;
$$
    LANGUAGE plpgsql;
------------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER reserv_update_or_remove
    AFTER UPDATE OR DELETE
    ON reservation
    FOR EACH row
EXECUTE PROCEDURE log_reserv_update_remove();
------------------------------------------------------------------------------------------------------------------------

/* Procedure/trigger description:
    TODO
*/
------------------------------------------------------------------------------------------------------------------------
drop FUNCTION if exists TABLEAU(debut timestamp, fin timestamp, categorie char(4)) cascade;
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION TABLEAU(debut timestamp, fin timestamp, categorie char(4))
	RETURNS TABLE(	c_pav_id char(2), c_piece_id char(5),
					c_reserv_deb timestamp, c_reserv_label text, c_reserv_label_cubicules text)
	AS $$
BEGIN
    DROP TABLE IF EXISTS c_horaire_temp;
	CREATE temporary TABLE c_horaire_temp
	(   c_reserv_deb timestamp not null,
	    c_reserv_label text null,
		c_reserv_label_cubicules text null);
	INSERT INTO c_horaire_temp
		SELECT plage_hor FROM generate_series(debut,fin, interval '15 minutes') tmp(plage_hor);

	DROP TABLE IF EXISTS c_tableau_result;
	CREATE temporary TABLE c_tableau_result
	(	c_pav_id char(2),
		c_piece_id char(5),
		c_reserv_deb timestamp not null,
		c_reserv_label text null,
		 c_reserv_label_cubicules text null);
	INSERT INTO c_tableau_result
	SELECT p.pav_id,p.piece_id,hor.c_reserv_deb,hor.c_reserv_label,hor.c_reserv_label_cubicules FROM
	    piece as p, c_horaire_temp as hor where p.fct_num=categorie;

	UPDATE c_tableau_result
	SET
		c_reserv_label = concat('- Reservation - ', reservation.reserv_label)
	FROM
		 reservation
	where
			reservation.piece_id = c_tableau_result.c_piece_id
		and	reservation.pav_id = c_tableau_result.c_pav_id
		and	reservation.reserv_deb <= c_tableau_result.c_reserv_deb
		and	reservation.reserv_fin >= (c_tableau_result.c_reserv_deb + interval '15min');
	-- add notice if PARENT is scheduled
	UPDATE c_tableau_result
	SET
		c_reserv_label_cubicules = concat('- Reservation parent - ', reservation.reserv_label)
	FROM
		reservation
	where
			reservation.piece_id = (select piece_parent from piece as p
			where c_tableau_result.c_piece_id = p.piece_id and c_tableau_result.c_pav_id = p.pav_id)
	  and	reservation.pav_id = (select pav_parent from piece as p
			where c_tableau_result.c_piece_id = p.piece_id and c_tableau_result.c_pav_id = p.pav_id)
	  and	reservation.reserv_deb <= c_tableau_result.c_reserv_deb
	  and	reservation.reserv_fin >= (c_tableau_result.c_reserv_deb + interval '15min');
	-- add notice if CHILD is scheduled
	UPDATE c_tableau_result
	SET
		c_reserv_label_cubicules = concat('- Un ou des cubicules ont été reservés -')
	FROM
		reservation
	where
			reservation.piece_id in (select p.piece_id from piece as p
			where c_tableau_result.c_piece_id = p.piece_parent and c_tableau_result.c_pav_id = p.pav_parent)
	  and	reservation.pav_id in (select p.pav_id from piece as p
			where c_tableau_result.c_piece_id = p.piece_parent and c_tableau_result.c_pav_id = p.pav_parent)
	  and	reservation.reserv_deb <= c_tableau_result.c_reserv_deb
	  and	reservation.reserv_fin >= (c_tableau_result.c_reserv_deb + interval '15min');

	RETURN QUERY SELECT * FROM c_tableau_result order by c_piece_id,c_reserv_deb;
END;
$$
	LANGUAGE plpgsql;

