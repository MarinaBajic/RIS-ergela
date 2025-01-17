package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.KonjRepository;
import com.example.demo.repository.RasaRepository;

import model.Konj;
import model.Rasa;

@Controller
@RequestMapping("/nereg")
public class NeregistrovanKontroler {

	@Autowired
	KonjRepository konjRepo;

	@Autowired
	RasaRepository rasaRepo;

	@GetMapping("/getSviKonji")
	public String getSviKonji(HttpServletRequest request) {
		List<Konj> konji = konjRepo.findAll();

		if (konji != null)
			request.getSession().setAttribute("sviKonji", konji);
		else
			request.setAttribute("porukaSviKonji", "Greska u prikazu svih konja!");

		return "prikaz/PrikazSvihKonja";
	}

	@GetMapping("/pronadjiKonjaNadimak")
	private String pronadjiKonjaNadimak() {
		return "pretraga/PronadjiKonjaPoNadimku";
	}

	@GetMapping("/findKonjaNadimak")
	private String findKonjaNadimak(String nadimak, HttpServletRequest request) {
		Konj konj = konjRepo.findByNadimak(nadimak);
		
		if (konj != null)
			request.setAttribute("konjNadimak", konj);
		else
			request.setAttribute("porukaKonjNadimak", "Greska! Nije pronadjen konj sa tim nadimkom!");

		return "pretraga/PronadjiKonjaPoNadimku";
	}

	@GetMapping("/pronadjiKonjeRasa")
	private String pronadjiKonjeRasa() {
		return "pretraga/PronadjiKonjePoRasi";
	}

	@GetMapping("/findKonjeRasa")
	private String findKonjeRasa(String nazivRase, HttpServletRequest request) {
		String porukaKonjiRasa = null;
		Rasa rasa = rasaRepo.findByNaziv(nazivRase);
		
		if (rasa == null)
			porukaKonjiRasa = "Greska! Ne postoji rasa sa tim nazivom!";
		else {
			List<Konj> konji = konjRepo.findByRasa(rasa);
			
			if (konji == null || konji.isEmpty())
				porukaKonjiRasa = "Greska! Nije pronadjen nijedan konj te rase!";
			else
				request.setAttribute("konjiRasa", konji);
		}
		request.setAttribute("porukaKonjiRasa", porukaKonjiRasa);
		
		return "pretraga/PronadjiKonjePoRasi";
	}
}
