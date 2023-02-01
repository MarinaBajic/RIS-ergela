package com.example.demo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.JahacRepository;
import com.example.demo.repository.KonjRepository;
import com.example.demo.repository.TreningRepository;

import model.Jahac;
import model.Konj;
import model.Trening;

@Controller
@RequestMapping("/menadzeri")
public class MenadzerKontroler {
	
	@Autowired
	JahacRepository jahacRepo;
	
	@Autowired
	KonjRepository konjRepo;
	
	@Autowired
	TreningRepository treningRepo;

	@GetMapping("/getSviJahaci")
	public String getSviJahaci(HttpServletRequest request) {
		List<Jahac> jahaci = jahacRepo.findAll();
		request.getSession().setAttribute("jahaci", jahaci);
		return "prikaz/PrikazSvihJahaca";
	}
	
	@GetMapping("/getSviKonji")
	public String getSviKonji(HttpServletRequest request) {
		List<Konj> konji = konjRepo.findAll();
		request.getSession().setAttribute("konji", konji);
		return "prikaz/PrikazSvihKonja";
	}
	
	@GetMapping("/getSviTreninzi")
	public String getSviTreninzi(HttpServletRequest request) {
		List<Trening> treninzi = treningRepo.findAll();
		request.setAttribute("treninzi", treninzi);
		return "prikaz/PrikazSvihTreninga";
	}
	
	@GetMapping("/pronadjiJahacaPoImenu")
	public String pronadjiJahacaPoImenu() {
		return "pretraga/PronadjiJahacaPoImenu";
	}
	
	@GetMapping("/getJahacIme")
	public String getJahacIme(String ime, String prezime, HttpServletRequest request) {
		Jahac jahac = jahacRepo.findByImeAndPrezime(ime, prezime);
		request.setAttribute("jahac", jahac);
		return "pretraga/PronadjiJahacaPoImenu";
	}
	
	@GetMapping("/pronadjiTrening")
	public String pronadjiTrening() {
		return "pretraga/PronadjiTrening";
	}
	
	@GetMapping("/getTrening")
	public String getTrening(Date datum, String imePrezime, String nadimak, HttpServletRequest request) {
		List<Trening> treninzi = null;

		String[] imeIPrezime = imePrezime.trim().split(" ");
		Jahac jahac = jahacRepo.findByImeAndPrezime(imeIPrezime[0], imeIPrezime[1]);
		Konj konj = konjRepo.findByNadimak(nadimak);

		treninzi = treningRepo.findAllByDatumAndJahacAndKonj(datum, jahac, konj);

		request.getSession().setAttribute("treninzi", treninzi);
		return "pretraga/PronadjiTreningPoDatumu";
	}
	
	@GetMapping("/getJahaciAndKonji")
	public String getJahaciAndKonji(HttpServletRequest request) {
		List<Jahac> jahaci = jahacRepo.findAll();
		List<Konj> konji = konjRepo.findAll();

		request.setAttribute("jahaci", jahaci);
		request.getSession().setAttribute("konji", konji);

		return "unos/UnosTreninga";
	}
	
	@GetMapping("/obrisiTrening")
	public String obrisiTrening(Integer idTrening, HttpServletRequest request) {
		Trening trening = treningRepo.findById(idTrening).get();
		treningRepo.delete(trening);
		
		String porukaTreningObrisan = "";
		if (treningRepo.findById(idTrening).isEmpty())
			porukaTreningObrisan = "Trening je uspesno obrisan";
		else
			porukaTreningObrisan = "Greska tokom brisanja treninga!";
	
		request.setAttribute("porukaTreningObrisan", porukaTreningObrisan);
		
		return "prikaz/PrikazSvihTreninga";
	}
}
