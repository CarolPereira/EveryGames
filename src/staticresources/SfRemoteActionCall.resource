function callRemote(methodName, params, resolve, reject=()=>{}) {
    Visualforce.remoting.Manager.invokeAction(
        methodName,
        ...params,
        (result, event) => {
          if (event.status) {
            resolve(result);
          }
          else{
            reject();
          }
        },
        {escape: true}
    );
}  