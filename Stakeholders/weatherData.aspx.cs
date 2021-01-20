using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;

namespace NMUSolar.Stakeholders
{
    public partial class weatherData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class WeatherInfo
        {
            public City city { get; set; }
            public List<List> list { get; set; }
        }

        public class City
        {
            public int ID { get; set; }
            public string name { get; set; }
            public string country { get; set; }

            public string weather { get; set; }
        }

        public class Temp
        {
            public double day { get; set; }
            public double min { get; set; }
            public double max { get; set; }
            public double night { get; set; }
        }

        public class Weather
        {
            public string description { get; set; }
            public string icon { get; set; }
            
        }

        public class List
        {
            public Temp temp { get; set; }
            public int humidity { get; set; }
            public List<Weather> weather { get; set; }
        }
        public void GetWeatherInfo(object sender, EventArgs e)
        {
            string appId = "2d62bcb7710064483cfd95ce603c11f9";


            string url = string.Format("http://api.openweathermap.org/data/2.5/weather?q={0}&APPID={1}", txtCity.Text.Trim(), appId);

           JObject response = JObject.Parse(new System.Net.WebClient().DownloadString(url));
            if (response.SelectToken("cod").ToString().Equals("200"))
            {

                lblHumidity.Text= response.SelectToken("name").ToString() + ", " + response.SelectToken("sys.country").ToString();
                lblTempNight.Text = response.SelectToken("main.temp").ToString() + "c, " + response.SelectToken("weather[0].main").ToString();
                
            }

        }
        //protected void GetWeatherInfo(object sender, EventArgs e)
        //{
           
        //    string appId = "2d62bcb7710064483cfd95ce603c11f9";
            
           
        //    string url = string.Format("http://api.openweathermap.org/data/2.5/weather?q={0}&APPID={1}", txtCity.Text.Trim(), appId);
        //    using (WebClient client = new WebClient())
        //    {
        //        string json = client.DownloadString(url);
        //        Weather weather = (new JavaScriptSerializer()).Deserialize<Weather>(json);
        //        City city = new City();
        //        WeatherInfo weatherInfo = (new JavaScriptSerializer()).Deserialize<WeatherInfo>(json);

        //        JavaScriptSerializer serializer = new JavaScriptSerializer();
        //        dynamic data = serializer.Deserialize<City>(json);
        //       // string emailAddress = data.emailAddress;


        //        ///lblCity_Country.Text = weatherInfo.city.name + "," + weatherInfo.city.country;
        //        // imgCountryFlag.ImageUrl = string.Format("http://openweathermap.org/images/flags/{0}.png", weatherInfo.city.country.ToLower());
        //        lblDescription.Text = data.weather;
        //       // imgWeatherIcon.ImageUrl = string.Format("http://openweathermap.org/img/w/{0}.png", weatherInfo.list[0].weather[0].icon);
        //        lblTempMin.Text = string.Format("{0}°С", Math.Round(weatherInfo.list[0].temp.min, 1));
        //        lblTempMax.Text = string.Format("{0}°С", Math.Round(weatherInfo.list[0].temp.max, 1));
        //        lblTempDay.Text = string.Format("{0}°С", Math.Round(weatherInfo.list[0].temp.day, 1));
        //        lblTempNight.Text = string.Format("{0}°С", Math.Round(weatherInfo.list[0].temp.night, 1));
        //        lblHumidity.Text = weatherInfo.list[0].humidity.ToString();
        //        tblWeather.Visible = true;

        //    }
        //}
    }
}