
using IceCream.Business.Component;
using IceCream.Data.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
namespace IceCream.API.Controllers
{
    [Route("api/UserDebtor")]
    public class UserDebtorController : Controller 
    {
        private UserDebtorComponent Component { get; set; }

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

        [HttpGet, Route("GetAllEvaluationData")]
        [Authorize("Bearer")]
        public IActionResult GetAllEvaluationData()
        {
            var evaluationData = Component.GetAllEvaluationData();

            return Json(evaluationData);
        }
    }
}