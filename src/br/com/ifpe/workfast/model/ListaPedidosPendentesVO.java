package br.com.ifpe.workfast.model;

import java.sql.Date;

public class ListaPedidosPendentesVO {
  
	private Integer idProposta;
	private Integer idPrestadorServico;
	private String nome;
	private String nomeFantasia;
	private String tipoUsuario;
	private String servico;
	private String rua;
	private String numeroCasa;
	private String cep;
	private String cidade;
	private String estado;
	private String convite;
	private Date data;
	
	
	
	public ListaPedidosPendentesVO(Integer idProposta, Integer idPrestadorServico, String nome,
			String nomeFantasia, String tipoUsuario, String servico, String rua, String numeroCasa, String cep,
			String cidade, String estado, String convite) {
		super();
		this.idProposta = idProposta;
		this.idPrestadorServico = idPrestadorServico;
		this.nome = nome;
		this.nomeFantasia = nomeFantasia;
		this.tipoUsuario = tipoUsuario;
		this.servico = servico;
		this.rua = rua;
		this.numeroCasa = numeroCasa;
		this.cep = cep;
		this.cidade = cidade;
		this.estado = estado;
		this.convite = convite;
		
		
	}
	public Integer getIdProposta() {
		return idProposta;
	}
	public void setIdProposta(Integer idProposta) {
		this.idProposta = idProposta;
	}
	public Integer getIdPrestadorServico() {
		return idPrestadorServico;
	}
	public void setIdPrestadorServico(Integer idPrestadorServico) {
		this.idPrestadorServico = idPrestadorServico;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNomeFantasia() {
		return nomeFantasia;
	}
	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}
	public String getTipoUsuario() {
		return tipoUsuario;
	}
	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
	public String getServico() {
		return servico;
	}
	public void setServico(String servico) {
		this.servico = servico;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public String getNumeroCasa() {
		return numeroCasa;
	}
	public void setNumeroCasa(String numeroCasa) {
		this.numeroCasa = numeroCasa;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getConvite() {
		return convite;
	}
	public void setConvite(String convite) {
		this.convite = convite;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	
	


	
	
	
	
	
	
	
}
