public class AccountDAO {

	private static final AccountDAO instance = new AccountDAO();

	public static AccountDAO getInstance() {
		return instance;
	}

	public List<Account> buscarContaPorId(Id contaId) {
		return [SELECT 
					Id, 
					Name, 
					LastModifiedDate 
				FROM 
					Account 
				WHERE 
					Id =: contaId 
				LIMIT 1
		];
	}

	public List<AccountHistory> buscarHistoricoPorEndereco(Id contaId) {
		return [SELECT 
					Field, 
					CreatedById, 
					CreatedDate, 
					AccountId, 
					NewValue, 
					OldValue 
				FROM 
					AccountHistory 
				WHERE 
					(Field = 'Endereco__c' OR Field = 'created') 
				AND 
					AccountId =: contaId 
				Order By 
					CreatedDate desc 
				LIMIT 1
		];
	}
}