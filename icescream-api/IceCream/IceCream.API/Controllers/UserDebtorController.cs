
using IceCream.Business.Component;
using IceCream.Data.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace IceCream.API.Controllers
{
    [Route("api/UserDebtor")]
    public class UserDebtorController : Controller
    {
        private UserDebtorComponent Component { get; set; }
        private S3Component S3Component { get; set; }

        public UserDebtorController(DBIceScreamContext context)
        {
            Component = new UserDebtorComponent(context);
        }

        [HttpGet, Route("GetPending")]
        [Authorize("Bearer")]
        public IActionResult GetPending(int? maximumItems = null)
        {
            var userDebtorList = Component.GetPendingUserDebtor(maximumItems);

            return Json(userDebtorList);
        }

        [HttpPost, Route("CreatePendingDebtors")]
        [Authorize("Bearer")]
        public IActionResult CreatePendingDebtors()
        {
            Component.CreatePendingDebtors();

            return Ok();
        }

        [HttpGet, Route("GetLastPaymentDate")]
        [Authorize("Bearer")]
        public IActionResult GetLastPaymentDate()
        {
            var lastPaymentDate = Component.GetLastPaymentDate();

            return Json(lastPaymentDate);
        }

        [HttpPut, Route("RequestPayment")]
        [Authorize("Bearer")]
        public IActionResult RequestPayment([FromBody] RequestUserDebtorPayment requestPayment)
        {
            if (requestPayment == null)
            {
                return BadRequest();
            }

            Component.RequestPayment(requestPayment);

            return Ok();
        }
        [HttpPost, Route("CreateImagePayment")]
        [Authorize("Bearer")]
        public IActionResult CreateImagePayment(IFormFile file)
        {
            if (file == null)
            {
                return BadRequest();
            }

            Guid g = Guid.NewGuid();
            var imageUrl = $"{g.ToString()}.{file.FileName.Split('.').ToList().Last()}";

            _ = S3Component.UploadFileToS3(file, imageUrl);

            return Ok(Json(imageUrl));
        }
    }
}