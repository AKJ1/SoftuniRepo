using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace _04_RestClient
{
    using System.Net;
    class Program
    {
        static readonly string requestUrl = "http://localhost:39647/api/";
        static readonly string requestApi = "calculations?";
        private static string[] parameterNames = {"x1", "y1", "x2", "y2"};
        
        static void Main(string[] args)
        {
            ConsoleLoop();
        }

        static void ConsoleLoop()
        {
            Console.WriteLine("Looping~!");
            bool isRunning = true;
            while (isRunning)
            {
                string requestString = requestUrl + requestApi;
                Console.Clear();
                for (int i = 0; i < parameterNames.Length; i++)
                {
                    Console.WriteLine("Enter {0} parameter", parameterNames[i]);
                    requestString = requestString + parameterNames[i] + "=" + Console.ReadLine() + "&";
                }
                HandleRequest(requestString);
                
                

                Console.WriteLine("Press any key to continue or x to exit"); 
                switch (Console.ReadKey().KeyChar)
                {
                    case 'x':
                        isRunning = false;
                        break;
                    default:
                        break;
                }
            }
        }

        static void HandleRequest(string uri)
        {
            WebRequest request = WebRequest.Create(uri);
            request.Method = WebRequestMethods.Http.Get;

            try
            {
                PrintResult(request.GetResponse().GetResponseStream());
            }
            catch (WebException e)
            {
                Console.WriteLine("Something went wrong. Some of the input data was probably wrong.");
                Console.WriteLine(e.Message);
            }
        }

        static void PrintResult(Stream responseStream)
        {
            StreamReader reader = new StreamReader(responseStream);
            while (!reader.EndOfStream)
            {
                Console.WriteLine(reader.ReadLine());
            }
        }

    }
}
