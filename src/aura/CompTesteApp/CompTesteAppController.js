({
	init : function(component, event, helper) {
		debugger;
		var idConta = component.get('v.recordId');
		var buscarContatos = component.get('c.buscarContatos');

		buscarContatos.setParams({
			'idConta' : idConta
		});

		buscarContatos.setCallback(this, function(response) {
			var state = response.getState();

			if(component.isValid() && state === 'SUCCESS') {
				var contatos;

				contatos = response.getReturnValue();
				component.set('v.contatos', contatos);
			}
		});

		$A.enqueueActionn(buscarContatos);
	}
})