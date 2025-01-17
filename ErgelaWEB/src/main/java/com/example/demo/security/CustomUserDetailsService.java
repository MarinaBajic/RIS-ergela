package com.example.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ErgelaKorisnikRepository;

import model.ErgelaKorisnik;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private ErgelaKorisnikRepository korisnikRepo;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		ErgelaKorisnik korisnik = korisnikRepo.findByKorisnickoIme(username);
		UserDetailsImpl userDetails = new UserDetailsImpl();
		userDetails.setUsername(korisnik.getKorisnickoIme());
		userDetails.setPassword(korisnik.getLozinka());
		userDetails.setRoles(korisnik.getUlogas());
		return userDetails;
	}
}
