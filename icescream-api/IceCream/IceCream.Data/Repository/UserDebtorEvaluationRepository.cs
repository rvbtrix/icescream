using System.Collections.Generic;
using System.Linq;
using IceCream.Data.Models;

namespace IceCream.Data.Repository
{
    public class UserDebtorEvaluationRepository
    {
        private DBIceScreamContext Context { get; set; }

        public UserDebtorEvaluationRepository(DBIceScreamContext context)
        {
            Context = context;
        }

        public void Add(UserDebtorEvaluation item)
        {
            Context.UserDebtorEvaluation.Add(item);
            Context.SaveChanges();
        }

        public void Delete(int Id)
        {
            var deleteItem = Context.UserDebtorEvaluation.SingleOrDefault(r => r.IdUserDebtorEvaluation == Id);
            Context.UserDebtorEvaluation.Remove(deleteItem);
            Context.SaveChanges();
        }

        public UserDebtorEvaluation Get(int id)
        {
            return Context.UserDebtorEvaluation.Where(e => e.IdUserDebtorEvaluation.Equals(id)).FirstOrDefault();
        }

        public List<UserDebtorEvaluation> GetAllByIdUserDebtor(int idUserDebtor)
        {
            List<UserDebtorEvaluation> ListUserDebtorEvaluation = new List<UserDebtorEvaluation>();

            ListUserDebtorEvaluation = Context.UserDebtorEvaluation.Where(w => w.IdUserDebtor == idUserDebtor).ToList();

            return ListUserDebtorEvaluation;
        }

        public List<UserDebtorEvaluation> GetAllUserDebtorEvaluation()
        {
            List<UserDebtorEvaluation> ListUserDebtorEvaluation = new List<UserDebtorEvaluation>();

            ListUserDebtorEvaluation = Context.UserDebtorEvaluation.ToList();

            return ListUserDebtorEvaluation;
        }

        public bool HasEvaluator(int idUserDebtor, int idUser)
        {
            List<UserDebtorEvaluation> ListUserDebtorEvaluation = new List<UserDebtorEvaluation>();

            return Context.UserDebtorEvaluation.Where(w => w.IdUserDebtor == idUserDebtor && w.IdUserDebtorEvaluator == idUser).Any();
        }
    }
}
