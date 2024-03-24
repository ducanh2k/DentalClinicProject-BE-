using AutoMapper;
using AutoMapper.Internal;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : Controller
    {
        private readonly dentalContext _context;
        
        public DashboardController(dentalContext context)
        {
            _context = context;
        }
        static DateTime dateTime = DateTime.Now;
        static int CurrentMonth = dateTime.Month;
        static int CurrentYear = dateTime.Year;

        // Revenue from service, material which used 
        [HttpGet("revenue")]
        public IActionResult GetRevenue(int year) 
        {
            try
            {
                var query = (from il in _context.InvoiceLines
                             join inv in _context.Invoices on il.InvoiceId equals inv.InvoiceId into invJoin
                             from inv in invJoin.DefaultIfEmpty()
                             join s in _context.Services on il.ServiceId equals s.ServiceId into sJoin
                             from s in sJoin.DefaultIfEmpty()
                             where inv != null && inv.Status == 2 && inv.Date.Value.Year == year
                             select new
                             {
                                 Year = inv.Date.Value.Year,
                                 Month = inv.Date.Value.Month,
                                 TotalPay = (s.Price ?? 0) 
                             }).ToList();

                var result = query.GroupBy(x => new { x.Year, x.Month })
                                  .Select(g => new
                                  {
                                      Year = g.Key.Year,
                                      Month = g.Key.Month,
                                      TotalPayOfMonth = g.Sum(x => x.TotalPay)
                                  })
                                  .OrderBy(x => x.Month)
                                  .ToList<object>();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // Doanh thu 1 thang
        [HttpGet("revenueInMonth")]
        public IActionResult GetRevenueInMonth()
        {
            try
            {
                var query = from invLine in _context.InvoiceLines
                            join inv in _context.Invoices on invLine.InvoiceId equals inv.InvoiceId into invGroup
                            from inv in invGroup.DefaultIfEmpty()
                            join service in _context.Services on invLine.ServiceId equals service.ServiceId into serviceGroup
                            from service in serviceGroup.DefaultIfEmpty()
                            where inv.Date.Value.Year == CurrentYear && inv.Date.Value.Month == CurrentMonth && inv.Status == 2
                            select new
                            {
                                Year = inv.Date.Value.Year,
                                Month = inv.Date.Value.Month,
                                Day = inv.Date.Value.Day,
                                TotalPay = (service.Price ?? 0) 
                            }
                        into subquery
                            group subquery by new { subquery.Year, subquery.Month, subquery.Day } into g
                            select new
                            {
                                Year = g.Key.Year,
                                Month = g.Key.Month,
                                Day = g.Key.Day,
                                TotalPayOfDay = g.Sum(x => x.TotalPay)
                            };

                return Ok(query);
            }
            catch(Exception ex) { 
            return BadRequest(ex.Message);
            }
        }
        // So benh nhan da phuc vu 1 thang, 1 nam
        [HttpGet("patient")]
        public IActionResult GetPatient(int month, int year) // month = 0 then count patient in all year
        {
            try
            {
                var query = _context.Appointments.AsQueryable();

                if (month == 0)
                {
                    var result = query
                        .Where(a => a.Datetime.Value.Year == year)
                        .GroupBy(a => new { Month = a.Datetime.Value.Month, Year = a.Datetime.Value.Year })
                        .Select(g => new
                        {
                            TotalPatientsPerMonth = g.Count(),
                            Month = g.Key.Month,
                            Year = g.Key.Year
                        })
                        .ToList();

                    return Ok(result);
                }
                else
                {
                    var result = query
                        .Where(a => a.Datetime.Value.Month == month && a.Datetime.Value.Year == year)
                        .GroupBy(a => new { Month = a.Datetime.Value.Month, Year = a.Datetime.Value.Year })
                        .Select(g => new
                        {
                            TotalPatientsPerMonth = g.Count(),
                            Month = g.Key.Month,
                            Year = g.Key.Year
                        })
                        .ToList();

                    return Ok(result);
                }
            }catch(Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        // Dich vu dc dung nhieu nhat trong nam
        [HttpGet("service")]
        public IActionResult GetService(int month, int year) // month = 0 mean service in all year
        {
            try
            {
                var query = _context.InvoiceLines
            .Join(_context.Invoices, il => il.InvoiceId, i => i.InvoiceId, (il, i) => new { il, i }).AsQueryable();
                if (month == 0)
                {
                    var result = query
                            .Where(x => x.i.Date.Value.Year == year)
                            .GroupBy(x => new { Month = x.i.Date.Value.Month, Year = x.i.Date.Value.Year, ServiceId = x.il.ServiceId })
                            .Select(g => new
                            {
                                ServiceId = g.Key.ServiceId,
                                UsageCount = g.Count(),
                                Month = g.Key.Month,
                                Year = g.Key.Year
                            })
                            .ToList();
                    return Ok(result);
                }
                else
                {
                    var result = query
                        .Where(x => x.i.Date.Value.Month == month && x.i.Date.Value.Year == year)
                        .GroupBy(x => new { Month = x.i.Date.Value.Month, Year = x.i.Date.Value.Year, ServiceId = x.il.ServiceId })
                        .Select(g => new
                        {
                            ServiceId = g.Key.ServiceId,
                            UsageCount = g.Count(),
                            Month = g.Key.Month,
                            Year = g.Key.Year
                        })
                        .ToList();

                    return Ok(result);
                }
            }catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //Chi phi moi trang thiet bi trong 1 thang (12 thang)
        [HttpGet("expense")]
        public IActionResult GetExpense(int month, int year) // month = 0 mean service in all year
        {
            try
            {
                var query = (from il in _context.InvoiceLines
                             join inv in _context.Invoices on il.InvoiceId equals inv.InvoiceId into invJoin
                             from inv in invJoin.DefaultIfEmpty()
                             join m in _context.Materials on il.MaterialId equals m.MaterialId into mJoin
                             from m in mJoin.DefaultIfEmpty()
                             where inv != null && inv.Status == 2 && inv.Date.Value.Year == year
                             select new
                             {
                                 Year = inv.Date.Value.Year,
                                 Month = inv.Date.Value.Month,
                                 TotalSpent = (m.UnitPrice * il.Quantity ?? 0)
                             }).ToList();
                if(month == 0)
                {
                    var result = query.Where(x => x.Year == year)
                                                      .GroupBy(x => new { x.Year, x.Month })
                                                      .Select(g => new
                                                      {
                                                          Year = g.Key.Year,
                                                          Month = g.Key.Month,
                                                          TotalSpentOfMonth = g.Sum(x => x.TotalSpent)
                                                      })
                                                      .OrderBy(x => x.Month)
                                                      .ToList<object>();
                    return Ok(result);
                }else
                {
                    var result = query.Where(x => x.Month == month && x.Year == year)
                                  .GroupBy(x => new { x.Year, x.Month })
                                  .Select(g => new
                                  {
                                      Year = g.Key.Year,
                                      Month = g.Key.Month,
                                      TotalPayOfMonth = g.Sum(x => x.TotalSpent)
                                  })
                                  .OrderBy(x => x.Month)
                                  .ToList<object>();
                    return Ok(result);
                }
                
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //top 8 service duoc dung nhieu nhat all time
        [HttpGet("topService")]
        public ActionResult GetTopServices()
        {
            try
            {
                var totalRevenue = (from il in _context.InvoiceLines
                                    join i in _context.Invoices on il.InvoiceId equals i.InvoiceId
                                    join s in _context.Services on il.ServiceId equals s.ServiceId
                                    select il.Service.Price * il.Quantity).Sum();

                var topServices = (from il in _context.InvoiceLines
                                   join i in _context.Invoices on il.InvoiceId equals i.InvoiceId
                                   join s in _context.Services on il.ServiceId equals s.ServiceId
                                   group il by il.ServiceId into g
                                   orderby g.Sum(x => x.Service.Price * x.Quantity) descending
                                   select new
                                   {
                                       ServiceId = g.Key,
                                       TotalRevenue = g.Sum(x => x.Service.Price * x.Quantity)
                                   }).Take(10).ToList();

                var otherServicesRevenue = totalRevenue - topServices.Sum(s => s.TotalRevenue);
                var topServicesPercentage = topServices.Select(s => new
                {
                    ServiceId = s.ServiceId,
                    ServiceName = _context.Services.FirstOrDefault(service => service.ServiceId == s.ServiceId)?.ServiceName,
                    Percentage = (double)Math.Round(((double)s.TotalRevenue / (double)totalRevenue) * 100, 2)
                }).ToList();

                var otherServicesPercentage = Math.Round(((double)otherServicesRevenue / (double)totalRevenue) * 100, 2);
                var result = new
                {
                    TopServicesPercentage = topServicesPercentage,
                    OtherServicesPercentage = otherServicesPercentage
                };

                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        // top 8 vat lieu duoc dung nhieu nhat all time
        [HttpGet("topMaterial")]
        public ActionResult GetTopMats()
        {
            try
            {
                // Tính tổng doanh thu của tất cả các vật liệu
                var totalRevenue = (from il in _context.InvoiceLines
                                    join m in _context.Materials on il.MaterialId equals m.MaterialId
                                    select m.UnitPrice * il.Quantity).Sum();

                // Lấy top 5 vật liệu theo tổng số lượng
                var topMaterials = (from il in _context.InvoiceLines
                                    join m in _context.Materials on il.MaterialId equals m.MaterialId
                                    group new { il, m } by new { il.MaterialId, m.MaterialName } into g
                                    select new
                                    {
                                        MaterialId = g.Key.MaterialId,
                                        MaterialName = g.Key.MaterialName,
                                        TotalQuantity = g.Sum(x => x.il.Quantity),
                                        TotalPay = g.Sum(x => x.m.UnitPrice * x.il.Quantity)
                                    })
                                .OrderByDescending(x => x.TotalQuantity)
                                .Take(10)
                                .ToList();

                // Tính tổng doanh thu của top 5 vật liệu
                var totalTopRevenue = topMaterials.Sum(x => x.TotalPay);

                // Tính phần trăm của mỗi vật liệu so với tổng doanh thu
                var topMaterialsPercentage = topMaterials.Select(m => new
                {
                    MaterialId = m.MaterialId,
                    MaterialName = m.MaterialName,
                    Percentage = (double)Math.Round(((double)m.TotalPay / (double)totalRevenue) * 100, 2)
                }).ToList();

                // Tính phần trăm của các vật liệu còn lại
                var otherMaterialsRevenue = totalRevenue - totalTopRevenue;
                var otherMaterialsPercentage = Math.Round(((double)otherMaterialsRevenue / (double)totalRevenue) * 100, 2);

                // Trả về kết quả
                var result = new
                {
                    TopMaterials = topMaterialsPercentage,
                    OtherMaterialsPercentage = otherMaterialsPercentage
                };

                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }




    }


}


