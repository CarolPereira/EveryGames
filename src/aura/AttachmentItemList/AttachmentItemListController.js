({
	init : function(component, event, helper) {
		
	},

	openSingleFile: function(component, event, helper) {
	    $A.get('e.lightning:openFiles').fire({
	        recordIds: [component.get('v.attachment.Id')]
	    });
	},

	downloadFile : function(component, event, helper) {
		var attachment = component.get('v.attachment');
		var url = 'https://everygames-dev-ed.lightning.force.com/sfc/servlet.shepherd/document/download/' + attachment.Id;
		component.set('v.attachmentDownloadUrl', url);
		console.log('URL : '+ url);	

    	var urlEvent = $A.get("e.force:navigateToURL");
    	urlEvent.setParams({
      		'url': url
    	});
    	urlEvent.fire();

	},

	goToFile : function (component, event, helper) {
		var attachmentId = component.get('v.attachment');
	    var navEvt = $A.get("e.force:navigateToSObject");
	    navEvt.setParams({
	      'recordId': attachmentId.Id,
	      'slideDevName': 'related'
	    });
	    navEvt.fire();
	},
})