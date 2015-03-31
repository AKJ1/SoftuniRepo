namespace _01_SOAP
{
    using System.Runtime.Serialization;
    using System.ServiceModel;
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ICalculator" in both code and config file together.
    [ServiceContract]
    public interface ICalculator
    {
        [OperationContract]
        float GetDistance(Point p1, Point p2);
    }
    
    [DataContract]
    public class Point
    {
        public Point(float X, float Y)
        {
            this.X = X;
            this.Y = Y;
        }

        [DataMember]
        public float X { get; set; }
        
        [DataMember]
        public float Y { get; set; }
    }
}
