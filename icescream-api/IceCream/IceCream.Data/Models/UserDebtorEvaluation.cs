using System;
using System.Collections.Generic;
using System.Text;

namespace IceCream.Data.Models
{
    public partial class UserDebtorEvaluation
    {
        public int IdUserDebtorEvaluation { get; set; }
        public int IdUserDebtor { get; set; }
        public int IdUserDebtorEvaluator { get; set; }
        public int Star { get; set; }
        public DateTime UserDebtorEvaluationDate { get; set; }
        public virtual UserDebtor IdUserDebtorEvaluatorNavigation { get; set; }
    }
}
