let UtilConsole = new function(){

	this.piscarBotaoConsole = (piscar) => {
		if(piscar){
			let vermelho = '#eb676b';
			let transparent = 'transparent';
			let trocarCorBotaoConsole = (cor, tempo) => {
				window.setTimeout(
					function(){
						sforce.console.setCustomConsoleComponentButtonStyle('background: ' + cor + ';');
				}, tempo);
			};

			trocarCorBotaoConsole(vermelho, 0);
			trocarCorBotaoConsole(transparent, 1000);
			trocarCorBotaoConsole(vermelho, 2000);
			trocarCorBotaoConsole(transparent, 3000);
			trocarCorBotaoConsole(vermelho, 4000);
			trocarCorBotaoConsole(transparent, 5000);
		}
	}
}();