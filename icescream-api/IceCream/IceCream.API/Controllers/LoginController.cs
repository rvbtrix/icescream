using IceCream.API.Security;
using IceCream.Business.Component;
using IceCream.Data.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel;

namespace IceCream.API.Controllers
{
    [Route("api/[controller]")]
    public class LoginController : Controller
    {
        private UserComponent Component { get; set; }

        public LoginController(DBIceScreamContext context)
        {
            Component = new UserComponent(context);
        }
        [AllowAnonymous]
        [HttpPost]
        public object Post(
            [FromBody]User usuario,
            [FromServices]AccessManager accessManager)
        {
            usuario = Component.Login(usuario.Email, usuario.Password);

            if (usuario != null)
            {
                return accessManager.GenerateToken(usuario);
            }
            else
            {
                return new
                {
                    Authenticated = false,
                    Message = "Falha ao autenticar"
                };
            }
        }
    }
}