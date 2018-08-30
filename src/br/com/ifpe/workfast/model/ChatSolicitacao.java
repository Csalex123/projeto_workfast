package br.com.ifpe.workfast.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "chatSolicitacao")
public class ChatSolicitacao {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int idChat;
	
	
	@Column
	private String mensagem;
	
	
	@Column(name="novo")
	private String novaMensagem;
	
	@Column(name="data")
	private Date dataPostagem;
	
	@ManyToOne
	@JoinColumn(name="fk_solicitacao")
	private SolicitacaoContrato solicitacaoContrato;
	
	@ManyToOne
	@JoinColumn(name="fk_prestador")
	private Usuario usuarioPrestador;
	
	@ManyToOne
	@JoinColumn(name="fk_cliente")
	private Usuario usuarioCliente;

	public int getIdChat() {
		return idChat;
	}

	public void setIdChat(int idChat) {
		this.idChat = idChat;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public String getNovaMensagem() {
		return novaMensagem;
	}

	public void setNovaMensagem(String novaMensagem) {
		this.novaMensagem = novaMensagem;
	}

	public Date getDataPostagem() {
		return dataPostagem;
	}

	public void setDataPostagem(Date dataPostagem) {
		this.dataPostagem = dataPostagem;
	}

	public SolicitacaoContrato getSolicitacaoContrato() {
		return solicitacaoContrato;
	}

	public void setSolicitacaoContrato(SolicitacaoContrato solicitacaoContrato) {
		this.solicitacaoContrato = solicitacaoContrato;
	}

	public Usuario getUsuarioPrestador() {
		return usuarioPrestador;
	}

	public void setUsuarioPrestador(Usuario usuarioPrestador) {
		this.usuarioPrestador = usuarioPrestador;
	}

	public Usuario getUsuarioCliente() {
		return usuarioCliente;
	}

	public void setUsuarioCliente(Usuario usuarioCliente) {
		this.usuarioCliente = usuarioCliente;
	}
	
	

	
	
}
