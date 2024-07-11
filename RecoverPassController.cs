using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace SalesSystem
{
    public class RecoverPassController : ApiController
    {

        public async Task<string> GetCodePassword()
        {
            var client = new HttpClient();
            var request = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri("https://password-code-generator.p.rapidapi.com/pass/8/no"),
                Headers =
    {
        { "X-RapidAPI-Key", "9eef68c5cbmshb1dcf4a93719887p11b179jsn299d0d3841cd" },
        { "X-RapidAPI-Host", "password-code-generator.p.rapidapi.com" },
    },

            };

            using (var response = await client.SendAsync(request))
            {
                response.EnsureSuccessStatusCode();
                var body = await response.Content.ReadAsStringAsync();
                return body;
            }
        }

    }
}
