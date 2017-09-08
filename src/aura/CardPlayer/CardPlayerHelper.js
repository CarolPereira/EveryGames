({
	getJogos : function(component) {
		var action = component.get("c.getJogos");
		action.setParams({
			'jogador' : component.get('v.card.Id')
		});
		action.setCallback(this, function (a) {
			component.set("v.jogos", a.getReturnValue());
		});
		$A.enqueueAction(action);
	},
})