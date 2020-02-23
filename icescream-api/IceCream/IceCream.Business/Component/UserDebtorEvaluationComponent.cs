
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using IceCream.Data.Models;
using IceCream.Data.Repository;

namespace IceCream.Business.Component
{
    public class UserDebtorEvaluationComponent
    {
        private UserDebtorEvaluationRepository UserDebtorEvaluationRepository { get; set; }
        private UserComponent UserComponent { get; set; }
        private UserDebtorComponent UserDebtorComponent { get; set; }

        public UserDebtorEvaluationComponent(DBIceScreamContext context)
        {
            UserDebtorEvaluationRepository = new UserDebtorEvaluationRepository(context);
            UserComponent = new UserComponent(context);
        }
        public List<UserDebtorEvaluation> GetUserDebtorEvaluation(int idUserDebtor)
        {
            return UserDebtorEvaluationRepository.GetAllByIdUserDebtor(idUserDebtor);
        }
        public bool HasEvaluator(int idUserDebtor, int idUser)
        {
            return UserDebtorEvaluationRepository.HasEvaluator(idUserDebtor, idUser);
        }
        public void Add(UserDebtorEvaluation evaluation)
        {
            if (UserDebtorComponent.Get(evaluation.IdUserDebtor) != null)
            {
                throw new Exception("Débito não encontrado");
            }

            if (UserComponent.Get(evaluation.IdUserDebtorEvaluator) != null)
            {
                throw new Exception("Avaliador não encontrado");
            }

            if (evaluation.Star <= 0)
            {
                throw new Exception("Valor de estrelas inválido");
            }

            if (HasEvaluator(evaluation.IdUserDebtor, evaluation.IdUserDebtorEvaluator))
            {
                throw new Exception("Avaliação efetuada anteriormente");
            }

            UserDebtorEvaluationRepository.Add(evaluation);
        }
        public List<EvaluationData> GetAllUserDebtorEvaluation()
        {
            var evaluations = UserDebtorEvaluationRepository.GetAllUserDebtorEvaluation().Select(s => new EvaluationData
            {
                DebitDate = UserDebtorComponent.Get(s.IdUserDebtor).DebitDate,
                PaymentDate = UserDebtorComponent.Get(s.IdUserDebtor).PaymentDate.Value,
                Reason = UserDebtorComponent.Get(s.IdUserDebtor).Reason,
                UserName = UserComponent.Get(s.IdUserDebtorEvaluator).Name,
                Evaluation = UserDebtorEvaluationRepository.GetAllByIdUserDebtor(s.IdUserDebtor).Any() ? UserDebtorEvaluationRepository.GetAllByIdUserDebtor(s.IdUserDebtor).Sum(ss => ss.Star) / UserDebtorEvaluationRepository.GetAllByIdUserDebtor(s.IdUserDebtor).Count() : 0
            });

            return evaluations.ToList();
        }
    }
}