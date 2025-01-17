package com.example.demo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Jahac;
import model.Konj;
import model.Trening;

public interface TreningRepository extends JpaRepository<Trening, Integer> {

	public List<Trening> findAllByDatumAndJahacAndKonj(Date datum, Jahac jahac, Konj konj);

	public List<Trening> findAllByJahac(Jahac jahac);
	
	public List<Trening> findAllByOrderByDatum();
}
