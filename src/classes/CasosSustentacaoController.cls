public class CasosSustentacaoController {
	public CasosSustentacaoController(ApexPages.StandardController stdController) {}

	public CasosSustentacaoController() {}

	@remoteAction
	public static List<Case> buscarCasos(String status, String analista) {
		//Buscar casos por status e analista
		return CasoDAO.getInstance().buscarCasos(status,analista);
	}
}