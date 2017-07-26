public class JogoVideosController {
	
	public JogoVideosController(ApexPages.StandardController controller) {}

	public JogoVideosController() {}
	
	@remoteAction
	public static List<String> buscarVideos() {
		List<String> lstVideos = new List<String>();
		List<String> lstVideosURL = new List<String>();
		lstVideos.add('https://www.youtube.com/watch?v=bmnq7yedAzI');
		lstVideos.add('https://www.youtube.com/watch?v=nF0f08S94eU');
		lstVideos.add('https://www.youtube.com/watch?v=xCmzq4flyCw');
		lstVideos.add('https://www.youtube.com/watch?v=DHeraKHNOPk');
		lstVideos.add('https://www.youtube.com/watch?v=Z6bDV2flxaA');

		for(String videoURL : lstVideos) {
			videoURL = videoURL.replace('watch?v=','embed/');
			lstVideosURL.add(videoURL);
		}
		return lstVideosURL;
	}
}