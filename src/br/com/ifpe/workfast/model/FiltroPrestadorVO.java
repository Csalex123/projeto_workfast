package br.com.ifpe.workfast.model;

public class FiltroPrestadorVO {
	

	private String servico;
	private String categoria;
	private String usuario;
	private String foto;
	private String nomeFantasia;
	private String localizacao;
	

	public FiltroPrestadorVO(String servico, String categoria, String usuario, String foto, String nomeFantasia,
			String localizacao) {
		super();
		this.servico = servico;
		this.categoria = categoria;
		this.usuario = usuario;
		this.foto = foto;
		this.nomeFantasia = nomeFantasia;
		this.localizacao = localizacao;
	}


	public String getServico() {
		return servico;
	}


	public void setServico(String servico) {
		this.servico = servico;
	}


	public String getCategoria() {
		return categoria;
	}


	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}


	public String getUsuario() {
		return usuario;
	}


	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}


	public String getFoto() {
		return foto;
	}


	public void setFoto(String foto) {
		this.foto = foto;
	}


	public String getNomeFantasia() {
		return nomeFantasia;
	}


	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}


	public String getLocalizacao() {
		return localizacao;
	}


	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}

	

}
