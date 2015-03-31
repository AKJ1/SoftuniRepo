namespace SoapWebApp
{
    using System;
    using SoapWebApp.Service_References.CalculatorService;
    using _01_SOAP;
    class DistanceCalculatorConsole
    {
        static void Main(string[] args)
        {
            ConsoleLoop();
        }

        static void ConsoleLoop()
        {
            Console.Clear();
            CalculatorClient calc = new CalculatorClient();
            bool isRunning = true;
            while (isRunning)
            {
                try
                {
                    Console.WriteLine("Enter first point's X");
                    float x1 = float.Parse(Console.ReadLine());
                    Console.WriteLine("Enter first point's Y");
                    float y1 = float.Parse(Console.ReadLine());
                    Console.WriteLine("Enter second point's X");
                    float x2 = float.Parse(Console.ReadLine());
                    Console.WriteLine("Enter second point's Y");
                    float y2 = float.Parse(Console.ReadLine());
                    Console.WriteLine("The distance between the two points is: {0,00}",calc.GetDistance(new Point(x1, y1), new Point(x2, y2)));
                    
                }
                catch (Exception)
                {
                    Console.WriteLine("You entered incorrect data. Back to the start");
                }
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
    }
}
