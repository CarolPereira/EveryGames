var app = angular.module("jogosApp");

app.controller('HumorClienteCtrl', function($scope, $timeout) {

	$scope.clienteId = '0010v000002zH7v';
	$scope.lstCasos = [];
	$scope.lstMotivos = [];
	$scope.qtdCasos = 0;
	$scope.qtdTipos = {};
	$scope.conta = [];
	$scope.humor = [];
	$scope.img;
	$scope.EnderecoAtualizado = true;
	$scope.data;
	$scope.startFade;

	// Abre em uma nova aba no console a conta
	$scope.abrirConta = function() {
		sforce.console.openPrimaryTab(null, '/' + $scope.conta[0].Id, true);
	}
	
	// Ação do botão para fechar o alerta
	$scope.fecharAlerta = function() {
		$scope.startFade = true;
		$timeout(function(){
			$scope.EnderecoAtualizado = true;
			console.log('Era pra ter fechado !!' + $scope.EnderecoAtualizado );	
		}, 700);
	}

	// Mostrar o alerta
	function mostrarAlerta() {
		window.setTimeout(
			function(){
				$scope.EnderecoAtualizado = false;
				$scope.$apply();
				console.log('Era pra ter mostrado !!' + $scope.EnderecoAtualizado );
			}, 5000);
	}

	function iniciar() {

		// Retorna o id do registro aberto
		sforce.console.getEnclosingPrimaryTabObjectId(function (caso) {

			// Busca casos pelo id da conta
			HumorClienteController.buscarCasosCliente(caso.id,function(result) {
			
				$scope.lstCasos = result;
				$scope.qtdCasos = $scope.lstCasos.length;
				$scope.$apply();
				definirMotivos();
				filtrarLista();
				defineHumor();
				$scope.$apply();
				console.log('Lista de motivos' + $scope.lstMotivos);
			});
			// Busca dados da conta
			HumorClienteController.buscarInfoCliente(caso.id, function(result) {

				$scope.conta = result;
				$scope.$apply();
				console.log('Conta' + $scope.conta);
				console.log('Conta data' + $scope.conta[0].LastModifiedDate);

				// busca historico de alterações no campo endereco
				HumorClienteController.buscarHistoricoConta($scope.conta[0].Id, function(result) {
					
					$scope.data = result;
					if(result[0] == 'false') {
						mostrarAlerta();
						$scope.$apply();
					}
				});
			});	
		});	
	}

	// Definir lista de motivos
	function definirMotivos() {

		for(var i = 0; i < $scope.lstCasos.length; i++){
			if(i==0){
				$scope.lstMotivos.push($scope.lstCasos[i].Type);
			}else{
				// Se não existe, adicionar na lista
				var adicionar = $scope.lstMotivos.every(function(v,x) {
						v = true;
						if($scope.lstMotivos[x] == $scope.lstCasos[i].Type){
							v = false;
						}
						return v;
				});
				// É para adicionar?
				if(adicionar) {
					$scope.lstMotivos.push($scope.lstCasos[i].Type);
				}	
			}
		}
	}

	// Filtra lista de casos por motivos
	function filtrarLista(){
		
		for(var m=0; m < $scope.lstMotivos.length; m++){
			var quantidade = 0;
			for(var c=0; c < $scope.lstCasos.length; c++){
				if($scope.lstCasos[c].Type == $scope.lstMotivos[m]){
					quantidade++;
				}
			}
			$scope.qtdTipos[$scope.lstMotivos[m]] = quantidade;
		}
	}		
	
	// Define humor do cliente
	function defineHumor(){
		var x = 0;
		for(var m=0; m < $scope.lstMotivos.length; m++){
			// Entra apenas na primeira vez
			if(m==0){
				$scope.humor = $scope.lstMotivos[m];
				x = m;
			}
			// Se a quantidade de casos for maior seleciona o humor
			if($scope.qtdTipos[$scope.lstMotivos[m]] > $scope.qtdTipos[$scope.lstMotivos[x]]){
				x = m;
				$scope.humor = $scope.lstMotivos[m];
			}
		}
		
		// Busca a imagem para cada humor
		switch ($scope.humor) {

			case 'Reclamação':
				$scope.img='https://c.na50.visual.force.com/resource/1500490921000/Reclamacao';
				break;
			case 'Dúvida':
				$scope.img='https://c.na50.visual.force.com/resource/1500490782000/Duvida';
				break;
			case 'Elogio':
				$scope.img='https://c.na50.visual.force.com/resource/1500490838000/Elogio';
				break;			
			case 'Sugestão':
				$scope.img='https://c.na50.visual.force.com/resource/1500491060000/Sugestao';
				break;

		}
	}

	iniciar();

});