using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MidClass
{
	static class Program
	{
		//string path 
		public static string conStr = System.IO.File.ReadAllText(@"..\..\ConnectionString.txt");
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main()
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
			Application.Run(new SignIn());
		}
	}
}
