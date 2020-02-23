using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using IceCream.Data.Models;
using IceCream.Data.Repository;
using System;
using System.Net;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using Amazon.S3;
using Microsoft.AspNetCore.Http;
using Amazon;
using Amazon.S3.Transfer;

namespace IceCream.Business.Component
{
    public class S3Component
    {
        public S3Component()
        {
           
        }
        public async Task UploadFileToS3(IFormFile file, string fileName)
        {
            using (var client = new AmazonS3Client("AKIA336JXY6S5K36AHDT", "RM3rhYtkU0UzX5JMNHxXuLSIX8zFfI0vuQWF7eJl", RegionEndpoint.USEast2))
            {
                using (var newMemoryStream = new MemoryStream())
                {
                    file.CopyTo(newMemoryStream);

                    var uploadRequest = new TransferUtilityUploadRequest
                    {
                        InputStream = newMemoryStream,
                        Key = fileName,
                        BucketName = "icescreams3",
                        StorageClass = S3StorageClass.StandardInfrequentAccess,
                        CannedACL = S3CannedACL.PublicRead
                    };

                    var fileTransferUtility = new TransferUtility(client);
                    await fileTransferUtility.UploadAsync(uploadRequest);
                }
            }
        }
    }
}