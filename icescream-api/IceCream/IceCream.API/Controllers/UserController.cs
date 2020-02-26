using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IceCream.Business.Component;
using IceCream.Data.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace IceCream.API.Controllers
{
    [Route("api/User")]
    public class UserController : Controller
    {        
        private UserComponent Component { get; set; }
        private S3Component S3Component { get; set; }


        public UserController(DBIceScreamContext context)
        {
            Component = new UserComponent(context);
            S3Component = new S3Component();

        }

        [HttpGet, Route("GetAll")]
        [Authorize("Bearer")]
        public IActionResult GetAll()
        {
            List<User> response = Component.GetAll();

            return Json(response);
        }

        [HttpGet, Route("Get")]
        [Authorize("Bearer")]
        public IActionResult Get(int id)
        {
            var user = Component.Get(id);

            if (user == null)
            {
                return NotFound();
            }

            return Json(user);
        }

        [HttpPost, Route("Add")]
        public IActionResult Add([FromBody] User user)
        {
            if (user == null || user.Email.Split('@')[1] != "dartdigital.com.br" || Component.GetAll().Any(w => w.Email == user.Email))
            {
                return BadRequest();
            }

            Component.Add(user);

            return Ok();
        }

        [HttpPut, Route("Update")]
        [Authorize("Bearer")]
        public IActionResult Update([FromBody] RequestUpdateUser user)
        {
            var userAdmin = Component.Get(user.idUserAdminRequester);
            if (user == null || (userAdmin != null && !userAdmin.IsAdmin))
            {
                return BadRequest();
            }

            User oldEntity = Component.Get(user.IdUser);

            if (oldEntity == null)
            {
                return NotFound();
            }

            Component.Update(oldEntity, user);

            return Ok();
        }

        [HttpPost, Route("ChangeImageProfile")]
        [Authorize("Bearer")]
        public IActionResult ChangeImageProfile(IFormFile file, int idUser)
        {
            if (idUser <= 0 || file == null)
            {
                return BadRequest();
            }

            User user = Component.Get(idUser);

            if (user == null)
            {
                return NotFound();
            }
            Guid g = Guid.NewGuid();
            user.ImageUrl = $"{g.ToString()}.{file.FileName.Split('.').ToList().Last()}";

            _ = S3Component.UploadFileToS3(file, user.ImageUrl);

            Component.UpdateImage(user.IdUser, user.ImageUrl);

            return Ok();
        }

        [HttpPut, Route("EnableDisable")]
        [Authorize("Bearer")]
        public IActionResult EnableDisable([FromBody] RequestEnableDisable request)
        {
            var userAdmin = Component.Get(request.idUserAdminRequester);

            if (request == null || (userAdmin != null && !userAdmin.IsAdmin))
            {
                return BadRequest();
            }

            User user = Component.Get(request.IdUser);

            if (user == null)
            {
                return NotFound();
            }

            Component.EnableDisable(user, request.Active);
            
            return Ok();
        }

        [HttpPut, Route("ChangePassword")]
        [Authorize("Bearer")]
        public IActionResult ChangePassword([FromBody] RequestChangePassword request)
        {
            if (request == null)
            {
                return BadRequest();
            }

            User user = Component.Get(request.IdUser);

            if (user == null)
            {
                return NotFound();
            }

            bool response = Component.ChangePassword(user, request);

            if(response)
                return Ok();
                
            return BadRequest();
        }

        [HttpDelete, Route("Delete")]
        [Authorize("Bearer")]
        public IActionResult Delete(int id)
        {
            User user = Component.Get(id);

            if (user == null)
            {
                return NotFound();
            }

            Component.Delete(id);

            return Ok();
        }

        //[HttpPost, Route("Login")]
        //public IActionResult Login([FromBody] User user) 
        //{
        //    User response = Component.Login(user.Email, user.Password);

        //    if (user == null) 
        //    {
        //        return NotFound();
        //    }

        //    return Json(response);    
        //}

        [HttpPost, Route("AcceptedTerms")]
        [Authorize("Bearer")]
        public IActionResult AcceptedTerms([FromBody] User user)
        {
            User userObj = Component.Get(user.IdUser);
            
            if (userObj == null)
            {
                return NotFound();
            }
            
            Component.AcceptedTerms(userObj);

            return Ok();
        }

        [HttpPost, Route("RecoveryPassword")]
        public async System.Threading.Tasks.Task<IActionResult> RecoveryPassword([FromBody] User user)
        {
            await Component.ResetPasswordAsync(user.Email);
            return Ok();
        }

        [HttpGet, Route("RecoveryPasswordToken")]
        public IActionResult RecoveryPasswordToken(string token)
        {
            var user = Component.RecoveryPasswordToken(token);

            if (user == null)
            {
                return NotFound();
            }

            return Json(user);
        }
    }
}
