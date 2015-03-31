namespace MvcApplication2.Models.DistanceCalculator
{
    using System;
    public static class DistanceCalculator
    {
        public static float CalcDistance(Point start, Point end)
        {

            return (float)Math.Sqrt(Math.Pow(end.X - start.X, 2) + Math.Pow(end.Y - start.Y, 2));
        }
    }
}