using Firebase.Auth;
using Firebase.Database;
using Firebase.Storage;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace PPDWebsite.AppCode
{
	public class FireBaseFunctions
	{
		static string FirebaseApiKey = "AIzaSyCnCz2IThupXTryJqkeyHfoF90Bk1J65ig";

		public static async Task<string> UploadFirebaseFile(Stream imageStream, string userId, string fileName)
		{
			var authProvider = new FirebaseAuthProvider(new FirebaseConfig(FirebaseApiKey));
			var auth = await authProvider.SignInAnonymouslyAsync();//.SignInWithOAuthAsync(FirebaseAuthType.Facebook, facebookAccessToken);

			// Get any Stream — it can be FileStream, MemoryStream or any other type of Stream
			//var stream = File.Open(@"C:\YourFile.png", FileMode.Open);

			// Construct FirebaseStorage with path to where you want to upload the file and put it there
			var task = new FirebaseStorage("pregnancy-prayer.appspot.com")
			 //.Child("data")
			 .Child("journalImages")
			 .Child(GenerateUniqueID(userId) + GetFileExtension(fileName))
			 .PutAsync(imageStream);

			// Track progress of the upload
			task.Progress.ProgressChanged += (s, e) => Console.WriteLine($"Progress: {e.Percentage} %");

			// Await the task to wait until upload is completed and get the download url
			var downloadUrl = await task;

			return downloadUrl;
		}

		public static string GenerateUniqueID(string userId)
		{
			DateTime dt = DateTime.Now;
			return "web"+ "_" + userId + "_" + dt.Millisecond;
		}

		public static string GetFileExtension(string fileName)
		{
			return ".png";
		} 
		
		public async void AuthoriseUpload()
		{
			var authProvider = new FirebaseAuthProvider(new FirebaseConfig(FirebaseApiKey));
			//var facebookAccessToken = "<login with facebook and get oauth access token>";

			var auth = await authProvider.SignInAnonymouslyAsync();//.SignInWithOAuthAsync(FirebaseAuthType.Facebook, facebookAccessToken);
			/*
			var firebase = new FirebaseClient(
			  "https://dinosaur-facts.firebaseio.com/",
			  new FirebaseOptions
			  {
				  AuthTokenAsyncFactory = () => Task.FromResult(auth.FirebaseToken)
			  });

			var dinos = await firebase
			  .Child("dinosaurs")
			  .OnceAsync<Dinosaur>();

			foreach (var dino in dinos)
			{
				Console.WriteLine($"{dino.Key} is {dino.Object.Height}m high.");
			}
			*/
		}
	}
}