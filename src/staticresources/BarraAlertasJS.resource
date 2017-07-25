var app = angular.module("jogosApp");

app.controller('BarraAlertasCtrl', function($scope) {

    $scope.lstAlertas;
    $scope.alertas = 'Não há alertas a serem exibidos';
    var contador = 0;
    var primeiraBusca = true;

    // Define o tempo em que cada mensagem será exibida
    setInterval(function() {
            exibirAlerta();
    }, 60000);
    
    //  Busca uma lista com as mensagens a serem exibidas   
    function getListaAlertas() {
        BarraAlertasController.buscarAlertas(function(result) {
            $scope.lstAlertas = result;
            // contador para saber quando todas as mensagens foram exibidas
            contador = 0;
            $scope.$apply(); 
            exibirAlerta();              
        });
    }

    // Exibi as mensagens, e se todas já foram exibidas, atualiza a lista de mensagens
    function exibirAlerta() {
        if(contador >= $scope.lstAlertas.length) {
            // Ao carregar a página, fazer primeira busca
            if(primeiraBusca){
                primeiraBusca=false;
                getListaAlertas(); 
            }else{
                // Se a lista estiver vazia, esperar um tempo até buscar novamente
                if($scope.lstAlertas.length == 0){
                    window.setTimeout(
                    function(){
                       getListaAlertas();
                    }, 60000);
                }else{
                // Senão estava vazia, fazer busca.
                  getListaAlertas(); 
                }    
            }    
        }else{
            $scope.alertas = $scope.lstAlertas[contador].Mensagem__c;
            contador++;
            scrollButtonText();
        }
    }  

    // Muda o texto do botão e faz com que a mensagem fique passando
    function scrollButtonText() {                   
        sforce.console.setCustomConsoleComponentButtonText($scope.alertas, function() {
            sforce.console.scrollCustomConsoleComponentButtonText($scope.alertas.length, 5, true, function(result){});
        });
    }

    esconderJanela();
    getListaAlertas();

    // Esconde a janela da visualforce
    function esconderJanela() {
        sforce.console.onCustomConsoleComponentButtonClicked(function() {
            sforce.console.setCustomConsoleComponentVisible(false);
            $scope.$apply(); 
            var x = contador - 1;
            console.log('$scope.lstAlertas[contador].Id :' + $scope.lstAlertas[x]);
            sforce.console.openPrimaryTab(null, '/' + $scope.lstAlertas[x].Id, true); 
        });
    }
});