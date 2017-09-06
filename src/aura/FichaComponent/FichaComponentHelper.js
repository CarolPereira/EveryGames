({
	getJogadores : function(component) {
		var action = component.get("c.getJogadores");
		/*var self = this;*/
		action.setCallback(this, function (a) {
			component.set("v.cards", a.getReturnValue());
		});
		$A.enqueueAction(action);
	},

})