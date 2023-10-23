package com.jsfcourse.calc;

import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.inject.Inject;
import jakarta.inject.Named;

@Named
@RequestScoped
public class KredytBB {
	private String kwota;
	private String okres;
	private String oprocentowanie;
	private Double rata;

	@Inject
	FacesContext ctx;

	

	public String getKwota() {
		return kwota;
	}

	public void setKwota(String kwota) {
		this.kwota = kwota;
	}

	public String getOkres() {
		return okres;
	}

	public void setOkres(String okres) {
		this.okres = okres;
	}

	public String getOprocentowanie() {
		return oprocentowanie;
	}

	public void setOprocentowanie(String oprocentowanie) {
		this.oprocentowanie = oprocentowanie;
	}

	public Double getRata() {
		return rata;
	}

	public void setRata(Double rata) {
		this.rata = rata;
	}
	
	public String calc() {
		try {
			double kwota = Double.parseDouble(this.kwota);
			double okres = Double.parseDouble(this.okres);
			double oprocentowanie = Double.parseDouble(this.oprocentowanie);

			rata = (kwota + (kwota * (oprocentowanie / 100))) / okres;
			

			ctx.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Poprawnie obliczono rate", null));
			return "showresult";
		} catch (Exception e) {
			ctx.addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd przetwarzania parametrów", null));
			return null;
		}
	}

	

}
