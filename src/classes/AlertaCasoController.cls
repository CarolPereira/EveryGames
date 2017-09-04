public class AlertaCasoController {
	public AlertaCasoController(ApexPages.StandardController stdController) {}

	public AlertaCasoController(){}

	@remoteAction
	public static List<Case> buscarCasosAbertos(){
		// Busca casos com status diferente de closed
		return CasoDAO.getInstance().buscarCasosAbertos();
	}
	
	@remoteAction
	public static List<Schema.PicklistEntry> buscarFiltroTipo(){
		return Case.Type.getDescribe().getPicklistValues();
	}
}