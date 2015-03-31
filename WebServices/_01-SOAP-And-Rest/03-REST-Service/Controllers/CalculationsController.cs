namespace MvcApplication2.Controllers
{
    using System.Web.Http;
    using MvcApplication2.Models.DistanceCalculator;

    public class CalculationsController : ApiController
    {
        //public IEnumerable<float> Get()
        //{
        //    return new float[] { 7.512f, 4.435f};
        //}

        // GET api/values/5
        public float Get(float x1, float y1, float x2, float y2)
        {
            return DistanceCalculator.CalcDistance(new Point(x1,y1), new Point(x2,y2));
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
