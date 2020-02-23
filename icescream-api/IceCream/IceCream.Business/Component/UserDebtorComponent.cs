
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using IceCream.Data.Models;
using IceCream.Data.Repository;

namespace IceCream.Business.Component
{
    public class UserDebtorComponent
    {
        private UserDebtorRepository UserDebtorRepository { get; set; }
        private UserComponent UserComponent { get; set; }
        public UserDebtorComponent(DBIceScreamContext context)
        {
            UserDebtorRepository = new UserDebtorRepository(context);
            UserComponent = new UserComponent(context);
        }

        public List<UserDebtor> GetAllUserDebtor()
        {
            return UserDebtorRepository.GetAllUserDebtor();
        }

        public List<PendingUserDebtor> GetPendingUserDebtor(int? maximumItems)
        {
            return UserDebtorRepository.GetPendingUserDebtor(maximumItems);
        }

        public List<UserDebtor> GetUserDebtorByUser(int idUser)
        {
            return UserDebtorRepository.GetUserDebtorByUser(idUser);
        }

        public UserDebtor Get(int idUserDebtor)
        {
            return UserDebtorRepository.Get(idUserDebtor);
        }

        public void CreatePendingDebtors()
        {
            UserDebtorRepository.CreatePendingDebtors();
        }

        public DateTime? GetLastPaymentDate()
        {
            return UserDebtorRepository.GetLastPaymentDate();
        }
        public void RequestPayment(RequestUserDebtorPayment requestPayment)  
        {
            if (requestPayment.PaymentDate == null)
            {
                throw new Exception("Data de pagamento é obrigatória");
            }

           var userDebtor = UserDebtorRepository.Get(requestPayment.IdUserDebtor);

            if (userDebtor == null)
            {
                throw new Exception("Débito não encontrado");
            }

            if (userDebtor.PaymentDate != null)
            {
                throw new Exception("Pagamento já baixado");
            }

            if (userDebtor.IdUser != requestPayment.IdUser)
            {
                throw new Exception("Usuário inválido para este pagamento");
            }

            UserDebtorRepository.UpdateRequestPayment(requestPayment);
        }
        
        
    }
}