public class BarraAlertasController {
    public BarraAlertasController(ApexPages.StandardController stdController) {}

    public BarraAlertasController() {}

    @remoteAction 
	public static List<Alerta__c> buscarAlertas(){
		return [SELECT
					Id,
					Mensagem__c,
					Exibir__c
				FROM
					Alerta__c
				WHERE
					Exibir__c = true];
	}
}