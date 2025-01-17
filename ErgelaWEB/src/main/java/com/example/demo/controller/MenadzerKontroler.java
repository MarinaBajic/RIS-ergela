package com.example.demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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
		
		if (jahaci == null || jahaci.isEmpty())
			request.setAttribute("porukaSviJahaci", "Nema jahaca za prikaz!");
		else
			request.setAttribute("sviJahaci", jahaci);
		
		return "prikaz/PrikazSvihJahaca";
	}
	
	@GetMapping("/pronadjiJahacaPoImenu")
	public String pronadjiJahacaPoImenu() {
		return "pretraga/PronadjiJahacaPoImenu";
	}
	
	@GetMapping("/getJahacIme")
	public String getJahacIme(String ime, String prezime, HttpServletRequest request) {
		Jahac jahac = jahacRepo.findByImeAndPrezime(ime, prezime);
		
		if (jahac == null)
			request.setAttribute("porukaNijeNadjenJahac", "Nije pronadjen jahac sa tim imenom i prezimenom!");
		else
			request.setAttribute("jahacIme", jahac);
		
		return "pretraga/PronadjiJahacaPoImenu";
	}
	
	@GetMapping("/pronadjiTrening")
	public String pronadjiTrening() {
		return "pretraga/PronadjiTrening";
	}
	
	@GetMapping("/getTrening")
	public String getTrening(Date datum, String imePrezime, String nadimak, HttpServletRequest request) {
		List<Trening> treninzi = null;

		String porukaPretragaTreninga = null;
		
		String[] imeIPrezime = imePrezime.trim().split(" ");
		if (imeIPrezime.length < 2)
			porukaPretragaTreninga = "Molim Vas unesite i ime i prezime jahača!";
		
		else {
			Jahac jahac = jahacRepo.findByImeAndPrezime(imeIPrezime[0], imeIPrezime[1]);
			Konj konj = konjRepo.findByNadimak(nadimak);
			
			if (jahac == null)
				porukaPretragaTreninga = "Ne postoji jahac sa tim imenom i prezimenom!";
			if (konj == null)
				porukaPretragaTreninga = "Ne postoji konj sa tim nadimkom!";
			else {
				treninzi = treningRepo.findAllByDatumAndJahacAndKonj(datum, jahac, konj);
				
				if (treninzi == null || treninzi.isEmpty())
					porukaPretragaTreninga = "Nije pronadjen nijedan trening!";
				else
					request.setAttribute("treninziPretraga", treninzi);
			}
		}
		request.setAttribute("porukaPretragaTreninga", porukaPretragaTreninga);

		return "pretraga/PronadjiTrening";
	}
	
	@GetMapping("/getJahaciAndKonji")
	public String getJahaciAndKonji(HttpServletRequest request) {
		List<Jahac> jahaci = jahacRepo.findAll();
		List<Konj> konji = konjRepo.findAll();

		request.getSession().setAttribute("sviJahaci", jahaci);
		request.getSession().setAttribute("sviKonji", konji);

		return "unos/UnosTreninga";
	}
	
	@GetMapping("/obrisiTrening")
	public String obrisiTrening(Integer idTrening, HttpServletRequest request) {
		Trening trening = treningRepo.findById(idTrening).get();
		treningRepo.delete(trening);
		
		String porukaTreningObrisan = "";
		if (treningRepo.findById(idTrening).isEmpty())
			porukaTreningObrisan = "Trening je uspešno obrisan";
		else
			porukaTreningObrisan = "Greška tokom brisanja treninga!";
	
		request.setAttribute("porukaTreningObrisan", porukaTreningObrisan);
		
		return "prikaz/PrikazSvihTreninga";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
