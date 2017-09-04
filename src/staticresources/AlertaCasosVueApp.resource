let mainpage = {
    template: '#template-page',
    data(){
        return {
            casos: [],
            casosOld: [],
            filtroTipos: [],
            filtroTipo: '',
           	filtroBusca: '',
            mapQtdeCasosPorTipo: new Map()
        }
    },
    mounted(){
    	this.iniciar();
        setInterval(() => this.iniciar(), 60000);
    },
    methods: {
    	iniciar(){
    		this.buscarFitrosTipo();
        	this.buscarCasos();
    	},
    	buscarFitrosTipo(){
	    	if(this.filtroTipos.length == 0){
	    		callRemote('AlertaCasoController.buscarFiltroTipo', [], (result) => {
	    			if(result){
						this.filtroTipos = result;
					}
	    		});
			}
    	},
    	buscarCasos(){
    		this.casosOld = this.casos;
    		callRemote('AlertaCasoController.buscarCasosAbertos', [], (result) => {
    			this.montarQtdePorTipo(result);
    			this.casos = result;
				let alterouQtdeCasos = false;

				if((this.casosOld.length == 0 && this.casos.length > 0)){
					alterouQtdeCasos = true;
				}
				else{
					alterouQtdeCasos = this.casos.every(function(elem, index, arr) {
						elem = true;
						for(i=0; i < this[i].length; i++){
							if(arr[index].Id == this[i].Id){
								elem = false;
							}
						}

						return elem;
					}, this.casosOld);
				}

				if(alterouQtdeCasos){
					UtilConsole.piscarBotaoConsole(result.length > 0);
				}
    		});
    	},
    	montarQtdePorTipo(casos){
			this.mapQtdeCasosPorTipo = new Map();

			casos.forEach((caso) => {
				if(!this.mapQtdeCasosPorTipo.has(caso.Type)){
					this.mapQtdeCasosPorTipo.set(caso.Type, 0);
				}

				let qtde = this.mapQtdeCasosPorTipo.get(caso.Type) + 1;
				this.mapQtdeCasosPorTipo.set(caso.Type, qtde);
			});
		},
		abrirCaso(casoId) {
			sforce.console.openPrimaryTab(null, '/' + casoId, true);
		},
		escolherFiltroTipo(tipo){
			this.filtroTipo = tipo;
		}
    },
    computed: {
    	casosFiltrados(){
    		let filtro = this.filtroTipo != "" ? this.filtroTipo : this.filtroBusca;

    		if(!filtro){
    			return this.casos;
    		}
    		else{
    			return this.casos.filter((item) => {
    				let programa = item.Programa__r != null ? item.Programa__r.Name : "";
    				let busca = item.CaseNumber + ' ' + item.Segmento__c + ' ' + item.Type + ' ' + item.Priority + ' ' + item.Status + ' ' + programa;
    				return busca.toLowerCase().indexOf(filtro.toLowerCase()) > -1;
    			});
    		}
    	}
  	}
};

new Vue({
	el: '#app',
	components: { 
		mainpage
	}
});