using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PPDWebsite.Startup))]
namespace PPDWebsite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
