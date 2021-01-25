package com.sga.entities;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.PastOrPresent;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "LigneFonctions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LigneFonction implements Serializable {
	private static final long serialVersionUID = -2509167196362627083L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idLigneFonction;
	@NotEmpty(message = "Merci d'entrer la date de debut.")
	@PastOrPresent(message = "la date de debut est incorrecte.")
	private LocalDate dateDebut;
	@NotEmpty(message = "Merci d'entrer la date de fin.")
	private LocalDate dateFin;
}
