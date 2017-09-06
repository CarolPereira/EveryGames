({
	doInit : function(component, event, helper) {
		//Update expense counters
		helper.getExpenses(component);
	},//Delimiter for future code

	createExpense : function(component, event, helper) {
		var amtField = component.find("amount");
		var amt = amtField.get("v.value");
		if(isNaN(amt)||amt==''){
			amtField.setValid("v.value",false);
			amtField.addErrors("v.value",[{message:"Enter and expense amount."}]);
		}
		else{
			amtField.setValid("v.value",true);
			var newExpense = component.get("v.newExpense");
			helper.createExpense(component, newExpense);
		}
	}, // Delimiter for future code
})