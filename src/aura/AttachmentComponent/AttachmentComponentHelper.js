({
	 searchForAttachments : function(component) {

		var action = component.get('c.searchForAttachments');
		action.setParams({
			'accountId' : component.get('v.recordId')
		});
		action.setCallback(this, function(response) {
			component.set('v.lstAttachments', response.getReturnValue());
			console.log('URL :' + response.getReturnValue());
		});
		$A.enqueueAction(action);
	},

})