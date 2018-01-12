public class CasoDAO {

	private static final CasoDAO instance = new CasoDAO();

	public static CasoDAO getInstance() {
		return instance;
	}

	public List<Case> buscarCasosAbertos(){
		return [SELECT
					Id,
					CaseNumber,
					Type,
					Priority,
					Subject,
					Status,
					Reason,
					Origin
				FROM
					Case
				WHERE
					Status != 'Closed'
		];	
	}

	public Case buscarCasoPorId(Id casoId) {
		return [SELECT
					Id,
					AccountId
				FROM
					Case
				WHERE
					Id =: casoId
				LIMIT 1
		];
	}

	public List<Case> buscarCasosPorAccountId(Id accountId){
		return [SELECT 
					Id, 
					Type, 
					AccountId 
				FROM 
					Case 
				WHERE 
					AccountId =: accountId
		];
	}
	
	public List<Case> buscarCasos(String status, String analista){
		return [SELECT
					Id,
					CaseNumber,
					Type,
					Priority,
					Subject,
					Status,
					Reason,
					Origin
				FROM
					Case
				WHERE
					Status =: status
		];	
	}
}