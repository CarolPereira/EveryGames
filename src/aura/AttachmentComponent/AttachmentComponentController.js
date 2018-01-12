({
	init : function(component, event, helper) {

		helper.searchForAttachments(component);
		console.log('Init ComponentController');
	},

	handleUploadFinished: function (component, event) {
        // Get the list of uploaded files
        var uploadedFiles = event.getParam("files");
        
    	var accountId = component.get('v.recordId');
	    var navEvt = $A.get("e.force:navigateToSObject");
	    navEvt.setParams({
	      'recordId': accountId
	    });
	    navEvt.fire();
	
    },

})