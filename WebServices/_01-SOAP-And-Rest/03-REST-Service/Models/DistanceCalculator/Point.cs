﻿namespace MvcApplication2.Models.DistanceCalculator
{
    public class Point
    {
        private float x, y;

        public Point(float x, float y)
        {
            this.x = x;
            this.y = y;
        }

        public float X
        {
            get { return x; }
            set { x = value; }
        }

        public float Y
        {
            get { return y; }
            set { y = value; }
        }
           
    }
}
