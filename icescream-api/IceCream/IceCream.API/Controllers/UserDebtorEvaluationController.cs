
using IceCream.Business.Component;
using IceCream.Data.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace IceCream.API.Controllers
{
    [Route("api/UserDebtorEvaluation")]
    public class UserDebtorEvaluationController : Controller
    {
        private UserDebtorEvaluationComponent Component { get; set; }

        public UserDebtorEvaluationController(DBIceScreamContext context)
        {
            Component = new UserDebtorEvaluationComponent(context);
        }

        [HttpPost, Route("CreateEvaluation")]
        [Authorize("Bearer")]
        public IActionResult CreateEvaluation([FromBody] UserDebtorEvaluation userDebtorEvaluation)
        {
            Component.Add(userDebtorEvaluation);

            return Ok();
        }

        [HttpGet, Route("GetAllEvaluationData")]
        [Authorize("Bearer")]
        public IActionResult GetAllEvaluationData()
        {
            var evaluationData = Component.GetAllUserDebtorEvaluation();

            return Json(evaluationData);
        }
    }
}