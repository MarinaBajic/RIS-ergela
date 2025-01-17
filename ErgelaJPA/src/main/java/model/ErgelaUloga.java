package model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the ergela_uloga database table.
 * 
 */
@Entity
@Table(name="ergela_uloga")
@NamedQuery(name="ErgelaUloga.findAll", query="SELECT e FROM ErgelaUloga e")
public class ErgelaUloga implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUloga;

	private String naziv;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="ERGELA_KORISNIK_ULOGA", joinColumns = @JoinColumn(name = "idUloga", referencedColumnName = "idUloga"), inverseJoinColumns = @JoinColumn(name = "idKorisnik"))
	private Set<ErgelaKorisnik> korisniks = new HashSet<>();

	public ErgelaUloga() {
	}

	public int getIdUloga() {
		return this.idUloga;
	}

	public void setIdUloga(int idUloga) {
		this.idUloga = idUloga;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}
	
	public Set<ErgelaKorisnik> getKorisniks() {
		return korisniks;
	}

	public void setKorisniks(Set<ErgelaKorisnik> korisniks) {
		this.korisniks = korisniks;
	}
	public void addKorisnik(ErgelaKorisnik k) {
		this.korisniks.add(k);
	}

}