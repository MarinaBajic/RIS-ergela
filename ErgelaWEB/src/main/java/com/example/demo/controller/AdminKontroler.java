package com.example.demo.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.JahacRepository;
import com.example.demo.repository.KonjRepository;
import com.example.demo.repository.RasaRepository;
import com.example.demo.repository.TrenerRepository;
import com.example.demo.repository.TreningRepository;

import model.Jahac;
import model.Konj;
import model.Rasa;
import model.Trener;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
@RequestMapping("/admin")
public class AdminKontroler {

	@Autowired
	TrenerRepository trenerRepo;
	
	@Autowired
	TreningRepository treningRepo;
	
	@Autowired
	JahacRepository jahacRepo;
	
	@Autowired
	RasaRepository rasaRepo;
	
	@Autowired
	KonjRepository konjRepo;
	
	@GetMapping("/getSviTreneri")
	public String getSviTreneri(HttpServletRequest request) {
		List<Trener> treneri = trenerRepo.findAll();
		request.setAttribute("sviTreneri", treneri);
		return "unos/UnosJahaca";
	}
	
	@PostMapping("/unesiJahaca")
	public String unesiJahaca(String ime, String prezime, String adresa, Date datumRodjenja, Integer idTrener, HttpServletRequest request) {
		Trener trener = trenerRepo.findById(idTrener).get();
		
		Jahac j = new Jahac();
		j.setIme(ime);
		j.setPrezime(prezime);
		j.setAdresa(adresa);
		j.setDatumRodjenja(datumRodjenja);
		j.setDatumUpisa(new Date());
		j.setTrener(trener);
		
		Jahac jahac = jahacRepo.save(j);
		
		if (jahac == null)
			request.setAttribute("porukaUnosJahaca", "Greska prilikom unosa jahaca!");
		else
			request.setAttribute("jahacUnos", jahac);
		
		return "unos/UnosJahaca";
	}
	
	@GetMapping("/getSveRase")
	public String getSveRase(HttpServletRequest request) {
		List<Rasa> rase = rasaRepo.findAll();
		request.setAttribute("sveRase", rase);
		return "unos/UnosKonja";
	}
	
	@PostMapping("/unesiKonja")
	public String unesiKonja(String punoIme, String nadimak, String pol, Date datumRodjenja, Integer idRasa, HttpServletRequest request) {
		Rasa rasa = rasaRepo.findById(idRasa).get();
			
		Konj k = new Konj();
		k.setPunoIme(punoIme);
		k.setNadimak(nadimak);
		k.setPol(pol);
		k.setDatumRodjenja(datumRodjenja);
		k.setRasa(rasa);
		
		Konj konj = konjRepo.save(k);
		
		if (konj == null)
			request.setAttribute("porukaUnosKonja", "Greska prilikom unosa konja!");
		else
			request.setAttribute("konjUnos", konj);
		
		return "unos/UnosKonja";
	}
	
	@GetMapping("/unosRase")
	public String unosRase() {
		return "unos/UnosRase";
	}
	
	@PostMapping("/unesiRasu")
	public String unesiRasu(String naziv, String boja, HttpServletRequest request) {
		Rasa r = new Rasa();
		r.setNaziv(naziv);
		r.setBoja(boja);
		
		Rasa rasa = rasaRepo.save(r);
		
		if (rasa == null)
			request.setAttribute("porukaUnosRase", "Greska prilikom unosa rase!");
		else
			request.setAttribute("rasaUnos", rasa);
		
		return "unos/UnosRase";
	}
	
	@GetMapping("/unosTrenera")
	public String unosTrenera() {
		return "unos/UnosTrenera";
	}
	
	@PostMapping("/unesiTrenera")
	public String unesiTrenera(String ime, String prezime, Integer godIskustva, HttpServletRequest request) {
		Trener t = new Trener();
		t.setIme(ime);
		t.setPrezime(prezime);
		t.setGodIskustva(godIskustva);
		
		Trener trener = trenerRepo.save(t);
		
		if (trener == null)
			request.setAttribute("porukaUnosTrenera", "Greska prilikom unosa trenera!");
		else
			request.setAttribute("trenerUnos", trener);
		
		return "unos/UnosTrenera";
	}
	
	@GetMapping("/promeniNadimakKonju")
	public String promeniNadimakKonju(Integer idKonj, HttpServletRequest request) {
		Konj konj = konjRepo.findById(idKonj).get();
		request.getSession().setAttribute("konjUpdate", konj);
		return "promena/PromenaNadimkaKonju";
	}
	
	@PostMapping("/updateKonjNadimak")
	public String updateKonjNadimak(String nadimak, HttpServletRequest request) {
		Konj k = (Konj) request.getSession().getAttribute("konjUpdate");
		k.setNadimak(nadimak);
		
		String porukaKonjUpdate = null;
		Konj konj = konjRepo.save(k);
		if (konj.getNadimak().equals(nadimak))
			porukaKonjUpdate = "Nadimak za konja " + konj.getPunoIme() + " je uspesno promenjen u " + konj.getNadimak() + "!";
		else
			porukaKonjUpdate = "Došlo je do greške prilikom promene nadimka!";
		
		request.setAttribute("porukaKonjUpdate", porukaKonjUpdate);
		
		return "promena/PromenaNadimkaKonju";
	}
	
	@GetMapping("/izvestajSviTreninzi")
	public void izvestajSviTreninzi(HttpServletResponse response) throws JRException, IOException {
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(treningRepo.findAllByOrderByDatum());

		InputStream inStream = getClass().getResourceAsStream("/jasperreports/TreningIzvestaj.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inStream);

		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, dataSource);
		
		response.setContentType("application/x-download");
		response.setHeader("Content-Disposition", "attachment; filename=TreningIzvestaj.pdf");
		
		OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
		
		inStream.close();
		outStream.close();
	}
	
	@GetMapping("/izvestajTreninziZaJahaca")
	public String izvestajTreninziZaJahaca(HttpServletRequest request) {
		List<Jahac> jahaci = jahacRepo.findAll();
		
		if (jahaci == null || jahaci.isEmpty())
			request.setAttribute("porukaIzvestaj", "Nema jahaca u bazi!");
		else
			request.setAttribute("sviJahaci", jahaci);
		
		return "izvestaji/OdabirJahacaZaIzvestaj";
	}
	
	@GetMapping("/generisiIzvestajTreninziZaJahaca")
	public void izvestajTreninziZaJahaca(Integer idJahac, HttpServletResponse response) throws JRException, IOException {
		Jahac jahac = jahacRepo.findById(idJahac).get();
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(treningRepo.findAllByJahac(jahac));

		InputStream inStream = getClass().getResourceAsStream("/jasperreports/TreningJahacIzvestaj.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inStream);

		Map<String, Object> parameters = new HashMap<>();
		parameters.put("imePrezimeJahaca", jahac.getIme() + " " + jahac.getPrezime());
		parameters.put("datumRodjenja", jahac.getDatumRodjenja());
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
		
		response.setContentType("application/x-download");
		response.setHeader("Content-Disposition", "attachment; filename=TreningJahacIzvestaj.pdf");
		
		OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
		
		inStream.close();
		outStream.close();
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
