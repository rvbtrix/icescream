using System;
using System.Collections.Generic;
using System.Linq;
using IceCream.Data.Models;
using Microsoft.EntityFrameworkCore;

namespace IceCream.Data.Repository
{
    public class UserDebtorRepository
    {
        private DBIceScreamContext Context { get; set; }

        public UserDebtorRepository(DBIceScreamContext context)
        {
            Context = context;
        }

        public List<UserDebtor> GetAllUserDebtor()
        {
            var response = Context.UserDebtor.ToList();

            return response;
        }

        public List<PendingUserDebtor> GetPendingUserDebtor(int? maximumItems)
        {
            var query = Context.UserDebtor.Where(ud => ud.PaymentDate == null).OrderBy(o => o.DebitDate).Select(u => new PendingUserDebtor()
            {
                IdUserDebtor = u.IdUserDebtor,
                UserName = u.IdUserNavigation.Name,
                UserContact = u.IdUserNavigation.Contact,
                DebitDate = u.DebitDate,
                Reason = u.Reason,
                ImageURL = string.Concat("https://icescreams3.s3.us-east-2.amazonaws.com/", u.IdUserNavigation.ImageUrl)
            });

            if (maximumItems.HasValue)
            {
                query = query.Take(maximumItems.Value);
            }

            var response = query.ToList();

            return response;
        }

        public List<UserDebtor> GetUserDebtorByUser(int idUser)
        {
            var response = Context.UserDebtor.Where(ud => ud.IdUser == idUser).ToList();

            return response;
        }

        public UserDebtor Get(int id)
        {
            var user = Context.UserDebtor.FirstOrDefault(u => u.IdUserDebtor == id);

            return user;
        }

        public void Add(UserDebtor userDebtor)
        {
            userDebtor.Created = DateTime.Now;
            Context.UserDebtor.Add(userDebtor);

            Context.SaveChanges();
        }


        public DateTime? GetLastPaymentDate()
        {
            var query = Context.UserDebtor.Where(ud => ud.PaymentDate != null);

            return query.Max(ud => ud.PaymentDate);
        }

        public void UpdateRequestPayment(RequestUserDebtorPayment requestUserDebtorPayment)
        {
            var entity = Get(requestUserDebtorPayment.IdUserDebtor);

            if (entity != null)
            {
                entity.PaymentDate = requestUserDebtorPayment.PaymentDate;
                entity.PaymentImageUrl = requestUserDebtorPayment.PaymentImageUrl;

                Context.UserDebtor.Update(entity);

                Context.SaveChanges();
            }
        }

        public void CreatePendingDebtors()
        {
            _ = Context.Database.ExecuteSqlCommand("dbo.GerarDebitos");
        }
    }
}