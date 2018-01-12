public with sharing class AttachmentComponentController {
	
	@AuraEnabled
	public static List<ContentDocument> searchForAttachments(String accountId) {

		List<ContentDocumentLink> lstContentDocumentLink = [SELECT 
																ContentDocumentId, 
																LinkedEntityId 
															FROM 
																ContentDocumentLink
															WHERE 
																LinkedEntityId =: accountId
															];

		Set<Id> setContentDocumentLinkIds = new Set<Id>();

		for(ContentDocumentLink contentD : lstContentDocumentLink) {
			setContentDocumentLinkIds.add(contentD.ContentDocumentId);
		}

		List<ContentDocument> lstContentDocument = 	[SELECT
														Id,
													/*	ContentSize,
														Description,
														FileExtension,
														FileType,
														OwnerId,
														ParentId,*/
														Title
													FROM
														ContentDocument
													WHERE
														Id =: setContentDocumentLinkIds
													];
		return lstContentDocument;
	}

}